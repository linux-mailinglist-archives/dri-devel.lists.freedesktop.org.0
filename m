Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC83C7D3C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 06:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F56E156;
	Wed, 14 Jul 2021 04:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1926E156
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 04:14:20 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 13 Jul 2021 21:14:16 -0700
Received: from vertex.localdomain (unknown [10.21.244.34])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 8DFBF20250;
 Tue, 13 Jul 2021 21:14:18 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/vmwgfx: Switch to using DRM_IOCTL_DEF_DRV
Date: Wed, 14 Jul 2021 00:14:15 -0400
Message-ID: <20210714041417.221947-2-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714041417.221947-1-zackr@vmware.com>
References: <20210714041417.221947-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro has been accounting for DRM_COMMAND_BASE for a long time
now so there's no reason to still be duplicating it. Plus we were
leaving the name undefined which meant that all the DRM ioctl
warnings/errors were always listing "null" ioctl at the culprit.

This fixes the undefined ioctl name and removes duplicated code.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 176 +++++++++++++---------------
 1 file changed, 84 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 7d8cc2f6b04e..359f2e6f3693 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -159,110 +159,102 @@
 	DRM_IOW(DRM_COMMAND_BASE + DRM_VMW_MKSSTAT_REMOVE,	\
 		struct drm_vmw_mksstat_remove_arg)
 
-/*
- * The core DRM version of this macro doesn't account for
- * DRM_COMMAND_BASE.
- */
-
-#define VMW_IOCTL_DEF(ioctl, func, flags) \
-  [DRM_IOCTL_NR(DRM_IOCTL_##ioctl) - DRM_COMMAND_BASE] = {DRM_IOCTL_##ioctl, flags, func}
-
 /*
  * Ioctl definitions.
  */
 
 static const struct drm_ioctl_desc vmw_ioctls[] = {
-	VMW_IOCTL_DEF(VMW_GET_PARAM, vmw_getparam_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_ALLOC_DMABUF, vmw_bo_alloc_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_UNREF_DMABUF, vmw_bo_unref_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_CURSOR_BYPASS,
-		      vmw_kms_cursor_bypass_ioctl,
-		      DRM_MASTER),
-
-	VMW_IOCTL_DEF(VMW_CONTROL_STREAM, vmw_overlay_ioctl,
-		      DRM_MASTER),
-	VMW_IOCTL_DEF(VMW_CLAIM_STREAM, vmw_stream_claim_ioctl,
-		      DRM_MASTER),
-	VMW_IOCTL_DEF(VMW_UNREF_STREAM, vmw_stream_unref_ioctl,
-		      DRM_MASTER),
-
-	VMW_IOCTL_DEF(VMW_CREATE_CONTEXT, vmw_context_define_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_UNREF_CONTEXT, vmw_context_destroy_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_CREATE_SURFACE, vmw_surface_define_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_UNREF_SURFACE, vmw_surface_destroy_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_REF_SURFACE, vmw_surface_reference_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_EXECBUF, vmw_execbuf_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_FENCE_WAIT, vmw_fence_obj_wait_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_FENCE_SIGNALED,
-		      vmw_fence_obj_signaled_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_FENCE_UNREF, vmw_fence_obj_unref_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_FENCE_EVENT, vmw_fence_event_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_GET_3D_CAP, vmw_get_cap_3d_ioctl,
-		      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_GET_PARAM, vmw_getparam_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_ALLOC_DMABUF, vmw_bo_alloc_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_UNREF_DMABUF, vmw_bo_unref_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_CURSOR_BYPASS,
+			  vmw_kms_cursor_bypass_ioctl,
+			  DRM_MASTER),
+
+	DRM_IOCTL_DEF_DRV(VMW_CONTROL_STREAM, vmw_overlay_ioctl,
+			  DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(VMW_CLAIM_STREAM, vmw_stream_claim_ioctl,
+			  DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(VMW_UNREF_STREAM, vmw_stream_unref_ioctl,
+			  DRM_MASTER),
+
+	DRM_IOCTL_DEF_DRV(VMW_CREATE_CONTEXT, vmw_context_define_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_UNREF_CONTEXT, vmw_context_destroy_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_CREATE_SURFACE, vmw_surface_define_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_UNREF_SURFACE, vmw_surface_destroy_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_REF_SURFACE, vmw_surface_reference_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_EXECBUF, vmw_execbuf_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_FENCE_WAIT, vmw_fence_obj_wait_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_FENCE_SIGNALED,
+			  vmw_fence_obj_signaled_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_FENCE_UNREF, vmw_fence_obj_unref_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_FENCE_EVENT, vmw_fence_event_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_GET_3D_CAP, vmw_get_cap_3d_ioctl,
+			  DRM_RENDER_ALLOW),
 
 	/* these allow direct access to the framebuffers mark as master only */
-	VMW_IOCTL_DEF(VMW_PRESENT, vmw_present_ioctl,
-		      DRM_MASTER | DRM_AUTH),
-	VMW_IOCTL_DEF(VMW_PRESENT_READBACK,
-		      vmw_present_readback_ioctl,
-		      DRM_MASTER | DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VMW_PRESENT, vmw_present_ioctl,
+			  DRM_MASTER | DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VMW_PRESENT_READBACK,
+			  vmw_present_readback_ioctl,
+			  DRM_MASTER | DRM_AUTH),
 	/*
 	 * The permissions of the below ioctl are overridden in
 	 * vmw_generic_ioctl(). We require either
 	 * DRM_MASTER or capable(CAP_SYS_ADMIN).
 	 */
-	VMW_IOCTL_DEF(VMW_UPDATE_LAYOUT,
-		      vmw_kms_update_layout_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_CREATE_SHADER,
-		      vmw_shader_define_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_UNREF_SHADER,
-		      vmw_shader_destroy_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_GB_SURFACE_CREATE,
-		      vmw_gb_surface_define_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_GB_SURFACE_REF,
-		      vmw_gb_surface_reference_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_SYNCCPU,
-		      vmw_user_bo_synccpu_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_CREATE_EXTENDED_CONTEXT,
-		      vmw_extended_context_define_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_GB_SURFACE_CREATE_EXT,
-		      vmw_gb_surface_define_ext_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_GB_SURFACE_REF_EXT,
-		      vmw_gb_surface_reference_ext_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_MSG,
-		      vmw_msg_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_MKSSTAT_RESET,
-		      vmw_mksstat_reset_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_MKSSTAT_ADD,
-		      vmw_mksstat_add_ioctl,
-		      DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_MKSSTAT_REMOVE,
-		      vmw_mksstat_remove_ioctl,
-		      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_UPDATE_LAYOUT,
+			  vmw_kms_update_layout_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_CREATE_SHADER,
+			  vmw_shader_define_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_UNREF_SHADER,
+			  vmw_shader_destroy_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_GB_SURFACE_CREATE,
+			  vmw_gb_surface_define_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_GB_SURFACE_REF,
+			  vmw_gb_surface_reference_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_SYNCCPU,
+			  vmw_user_bo_synccpu_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_CREATE_EXTENDED_CONTEXT,
+			  vmw_extended_context_define_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_GB_SURFACE_CREATE_EXT,
+			  vmw_gb_surface_define_ext_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_GB_SURFACE_REF_EXT,
+			  vmw_gb_surface_reference_ext_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_MSG,
+			  vmw_msg_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_MKSSTAT_RESET,
+			  vmw_mksstat_reset_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_MKSSTAT_ADD,
+			  vmw_mksstat_add_ioctl,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VMW_MKSSTAT_REMOVE,
+			  vmw_mksstat_remove_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static const struct pci_device_id vmw_pci_id_list[] = {
-- 
2.30.2

