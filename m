Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08562B0AE43
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 08:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CB410E1D4;
	Sat, 19 Jul 2025 06:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="DAfrqHNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9743510E1D4;
 Sat, 19 Jul 2025 06:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752907597; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Tv5PtB/Hu0pilIetNsmQ8GuCl9Blw4g6utc7I3xb4Gg5bSglvP2IAOT08JkoaDtaueGoGl7W8XeV/kY7B18zEueCZHOQBw7FkEOCZO3DUqKzEWDtioxvGrSuDLYR/00ExjqNmutnCPMKZALgIA9M68wjPjS/SLDOuZ5YkhRIhvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752907597;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LHHndUs+/G5YW9qx+xWQMhGSrQiJOYOxKpwiXLvTjD4=; 
 b=J9Gg8BZ4Hu8LrN5jAWdG8xXcdN8RODt53r1YHiqUGw5Mw7fYpnmp4GchY3OPUF+zf4g1Vp4QVybOn4DGEctAhvFrELtGyP6BqCUiBSeJppQP5APttY42mVQHG7XIvI6Kce23ty2h87kBjjeiwLSFh1UvQXEvAuL/cpGErA5fmBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752907597; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=LHHndUs+/G5YW9qx+xWQMhGSrQiJOYOxKpwiXLvTjD4=;
 b=DAfrqHNIFLYKxJLY3UrTlPvNkcRk3XRcSOk0Ql1kUxWQUg6cqmAiBurjZmFU76dW
 ik51svEVHL17MoIcOHDU1mNTDgkOvIxvE82drY7SOhLIUKg5pWOfEvY00ojmu+8xTxJ
 wKKVGNQTMrSqOLwoG4nF3xsezxb68HvJhrxSY3aQREYlkKCxdWD/POS+qzjUoQMWpkb
 NnJqloVoYPaBPMan/hmGfpVo8mSXkXaiVyoyXN9aXz9Z43e8kDsZTYYf8vKYlIIBve2
 Tji0PASQhUY3GDgYjsc9Ibko3plTz9gvo2gvQXSg4nIpg8YQ9euAThOxEJX0Jb1hanV
 OX0PGejKGg==
Received: by mx.zohomail.com with SMTPS id 1752907596122572.0044863390824;
 Fri, 18 Jul 2025 23:46:36 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH] drm/etnaviv: set the 32-bit coherent DMA mask later
Date: Sat, 19 Jul 2025 14:46:24 +0800
Message-ID: <20250719064624.690606-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The etnaviv driver wants to use 40-bit DMA mask and 32-bit coherent
allocation mask, to be able to access memory up to 40-bit, but still
limit page tables to lower 32-bit.

However, the call to of_dma_configure() next to setting the masks ruined
everything -- of_dma_configure will use the coherent allocation mask to
clip the DMA accessibility mask, leads to a setup with both masks as
32-bit.

In this situation PRIME imports stop to work because of SWIOTLB getting
activated.

Set a 40-bit coherent mask before of_dma_configure() and then the real
32-bit mask after it, to prevent main DMA mask being clipped.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
This patch is marked RFC because the practice looks a little dirty.

P.S. unfortunately the testing situation isn't mainlined yet -- I am
using etnaviv as the X.org 2D accelerator on TH1520 SoC (with
xf86-video-thead DDX), and importing buffers from powervr device
(open source Vulkan driver, hacked to add xcb WSI support). Both devices
are a few patches away from mainline, and the display engine
(VeriSilicon DC8200) support is a big TODO.

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed339..cded63904c65 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -650,9 +650,11 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 * To make things easy, we set the dma_coherent_mask to 32
 	 * bit to make sure we are allocating the command buffers and
 	 * TLBs in the lower 4 GiB address space.
+	 *
+	 * As coherent_mask may mislead of_dma_configure(), set it to
+	 * the same with main dma mask temporarily as a hack.
 	 */
-	if (dma_set_mask(dev, DMA_BIT_MASK(40)) ||
-	    dma_set_coherent_mask(dev, DMA_BIT_MASK(32))) {
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40))) {
 		dev_dbg(dev, "No suitable DMA available\n");
 		return -ENODEV;
 	}
@@ -668,6 +670,13 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 		of_node_put(first_node);
 	}
 
+	/*
+	 * Now as of_dma_configure() is done, we're now safe to set
+	 * coherent_dma_mask to the real value.
+	 */
+	if (dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32)))
+		return -ENODEV;
+
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
 
-- 
2.50.1

