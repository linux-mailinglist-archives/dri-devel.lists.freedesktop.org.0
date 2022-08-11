Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8C590251
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C3E10EAD2;
	Thu, 11 Aug 2022 16:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A052C11AE8D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:08:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E418B821AD;
 Thu, 11 Aug 2022 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D71C43140;
 Thu, 11 Aug 2022 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660234117;
 bh=lBULXpbflhEtmDOYoc0TEi/88x7wWuFwf7GPpqpC2cI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=shHL5NVOsBSJfMqwLynocPkYc8AlsfxO8x9WP73//Df8RdZUKeeJU31IBRWq14GQf
 iiHiAHileilpFgQ5hQD/ercdKm55Kk3jA6ujfbxdSDOH/ctlQakE/HxuuZQYA1gwlW
 77C5Sy5Bs3fqpPbmRsRn514LiNdS4WEVPzpzmulyNrDxHnb0nhCWH3Sc1AlNe54XBW
 kFF2cslnMOX8RPo9GTJfBT2+Np/+tQC9m5G0Bfs0yQmmGco5vx7emIYsbBydkPoFZT
 8yGcPPpNvmdtv5s7qq3+5vHpl9HqVeH5PmqVl94TNT2Lw6bpuW+yZgMj4DpXb4eDxb
 fzsd/3lhZAECA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 05/25] drm/panfrost: Don't set L2_MMU_CONFIG quirks
Date: Thu, 11 Aug 2022 12:08:00 -0400
Message-Id: <20220811160826.1541971-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160826.1541971-1-sashal@kernel.org>
References: <20220811160826.1541971-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

[ Upstream commit d8e53d8a4e0ae842ef5e83e0dfb0796980f710cf ]

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

Suggested-by: Steven Price <steven.price@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220525145754.25866-8-alyssa.rosenzweig@collabora.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 0d39a201c759..67b193bd0826 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -123,18 +123,6 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
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
2.35.1

