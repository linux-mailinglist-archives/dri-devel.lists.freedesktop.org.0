Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4113F3610
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 23:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55DB6EB1E;
	Fri, 20 Aug 2021 21:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4AE6EB1E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 21:31:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D758B1F44A90;
 Fri, 20 Aug 2021 22:31:35 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/3] drm/panfrost: Simplify lock_region calculation
Date: Fri, 20 Aug 2021 17:31:15 -0400
Message-Id: <20210820213117.13050-2-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
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

In lock_region, simplify the calculation of the region_width parameter.
This field is the size, but encoded as log2(ceil(size)) - 1.
log2(ceil(size)) may be computed directly as fls(size - 1). However, we
want to use the 64-bit versions as the amount to lock can exceed
32-bits.

This avoids undefined behaviour when locking all memory (size ~0),
caught by UBSAN.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reported-and-tested-by: Chris Morgan <macromorgan@hotmail.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 0da5b3100ab1..f6e02d0392f4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -62,21 +62,12 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
 {
 	u8 region_width;
 	u64 region = iova & PAGE_MASK;
-	/*
-	 * fls returns:
-	 * 1 .. 32
-	 *
-	 * 10 + fls(num_pages)
-	 * results in the range (11 .. 42)
-	 */
-
-	size = round_up(size, PAGE_SIZE);
 
-	region_width = 10 + fls(size >> PAGE_SHIFT);
-	if ((size >> PAGE_SHIFT) != (1ul << (region_width - 11))) {
-		/* not pow2, so must go up to the next pow2 */
-		region_width += 1;
-	}
+	/* The size is encoded as ceil(log2) minus(1), which may be calculated
+	 * with fls. The size must be clamped to hardware bounds.
+	 */
+	size = max_t(u64, size, PAGE_SIZE);
+	region_width = fls64(size - 1) - 1;
 	region |= region_width;
 
 	/* Lock the region that needs to be updated */
-- 
2.30.2

