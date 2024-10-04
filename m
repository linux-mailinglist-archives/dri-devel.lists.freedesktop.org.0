Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D47990ED1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 21:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B4E10EAAE;
	Fri,  4 Oct 2024 19:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Gs+lwkXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89410EAAF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 19:42:41 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1728070960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4HgvyzfgIepFwk/c9SOPAgoWvUuHNu+CqXfvHDy0mU=;
 b=Gs+lwkXaylIbGwOi83yonCCU74a+DnJS+lLO3LOg8JVomMmh3rKEfwPLFJ6I5myPUo8Yxh
 KR14ry7JUwenza/SPTQz8gWh1yF8sedOFXPKMcjjo4dFpIYlufLht/eQGVHoyuczOD9pP6
 0Imgtt3nhEO5HL509c8EBguyuDUO0is=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 3/3] drm/etnaviv: Print an error message if inserting IOVA
 range fails
Date: Sat,  5 Oct 2024 03:42:07 +0800
Message-Id: <20241004194207.1013744-4-sui.jingfeng@linux.dev>
In-Reply-To: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
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

Print an error message to help debug when such an issue happen, since it's
not so obvious.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
v0 -> v1: Use dev_err_ratelimited() to prevent spamming the logs

v0 is at https://lore.kernel.org/dri-devel/20240930221706.399139-1-sui.jingfeng@linux.dev/
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index a52ec5eb0e3d..37866ed05c13 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -300,8 +300,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 		ret = etnaviv_iommu_insert_exact(context, node, user_size, va);
 	else
 		ret = etnaviv_iommu_find_iova(context, node, user_size);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err_ratelimited(context->global->dev,
+				    "Insert iova failed: 0x%llx(0x%x)\n",
+				    va, user_size);
 		goto unlock;
+	}
 
 	mapping->iova = node->start;
 	ret = etnaviv_iommu_map(context, node->start, user_size, sgt,
-- 
2.34.1

