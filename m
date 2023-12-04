Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2B803280
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD6210E1B1;
	Mon,  4 Dec 2023 12:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9549910E1B1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701692616; x=1733228616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pA2hIUCEqzd+GtBE/QzkH/cr0EoxYMBcOLYSi/uD6Ws=;
 b=FwbdZzqHsZKVpv7V8TQWd3NfdIrpxJfcEQxJtmo34Tk6fAnosNnMqOVt
 y2XXSkJ+UUznDHERYrTLUs914EedMVVXOOxU7bDaMKjiiZqnRbdLfxXaG
 0vESS7AmfH55D2SEqAPyMKA+fledfdYO1GeoZziG4yD3DT3nGuB6AdoIb
 zn/W+yFFKarH5QKRUg/q1ddHmC3dJzbg4HwXyyErR6G4WAYyf99YEJYah
 qqEILEr5hllkamzYYEZoQeCBVbqhcoq0Qwb4nfy5nb/twv3h80PS3oYK+
 AEsBzGO3NwlkCRvMtfKjznlgpY4GfgfgRkHY2gF4dpdrJ+Gdk7IrWC3KE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378757909"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="378757909"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 04:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774238808"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="774238808"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 04:23:34 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu/37xx: Fix interrupt_clear_with_0 WA initialization
Date: Mon,  4 Dec 2023 13:23:31 +0100
Message-ID: <20231204122331.40560-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Using PCI Device ID/Revision to initialize the interrupt_clear_with_0
workaround is problematic - there are many pre-production
steppings with different behavior, even with the same PCI ID/Revision

Instead of checking for PCI Device ID/Revision, check the VPU
buttress interrupt status register behavior - if this register
is not zero after writing 1s it means there register is RW
instead of RW1C and we need to enable the interrupt_clear_with_0
workaround.

Fixes: 7f34e01f77f8 ("accel/ivpu: Clear specific interrupt status bits on C0")
Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 4ccf1994b97a..d530384f8d60 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -53,10 +53,12 @@
 
 #define ICB_0_1_IRQ_MASK ((((u64)ICB_1_IRQ_MASK) << 32) | ICB_0_IRQ_MASK)
 
-#define BUTTRESS_IRQ_MASK ((REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE)) | \
-			   (REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, ATS_ERR)) | \
+#define BUTTRESS_IRQ_MASK ((REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, ATS_ERR)) | \
 			   (REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, UFI_ERR)))
 
+#define BUTTRESS_ALL_IRQ_MASK (BUTTRESS_IRQ_MASK | \
+			       (REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE)))
+
 #define BUTTRESS_IRQ_ENABLE_MASK ((u32)~BUTTRESS_IRQ_MASK)
 #define BUTTRESS_IRQ_DISABLE_MASK ((u32)-1)
 
@@ -74,8 +76,12 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 	vdev->wa.clear_runtime_mem = false;
 	vdev->wa.d3hot_after_power_off = true;
 
-	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_MTL && ivpu_revision(vdev) < 4)
+	REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, BUTTRESS_ALL_IRQ_MASK);
+	if (REGB_RD32(VPU_37XX_BUTTRESS_INTERRUPT_STAT) == BUTTRESS_ALL_IRQ_MASK) {
+		/* Writing 1s does not clear the interrupt status register */
 		vdev->wa.interrupt_clear_with_0 = true;
+		REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, 0x0);
+	}
 
 	IVPU_PRINT_WA(punit_disabled);
 	IVPU_PRINT_WA(clear_runtime_mem);
-- 
2.43.0

