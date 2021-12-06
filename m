Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741446A2D8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FF373BA7;
	Mon,  6 Dec 2021 17:26:42 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6D73B2E
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:40 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E632C29F4A3;
 Mon,  6 Dec 2021 17:26:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811598; bh=8LIJKgkb1aCvVq/6NOI3JwtllQhifk+erpTqHFAB8/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ka1tYDK8JgXzkdvGZ6w5uCgEIVlKo6i3Hch8KJHK5V28v3zklWeeL/1X0WNmEcyi4
 unqhA9YrAwy6g3KmbC3sOJwxdeJOMNHk4ULO0o74zBDHO9oCN1Hvv0uzyzcQ5RP/eH
 vDyHwLtEQn/VAqB/3lAiHrnrYEYUavv+o5O8F9JWQ01Z1CirBnD/QW5ShKS+ZB4AjG
 gHIbqB4Jz3MTc/nyQuApOt8X55mBYTNOLgzsA0ngfJEkB4GytfBt/KsBWgY0Dav3ka
 MwDGB1OIVf0Q60nCKlX24OJ37gB+p2KQSb1aPNH65NSIS+d/ji/F77EStLoHRIkVWk
 e7jnOYeQmSSbA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 07/12] drm/vmwgfx: support
 SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2 command
Date: Mon,  6 Dec 2021 12:26:15 -0500
Message-Id: <20211206172620.3139754-8-zack@kde.org>
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

This is going to be required for setting the sample count when
rendering with no attachments.
Also cleans up view handling (should fix depthstencil_v2).

Reviewed-by: Charmaine Lee <charmainel@vmware.com>
Signed-off-by: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c      | 4 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_so.h      | 6 +++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index fde26360e066..f3a11428ba90 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3559,6 +3559,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    &vmw_cmd_dx_define_streamoutput, true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_BIND_STREAMOUTPUT,
 		    &vmw_cmd_dx_bind_streamoutput, true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2,
+		    &vmw_cmd_dx_so_define, true, false, true),
 };
 
 bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
index 9739ffde007c..4ea32b01efc0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
@@ -567,4 +567,8 @@ static void vmw_so_build_asserts(void)
 		     offsetof(SVGA3dCmdDXDefineRenderTargetView, sid));
 	BUILD_BUG_ON(offsetof(struct vmw_view_define, sid) !=
 		     offsetof(SVGA3dCmdDXDefineDepthStencilView, sid));
+	BUILD_BUG_ON(offsetof(struct vmw_view_define, sid) !=
+		     offsetof(SVGA3dCmdDXDefineUAView, sid));
+	BUILD_BUG_ON(offsetof(struct vmw_view_define, sid) !=
+		     offsetof(SVGA3dCmdDXDefineDepthStencilView_v2, sid));
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_so.h b/drivers/gpu/drm/vmwgfx/vmwgfx_so.h
index f48b84bfeeac..01c701e7466e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_so.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_so.h
@@ -93,7 +93,10 @@ static inline enum vmw_view_type vmw_view_cmd_to_type(u32 id)
 	    id == SVGA_3D_CMD_DX_DESTROY_UA_VIEW)
 		return vmw_view_ua;
 
-	if (tmp > (u32)vmw_view_max)
+	if (id == SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW_V2)
+		return vmw_view_ds;
+
+	if (tmp > (u32)vmw_view_ds)
 		return vmw_view_max;
 
 	return (enum vmw_view_type) tmp;
@@ -123,6 +126,7 @@ static inline enum vmw_so_type vmw_so_cmd_to_type(u32 id)
 	case SVGA_3D_CMD_DX_DESTROY_DEPTHSTENCIL_STATE:
 		return vmw_so_ds;
 	case SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE:
+	case SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2:
 	case SVGA_3D_CMD_DX_DESTROY_RASTERIZER_STATE:
 		return vmw_so_rs;
 	case SVGA_3D_CMD_DX_DEFINE_SAMPLER_STATE:
-- 
2.32.0

