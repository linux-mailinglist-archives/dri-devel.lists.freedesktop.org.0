Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5485A08F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A1110E1F7;
	Mon, 19 Feb 2024 10:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8678E10E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 10:09:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9ECFEC;
 Mon, 19 Feb 2024 02:10:21 -0800 (PST)
Received: from a077854.blr.arm.com (a077854.arm.com [10.162.41.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45ED93F762;
 Mon, 19 Feb 2024 02:09:38 -0800 (PST)
From: Faiz Abbas <faiz.abbas@arm.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>,
 Faiz Abbas <faiz.abbas@arm.com>
Subject: [PATCH 3/3] drm/arm/komeda: update DMA mask to 40 bits
Date: Mon, 19 Feb 2024 15:39:15 +0530
Message-Id: <20240219100915.192475-4-faiz.abbas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219100915.192475-1-faiz.abbas@arm.com>
References: <20240219100915.192475-1-faiz.abbas@arm.com>
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

From: Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>

Each layer in the DPU has a 40-bit base address register, which indicates
start of frame buffer data for that layer. Komeda driver does not set
its DMA mask, which makes it 32-bit by default which does not use
the entire available possible supported by the DPU.

Update the DMA mask to align with DPU Architecture v1.0 spec.

Signed-off-by: Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>
Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index cc57ea4e13ae..fea5a4818f33 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -59,6 +59,10 @@ static int komeda_platform_probe(struct platform_device *pdev)
 	struct komeda_drv *mdrv;
 	int err;
 
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	if (err)
+		return dev_err_probe(dev, err, "DMA mask error\n");
+
 	mdrv = devm_kzalloc(dev, sizeof(*mdrv), GFP_KERNEL);
 	if (!mdrv)
 		return -ENOMEM;
-- 
2.25.1

