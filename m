Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ACA9B9CCA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 05:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D93810E231;
	Sat,  2 Nov 2024 04:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="a6Y1igLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7A410E231
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 04:27:03 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730521621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LjM8+cIQXYtSO2YQDr5pKwc3LLU72AYnqnGxdbYDS6E=;
 b=a6Y1igLywdkFGq5aojQWQtTor7xHEi/41wqgwW8bsC145NLK/K5m7ZDwi2xhY+U9wD/CkC
 m/bSDWzkrm8DJR7Lwh6fYFpqEJ6KXlRoXKal3JrTBp0grslb/Awm4V7XGRmzXTa3d9fzhk
 mGkc/PaEani4Uu0Wqi7Gbt628/sHK2I=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/etnaviv: Drop unused data member from the
 etnaviv_gem_object structure
Date: Sat,  2 Nov 2024 12:26:52 +0800
Message-Id: <20241102042652.3325597-1-sui.jingfeng@linux.dev>
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

Referencing the 'struct etnaviv_gpu *' by every etnaviv GEM BO is weird.
Drop it and drop yet another unused data field, namely 'access'.

Memory footprint of etnaviv GEM BOs reduced.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index bf0d049d8a79..8da32fb5df16 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -50,9 +50,7 @@ struct etnaviv_gem_object {
 	u32 flags;
 
 	struct list_head gem_node;
-	struct etnaviv_gpu *gpu;     /* non-null if active */
 	atomic_t gpu_active;
-	u32 access;
 
 	struct page **pages;
 	struct sg_table *sgt;
-- 
2.34.1

