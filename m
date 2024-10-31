Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F749B7F58
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AE110E8E3;
	Thu, 31 Oct 2024 15:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="hHAHLUDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4A310E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:56:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730390188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ce50T52Mg3KtaLG7W7v0gI2ull5wlkcCd0a72TjlbNQ=;
 b=hHAHLUDdljPxC8yGeBEnHSwWzpimYR7nrNXjt9QnjOQdisshMN6PHiaZdEc8BzBxMrQeXG
 mJluXxeCMeCLz6xWYN5L5zNxqyNSwx0ZkT+m22af832CSJfkpqxEgy5XcsRM0OwYwgV3Td
 izWXL+6XXVhi83SGbdM77B85r1VoLBY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v3] drm/etnaviv: Print an error message if inserting
 IOVA range fails
Date: Thu, 31 Oct 2024 23:56:16 +0800
Message-Id: <20241031155616.2451084-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Print an error message to help debug when such an error happens,
since there meight have other CPU page size & GPU page size combinations.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
v3:
 - Pick up tags and resend.
 - Slightly improve commit message.
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 7e065b3723cf..47b6242e24a0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -298,8 +298,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 		ret = etnaviv_iommu_insert_exact(context, node, etnaviv_obj->size, va);
 	else
 		ret = etnaviv_iommu_find_iova(context, node, etnaviv_obj->size);
-	if (ret < 0)
+	if (ret) {
+		dev_err_ratelimited(context->global->dev,
+				    "Insert iova failed: 0x%llx(0x%x)\n",
+				    va, etnaviv_obj->size);
 		goto unlock;
+	}
 
 	mapping->iova = node->start;
 	ret = etnaviv_iommu_map(context, node->start, etnaviv_obj->size, sgt,
-- 
2.34.1

