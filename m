Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6979E46A2D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8774B73C27;
	Mon,  6 Dec 2021 17:26:42 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6275E73AA3
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:40 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id BA50429F4A2;
 Mon,  6 Dec 2021 17:26:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811599; bh=/d51hgzs6oh82EOpgR7PawLlEnDN1nUE0eNuH+XffpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jnMxbkozbbjG/YkfFOc7sd2QpyHi8TizBTIk4xcPjtH/k8hBVOLMZUiVzclpIE3AD
 FysxYPJaBu5UMXSZl5pjayKRBIWF3/e/lffgrSLElw6zEibjiZLnzILxh0+XmmXAZH
 3nX2OjPjidkQ45AoIRdOJF/7gaVgsmFRoemAr2cIrJAeoI9liceFMNmuebRH2+624S
 gJramHO7PbIF2uPTRsvAzazJO1f/dCMy+J0+SbLBUa79Aj8TmPW2adiM+uZtz5/ceT
 87QV7PNlLTaFP8djXfCN/ktaIuBI04k1p620Bbf7o3W+19sjIYFYqcehfkq/VcVfCH
 YUkD2aL7SAk+g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 08/12] drm/vmwgfx: support 64 UAVs
Date: Mon,  6 Dec 2021 12:26:16 -0500
Message-Id: <20211206172620.3139754-9-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-1-zack@kde.org>
References: <20211206172620.3139754-1-zack@kde.org>
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
Cc: krastevm@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

If the host supports SVGA3D_DEVCAP_GL43, we can handle 64 instead of
just 8 UAVs.
Based on a patch from Roland Scheidegger <sroland@vmware.com>.

Signed-off-by: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.h |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  6 +++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     | 20 ++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  4 ++--
 5 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
index fc8cc222ec51..9aa69ba85670 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
@@ -1070,7 +1070,7 @@ static int vmw_emit_set_uav(struct vmw_ctx_binding_state *cbs)
 	size_t cmd_size, view_id_size;
 	const struct vmw_resource *ctx = vmw_cbs_context(cbs);
 
-	vmw_collect_view_ids(cbs, loc, SVGA3D_MAX_UAVIEWS);
+	vmw_collect_view_ids(cbs, loc, vmw_max_num_uavs(cbs->dev_priv));
 	view_id_size = cbs->bind_cmd_count*sizeof(uint32);
 	cmd_size = sizeof(*cmd) + view_id_size;
 	cmd = VMW_CMD_CTX_RESERVE(ctx->dev_priv, cmd_size, ctx->id);
@@ -1100,7 +1100,7 @@ static int vmw_emit_set_cs_uav(struct vmw_ctx_binding_state *cbs)
 	size_t cmd_size, view_id_size;
 	const struct vmw_resource *ctx = vmw_cbs_context(cbs);
 
-	vmw_collect_view_ids(cbs, loc, SVGA3D_MAX_UAVIEWS);
+	vmw_collect_view_ids(cbs, loc, vmw_max_num_uavs(cbs->dev_priv));
 	view_id_size = cbs->bind_cmd_count*sizeof(uint32);
 	cmd_size = sizeof(*cmd) + view_id_size;
 	cmd = VMW_CMD_CTX_RESERVE(ctx->dev_priv, cmd_size, ctx->id);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h
index dcb71fd0bb3b..6b1b234d12a1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h
@@ -200,7 +200,7 @@ struct vmw_dx_shader_bindings {
  * @splice_index: The device splice index set by user-space.
  */
 struct vmw_ctx_bindinfo_uav {
-	struct vmw_ctx_bindinfo_view views[SVGA3D_MAX_UAVIEWS];
+	struct vmw_ctx_bindinfo_view views[SVGA3D_DX11_1_MAX_UAVIEWS];
 	uint32 index;
 };
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 71b6b1219ce1..2d59bdad0373 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -364,6 +364,7 @@ static void vmw_print_sm_type(struct vmw_private *dev_priv)
 		[VMW_SM_4] = "SM4",
 		[VMW_SM_4_1] = "SM4_1",
 		[VMW_SM_5] = "SM_5",
+		[VMW_SM_5_1X] = "SM_5_1X",
 		[VMW_SM_MAX] = "Invalid"
 	};
 	BUILD_BUG_ON(ARRAY_SIZE(names) != (VMW_SM_MAX + 1));
@@ -1083,8 +1084,11 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 			dev_priv->sm_type = VMW_SM_4_1;
 		if (has_sm4_1_context(dev_priv) &&
 				(dev_priv->capabilities2 & SVGA_CAP2_DX3)) {
-			if (vmw_devcap_get(dev_priv, SVGA3D_DEVCAP_SM5))
+			if (vmw_devcap_get(dev_priv, SVGA3D_DEVCAP_SM5)) {
 				dev_priv->sm_type = VMW_SM_5;
+				if (vmw_devcap_get(dev_priv, SVGA3D_DEVCAP_GL43))
+					dev_priv->sm_type = VMW_SM_5_1X;
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index daa4501d17ec..21dd69e5cdfb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -488,6 +488,7 @@ enum {
  * @VMW_SM_4: Context support upto SM4.
  * @VMW_SM_4_1: Context support upto SM4_1.
  * @VMW_SM_5: Context support up to SM5.
+ * @VMW_SM_5_1X: Adds support for sm5_1 and gl43 extensions.
  * @VMW_SM_MAX: Should be the last.
  */
 enum vmw_sm_type {
@@ -495,6 +496,7 @@ enum vmw_sm_type {
 	VMW_SM_4,
 	VMW_SM_4_1,
 	VMW_SM_5,
+	VMW_SM_5_1X,
 	VMW_SM_MAX
 };
 
@@ -755,6 +757,24 @@ static inline bool has_sm5_context(const struct vmw_private *dev_priv)
 	return (dev_priv->sm_type >= VMW_SM_5);
 }
 
+/**
+ * has_gl43_context - Does the device support GL43 context.
+ * @dev_priv: Device private.
+ *
+ * Return: Bool value if device support SM5 context or not.
+ */
+static inline bool has_gl43_context(const struct vmw_private *dev_priv)
+{
+	return (dev_priv->sm_type >= VMW_SM_5_1X);
+}
+
+
+static inline u32 vmw_max_num_uavs(struct vmw_private *dev_priv)
+{
+	return (has_gl43_context(dev_priv) ?
+			SVGA3D_DX11_1_MAX_UAVIEWS : SVGA3D_MAX_UAVIEWS);
+}
+
 extern void vmw_svga_enable(struct vmw_private *dev_priv);
 extern void vmw_svga_disable(struct vmw_private *dev_priv);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index f3a11428ba90..fd204fe2c68f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -2916,7 +2916,7 @@ static int vmw_cmd_set_uav(struct vmw_private *dev_priv,
 	if (!has_sm5_context(dev_priv))
 		return -EINVAL;
 
-	if (num_uav > SVGA3D_MAX_UAVIEWS) {
+	if (num_uav > vmw_max_num_uavs(dev_priv)) {
 		VMW_DEBUG_USER("Invalid UAV binding.\n");
 		return -EINVAL;
 	}
@@ -2948,7 +2948,7 @@ static int vmw_cmd_set_cs_uav(struct vmw_private *dev_priv,
 	if (!has_sm5_context(dev_priv))
 		return -EINVAL;
 
-	if (num_uav > SVGA3D_MAX_UAVIEWS) {
+	if (num_uav > vmw_max_num_uavs(dev_priv)) {
 		VMW_DEBUG_USER("Invalid UAV binding.\n");
 		return -EINVAL;
 	}
-- 
2.32.0

