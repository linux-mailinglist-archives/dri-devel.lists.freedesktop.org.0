Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251523B976C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BB66EBFE;
	Thu,  1 Jul 2021 20:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEF76EC01;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998666"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998666"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564515"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 38/53] drm/i915/dg2: Add dbuf programming
Date: Thu,  1 Jul 2021 13:24:12 -0700
Message-Id: <20210701202427.1547543-39-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DG2 extends our DDB to four DBuf slices; pipes A+B only have access to
the first two slices, whereas pipes C+D only have access to the second
two.

Confusingly, our bspec decided to switch from 1-based numbering
of dbuf slices (S1, S2) to 0-based numbering (S0, S1, S2, S3) in
Display13.  At the moment we're using the 0-based number scheme for the
DBUF_CTL_S() register addressing, but the 1-based number scheme in the
actual slice assignment tables.  We may want to consider switching the
assignment over to 0-based numbering too at some point...

Bspec: 49255
Bspec: 50057
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../drm/i915/display/intel_display_power.h    |   4 +
 drivers/gpu/drm/i915/intel_pm.c               | 120 +++++++++++++++++-
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 22367b5cba96..ad788bbd727d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -392,6 +392,10 @@ intel_display_power_put_all_in_set(struct drm_i915_private *i915,
 	intel_display_power_put_mask_in_set(i915, power_domain_set, power_domain_set->mask);
 }
 
+/*
+ * FIXME: We should probably switch this to a 0-based scheme to be consistent
+ * with how we now name/number DBUF_CTL instances.
+ */
 enum dbuf_slice {
 	DBUF_S1,
 	DBUF_S2,
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 5fdb96e7d266..ff8d89fff502 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -4584,6 +4584,117 @@ static const struct dbuf_slice_conf_entry tgl_allowed_dbufs[] =
 	{}
 };
 
+static const struct dbuf_slice_conf_entry dg2_allowed_dbufs[] = {
+	{
+		.active_pipes = BIT(PIPE_A),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1) | BIT(DBUF_S2),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_B),
+		.dbuf_mask = {
+			[PIPE_B] = BIT(DBUF_S1) | BIT(DBUF_S2),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_A) | BIT(PIPE_B),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1),
+			[PIPE_B] = BIT(DBUF_S2),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_C),
+		.dbuf_mask = {
+			[PIPE_C] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_A) | BIT(PIPE_C),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1) | BIT(DBUF_S2),
+			[PIPE_C] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_B) | BIT(PIPE_C),
+		.dbuf_mask = {
+			[PIPE_B] = BIT(DBUF_S1) | BIT(DBUF_S2),
+			[PIPE_C] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1),
+			[PIPE_B] = BIT(DBUF_S2),
+			[PIPE_C] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_D] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_A) | BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1) | BIT(DBUF_S2),
+			[PIPE_D] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_B) | BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_B] = BIT(DBUF_S1) | BIT(DBUF_S2),
+			[PIPE_D] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1),
+			[PIPE_B] = BIT(DBUF_S2),
+			[PIPE_D] = BIT(DBUF_S3) | BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_C) | BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_C] = BIT(DBUF_S3),
+			[PIPE_D] = BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_A) | BIT(PIPE_C) | BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1) | BIT(DBUF_S2),
+			[PIPE_C] = BIT(DBUF_S3),
+			[PIPE_D] = BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_B] = BIT(DBUF_S1) | BIT(DBUF_S2),
+			[PIPE_C] = BIT(DBUF_S3),
+			[PIPE_D] = BIT(DBUF_S4),
+		},
+	},
+	{
+		.active_pipes = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
+		.dbuf_mask = {
+			[PIPE_A] = BIT(DBUF_S1),
+			[PIPE_B] = BIT(DBUF_S2),
+			[PIPE_C] = BIT(DBUF_S3),
+			[PIPE_D] = BIT(DBUF_S4),
+		},
+	},
+	{}
+};
+
 static const struct dbuf_slice_conf_entry adlp_allowed_dbufs[] = {
 	{
 		.active_pipes = BIT(PIPE_A),
@@ -4759,12 +4870,19 @@ static u32 adlp_compute_dbuf_slices(enum pipe pipe, u32 active_pipes)
 	return compute_dbuf_slices(pipe, active_pipes, adlp_allowed_dbufs);
 }
 
+static u32 dg2_compute_dbuf_slices(enum pipe pipe, u32 active_pipes)
+{
+	return compute_dbuf_slices(pipe, active_pipes, dg2_allowed_dbufs);
+}
+
 static u8 skl_compute_dbuf_slices(struct intel_crtc *crtc, u8 active_pipes)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum pipe pipe = crtc->pipe;
 
-	if (IS_ALDERLAKE_P(dev_priv))
+	if (IS_DG2(dev_priv))
+		return dg2_compute_dbuf_slices(pipe, active_pipes);
+	else if (IS_ALDERLAKE_P(dev_priv))
 		return adlp_compute_dbuf_slices(pipe, active_pipes);
 	else if (DISPLAY_VER(dev_priv) == 12)
 		return tgl_compute_dbuf_slices(pipe, active_pipes);
-- 
2.25.4

