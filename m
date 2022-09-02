Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967BF5AA7AB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403D410E755;
	Fri,  2 Sep 2022 06:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060F110E746;
 Fri,  2 Sep 2022 06:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662098666; x=1693634666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7FXrWOQLXBEDZUY+/0/oUVyWMZQtOiyt80gOoUdmtg=;
 b=KA89ZxwynX4jGQ9fX2zWGtrhgq2jVWkN9Oi59G9JOXuNMOJcPRcsH9BN
 /ZFpdtbwpFedWciYWfJOkL1zde/OWqhUhFIti1tZa1nWzmnxLBpJLr3ow
 rkOqqRlLEHdZLLCwyyx+SrQQ8mc4vpIk4kZwGrFxFp/o4yTROpsFJkaFq
 +1h1gdKad6yakHaEHrj0UTXT3VATr3TdIorV5wAc2TNJtzDV3O0wY24eA
 kbH5UyT4sGugdeBqAiHF0QE2d4NYPjSpmZEBilrSL6jx+11PsU1FaLNrX
 Ky/x4Ec+G5E8QC1RbiOb0J/BoKf689mz/Bf+THlfXL9xakDPoSOKAPgB4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282889131"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="282889131"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="755144590"
Received: from invictus.jf.intel.com ([10.165.21.188])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:24 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 03/11] drm/i915: Parse and set stepping for platforms with
 GMD
Date: Thu,  1 Sep 2022 23:03:34 -0700
Message-Id: <20220902060342.151824-4-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
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
index 42b3133d8387..14ea103d6dab 100644
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
+						       &RUNTIME_INFO(i915)->graphics.version,
+						       gmd_graphics_table,
+						       ARRAY_SIZE(gmd_graphics_table));
+		step.media_step = gmd_to_intel_step(i915,
+						    &RUNTIME_INFO(i915)->media.version,
+						    gmd_media_table,
+						    ARRAY_SIZE(gmd_media_table));
+		step.display_step = gmd_to_intel_step(i915,
+						      &RUNTIME_INFO(i915)->display.version,
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

