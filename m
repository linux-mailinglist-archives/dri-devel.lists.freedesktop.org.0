Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C357082DE
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5C310E52F;
	Thu, 18 May 2023 13:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938A10E539
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684416978; x=1715952978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JN1uzDYf57Lp0EfjRF7huRftHgSqPKH6tVa/+0n1xNU=;
 b=CueUtuHaaB/GzIk4JUO0xkbVtst3NzgoHguWiseOiXFhp4qwhzsfg2SZ
 zZX2zQ9A4QuTFqZWxwn/sbXb0ixm/EoOz3/G7slGvwfLw8sY0Q5FCs/82
 mxGT2m5MRu6g8XfH7XRjxXTe0x+7PYWzfecIQtkILHVf6M+dTikBYTnk9
 LpnOFc9Cd3PEmoNMZs/BsGMB/X+wTZmai42kL/5odQkTGnJSBylXLu027
 7KsZWgeEkrWtibY9TCNeKlfOWXOX+ImWC/H28kqtjVe7cCR/VnkF24l/v
 /vdYGpStzUM/Hzbva2ySeiNmJl0EYOnNqY/9O3cr1OeCAsaEOLQe4iFDC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355264488"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="355264488"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="767204083"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="767204083"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:44 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] accel/ivpu: Make DMA bit mask HW specific
Date: Thu, 18 May 2023 15:16:03 +0200
Message-Id: <20230518131605.650622-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
References: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Future devices will have different dma bit mask, make it hw specific.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 +++-
 drivers/accel/ivpu/ivpu_hw.h  | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 8396db2b5203..21a5a0d63241 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -427,7 +427,7 @@ static int ivpu_pci_init(struct ivpu_device *vdev)
 		return PTR_ERR(vdev->regb);
 	}
 
-	ret = dma_set_mask_and_coherent(vdev->drm.dev, DMA_BIT_MASK(38));
+	ret = dma_set_mask_and_coherent(vdev->drm.dev, DMA_BIT_MASK(vdev->hw->dma_bits));
 	if (ret) {
 		ivpu_err(vdev, "Failed to set DMA mask: %d\n", ret);
 		return ret;
@@ -477,6 +477,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 		return -ENOMEM;
 
 	vdev->hw->ops = &ivpu_hw_mtl_ops;
+	vdev->hw->dma_bits = 38;
+
 	vdev->platform = IVPU_PLATFORM_INVALID;
 	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
 	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index 50a9304ab09c..0393901be492 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -57,6 +57,7 @@ struct ivpu_hw_info {
 	u32 tile_fuse;
 	u32 sku;
 	u16 config;
+	int dma_bits;
 };
 
 extern const struct ivpu_hw_ops ivpu_hw_mtl_ops;
-- 
2.25.1

