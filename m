Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500C5A8880
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6786310E511;
	Wed, 31 Aug 2022 21:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1405210E4F0;
 Wed, 31 Aug 2022 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982633; x=1693518633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Jy3myBUOLe2xYnSKVWN0bTdnwqvrashwRPhcHF/+KU=;
 b=Brieo9QGuPMdQ0NdVDLQ4qlNL8gNaNkUkNZIKyxAwbc0kUeJSCFo9/Lx
 k/NfAYwYzjPbBpBdZdJkA7FB3fkskxfwEMXA1k1mEsDFLLUqrsT82/t3H
 DDR1Gvx8RqR9tx+3ybSdpGq7o9M91WOYSReYjBC6ifFuPJqtUNAANegMI
 IXlJz8c6D/2UDK/9kr+aqk7w8EdgQalbTqMFwVF0rlQqHASfNDD3Wtnrm
 ggWM+3+cyAmJkTgTls2OH4Oj2NzKzvG7++SFtnKo5f9UnGeICZInLWqqb
 v6oGy111c9DMNEfpkDTmkTFsdQptb3emJxQVHjUZtM+u3ehNdZF03cDCo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296833062"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="296833062"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586216"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:30 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 03/11] drm/i915: Parse and set stepping for platforms with
 GMD
Date: Wed, 31 Aug 2022 14:49:50 -0700
Message-Id: <20220831214958.109753-4-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: José Roberto de Souza <jose.souza@intel.com>

The GMD step field do not properly match the current stepping convention
that we use(STEP_A0, STEP_A1, STEP_B0...).

One platform could have { arch = 12, rel = 70, step = 1 } and the
actual stepping is STEP_B0 but without the translation of the step
field would mean STEP_A1.
That is why we will need to have gmd_to_intel_step tables for each IP.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/intel_step.c | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 42b3133d8387..0fa7147c7d0f 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -135,6 +135,48 @@ static const struct intel_step_info adlp_n_revids[] = {
 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_D0 },
 };
 
+struct gmd_to_intel_step {
+	struct ip_version gmd;
+	enum intel_step step;
+};
+
+static const struct gmd_to_intel_step gmd_graphics_table[] = {
+	{ .gmd.ver = 12, .gmd.rel = 70, .gmd.step = 0, .step = STEP_A0 },
+	{ .gmd.ver = 12, .gmd.rel = 70, .gmd.step = 4, .step = STEP_B0 },
+	{ .gmd.ver = 12, .gmd.rel = 71, .gmd.step = 0, .step = STEP_A0 },
+	{ .gmd.ver = 12, .gmd.rel = 71, .gmd.step = 4, .step = STEP_B0 },
+	{ .gmd.ver = 12, .gmd.rel = 73, .gmd.step = 0, .step = STEP_A0 },
+	{ .gmd.ver = 12, .gmd.rel = 73, .gmd.step = 4, .step = STEP_B0 },
+};
+
+static const struct gmd_to_intel_step gmd_media_table[] = {
+	{ .gmd.ver = 13, .gmd.rel = 70, .gmd.step = 0, .step = STEP_A0 },
+	{ .gmd.ver = 13, .gmd.rel = 70, .gmd.step = 4, .step = STEP_B0 },
+};
+
+static const struct gmd_to_intel_step gmd_display_table[] = {
+	{ .gmd.ver = 14, .gmd.rel = 0, .gmd.step = 0, .step = STEP_A0 },
+	{ .gmd.ver = 14, .gmd.rel = 0, .gmd.step = 4, .step = STEP_B0 },
+};
+
+static u8 gmd_to_intel_step(struct drm_i915_private *i915,
+			    struct ip_version *gmd,
+			    const struct gmd_to_intel_step *table,
+			    int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++) {
+		if (table[i].gmd.ver == gmd->ver &&
+		    table[i].gmd.rel == gmd->rel &&
+		    table[i].gmd.step == gmd->step)
+			return table[i].step;
+	}
+
+	drm_dbg(&i915->drm, "Using future steppings\n");
+	return STEP_FUTURE;
+}
+
 static void pvc_step_init(struct drm_i915_private *i915, int pci_revid);
 
 void intel_step_init(struct drm_i915_private *i915)
@@ -144,6 +186,24 @@ void intel_step_init(struct drm_i915_private *i915)
 	int revid = INTEL_REVID(i915);
 	struct intel_step_info step = {};
 
+	if (HAS_GMD_ID(i915)) {
+		step.graphics_step = gmd_to_intel_step(i915,
+						       &RUNTIME_INFO(i915)->graphics,
+						       gmd_graphics_table,
+						       ARRAY_SIZE(gmd_graphics_table));
+		step.media_step = gmd_to_intel_step(i915,
+						    &RUNTIME_INFO(i915)->media,
+						    gmd_media_table,
+						    ARRAY_SIZE(gmd_media_table));
+		step.display_step = gmd_to_intel_step(i915,
+						      &RUNTIME_INFO(i915)->display,
+						      gmd_display_table,
+						      ARRAY_SIZE(gmd_display_table));
+		RUNTIME_INFO(i915)->step = step;
+
+		return;
+	}
+
 	if (IS_PONTEVECCHIO(i915)) {
 		pvc_step_init(i915, revid);
 		return;
-- 
2.25.1

