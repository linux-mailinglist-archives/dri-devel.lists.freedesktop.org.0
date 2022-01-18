Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B975A491687
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855751128ED;
	Tue, 18 Jan 2022 02:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01D31128EE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 02:35:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 325FA61118;
 Tue, 18 Jan 2022 02:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A67C36AF3;
 Tue, 18 Jan 2022 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473320;
 bh=Hvvm+t8YuGPHPo5EwnXIPry3zfErMAu9pssWp8p3sPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RMA0t2Zk2v3GpgK1bDgg/QByj2rKjmNFF7dtDinAEhFPzPCE5E8cZmh9Jm2Ce8voW
 q1oRWlqjPDMy8dyfifPuZFHi687WOsvLsU8BuKRPuM8GNXJWkLaEF+TfZ2Kibwemez
 dl1P71c28cQdg1c7kkcnsoCJxy9TScpKNSvp6hjudCijkBu1YYQcp+6NukTdJnJNTH
 kKb/izbLswWLpg5TUVDYRbAx1SI0VMHaVnZIHwt91f0Jjp+nZiPOpqDQbey2psqbgX
 7bLKOeI+T1ET+KLZsuPESEUS29obFYsltkiuoVAK486gzsiJF060fbpP3bIFQj3k5B
 9qmaO3jT+mbSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 070/188] drm/vmwgfx: Release ttm memory if probe
 fails
Date: Mon, 17 Jan 2022 21:29:54 -0500
Message-Id: <20220118023152.1948105-70-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Martin Krastev <krastevm@vmware.com>,
 linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

[ Upstream commit 28b5f3b6121b7db2a44be499cfca0b6b801588b6 ]

The ttm mem global state was leaking if the vmwgfx driver load failed.

In case of a driver load failure we have to make sure we also release
the ttm mem global state.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20211105193845.258816-3-zackr@vmware.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index ab9a1750e1dff..8d0b083ba267f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1617,34 +1617,40 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (ret)
-		return ret;
+		goto out_error;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
-		return ret;
+		goto out_error;
 
 	vmw = devm_drm_dev_alloc(&pdev->dev, &driver,
 				 struct vmw_private, drm);
-	if (IS_ERR(vmw))
-		return PTR_ERR(vmw);
+	if (IS_ERR(vmw)) {
+		ret = PTR_ERR(vmw);
+		goto out_error;
+	}
 
 	pci_set_drvdata(pdev, &vmw->drm);
 
 	ret = ttm_mem_global_init(&ttm_mem_glob, &pdev->dev);
 	if (ret)
-		return ret;
+		goto out_error;
 
 	ret = vmw_driver_load(vmw, ent->device);
 	if (ret)
-		return ret;
+		goto out_release;
 
 	ret = drm_dev_register(&vmw->drm, 0);
-	if (ret) {
-		vmw_driver_unload(&vmw->drm);
-		return ret;
-	}
+	if (ret)
+		goto out_unload;
 
 	return 0;
+out_unload:
+	vmw_driver_unload(&vmw->drm);
+out_release:
+	ttm_mem_global_release(&ttm_mem_glob);
+out_error:
+	return ret;
 }
 
 static int __init vmwgfx_init(void)
-- 
2.34.1

