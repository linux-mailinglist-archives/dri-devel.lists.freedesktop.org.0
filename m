Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6C88AD9C8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB18112E8E;
	Mon, 22 Apr 2024 23:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a0WSWj0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B7B112E8E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 23:58:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8768CCE0EB3;
 Mon, 22 Apr 2024 23:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B6BC2BD11;
 Mon, 22 Apr 2024 23:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830327;
 bh=JKVsaxJo/pKtxdhByvwKTlGoDkDpTOFdoHcj/OwxayA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a0WSWj0SW3qzA7D/RxuSId0O5pjTIEvISrvpCYI4wh1NF4+xWYv36pq3UsGxi3YRk
 HiYQ7aSqGYjYu7MC1Rj/FJsiLgNBiyqfuAJUrZDT2VOmVGnVYiXWd0n+IsNwX/zCh9
 tU7JnIEOYe73CEBQhgbvhjAfNZZso6h4hHP0QGsIT9ljcf8pFqsZtFDDvPpntMrEMe
 vqPkCtWUGSjsn4pdnQyyZdxi+smGz2hdUQb5T1MGZP/a/kj6it++Ge1VEl9Nd4JYt+
 FJUpJaHUFp2DokG9yekPsaMptkgiRNLvweuMTikigW48cPHvxR4rNf1xWbnPfIjtKr
 7eDkaFLR+IFWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Sasha Levin <sashal@kernel.org>, thierry.reding@gmail.com,
 mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 7/9] gpu: host1x: Do not setup DMA for virtual
 devices
Date: Mon, 22 Apr 2024 19:19:48 -0400
Message-ID: <20240422231955.1613650-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231955.1613650-1-sashal@kernel.org>
References: <20240422231955.1613650-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.215
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

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit 8ab58f6841b19423231c5db3378691ec80c778f8 ]

The host1x devices are virtual compound devices and do not perform DMA
accesses themselves, so they do not need to be set up for DMA.

Ideally we would also not need to set up DMA masks for the virtual
devices, but we currently still need those for legacy support on old
hardware.

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240314154943.2487549-1-thierry.reding@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/host1x/bus.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 6e3b49d0de66d..b113c8e0acd02 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -335,11 +335,6 @@ static int host1x_device_uevent(struct device *dev,
 	return 0;
 }
 
-static int host1x_dma_configure(struct device *dev)
-{
-	return of_dma_configure(dev, dev->of_node, true);
-}
-
 static const struct dev_pm_ops host1x_device_pm_ops = {
 	.suspend = pm_generic_suspend,
 	.resume = pm_generic_resume,
@@ -353,7 +348,6 @@ struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
 	.uevent = host1x_device_uevent,
-	.dma_configure = host1x_dma_configure,
 	.pm = &host1x_device_pm_ops,
 };
 
@@ -442,8 +436,6 @@ static int host1x_device_add(struct host1x *host1x,
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
 
-	of_dma_configure(&device->dev, host1x->dev->of_node, true);
-
 	device->dev.dma_parms = &device->dma_parms;
 	dma_set_max_seg_size(&device->dev, UINT_MAX);
 
-- 
2.43.0

