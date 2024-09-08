Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F097054F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 09:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712DC10E1DD;
	Sun,  8 Sep 2024 07:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="eKYbH2W3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207A110E1DD
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 07:20:03 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725780002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jechb95hmorUhOngmJkF9gCQgvUHcIPjIBZ73kyW/N8=;
 b=eKYbH2W3T8L9iU6FxtWjDR20MtrRZZ/TWlvZWwrJiCeyrgMGDnAak6jaVEcE3pqKEXkC1+
 qjX6MBu5BSQ/sAoF2aoyzlwBg8JDqGiKcPF72+mHQjHX3UytXo2c8nXL44gbm+5W/PC8WF
 nx6R4rgvOIW3T3VW/UC33MIQ3brZWCM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/etnaviv: Print error message when driver can't get pages
Date: Sun,  8 Sep 2024 15:19:50 +0800
Message-ID: <20240908071950.200508-1-sui.jingfeng@linux.dev>
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

This error could happen when the GFP_HIGHUSER flag is set, such an error
can also be seen on the X86 platform. According to the kernel document in
gfp_types.h, "the GFP_HIGHUSER is for userspace allocations that may be
mapped to userspace, it do not need to be directly accessible by the
kernel."

However, drm/etnaviv will use the pages to implement vmap and mmap
operations of the GEM object function. The flag still set at present.
When we can't get pages, it certainly is a bug. Hence, we should print
this kind of error with drm_err() instead of dev_dbg().

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 5c0c9d4e3be1..5ffc31f32ac9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -61,7 +61,7 @@ static int etnaviv_gem_shmem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 	struct page **p = drm_gem_get_pages(&etnaviv_obj->base);
 
 	if (IS_ERR(p)) {
-		dev_dbg(dev->dev, "could not get pages: %ld\n", PTR_ERR(p));
+		drm_err(dev, "could not get pages: %ld\n", PTR_ERR(p));
 		return PTR_ERR(p);
 	}
 
-- 
2.43.0

