Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016334B2E6A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D3A10EB88;
	Fri, 11 Feb 2022 20:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663E410EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 71AD61F46D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611272;
 bh=NXFW8WjYDUou1HGOEOZ3jdmlu8zAcjF0H+cDU8wYtNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqVBnNur02e8yaCh6iZt/T1gLYCVsczGxSraP6MnQ41V8m0V+sBXsIdsUsv0G1eMs
 y8wyX2hnESakOj7SgmfXMcMOjI38A76moBYZqDhU9cID5VcUheuB8qrnosu5B0CTkM
 yhiE6OVn4UqqM1IBrjfdYs28GXyUJheRuBwh/hXLe0bQle4V6O37BeiaLt7gGbWpYa
 r2tBfIAO8zM7eFngn88O5pcKZNSFgEoOzeoBfgofO+xETsU9UoF4IgY9h9v8Ut7dCn
 fETgnTz7DLyAcsNSEmHzGmKAnCWIv4u7nEpSH+CWkBei3/ogbA9ZlDVK0gewTm1jnC
 Moqbahnxv0FSA==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/panfrost: Don't set L2_MMU_CONFIG quirks
Date: Fri, 11 Feb 2022 15:27:26 -0500
Message-Id: <20220211202728.6146-8-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

L2_MMU_CONFIG is an implementation-defined register. Different Mali GPUs
define slightly different MAX_READS and MAX_WRITES fields, which
throttle outstanding reads and writes when set to non-zero values. When
left as zero, reads and writes are not throttled.

Both kbase and panfrost always zero these registers. Per discussion with
Steven Price, there are two reasons these quirks may be used:

1. Simulating slower memory subsystems. This use case is only of
   interest to system-on-chip designers; it is not relevant to mainline.

2. Working around broken memory subsystems. Hopefully we never see this
   case in mainline. If we do, we'll need to set this register based on
   an SoC-compatible, rather than generally matching on the GPU model.

To the best of our knowledge, these fields are zero at reset, so the
write is not necessary. Let's remove the write to aid porting to new
Mali GPUs, which have different layouts for the L2_MMU_CONFIG register.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Suggested-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 1c1e2017aa80..73e5774f01c1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -127,18 +127,6 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_TILER_CONFIG, quirks);
 
 
-	quirks = gpu_read(pfdev, GPU_L2_MMU_CONFIG);
-
-	/* Limit read & write ID width for AXI */
-	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG))
-		quirks &= ~(L2_MMU_CONFIG_3BIT_LIMIT_EXTERNAL_READS |
-			    L2_MMU_CONFIG_3BIT_LIMIT_EXTERNAL_WRITES);
-	else
-		quirks &= ~(L2_MMU_CONFIG_LIMIT_EXTERNAL_READS |
-			    L2_MMU_CONFIG_LIMIT_EXTERNAL_WRITES);
-
-	gpu_write(pfdev, GPU_L2_MMU_CONFIG, quirks);
-
 	quirks = 0;
 	if ((panfrost_model_eq(pfdev, 0x860) || panfrost_model_eq(pfdev, 0x880)) &&
 	    pfdev->features.revision >= 0x2000)
-- 
2.34.1

