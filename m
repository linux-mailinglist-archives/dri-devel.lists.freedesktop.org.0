Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F55498EEA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E818510E7B9;
	Mon, 24 Jan 2022 19:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1D110E7B9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 19:49:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53FF860920;
 Mon, 24 Jan 2022 19:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF18C340E7;
 Mon, 24 Jan 2022 19:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643053772;
 bh=YlU1sBgVFOIGLyn4tPFI06pq4M3DdSGDx1s/nOu7IKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aUHUq2w+W80nSqkDM9tFtsp+RhFb0+8miHn1rcqNkyHPVImO8IPtvrENchHntj/L4
 +AvGTnVOE6Vx1xotzNsI0oO6mTtDPFwqmxK6Rs6UVl+yagMdG69s3t+z4129ImNjth
 SG6RcY4ObKl8LwrkJHwRdQPuvCa6s2uZCqzEYt8c=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 171/563] drm/tegra: vic: Fix DMA API misuse
Date: Mon, 24 Jan 2022 19:38:56 +0100
Message-Id: <20220124184030.328363973@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124184024.407936072@linuxfoundation.org>
References: <20220124184024.407936072@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit 5566174cb10a5167d59b0793871cab7990b149b8 ]

Upon failure, dma_alloc_coherent() returns NULL. If that does happen,
passing some uninitialised stack contents to dma_mapping_error() - which
belongs to a different API in the first place - has precious little
chance of detecting it.

Also include the correct header, because the fragile transitive
inclusion currently providing it is going to break soon.

Fixes: 20e7dce255e9 ("drm/tegra: Remove memory allocation from Falcon library")
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Mikko Perttunen <mperttunen@nvidia.com>
CC: dri-devel@lists.freedesktop.org
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/vic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index b77f726303d89..ec0e4d8f0aade 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -265,10 +266,8 @@ static int vic_load_firmware(struct vic *vic)
 
 	if (!client->group) {
 		virt = dma_alloc_coherent(vic->dev, size, &iova, GFP_KERNEL);
-
-		err = dma_mapping_error(vic->dev, iova);
-		if (err < 0)
-			return err;
+		if (!virt)
+			return -ENOMEM;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
 	}
-- 
2.34.1



