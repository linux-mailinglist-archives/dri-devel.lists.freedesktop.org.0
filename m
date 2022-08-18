Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E404599158
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD11110E4AD;
	Thu, 18 Aug 2022 23:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A32810E034;
 Thu, 18 Aug 2022 23:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866150; x=1692402150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l67ahRc6M1EdPfYYgamo05mkylSph29P1aXBRqDKDGE=;
 b=R6ShnQHfPcsgh7iy80BgQ/Pz+tAbxNIiNvzoJj1Dl8ltzWNW05uMj7BL
 4BxcFi2JOFqksohastLWJwYjdIW25Aq5VyQfyWTjBoYl3DVLCZ1OWnX+h
 p95TKCqA8UD6B55HlsJ1mzgLk5JEMQk24Bsnk/Zy9lzTa/RKVberWlZ/y
 6yl9sgh1Xu4wl81fe8LAN1UHzl/hhrWlEa8xr8rPNTwyHhX8AvJJR2U2T
 +32XUQPKPwGaFQ5ak9BvD3CNXe3F1hLwT4mbv6uL1Q9e+RzpABnZp/67J
 bUjcLNtiCQT1vQEdxZPlA/QfISprr0ELBwOOINzK+tOKK1JEbhbyXz73i Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938511"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953285"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/21] drm/i915: Parse and set stepping for platforms with
 GMD
Date: Thu, 18 Aug 2022 16:41:43 -0700
Message-Id: <20220818234202.451742-3-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
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

