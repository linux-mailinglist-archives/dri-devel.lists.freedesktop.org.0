Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30446A2DA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCFC73DE0;
	Mon,  6 Dec 2021 17:26:46 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BF273B2E
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:41 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 3BA5A29F818;
 Mon,  6 Dec 2021 17:26:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811600; bh=ThjMypeb9UA1KlwgW+cAQt7A/DUHfLQUQ3icdwHInk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DT4x1DXsvxe47P4pTj+khMRRJWCOOnw3K+3Ty4PIz0LunbzMj4gr2pAeRWqNZ5zh0
 RwxhTLA76Icb5JNfmi7eIUre617CsiqLNymFQ2AFlFmLcZB8T59J6Zo+mr0R6Pw+Bz
 PDPlInIukVabW4SEgruhFTvNyQV2n/sGgUl2vvqJgiQ50VU+mOjqlhBZMDMvYb2I8V
 REOQj+Y2+27vyNZj3pTyayJfEWvHFH6yRMEOA/4NTIZPRb+NqRG8aZkz4TD06qehFp
 qrkRjbBw+zIyPmFs7OY8iMs2BnSgqh7pZcKrJsnbgxEgkhDLoZ5fjFrcHj9Ck0WfLv
 1O60F9ldTlJww==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 10/12] drm/vmwgfx: add support for updating only offsets of
 constant buffers
Date: Mon,  6 Dec 2021 12:26:18 -0500
Message-Id: <20211206172620.3139754-11-zack@kde.org>
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
Cc: krastevm@vmware.com, Charmaine Lee <charmainel@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roland Scheidegger <sroland@vmware.com>

This adds support for the
SVGA_3D_CMD_DX_SET_VS/PS/GS/HS/DS/CS_CONSTANT_BUFFER_OFFSET commands (which only update
the offset, but don't rebind the buffer), which saves some overhead.

Signed-off-by: Roland Scheidegger <sroland@vmware.com>
Reviewed-by: Charmaine Lee <charmainel@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c | 21 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.h |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 56 +++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
index 9aa69ba85670..ae2de914eb89 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.c
@@ -353,6 +353,27 @@ void vmw_binding_add(struct vmw_ctx_binding_state *cbs,
 	INIT_LIST_HEAD(&loc->res_list);
 }
 
+/**
+ * vmw_binding_cb_offset_update: Update the offset of a cb binding
+ *
+ * @cbs: Pointer to the context binding state tracker.
+ * @shader_slot: The shader slot of the binding.
+ * @slot: The slot of the binding.
+ * @offsetInBytes: The new offset of the binding.
+ *
+ * Updates the offset of an existing cb binding in the context binding
+ * state structure @cbs.
+ */
+void vmw_binding_cb_offset_update(struct vmw_ctx_binding_state *cbs,
+				  u32 shader_slot, u32 slot, u32 offsetInBytes)
+{
+	struct vmw_ctx_bindinfo *loc =
+		vmw_binding_loc(cbs, vmw_ctx_binding_cb, shader_slot, slot);
+	struct vmw_ctx_bindinfo_cb *loc_cb =
+		(struct vmw_ctx_bindinfo_cb *)((u8 *) loc);
+	loc_cb->offset = offsetInBytes;
+}
+
 /**
  * vmw_binding_add_uav_index - Add UAV index for tracking.
  * @cbs: Pointer to the context binding state tracker.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h
index 6b1b234d12a1..85b90f7d398d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_binding.h
@@ -217,6 +217,8 @@ struct vmw_ctx_bindinfo_so {
 extern void vmw_binding_add(struct vmw_ctx_binding_state *cbs,
 			    const struct vmw_ctx_bindinfo *ci,
 			    u32 shader_slot, u32 slot);
+extern void vmw_binding_cb_offset_update(struct vmw_ctx_binding_state *cbs,
+					 u32 shader_slot, u32 slot, u32 offsetInBytes);
 extern void vmw_binding_add_uav_index(struct vmw_ctx_binding_state *cbs,
 				      uint32 slot, uint32 splice_index);
 extern void
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index fd204fe2c68f..44ca23b0ea4e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -2163,6 +2163,44 @@ vmw_cmd_dx_set_single_constant_buffer(struct vmw_private *dev_priv,
 	return 0;
 }
 
+/**
+ * vmw_cmd_dx_set_constant_buffer_offset - Validate
+ * SVGA_3D_CMD_DX_SET_VS/PS/GS/HS/DS/CS_CONSTANT_BUFFER_OFFSET command.
+ *
+ * @dev_priv: Pointer to a device private struct.
+ * @sw_context: The software context being used for this batch.
+ * @header: Pointer to the command header in the command stream.
+ */
+static int
+vmw_cmd_dx_set_constant_buffer_offset(struct vmw_private *dev_priv,
+				      struct vmw_sw_context *sw_context,
+				      SVGA3dCmdHeader *header)
+{
+	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXSetConstantBufferOffset);
+
+	struct vmw_ctx_validation_info *ctx_node = VMW_GET_CTX_NODE(sw_context);
+	u32 shader_slot;
+
+	if (!has_sm5_context(dev_priv))
+		return -EINVAL;
+
+	if (!ctx_node)
+		return -EINVAL;
+
+	cmd = container_of(header, typeof(*cmd), header);
+	if (cmd->body.slot >= SVGA3D_DX_MAX_CONSTBUFFERS) {
+		VMW_DEBUG_USER("Illegal const buffer slot %u.\n",
+			       (unsigned int) cmd->body.slot);
+		return -EINVAL;
+	}
+
+	shader_slot = cmd->header.id - SVGA_3D_CMD_DX_SET_VS_CONSTANT_BUFFER_OFFSET;
+	vmw_binding_cb_offset_update(ctx_node->staged, shader_slot,
+				     cmd->body.slot, cmd->body.offsetInBytes);
+
+	return 0;
+}
+
 /**
  * vmw_cmd_dx_set_shader_res - Validate SVGA_3D_CMD_DX_SET_SHADER_RESOURCES
  * command
@@ -3526,6 +3564,24 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_TRANSFER_FROM_BUFFER,
 		    &vmw_cmd_dx_transfer_from_buffer,
 		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_VS_CONSTANT_BUFFER_OFFSET,
+		    &vmw_cmd_dx_set_constant_buffer_offset,
+		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_PS_CONSTANT_BUFFER_OFFSET,
+		    &vmw_cmd_dx_set_constant_buffer_offset,
+		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_GS_CONSTANT_BUFFER_OFFSET,
+		    &vmw_cmd_dx_set_constant_buffer_offset,
+		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_HS_CONSTANT_BUFFER_OFFSET,
+		    &vmw_cmd_dx_set_constant_buffer_offset,
+		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_DS_CONSTANT_BUFFER_OFFSET,
+		    &vmw_cmd_dx_set_constant_buffer_offset,
+		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_CS_CONSTANT_BUFFER_OFFSET,
+		    &vmw_cmd_dx_set_constant_buffer_offset,
+		    true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_INTRA_SURFACE_COPY, &vmw_cmd_intra_surface_copy,
 		    true, false, true),
 
-- 
2.32.0

