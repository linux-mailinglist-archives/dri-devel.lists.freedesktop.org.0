Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F83F6729
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7286E093;
	Tue, 24 Aug 2021 17:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D555B6E093
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:30:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D98E21F4270E;
 Tue, 24 Aug 2021 18:30:48 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 1/4] drm/panfrost: Simplify lock_region calculation
Date: Tue, 24 Aug 2021 13:30:25 -0400
Message-Id: <20210824173028.7528-2-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
References: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
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
This field is the size, but encoded as ceil(log2(size)) - 1.
ceil(log2(size)) may be computed directly as fls(size - 1). However, we
want to use the 64-bit versions as the amount to lock can exceed
32-bits.

This avoids undefined (and completely wrong) behaviour when locking all
memory (size ~0). In this case, the old code would "round up" ~0 to the
nearest page, overflowing to 0. Since fls(0) == 0, this would calculate
a region width of 10 + 0 = 10. But then the code would shift by
(region_width - 11) = -1. As shifting by a negative number is undefined,
UBSAN flags the bug. Of course, even if it were defined the behaviour is
wrong, instead of locking all memory almost none would get locked.

The new form of the calculation corrects this special case and avoids
the undefined behaviour.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reported-and-tested-by: Chris Morgan <macromorgan@hotmail.com>
Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
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

