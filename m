Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D24994A72
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 14:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9510510E4FB;
	Tue,  8 Oct 2024 12:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="izm8UF5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BE310E4F4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728390786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yl9j+0GsWdjGBeIQLmpZUgB1gURgYziSMT+/kuAvhW8=;
 b=izm8UF5E3GUrZHMEqDxi/EA0yzXybJafnzIBwVrwwwIlsrLkq1xaBc7Sv5ltZuOze30mxJ
 d/h++7vuhJJPs3ffw9jA9vHP9WScpf8NIgLH8PvfA3JDk/qC7zAdVKmXoG0P/qpAEQMazS
 vDG8tB+zhzNj2KRv9oWkjQJjms+I2R4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-540-Dw3QS9l5PuuJbBkAGSpfxA-1; Tue,
 08 Oct 2024 08:33:02 -0400
X-MC-Unique: Dw3QS9l5PuuJbBkAGSpfxA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0169A1955D72; Tue,  8 Oct 2024 12:32:59 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.224])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 157EC19560A2; Tue,  8 Oct 2024 12:32:50 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Melissa Wen <mwen@igalia.com>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Roman Li <roman.li@amd.com>,
 Bhuvana Chandra Pinninti <bhuvanachandra.pinninti@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Sung Joon Kim <sungkim@amd.com>,
 Duncan Ma <duncan.ma@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Lu Yao <yaolu@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amdgpu: Add dcn30 drm_panic support
Date: Tue,  8 Oct 2024 14:28:30 +0200
Message-ID: <20241008123220.224675-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a pretty user
friendly message on the screen when a Linux kernel panic occurs.

It should work on all readeon using amdgpu_dm_plane.c, when the
framebuffer is linear (like when in a VT). For tiled framebuffer, it
will only work on radeon with dcn30/dcn31. It should be easy to add support
for dcn20, but I can't test it.
I've tested it on a Radeon W6400 pro.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 - Disable tiling, and force page flip in the panic_flush() callback.
 - Enable tiling support for dcn31.
 - Force immediate page flip.

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 136 +++++++++++++++++-
 .../amd/display/dc/hubp/dcn30/dcn30_hubp.c    |  17 +++
 .../amd/display/dc/hubp/dcn30/dcn30_hubp.h    |   2 +
 .../amd/display/dc/hubp/dcn31/dcn31_hubp.c    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |   1 +
 5 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 25f63b2e7a8e2..e1e961d06fdd8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -26,7 +26,9 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include "drm/drm_framebuffer.h"
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_fourcc.h>
@@ -36,6 +38,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "bif/bif_4_1_d.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1420,6 +1423,124 @@ static void amdgpu_dm_plane_atomic_async_update(struct drm_plane *plane,
 	amdgpu_dm_plane_handle_cursor_update(plane, old_state);
 }
 
+/* panic_bo is set in amdgpu_dm_plane_get_scanout_buffer() and only used in amdgpu_dm_set_pixel()
+ * they are called from the panic handler, and no race condition can occurs.
+ */
+static struct amdgpu_bo *panic_abo;
+
+/* Use the indirect MMIO to write each pixel to the GPU VRAM,
+ * This is a simplified version of amdgpu_device_mm_access()
+ */
+static void amdgpu_dm_set_pixel(struct drm_scanout_buffer *sb,
+				unsigned int x,
+				unsigned int y,
+				u32 color)
+{
+	struct amdgpu_res_cursor cursor;
+	unsigned long offset;
+	struct amdgpu_bo *abo = panic_abo;
+	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
+	uint32_t tmp;
+
+	offset = x * 4 + y * sb->pitch[0];
+	amdgpu_res_first(abo->tbo.resource, offset, 4, &cursor);
+
+	tmp = cursor.start >> 31;
+	WREG32_NO_KIQ(mmMM_INDEX, ((uint32_t) cursor.start) | 0x80000000);
+	if (tmp != 0xffffffff)
+		WREG32_NO_KIQ(mmMM_INDEX_HI, tmp);
+	WREG32_NO_KIQ(mmMM_DATA, color);
+}
+
+static int amdgpu_dm_plane_get_scanout_buffer(struct drm_plane *plane,
+					      struct drm_scanout_buffer *sb)
+{
+	struct amdgpu_bo *abo;
+	struct drm_framebuffer *fb = plane->state->fb;
+
+	if (!fb)
+		return -EINVAL;
+
+	DRM_DEBUG_KMS("Framebuffer %dx%d %p4cc\n", fb->width, fb->height, &fb->format->format);
+
+	abo = gem_to_amdgpu_bo(fb->obj[0]);
+	if (!abo)
+		return -EINVAL;
+
+	sb->width = fb->width;
+	sb->height = fb->height;
+	/* Use the generic linear format, because tiling will be disabled in panic_flush() */
+	sb->format = drm_format_info(fb->format->format);
+	if (!sb->format)
+		return -EINVAL;
+
+	sb->pitch[0] = fb->pitches[0];
+
+	if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
+		if (abo->tbo.resource->mem_type != TTM_PL_VRAM) {
+			DRM_WARN("amdgpu panic, framebuffer not in VRAM\n");
+			return -EINVAL;
+		}
+		/* Only handle 32bits format, to simplify mmio access */
+		if (fb->format->cpp[0] != 4) {
+			DRM_WARN("amdgpu panic, pixel format is not 32bits\n");
+			return -EINVAL;
+		}
+		sb->set_pixel = amdgpu_dm_set_pixel;
+		panic_abo = abo;
+		return 0;
+	}
+	if (!abo->kmap.virtual &&
+	    ttm_bo_kmap(&abo->tbo, 0, PFN_UP(abo->tbo.base.size), &abo->kmap)) {
+		DRM_WARN("amdgpu bo map failed, panic won't be displayed\n");
+		return -ENOMEM;
+	}
+	if (abo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
+		iosys_map_set_vaddr_iomem(&sb->map[0], abo->kmap.virtual);
+	else
+		iosys_map_set_vaddr(&sb->map[0], abo->kmap.virtual);
+
+	return 0;
+}
+
+static void amdgpu_dm_plane_panic_flush(struct drm_plane *plane)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane->state);
+	struct drm_framebuffer *fb = plane->state->fb;
+	struct dc_plane_state *dc_plane_state;
+	struct dc *dc;
+	int i;
+
+	if (!dm_plane_state || !dm_plane_state->dc_state)
+		return;
+
+	dc_plane_state = dm_plane_state->dc_state;
+	dc = dc_plane_state->ctx->dc;
+	if (!dc || !dc->current_state)
+		return;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe_ctx = &dc->current_state->res_ctx.pipe_ctx[i];
+		struct hubp *hubp;
+
+		if (!pipe_ctx)
+			continue;
+
+		hubp = pipe_ctx->plane_res.hubp;
+		if (!hubp)
+			continue;
+
+		/* if framebuffer is tiled, disable tiling */
+		if (fb->modifier && hubp->funcs->hubp_clear_tiling)
+			hubp->funcs->hubp_clear_tiling(hubp);
+
+		/* force page flip to see the new content of the framebuffer */
+		hubp->funcs->hubp_program_surface_flip_and_addr(hubp,
+								&dc_plane_state->address,
+								true);
+	}
+}
+
 static const struct drm_plane_helper_funcs dm_plane_helper_funcs = {
 	.prepare_fb = amdgpu_dm_plane_helper_prepare_fb,
 	.cleanup_fb = amdgpu_dm_plane_helper_cleanup_fb,
@@ -1428,6 +1549,16 @@ static const struct drm_plane_helper_funcs dm_plane_helper_funcs = {
 	.atomic_async_update = amdgpu_dm_plane_atomic_async_update
 };
 
+static const struct drm_plane_helper_funcs dm_primary_plane_helper_funcs = {
+	.prepare_fb = amdgpu_dm_plane_helper_prepare_fb,
+	.cleanup_fb = amdgpu_dm_plane_helper_cleanup_fb,
+	.atomic_check = amdgpu_dm_plane_atomic_check,
+	.atomic_async_check = amdgpu_dm_plane_atomic_async_check,
+	.atomic_async_update = amdgpu_dm_plane_atomic_async_update,
+	.get_scanout_buffer = amdgpu_dm_plane_get_scanout_buffer,
+	.panic_flush = amdgpu_dm_plane_panic_flush,
+};
+
 static void amdgpu_dm_plane_drm_plane_reset(struct drm_plane *plane)
 {
 	struct dm_plane_state *amdgpu_state = NULL;
@@ -1854,7 +1985,10 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	    plane->type != DRM_PLANE_TYPE_CURSOR)
 		drm_plane_enable_fb_damage_clips(plane);
 
-	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(plane, &dm_primary_plane_helper_funcs);
+	else
+		drm_plane_helper_add(plane, &dm_plane_helper_funcs);
 
 #ifdef AMD_PRIVATE_COLOR
 	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c
index 60a64d2903527..3b16c3cda2c3e 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c
@@ -334,6 +334,22 @@ void hubp3_program_tiling(
 
 }
 
+void hubp3_clear_tiling(struct hubp *hubp)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	REG_UPDATE(DCHUBP_REQ_SIZE_CONFIG, SWATH_HEIGHT, 0);
+	REG_UPDATE(DCSURF_TILING_CONFIG, SW_MODE, DC_SW_LINEAR);
+
+	REG_UPDATE_6(DCSURF_SURFACE_CONTROL,
+		PRIMARY_SURFACE_DCC_EN, 0,
+		PRIMARY_SURFACE_DCC_IND_BLK, 0,
+		PRIMARY_SURFACE_DCC_IND_BLK_C, 0,
+		SECONDARY_SURFACE_DCC_EN, 0,
+		SECONDARY_SURFACE_DCC_IND_BLK, 0,
+		SECONDARY_SURFACE_DCC_IND_BLK_C, 0);
+}
+
 void hubp3_dcc_control(struct hubp *hubp, bool enable,
 		enum hubp_ind_block_size blk_size)
 {
@@ -512,6 +528,7 @@ static struct hubp_funcs dcn30_hubp_funcs = {
 	.hubp_in_blank = hubp1_in_blank,
 	.hubp_soft_reset = hubp1_soft_reset,
 	.hubp_set_flip_int = hubp1_set_flip_int,
+	.hubp_clear_tiling = hubp3_clear_tiling,
 };
 
 bool hubp3_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h b/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h
index b010531a7fe88..cfb01bf340a1a 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h
@@ -297,6 +297,8 @@ void hubp3_read_state(struct hubp *hubp);
 
 void hubp3_init(struct hubp *hubp);
 
+void hubp3_clear_tiling(struct hubp *hubp);
+
 #endif /* __DC_HUBP_DCN30_H__ */
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c
index 8394e8c069199..46b804ed05fba 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c
@@ -96,6 +96,7 @@ static struct hubp_funcs dcn31_hubp_funcs = {
 	.hubp_set_flip_int = hubp1_set_flip_int,
 	.hubp_in_blank = hubp1_in_blank,
 	.program_extended_blank = hubp31_program_extended_blank,
+	.hubp_clear_tiling = hubp3_clear_tiling,
 };
 
 bool hubp31_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index 16580d6242789..d0878fc0cc948 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -275,6 +275,7 @@ struct hubp_funcs {
 			enum hubp_3dlut_fl_crossbar_bit_slice bit_slice_cb_b,
 			enum hubp_3dlut_fl_crossbar_bit_slice bit_slice_cr_r);
 	int (*hubp_get_3dlut_fl_done)(struct hubp *hubp);
+	void (*hubp_clear_tiling)(struct hubp *hubp);
 };
 
 #endif

base-commit: a5c2320151ff7cdf9ec50630d638a417ff927e31
-- 
2.46.2

