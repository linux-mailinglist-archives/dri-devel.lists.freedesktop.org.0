Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A339A662
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F576F4E5;
	Thu,  3 Jun 2021 16:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823C56F4CC;
 Thu,  3 Jun 2021 16:55:06 +0000 (UTC)
IronPort-SDR: fl5MPBo+o3iI9Ti4sUQ9u6ISmi2dp/3BBeKwcKNwz6ERY+KPTMqBeZ1WDiNzteQjiVC9yZLPcm
 84agZt4BJc/w==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184464195"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="184464195"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:51 -0700
IronPort-SDR: WUoNArlooGI7cpR0Dky4qaX0FdajAuH+jY4c1MFg/WYDKWchMSi3GCPl1z1ed5jFv6M8TNCDTt
 KZssjCxxnYTA==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="400643678"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:54:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/i915/gvt: replace IS_GEN and friends with
 GRAPHICS_VER
Date: Thu,  3 Jun 2021 09:54:25 -0700
Message-Id: <20210603165428.3625495-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603165428.3625495-1-lucas.demarchi@intel.com>
References: <20210603165428.3625495-1-lucas.demarchi@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was done by the following semantic patch:

	@@ expression i915; @@
	- INTEL_GEN(i915)
	+ GRAPHICS_VER(i915)

	@@ expression i915; expression E; @@
	- INTEL_GEN(i915) >= E
	+ GRAPHICS_VER(i915) >= E

	@@ expression dev_priv; expression E; @@
	- !IS_GEN(dev_priv, E)
	+ GRAPHICS_VER(dev_priv) != E

	@@ expression dev_priv; expression E; @@
	- IS_GEN(dev_priv, E)
	+ GRAPHICS_VER(dev_priv) == E

	@@
	expression dev_priv;
	expression from, until;
	@@
	- IS_GEN_RANGE(dev_priv, from, until)
	+ IS_GRAPHICS_VER(dev_priv, from, until)

	@def@
	expression E;
	identifier id =~ "^gen$";
	@@
	- id = GRAPHICS_VER(E)
	+ ver = GRAPHICS_VER(E)

	@@
	identifier def.id;
	@@
	- id
	+ ver

It also takes care of renaming the variable we assign to GRAPHICS_VER()
so to use "ver" rather than "gen".

Cc: intel-gvt-dev@lists.freedesktop.org
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  8 ++++----
 drivers/gpu/drm/i915/gvt/dmabuf.c       |  2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c   | 10 +++++-----
 drivers/gpu/drm/i915/gvt/gtt.c          |  4 ++--
 drivers/gpu/drm/i915/gvt/handlers.c     |  6 +++---
 drivers/gpu/drm/i915/gvt/interrupt.c    |  2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c | 10 +++++-----
 drivers/gpu/drm/i915/gvt/scheduler.c    |  4 ++--
 drivers/gpu/drm/i915/gvt/vgpu.c         |  4 ++--
 9 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index ca9c9e27a43d..c4118b808268 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1006,7 +1006,7 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 	 * update reg values in it into vregs, so LRIs in workload with
 	 * inhibit context will restore with correct values
 	 */
-	if (IS_GEN(s->engine->i915, 9) &&
+	if (GRAPHICS_VER(s->engine->i915) == 9 &&
 	    intel_gvt_mmio_is_sr_in_ctx(gvt, offset) &&
 	    !strncmp(cmd, "lri", 3)) {
 		intel_gvt_hypervisor_read_gpa(s->vgpu,
@@ -1390,7 +1390,7 @@ static int gen8_check_mi_display_flip(struct parser_exec_state *s,
 	if (!info->async_flip)
 		return 0;
 
-	if (INTEL_GEN(s->engine->i915) >= 9) {
+	if (GRAPHICS_VER(s->engine->i915) >= 9) {
 		stride = vgpu_vreg_t(s->vgpu, info->stride_reg) & GENMASK(9, 0);
 		tile = (vgpu_vreg_t(s->vgpu, info->ctrl_reg) &
 				GENMASK(12, 10)) >> 10;
@@ -1418,7 +1418,7 @@ static int gen8_update_plane_mmio_from_mi_display_flip(
 
 	set_mask_bits(&vgpu_vreg_t(vgpu, info->surf_reg), GENMASK(31, 12),
 		      info->surf_val << 12);
-	if (INTEL_GEN(dev_priv) >= 9) {
+	if (GRAPHICS_VER(dev_priv) >= 9) {
 		set_mask_bits(&vgpu_vreg_t(vgpu, info->stride_reg), GENMASK(9, 0),
 			      info->stride_val);
 		set_mask_bits(&vgpu_vreg_t(vgpu, info->ctrl_reg), GENMASK(12, 10),
@@ -1446,7 +1446,7 @@ static int decode_mi_display_flip(struct parser_exec_state *s,
 {
 	if (IS_BROADWELL(s->engine->i915))
 		return gen8_decode_mi_display_flip(s, info);
-	if (INTEL_GEN(s->engine->i915) >= 9)
+	if (GRAPHICS_VER(s->engine->i915) >= 9)
 		return skl_decode_mi_display_flip(s, info);
 
 	return -ENODEV;
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index d4f883f35b95..8e65cd8258b9 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -223,7 +223,7 @@ static struct drm_i915_gem_object *vgpu_create_gem(struct drm_device *dev,
 
 	obj->read_domains = I915_GEM_DOMAIN_GTT;
 	obj->write_domain = 0;
-	if (INTEL_GEN(dev_priv) >= 9) {
+	if (GRAPHICS_VER(dev_priv) >= 9) {
 		unsigned int tiling_mode = 0;
 		unsigned int stride = 0;
 
diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
index 0889ad8291b0..11a8baba6822 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -151,7 +151,7 @@ static u32 intel_vgpu_get_stride(struct intel_vgpu *vgpu, int pipe,
 	u32 stride_reg = vgpu_vreg_t(vgpu, DSPSTRIDE(pipe)) & stride_mask;
 	u32 stride = stride_reg;
 
-	if (INTEL_GEN(dev_priv) >= 9) {
+	if (GRAPHICS_VER(dev_priv) >= 9) {
 		switch (tiled) {
 		case PLANE_CTL_TILED_LINEAR:
 			stride = stride_reg * 64;
@@ -215,7 +215,7 @@ int intel_vgpu_decode_primary_plane(struct intel_vgpu *vgpu,
 	if (!plane->enabled)
 		return -ENODEV;
 
-	if (INTEL_GEN(dev_priv) >= 9) {
+	if (GRAPHICS_VER(dev_priv) >= 9) {
 		plane->tiled = val & PLANE_CTL_TILED_MASK;
 		fmt = skl_format_to_drm(
 			val & PLANE_CTL_FORMAT_MASK,
@@ -256,9 +256,9 @@ int intel_vgpu_decode_primary_plane(struct intel_vgpu *vgpu,
 	}
 
 	plane->stride = intel_vgpu_get_stride(vgpu, pipe, plane->tiled,
-		(INTEL_GEN(dev_priv) >= 9) ?
-			(_PRI_PLANE_STRIDE_MASK >> 6) :
-				_PRI_PLANE_STRIDE_MASK, plane->bpp);
+		(GRAPHICS_VER(dev_priv) >= 9) ?
+		(_PRI_PLANE_STRIDE_MASK >> 6) :
+		_PRI_PLANE_STRIDE_MASK, plane->bpp);
 
 	plane->width = (vgpu_vreg_t(vgpu, PIPESRC(pipe)) & _PIPE_H_SRCSZ_MASK) >>
 		_PIPE_H_SRCSZ_SHIFT;
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 9478c132d7b6..cc2c05e18206 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1055,12 +1055,12 @@ static bool vgpu_ips_enabled(struct intel_vgpu *vgpu)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
 
-	if (INTEL_GEN(dev_priv) == 9 || INTEL_GEN(dev_priv) == 10) {
+	if (GRAPHICS_VER(dev_priv) == 9 || GRAPHICS_VER(dev_priv) == 10) {
 		u32 ips = vgpu_vreg_t(vgpu, GEN8_GAMW_ECO_DEV_RW_IA) &
 			GAMW_ECO_ENABLE_64K_IPS_FIELD;
 
 		return ips == GAMW_ECO_ENABLE_64K_IPS_FIELD;
-	} else if (INTEL_GEN(dev_priv) >= 11) {
+	} else if (GRAPHICS_VER(dev_priv) >= 11) {
 		/* 64K paging only controlled by IPS bit in PTE now. */
 		return true;
 	} else
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 33496397a74f..98eb48c24c46 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -220,7 +220,7 @@ static int gamw_echo_dev_rw_ia_write(struct intel_vgpu *vgpu,
 {
 	u32 ips = (*(u32 *)p_data) & GAMW_ECO_ENABLE_64K_IPS_FIELD;
 
-	if (INTEL_GEN(vgpu->gvt->gt->i915) <= 10) {
+	if (GRAPHICS_VER(vgpu->gvt->gt->i915) <= 10) {
 		if (ips == GAMW_ECO_ENABLE_64K_IPS_FIELD)
 			gvt_dbg_core("vgpu%d: ips enabled\n", vgpu->id);
 		else if (!ips)
@@ -286,7 +286,7 @@ static int mul_force_wake_write(struct intel_vgpu *vgpu,
 	old = vgpu_vreg(vgpu, offset);
 	new = CALC_MODE_MASK_REG(old, *(u32 *)p_data);
 
-	if (INTEL_GEN(vgpu->gvt->gt->i915)  >=  9) {
+	if (GRAPHICS_VER(vgpu->gvt->gt->i915)  >=  9) {
 		switch (offset) {
 		case FORCEWAKE_RENDER_GEN9_REG:
 			ack_reg_offset = FORCEWAKE_ACK_RENDER_GEN9_REG;
@@ -1174,7 +1174,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vgpu *vgpu,
 	write_vreg(vgpu, offset, p_data, bytes);
 	data = vgpu_vreg(vgpu, offset);
 
-	if ((INTEL_GEN(vgpu->gvt->gt->i915) >= 9)
+	if ((GRAPHICS_VER(vgpu->gvt->gt->i915) >= 9)
 		&& offset != _REG_SKL_DP_AUX_CH_CTL(port_index)) {
 		/* SKL DPB/C/D aux ctl register changed */
 		return 0;
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index 497d28ce47df..614b951d919f 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -585,7 +585,7 @@ static void gen8_init_irq(
 
 		SET_BIT_INFO(irq, 4, PRIMARY_C_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_C);
 		SET_BIT_INFO(irq, 5, SPRITE_C_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_C);
-	} else if (INTEL_GEN(gvt->gt->i915) >= 9) {
+	} else if (GRAPHICS_VER(gvt->gt->i915) >= 9) {
 		SET_BIT_INFO(irq, 25, AUX_CHANNEL_B, INTEL_GVT_IRQ_INFO_DE_PORT);
 		SET_BIT_INFO(irq, 26, AUX_CHANNEL_C, INTEL_GVT_IRQ_INFO_DE_PORT);
 		SET_BIT_INFO(irq, 27, AUX_CHANNEL_D, INTEL_GVT_IRQ_INFO_DE_PORT);
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index c9589e26af93..b8ac80765461 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -373,7 +373,7 @@ static void handle_tlb_pending_event(struct intel_vgpu *vgpu,
 	 */
 	fw = intel_uncore_forcewake_for_reg(uncore, reg,
 					    FW_REG_READ | FW_REG_WRITE);
-	if (engine->id == RCS0 && INTEL_GEN(engine->i915) >= 9)
+	if (engine->id == RCS0 && GRAPHICS_VER(engine->i915) >= 9)
 		fw |= FORCEWAKE_RENDER;
 
 	intel_uncore_forcewake_get(uncore, fw);
@@ -409,7 +409,7 @@ static void switch_mocs(struct intel_vgpu *pre, struct intel_vgpu *next,
 	if (drm_WARN_ON(&engine->i915->drm, engine->id >= ARRAY_SIZE(regs)))
 		return;
 
-	if (engine->id == RCS0 && IS_GEN(engine->i915, 9))
+	if (engine->id == RCS0 && GRAPHICS_VER(engine->i915) == 9)
 		return;
 
 	if (!pre && !gen9_render_mocs.initialized)
@@ -474,7 +474,7 @@ static void switch_mmio(struct intel_vgpu *pre,
 	struct engine_mmio *mmio;
 	u32 old_v, new_v;
 
-	if (INTEL_GEN(engine->i915) >= 9)
+	if (GRAPHICS_VER(engine->i915) >= 9)
 		switch_mocs(pre, next, engine);
 
 	for (mmio = engine->i915->gvt->engine_mmio_list.mmio;
@@ -486,7 +486,7 @@ static void switch_mmio(struct intel_vgpu *pre,
 		 * state image on gen9, it's initialized by lri command and
 		 * save or restore with context together.
 		 */
-		if (IS_GEN(engine->i915, 9) && mmio->in_context)
+		if (GRAPHICS_VER(engine->i915) == 9 && mmio->in_context)
 			continue;
 
 		// save
@@ -580,7 +580,7 @@ void intel_gvt_init_engine_mmio_context(struct intel_gvt *gvt)
 {
 	struct engine_mmio *mmio;
 
-	if (INTEL_GEN(gvt->gt->i915) >= 9) {
+	if (GRAPHICS_VER(gvt->gt->i915) >= 9) {
 		gvt->engine_mmio_list.mmio = gen9_engine_mmio_list;
 		gvt->engine_mmio_list.tlb_mmio_offset_list = gen8_tlb_mmio_offset_list;
 		gvt->engine_mmio_list.tlb_mmio_offset_list_cnt = ARRAY_SIZE(gen8_tlb_mmio_offset_list);
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index fc735692f21f..734c37c5e347 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -364,7 +364,7 @@ static int copy_workload_to_ring_buffer(struct intel_vgpu_workload *workload)
 	u32 *cs;
 	int err;
 
-	if (IS_GEN(req->engine->i915, 9) && is_inhibit_context(req->context))
+	if (GRAPHICS_VER(req->engine->i915) == 9 && is_inhibit_context(req->context))
 		intel_vgpu_restore_inhibit_context(vgpu, req);
 
 	/*
@@ -1148,7 +1148,7 @@ static void complete_current_workload(struct intel_gvt *gvt, int ring_id)
 static int workload_thread(void *arg)
 {
 	struct intel_engine_cs *engine = arg;
-	const bool need_force_wake = INTEL_GEN(engine->i915) >= 9;
+	const bool need_force_wake = GRAPHICS_VER(engine->i915) >= 9;
 	struct intel_gvt *gvt = engine->i915->gvt;
 	struct intel_gvt_workload_scheduler *scheduler = &gvt->scheduler;
 	struct intel_vgpu_workload *workload = NULL;
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 9039787f123a..fa6b92615799 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -149,10 +149,10 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
 		gvt->types[i].avail_instance = min(low_avail / vgpu_types[i].low_mm,
 						   high_avail / vgpu_types[i].high_mm);
 
-		if (IS_GEN(gvt->gt->i915, 8))
+		if (GRAPHICS_VER(gvt->gt->i915) == 8)
 			sprintf(gvt->types[i].name, "GVTg_V4_%s",
 				vgpu_types[i].name);
-		else if (IS_GEN(gvt->gt->i915, 9))
+		else if (GRAPHICS_VER(gvt->gt->i915) == 9)
 			sprintf(gvt->types[i].name, "GVTg_V5_%s",
 				vgpu_types[i].name);
 
-- 
2.31.1

