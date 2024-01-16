Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7F82F30A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341B410E5CC;
	Tue, 16 Jan 2024 17:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FD310E564;
 Tue, 16 Jan 2024 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425246; x=1736961246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UeC7t7eLnGKUj2H3082Q6NDtYT97LE3uoEYiX0ivVs=;
 b=WfhWOHnNZw7VsBMfv+lrRPJOPFeb2imT8qpPbgnA2bdOENtXQONGNDFC
 +gaHdXc9Ue2hcZde/Q+Cn6MKYnS12kg39PAhG3o6Vul/vLjCTiLgtm0wT
 AGLvWG4aw0ZjJNEYoe+hsOxyjhqaFFwVY2iiMfvgR/x3wiEWqmvyAlcxa
 WtVBjPoTP2Fe0zsVgjqHIbc4sjv2y2uUDk2eXpv/NejZI3Df5QwBOmTU1
 slNNs396lzoUfYGi3cb8pGUbct7/iFT5HpLfXLIFVqARTWenmN5V4vV/P
 n4joWNRGzRxXJoUWXQHWUoFkQyQMN7G5caTizrnpxAT6uvqbbOCTFwKdA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593355"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869619"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:45 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Add XE_LP steered register lists
Date: Tue, 16 Jan 2024 09:12:32 -0800
Message-Id: <20240116171237.118463-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the ability for runtime allocation and freeing of
steered register list extentions that depend on the
detected HW config fuses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 187 +++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index c8048b35a7eb..dde3a269d114 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -94,6 +94,81 @@
 	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
 	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
 
+/* XE_LP Global */
+static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
+	COMMON_XELP_BASE_GLOBAL,
+};
+
+/* XE_LP Render / Compute Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_rc_class_regs[] = {
+	COMMON_XELP_BASE_RENDER,
+};
+
+/* Pre-Xe Render / Compute Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_rc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* Pre-Xe Media Decode/Encode Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_vd_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* XE_LP Video Enhancement Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_vec_class_regs[] = {
+	COMMON_XELP_BASE_VEC,
+};
+
+/* Pre-Xe Video Enhancement Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_vec_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* Pre-Xe Blitter Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr pre_xe_blt_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* XE_LP - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/*
+ * Empty list to prevent warnings about unknown class/instance types
+ * as not all class/instanace types have entries on all platforms.
+ */
+static const struct __guc_mmio_reg_descr empty_regs_list[] = {
+};
+
+#define TO_GCAP_DEF_OWNER(x) (GUC_CAPTURE_LIST_INDEX_##x)
+#define TO_GCAP_DEF_TYPE(x) (GUC_CAPTURE_LIST_TYPE_##x)
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+		NULL, \
+	}
+
+/* List of lists */
+static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
+	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(pre_xe_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(pre_xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe_lp_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(pre_xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(pre_xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	{}
+};
+
 static const char * capture_list_type_names [] = {
 	"Global",
 	"Class",
@@ -179,11 +254,119 @@ guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
 	return NULL;
 }
 
+struct __ext_steer_reg {
+	const char *name;
+	struct xe_reg_mcr reg;
+};
+
+static const struct __ext_steer_reg pre_xe_extregs[] = {
+	{"SAMPLER_INSTDONE",	SAMPLER_INSTDONE},
+	{"ROW_INSTDONE", 	ROW_INSTDONE}
+};
+
+static const struct __ext_steer_reg xehpg_extregs[] = {
+	{"XEHPG_INSTDONE_GEOM_SVG", XEHPG_INSTDONE_GEOM_SVG}
+};
+
+static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
+			   const struct __ext_steer_reg *extlist,
+			   int slice_id, int subslice_id)
+{
+	ext->reg = XE_REG(extlist->reg.__reg.addr);
+	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
+	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
+	ext->regname = extlist->name;
+}
+
+static int
+__alloc_ext_regs(struct __guc_mmio_reg_descr_group *newlist,
+		 const struct __guc_mmio_reg_descr_group *rootlist, int num_regs)
+{
+	struct __guc_mmio_reg_descr *list;
+
+	list = kcalloc(num_regs, sizeof(struct __guc_mmio_reg_descr), GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+
+	newlist->extlist = list;
+	newlist->num_regs = num_regs;
+	newlist->owner = rootlist->owner;
+	newlist->engine = rootlist->engine;
+	newlist->type = rootlist->type;
+
+	return 0;
+}
+
+static void
+guc_capture_alloc_steered_lists(struct xe_guc *guc, const struct __guc_mmio_reg_descr_group *lists)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	int slice, subslice, iter, i, num_steer_regs, num_tot_regs = 0;
+	const struct __guc_mmio_reg_descr_group *list;
+	struct __guc_mmio_reg_descr_group *extlists;
+	struct __guc_mmio_reg_descr *extarray;
+	bool has_xehpg_extregs;
+
+	/* steered registers currently only exist for the render-class */
+	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
+					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+					GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE);
+	/* skip if extlists was previously allocated */
+	if (!list || guc->capture->extlists)
+		return;
+
+	has_xehpg_extregs = GRAPHICS_VERx100(gt_to_xe(gt)) >= 1255;
+
+	num_steer_regs = ARRAY_SIZE(pre_xe_extregs);
+	if (has_xehpg_extregs)
+		num_steer_regs += ARRAY_SIZE(xehpg_extregs);
+
+	num_tot_regs += num_steer_regs * bitmap_weight(gt->fuse_topo.g_dss_mask,
+						       sizeof(gt->fuse_topo.g_dss_mask) * 8);
+	if (!num_tot_regs)
+		return;
+	  
+	/* allocate an extra for an end marker */
+	extlists = kcalloc(2, sizeof(struct __guc_mmio_reg_descr_group), GFP_KERNEL);
+	if (!extlists)
+		return;
+
+	if (__alloc_ext_regs(&extlists[0], list, num_tot_regs)) {
+		kfree(extlists);
+		return;
+	}
+
+	extarray = extlists[0].extlist;
+	for_each_ss_steering(iter, gt, slice, subslice) {
+		for (i = 0; i < ARRAY_SIZE(pre_xe_extregs); ++i) {
+			__fill_ext_reg(extarray, &pre_xe_extregs[i], slice, subslice);
+			++extarray;
+		}
+
+		if (has_xehpg_extregs) {
+			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
+				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
+				++extarray;
+			}
+		}
+	}
+
+	xe_gt_dbg(guc_to_gt(guc), "capture found %d ext-regs.\n", num_tot_regs);
+	guc->capture->extlists = extlists;
+}
+
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct xe_guc *guc)
 {
-	//FIXME: add register list
-	return NULL;
+	/*
+	 * For certain engine classes, there are slice and subslice
+	 * level registers requiring steering. We allocate and populate
+	 * these at init time based on hw config add it as an extension
+	 * list at the end of the pre-populated render list.
+	 */
+	guc_capture_alloc_steered_lists(guc, xe_lp_lists);
+
+	return xe_lp_lists;
 }
 
 static int
-- 
2.34.1

