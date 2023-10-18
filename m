Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A57CD9F8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 13:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F7410E04C;
	Wed, 18 Oct 2023 11:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964C10E088
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697626877; x=1729162877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d/ajYbFbPqn0jkv2aBeZgEsbBly88wzCo+JhqTBRIY4=;
 b=infJlEwvkROL6S7KtbjAUeBZFLs0GYUgAyjn7x3RB3r2IEI7VUaWcdhv
 HswrpY4h8NoKNQx2WVvMSYw/vFvUy95bEbiU8DEY7PbazKc3JP3/org1e
 QeHuBvADXPIrlpmado4kQBypn9BY+u636esPzZ3MvThmbdRnP1gd+CgXP
 xpbJjExuHdludsnXnna5PlG/ehZZ1CIz2MKun7MV1JRh3XNDR8IU3JXZC
 lO4QNBqBGSeAnxiCAP2JuYjShMlZhvt26t7p+7e9K5ztJ+OwxX/s0I/OZ
 J3NRiNHGQr33cTjSwCQtghYmVCuJ295BYKBStXPqQfTBUZ7k6/ZZYuNbW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="417104841"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="417104841"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="872988493"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="872988493"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:01:15 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu: Extend address range for MMU mmap
Date: Wed, 18 Oct 2023 13:01:13 +0200
Message-Id: <20231018110113.547208-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Wludzik@freedesktop.org,
	Oded Gabbay <ogabbay@kernel.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	"Wludzik,  Jozef" <jozef.wludzik@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wludzik, Jozef" <jozef.wludzik@intel.com>

Allow to use whole address range in MMU context mmap which is up to 48
bits. Return invalid argument from MMU context mmap in case address is
not aligned to MMU page size, address is below MMU page size or address
is greater then 47 bits.

This fixes problem disallowing to run large models on VPU4

Signed-off-by: Wludzik, Jozef <jozef.wludzik@intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu_context.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 0c8c65351919..c1050a2df954 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -11,6 +11,7 @@
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
 
+#define IVPU_MMU_VPU_ADDRESS_MASK        GENMASK(47, 12)
 #define IVPU_MMU_PGD_INDEX_MASK          GENMASK(47, 39)
 #define IVPU_MMU_PUD_INDEX_MASK          GENMASK(38, 30)
 #define IVPU_MMU_PMD_INDEX_MASK          GENMASK(29, 21)
@@ -328,12 +329,8 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 
 	if (!IS_ALIGNED(vpu_addr, IVPU_MMU_PAGE_SIZE))
 		return -EINVAL;
-	/*
-	 * VPU is only 32 bit, but DMA engine is 38 bit
-	 * Ranges < 2 GB are reserved for VPU internal registers
-	 * Limit range to 8 GB
-	 */
-	if (vpu_addr < SZ_2G || vpu_addr > SZ_8G)
+
+	if (vpu_addr & ~IVPU_MMU_VPU_ADDRESS_MASK)
 		return -EINVAL;
 
 	prot = IVPU_MMU_ENTRY_MAPPED;
-- 
2.25.1

