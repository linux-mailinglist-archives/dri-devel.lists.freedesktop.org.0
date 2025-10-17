Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03824BE9772
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A3410EC4C;
	Fri, 17 Oct 2025 15:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kHxYZTvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3510EC4A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:05:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C1AF64429;
 Fri, 17 Oct 2025 15:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F015C4CEE7;
 Fri, 17 Oct 2025 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760713542;
 bh=jd2Oz//zHIxBpGFXepWRdskcnPG6U7GEtIK76+QESCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kHxYZTvFLiZNn4iJRPnYJzc895Hhh9m31REP7yKsAoaAGpGpjfG6w/lGnQXGvJSoa
 POrPPnXQObj7rwadO5ZpLAfVRQWN8ekPr2v4nYk824dYm2njkgOLiqy2cgxCtjT9Xl
 kvDEqeacj6UFWWnRjx0a1sF6uDmq05zArWbtAYog=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Zack Rusin <zack.rusin@broadcom.com>,
 Kuzey Arda Bulut <kuzeyardabulut@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 dri-devel@lists.freedesktop.org, Ian Forbes <ian.forbes@broadcom.com>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 033/201] drm/vmwgfx: Fix a null-ptr access in the cursor
 snooper
Date: Fri, 17 Oct 2025 16:51:34 +0200
Message-ID: <20251017145135.961739138@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145134.710337454@linuxfoundation.org>
References: <20251017145134.710337454@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Zack Rusin <zack.rusin@broadcom.com>

[ Upstream commit 5ac2c0279053a2c5265d46903432fb26ae2d0da2 ]

Check that the resource which is converted to a surface exists before
trying to use the cursor snooper on it.

vmw_cmd_res_check allows explicit invalid (SVGA3D_INVALID_ID) identifiers
because some svga commands accept SVGA3D_INVALID_ID to mean "no surface",
unfortunately functions that accept the actual surfaces as objects might
(and in case of the cursor snooper, do not) be able to handle null
objects. Make sure that we validate not only the identifier (via the
vmw_cmd_res_check) but also check that the actual resource exists before
trying to do something with it.

Fixes unchecked null-ptr reference in the snooping code.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: c0951b797e7d ("drm/vmwgfx: Refactor resource management")
Reported-by: Kuzey Arda Bulut <kuzeyardabulut@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>
Link: https://lore.kernel.org/r/20250917153655.1968583-1-zack.rusin@broadcom.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index b129ce873af3f..b235e7cc41f3f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1514,6 +1514,7 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 		       SVGA3dCmdHeader *header)
 {
 	struct vmw_bo *vmw_bo = NULL;
+	struct vmw_resource *res;
 	struct vmw_surface *srf = NULL;
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdSurfaceDMA);
 	int ret;
@@ -1549,18 +1550,24 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
 
 	dirty = (cmd->body.transfer == SVGA3D_WRITE_HOST_VRAM) ?
 		VMW_RES_DIRTY_SET : 0;
-	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
-				dirty, user_surface_converter,
-				&cmd->body.host.sid, NULL);
+	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface, dirty,
+				user_surface_converter, &cmd->body.host.sid,
+				NULL);
 	if (unlikely(ret != 0)) {
 		if (unlikely(ret != -ERESTARTSYS))
 			VMW_DEBUG_USER("could not find surface for DMA.\n");
 		return ret;
 	}
 
-	srf = vmw_res_to_srf(sw_context->res_cache[vmw_res_surface].res);
+	res = sw_context->res_cache[vmw_res_surface].res;
+	if (!res) {
+		VMW_DEBUG_USER("Invalid DMA surface.\n");
+		return -EINVAL;
+	}
 
-	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->tbo, header);
+	srf = vmw_res_to_srf(res);
+	vmw_kms_cursor_snoop(srf, sw_context->fp->tfile, &vmw_bo->tbo,
+			     header);
 
 	return 0;
 }
-- 
2.51.0



