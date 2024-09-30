Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4C98AFBA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 00:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BB710E135;
	Mon, 30 Sep 2024 22:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="qZLoTrfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E736710E161
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 22:17:22 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1727734640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y4YstUzFg6ou6O0nN1/xveTy1frOB8d3+83QVeA1OZk=;
 b=qZLoTrfJ1AIsNSTjv69oocKO6STCrG8uB0KYkjDrXGA6S1Kc4Fmz3QZyEzS01TJ/z4mLRw
 3+oNuUZ6T6Od4yvdQt9KSQno8NMyYKhXCLwMiSNzL/I9JAI37kXvmk55uyuAn+SFomxL9U
 Rw3S5w2pdXvBctWLa0tTbPieif37M14=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/etnaviv: Print error message if inserting IOVA address
 range fails
Date: Tue,  1 Oct 2024 06:17:06 +0800
Message-Id: <20240930221706.399139-1-sui.jingfeng@linux.dev>
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

Etnaviv assumes that GPU page size is 4KiB, yet on some systems, the CPU
page size is 16 KiB. The size of etnaviv buffer objects will be aligned
to CPU page size on kernel side, however, userspace still assumes the
page size is 4KiB and doing allocation with 4KiB page as unit. This
results in softpin(userspace managed per-process address spaces) fails.
Because kernel side BO takes up bigger address space than user space
assumes whenever the size of a BO is not CPU page size aligned.

Insert an error message to help debug when such an issue happen.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
For example, when running glmark2-drm:

[kernel space debug log]

 etnaviv 0000:03:00.0: Insert bo failed, va: fd38b000, size: 4000
 etnaviv 0000:03:00.0: Insert bo failed, va: fd38a000, size: 4000

[user space debug log]

bo->va = 0xfd48c000, bo->size=100000
bo->va = 0xfd38c000, bo->size=100000
bo->va = 0xfd38b000, bo->size=1000   <-- Insert IOVA fails started at here.
bo->va = 0xfd38a000, bo->size=1000
bo->va = 0xfd389000, bo->size=1000

[texture] texture-filter=nearest:MESA: error: etna_cmd_stream_flush:238: submit failed: -28 (No space left on device)
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 1661d589bf3e..682f27b27d59 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -310,8 +310,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 	else
 		ret = etnaviv_iommu_find_iova(context, node,
 					      etnaviv_obj->base.size);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(context->global->dev,
+			"Insert iova failed, va: %llx, size: %zx\n",
+			va, etnaviv_obj->base.size);
 		goto unlock;
+	}
 
 	mapping->iova = node->start;
 	ret = etnaviv_iommu_map(context, node->start, sgt,
-- 
2.34.1

