Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D17404320
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F284B6E40D;
	Thu,  9 Sep 2021 01:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9013289E38
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:46:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C02261167;
 Thu,  9 Sep 2021 01:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631151986;
 bh=kc1FYvBpSgEy2QFyFkir9/64Xk8FZ8y5oackNASlSTc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VNvtNodSAgYGanVNKOUqsN8JtXegVOllNaQvJI1qg7m54VOBoc3SDZejBt5c49sK0
 +1XWXWwVy1WyetHiPO04JLbuc1/7h1VYw/a4guCydBGarHLjuHpV8bMSybZ+DX+f1p
 qZo+SMNCF9A5PBmkyKGRAR94PUMch321Y9XnO3X1xqWyg+3wiTAwMZpQDWo1g1Yzez
 92z1PsranMIgc1w8ZCJS58mlQJ85mN51rFuWURbALplXhob5MyHEPsEmhoQRhbb0ij
 SIbm2IRBHzc+WUKPrRG5tWlg6PZCzqVRaL3Ir7pVZBWn0flFIv50pQKwmbhq2F/+Sq
 XSDPyCYCuAnXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zack Rusin <zackr@vmware.com>, Roland Scheidegger <sroland@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 002/252] drm/vmwgfx: Fix subresource updates with
 new contexts
Date: Wed,  8 Sep 2021 21:42:12 -0400
Message-Id: <20210909014623.128976-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909014623.128976-1-sashal@kernel.org>
References: <20210909014623.128976-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Zack Rusin <zackr@vmware.com>

[ Upstream commit a12be0277316ed923411c9c80b2899ee74d2b033 ]

The has_dx variable was only set during the initialization which
meant that UPDATE_SUBRESOURCE was never used. We were emulating it
with UPDATE_GB_IMAGE but that's always been a stop-gap. Instead
of has_dx which has been deprecated a long time ago we need to check
for whether shader model 4.0 or newer is available to the device.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210609172307.131929-4-zackr@vmware.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 0835468bb2ee..47c03a276515 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1872,7 +1872,6 @@ static void vmw_surface_dirty_range_add(struct vmw_resource *res, size_t start,
 static int vmw_surface_dirty_sync(struct vmw_resource *res)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
-	bool has_dx = 0;
 	u32 i, num_dirty;
 	struct vmw_surface_dirty *dirty =
 		(struct vmw_surface_dirty *) res->dirty;
@@ -1899,7 +1898,7 @@ static int vmw_surface_dirty_sync(struct vmw_resource *res)
 	if (!num_dirty)
 		goto out;
 
-	alloc_size = num_dirty * ((has_dx) ? sizeof(*cmd1) : sizeof(*cmd2));
+	alloc_size = num_dirty * ((has_sm4_context(dev_priv)) ? sizeof(*cmd1) : sizeof(*cmd2));
 	cmd = VMW_CMD_RESERVE(dev_priv, alloc_size);
 	if (!cmd)
 		return -ENOMEM;
@@ -1917,7 +1916,7 @@ static int vmw_surface_dirty_sync(struct vmw_resource *res)
 		 * DX_UPDATE_SUBRESOURCE is aware of array surfaces.
 		 * UPDATE_GB_IMAGE is not.
 		 */
-		if (has_dx) {
+		if (has_sm4_context(dev_priv)) {
 			cmd1->header.id = SVGA_3D_CMD_DX_UPDATE_SUBRESOURCE;
 			cmd1->header.size = sizeof(cmd1->body);
 			cmd1->body.sid = res->id;
-- 
2.30.2

