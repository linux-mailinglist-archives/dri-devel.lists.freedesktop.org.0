Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C814DE02E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112710E189;
	Fri, 18 Mar 2022 17:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E2F10E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:43:53 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 8959428909B;
 Fri, 18 Mar 2022 17:43:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1647625432; bh=Pq3m+BVAc4QHE9tP+/Vw24SFr8lOiJbCJYcCL0sQyGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XPGcKNX/p/6Nz7SUrgz317LYuM1TPHWmvGpXR5ge1jF7ZHic/B5bE4PHpl/wj1NoH
 D1mVTjdi2tW7O5TZwZ8QTR8i0Mmn/k20ySelQSGs9Xf4yQIX5vbenP2HT2qwpXOxtb
 57HA/V5wmXE3+lgh9ZjNZ2WwAYCHNrRJH6v70IrtixnArXBy14BvbN9yMGyu/jfiKD
 hGk1/stKO9lW9X3mlOwO7ThuVt0UYCN3eIvWDvdDuUC87+ASUmAhEcjRxevMTmPOs6
 E//PgsUYtKQdWrjSx/+R24LXjDhk8WAEXQC/FomZTUbl9dYuWYunCiTx3G0JsFJKl7
 hG92Zlp6s7vrw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/vmwgfx: Disable command buffers on svga3 without
 gbobjects
Date: Fri, 18 Mar 2022 13:43:31 -0400
Message-Id: <20220318174332.440068-5-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318174332.440068-1-zack@kde.org>
References: <20220318174332.440068-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, stable@vger.kernel.org, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

With very limited vram on svga3 it's difficult to handle all the surface
migrations. Without gbobjects, i.e. the ability to store surfaces in
guest mobs, there's no reason to support intermediate svga2 features,
especially because we can fall back to fb traces and svga3 will never
support those in-between features.

On svga3 we wither want to use fb traces or screen targets
(i.e. gbobjects), nothing in between. This fixes presentation on a lot
of fusion/esxi tech previews where the exposed svga3 caps haven't been
finalized yet.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 2cd80dbd3551 ("drm/vmwgfx: Add basic support for SVGA3")
Cc: <stable@vger.kernel.org> # v5.14+
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index bf1b394753da..162dfeb1cc5a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -675,11 +675,14 @@ int vmw_cmd_emit_dummy_query(struct vmw_private *dev_priv,
  */
 bool vmw_cmd_supported(struct vmw_private *vmw)
 {
-	if ((vmw->capabilities & (SVGA_CAP_COMMAND_BUFFERS |
-				  SVGA_CAP_CMD_BUFFERS_2)) != 0)
-		return true;
+	bool has_cmdbufs =
+		(vmw->capabilities & (SVGA_CAP_COMMAND_BUFFERS |
+				      SVGA_CAP_CMD_BUFFERS_2)) != 0;
+	if (vmw_is_svga_v3(vmw))
+		return (has_cmdbufs &&
+			(vmw->capabilities & SVGA_CAP_GBOBJECTS) != 0);
 	/*
 	 * We have FIFO cmd's
 	 */
-	return vmw->fifo_mem != NULL;
+	return has_cmdbufs || vmw->fifo_mem != NULL;
 }
-- 
2.32.0

