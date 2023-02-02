Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA996878A9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F68A10E4AD;
	Thu,  2 Feb 2023 09:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EB410E4AD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675329712; x=1706865712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u6xqhRkNcsFjKWpft9plcnn/NiRXFJJALNoCQ3T6DlU=;
 b=Iw2Tge2fG/by0Pvw+XeddkzbGXIMcwzDLv/KqcqYHZNl4SzrnDhD6pyG
 HwxCZ0giLXv1OYkLk+vkJZe3BZHsncK2DvtfEmJGBjG7+L8zV/mfXgi11
 oPlipI79SxuPfgIeoPl5rDL2hZzesVk932AC5reNSrz7VCCKkmFnwu11Y
 lIe91M5SV6YGgJHs5A9d+Jp/SjlRC4Fc5QfhN1NVk7D2kwPBxc1mkw3E5
 FdQd59cuSb0D3w+8HEVBoEuKVHT0FSuzS6IAWvuKccZPs/hTjqiVPAPa6
 PB4Sk7i9Dnr8T5KrBiTgunZ66FAHZIAYqQu99pKfKtdDKU5BQv2QMSv2G A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390791476"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="390791476"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665216057"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="665216057"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:50 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] accel/ivpu: Fix old dma_buf api usage
Date: Thu,  2 Feb 2023 10:21:14 +0100
Message-Id: <20230202092114.2637452-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update according to new dma-buf locking scheme.

Remove redundant WARN_ON()'s, dma_buf functions internally
have the same warnings already.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index d1f923971b4c..01d47d3bad5b 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -42,9 +42,7 @@ static int prime_map_pages_locked(struct ivpu_bo *bo)
 	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
 	struct sg_table *sgt;
 
-	WARN_ON(!bo->base.import_attach);
-
-	sgt = dma_buf_map_attachment(bo->base.import_attach, DMA_BIDIRECTIONAL);
+	sgt = dma_buf_map_attachment_unlocked(bo->base.import_attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt)) {
 		ivpu_err(vdev, "Failed to map attachment: %ld\n", PTR_ERR(sgt));
 		return PTR_ERR(sgt);
@@ -56,9 +54,7 @@ static int prime_map_pages_locked(struct ivpu_bo *bo)
 
 static void prime_unmap_pages_locked(struct ivpu_bo *bo)
 {
-	WARN_ON(!bo->base.import_attach);
-
-	dma_buf_unmap_attachment(bo->base.import_attach, bo->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_unmap_attachment_unlocked(bo->base.import_attach, bo->sgt, DMA_BIDIRECTIONAL);
 	bo->sgt = NULL;
 }
 
-- 
2.25.1

