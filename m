Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A73F6737
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2266E09A;
	Tue, 24 Aug 2021 17:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D428C6E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:31:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 020A81F41A29;
 Tue, 24 Aug 2021 18:31:10 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 3/4] drm/panfrost: Clamp lock region to Bifrost minimum
Date: Tue, 24 Aug 2021 13:30:27 -0400
Message-Id: <20210824173028.7528-4-alyssa.rosenzweig@collabora.com>
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

When locking a region, we currently clamp to a PAGE_SIZE as the minimum
lock region. While this is valid for Midgard, it is invalid for Bifrost,
where the minimum locking size is 8x larger than the 4k page size. Add a
hardware definition for the minimum lock region size (corresponding to
KBASE_LOCK_REGION_MIN_SIZE_LOG2 in kbase) and respect it.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Tested-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 2 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 3a795273e505..dfe5f1d29763 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -66,7 +66,7 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
 	/* The size is encoded as ceil(log2) minus(1), which may be calculated
 	 * with fls. The size must be clamped to hardware bounds.
 	 */
-	size = max_t(u64, size, PAGE_SIZE);
+	size = max_t(u64, size, AS_LOCK_REGION_MIN_SIZE);
 	region_width = fls64(size - 1) - 1;
 	region |= region_width;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 1940ff86e49a..6c5a11ef1ee8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -316,6 +316,8 @@
 #define AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
 #define AS_FAULTSTATUS_ACCESS_TYPE_WRITE	(0x3 << 8)
 
+#define AS_LOCK_REGION_MIN_SIZE                 (1ULL << 15)
+
 #define gpu_write(dev, reg, data) writel(data, dev->iomem + reg)
 #define gpu_read(dev, reg) readl(dev->iomem + reg)
 
-- 
2.30.2

