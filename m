Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5C5B79A2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 20:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E601410E134;
	Tue, 13 Sep 2022 18:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0605310E19A;
 Tue, 13 Sep 2022 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663094059; x=1694630059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/HQvQgN+uiXD6D5A1ZudnWQN262SwgQNx3UC2Gc8D/g=;
 b=GCJW1jQNXvIWnN+JJgIjrx1UPwclz9H9EVZGmIC61vLHJSc72YIcnpzI
 XwkWbS1EiXGzw53jrSNEyVOZiQC5cYCICyhdW/JE7biJN0dHrv7T7TKa/
 x2u5O8BrPiMvj7DftPbl9AF57OeeHADX9TSKFYP0HsMCELBSwOhaqAmCi
 cmc8p9bwR+APtVFeXi1A7gAnXXknMQsQ79pyCFZv4WcCDhtOK/EzpaiTK
 lD2g7zw7O8skDjOoWjPP/gr/pANtp/hG83zh3jn9CixFpcduHcWs/8oCq
 /2hOPLEFlmHqhVdaBXcsKBJoyzk+zh9+Ya6aOyktPZHS/UbaxzCJzYmz4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="281235523"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="281235523"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="647045103"
Received: from invictus.jf.intel.com ([10.165.21.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/5] drm/i915: Parse and set stepping for platforms with GMD
Date: Tue, 13 Sep 2022 11:33:38 -0700
Message-Id: <20220913183341.908028-3-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
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

v2:
 - Pass the updated ip version structure

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/intel_step.c | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 42b3133d8387..bc966478f0f8 100644
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
+						       &RUNTIME_INFO(i915)->graphics.ip,
+						       gmd_graphics_table,
+						       ARRAY_SIZE(gmd_graphics_table));
+		step.media_step = gmd_to_intel_step(i915,
+						    &RUNTIME_INFO(i915)->media.ip,
+						    gmd_media_table,
+						    ARRAY_SIZE(gmd_media_table));
+		step.display_step = gmd_to_intel_step(i915,
+						      &RUNTIME_INFO(i915)->display.ip,
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
2.34.1

