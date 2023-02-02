Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79256878A8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4EE10E2B1;
	Thu,  2 Feb 2023 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76FB10E2B1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675329708; x=1706865708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+KH13DtNtZmfszR/2DMSFdG5h+Y7eA4htO0gZRkgAU=;
 b=SkU6d3DD6KoJvJRcharuETRgnq8qQX3Elp9SGXCUS1iYX4cr4clx1uqZ
 k+9VqOju0gig1nyQDuzJqsI18UbrIj+63v1/G7SKlemRnb3jhr00kgZHT
 ER9NDtJvuQ2FV8s3/zUsYvVHUJKcvyOc3Ts33+EvhjgV/L0mKOEK1mIQP
 41mH5dyHfyUawYyC2Mb4cbxzCrx5DycPPgjn7Cg1scraXfcKc6VRpZxa4
 ckPFoRo5/BX1e70K1H4k8PsSJRoiJ/L0+P465Pb5vdEdCI8VDJtChs3Ox
 KPSmPtrGNuxB++fer5Xu15oKN9FED/p53tdXlgosSk2VLwW0t4mKex2qv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390791454"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="390791454"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665216053"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="665216053"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:46 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] accel/ivpu: Set dma max_segment_size
Date: Thu,  2 Feb 2023 10:21:13 +0100
Message-Id: <20230202092114.2637452-4-stanislaw.gruszka@linux.intel.com>
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

Avoid below spurious warning:

[  264.844029] DMA-API: intel_vpu 0000:00:0b.0: mapping sg segment longer than device claims to support [len=143360] [max=65536]
[  264.844038] WARNING: CPU: 0 PID: 1254 at kernel/dma/debug.c:1160 debug_dma_map_sg+0x6ca/0xb70

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 70c104851c6d..231f29bb5025 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -428,6 +428,7 @@ static int ivpu_pci_init(struct ivpu_device *vdev)
 		ivpu_err(vdev, "Failed to set DMA mask: %d\n", ret);
 		return ret;
 	}
+	dma_set_max_seg_size(vdev->drm.dev, UINT_MAX);
 
 	/* Clear any pending errors */
 	pcie_capability_clear_word(pdev, PCI_EXP_DEVSTA, 0x3f);
-- 
2.25.1

