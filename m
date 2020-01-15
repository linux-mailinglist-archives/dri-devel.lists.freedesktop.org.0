Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93513BEE4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8770C6E936;
	Wed, 15 Jan 2020 11:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A976E92F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D6F2E3F6BA;
 Wed, 15 Jan 2020 12:53:47 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ITSktjDx; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m34FRBvLi0pg; Wed, 15 Jan 2020 12:53:46 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id F03903F6BB;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8C87B36034F;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579089225; bh=/jEoEwT7+KmxMoU3uX6MDOBjIG61bosmEK0tbhTJi3w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ITSktjDx4XS0ecPfrFfz4FZkXAP+iWK5LfbPYJooWASiECoGoY3jFFhZ3/3xUegDI
 962894UuZeK28Hon4EkGM5EW4JnER4gS/qpJ+XXjP3z6FNgu1Bto7bIl1GCBgT9dVs
 EXUtcepb5G+FPd3WmrE0HVIXo2jrBvfjW2fzQaRU=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/vmwgfx: Replace deprecated PTR_RET
Date: Wed, 15 Jan 2020 12:53:23 +0100
Message-Id: <20200115115329.2836-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115115329.2836-1-thomas_os@shipmail.org>
References: <20200115115329.2836-1-thomas_os@shipmail.org>
MIME-Version: 1.0
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 508108ea2747 ("drm/vmwgfx: Don't refcount command-buffer managed
resource lookups during command buffer validation") slips in use of
deprecated PTR_RET. Use PTR_ERR_OR_ZERO instead.

As the PTR_ERR_OR_ZERO is a bit longer than PTR_RET, we introduce
local variable ret for proper indentation and line-length limits.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 934ad7c0c342..73489a45decb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -2377,9 +2377,12 @@ static int vmw_cmd_dx_clear_rendertarget_view(struct vmw_private *dev_priv,
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearRenderTargetView) =
 		container_of(header, typeof(*cmd), header);
+	struct vmw_resource *ret;
 
-	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_rt,
-					   cmd->body.renderTargetViewId));
+	ret = vmw_view_id_val_add(sw_context, vmw_view_rt,
+				  cmd->body.renderTargetViewId);
+
+	return PTR_ERR_OR_ZERO(ret);
 }
 
 /**
@@ -2396,9 +2399,12 @@ static int vmw_cmd_dx_clear_depthstencil_view(struct vmw_private *dev_priv,
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearDepthStencilView) =
 		container_of(header, typeof(*cmd), header);
+	struct vmw_resource *ret;
+
+	ret = vmw_view_id_val_add(sw_context, vmw_view_ds,
+				  cmd->body.depthStencilViewId);
 
-	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_ds,
-					   cmd->body.depthStencilViewId));
+	return PTR_ERR_OR_ZERO(ret);
 }
 
 static int vmw_cmd_dx_view_define(struct vmw_private *dev_priv,
@@ -2741,9 +2747,12 @@ static int vmw_cmd_dx_genmips(struct vmw_private *dev_priv,
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXGenMips) =
 		container_of(header, typeof(*cmd), header);
+	struct vmw_resource *ret;
+
+	ret = vmw_view_id_val_add(sw_context, vmw_view_sr,
+				  cmd->body.shaderResourceViewId);
 
-	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_sr,
-					   cmd->body.shaderResourceViewId));
+	return PTR_ERR_OR_ZERO(ret);
 }
 
 /**
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
