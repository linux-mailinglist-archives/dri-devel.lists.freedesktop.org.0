Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2D373411
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 05:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605C36E40A;
	Wed,  5 May 2021 03:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664976E40A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 03:57:43 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 4 May 2021 20:57:40 -0700
Received: from vertex.localdomain (unknown [10.21.250.233])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 6543F2047D;
 Tue,  4 May 2021 20:57:42 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/vmwgfx: Mark a surface gpu-dirty after the
 SVGA3dCmdDXGenMips command
Date: Tue, 4 May 2021 23:57:36 -0400
Message-ID: <20210505035740.286923-3-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505035740.286923-1-zackr@vmware.com>
References: <20210505035740.286923-1-zackr@vmware.com>
MIME-Version: 1.0
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
Cc: krastevm@vmware.com, sroland@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellstrom <thellstrom@vmware.com>

The SVGA3dCmdDXGenMips command uses a shader-resource view to access
the underlying surface. Normally accesses using that view-type are not
dirtying the underlying surface, but that particular command is an
exception.
Mark the surface gpu-dirty after a SVGA3dCmdDXGenMips command has been
submitted.

This fixes the piglit getteximage-formats test run with
SVGA_FORCE_COHERENT=1

Fixes: a9f58c456e9d ("drm/vmwgfx: Be more restrictive when dirtying resource")
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
Reviewed-by: Charmaine Lee <charmainel@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index ab752b102c9e..ca5360efa172 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -2763,12 +2763,24 @@ static int vmw_cmd_dx_genmips(struct vmw_private *dev_priv,
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXGenMips) =
 		container_of(header, typeof(*cmd), header);
-	struct vmw_resource *ret;
+	struct vmw_resource *view;
+	struct vmw_res_cache_entry *rcache;
 
-	ret = vmw_view_id_val_add(sw_context, vmw_view_sr,
-				  cmd->body.shaderResourceViewId);
+	view = vmw_view_id_val_add(sw_context, vmw_view_sr,
+				   cmd->body.shaderResourceViewId);
+	if (IS_ERR(view))
+		return PTR_ERR(view);
 
-	return PTR_ERR_OR_ZERO(ret);
+	/*
+	 * Normally the shader-resource view is not gpu-dirtying, but for
+	 * this particular command it is...
+	 * So mark the last looked-up surface, which is the surface
+	 * the view points to, gpu-dirty.
+	 */
+	rcache = &sw_context->res_cache[vmw_res_surface];
+	vmw_validation_res_set_dirty(sw_context->ctx, rcache->private,
+				     VMW_RES_DIRTY_SET);
+	return 0;
 }
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
