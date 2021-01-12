Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F257D2F2E0B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 12:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3799A6E1E8;
	Tue, 12 Jan 2021 11:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D036E1E6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m46fgffA5M5t9A9Cpwa2FY/vSVHxsvBFLqmiuT0mFnw=; b=Xgni5b9MnmYnhtifzuMDygspW3
 rtIi0rDdpM5IhplvAfn3WKSYqpWy+ZnFv8MrxUZY7toZzZscWRDtgIV6/Nuufx2WDujf+knoUBGDw
 OxetdIUW3uvEiKS+v66lPVKcRLK8yCWDjJdFlmMrjbVU8mkoqHD7Pt0b4hvEDQdX0PPkmgiP+LVfj
 tWPqZJTvTaK8r8dg9V+9E8xO+9mV/Rx9VeeVJ7ZarcETHDPhKILE+k86JrS+ra4xPOogbemc1T/5s
 ECXXdjHS4bSM1w4yJiKYy0Aw3fbj5oix1WGaTmB0+o9i4jklcDGEFXZ+lgPtaUqK1eNexuoH881l9
 s6VJ8XHg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kzHzY-0000zo-VO; Tue, 12 Jan 2021 13:37:40 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com
Subject: [PATCH 1/2] drm/tegra: falcon: Support newer VIC firmware
Date: Tue, 12 Jan 2021 13:37:06 +0200
Message-Id: <20210112113707.3837876-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support newer VIC firmware by accepting the new magic number 0x10fe,
loading the full code segment instead of just the first page at boot
time, and skipping FCE setup if the firmware header indicates that
FCE is handled internally by the firmware.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/falcon.c |  9 +++++----
 drivers/gpu/drm/tegra/vic.c    | 21 +++++++++++++--------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index 56edef06c48e..223ab2ceb7e6 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -72,7 +72,7 @@ static int falcon_parse_firmware_image(struct falcon *falcon)
 	struct falcon_fw_os_header_v1 *os;
 
 	/* endian problems would show up right here */
-	if (bin->magic != PCI_VENDOR_ID_NVIDIA) {
+	if (bin->magic != PCI_VENDOR_ID_NVIDIA && bin->magic != 0x10fe) {
 		dev_err(falcon->dev, "incorrect firmware magic\n");
 		return -EINVAL;
 	}
@@ -178,9 +178,10 @@ int falcon_boot(struct falcon *falcon)
 				  falcon->firmware.data.offset + offset,
 				  offset, FALCON_MEMORY_DATA);
 
-	/* copy the first code segment into Falcon internal memory */
-	falcon_copy_chunk(falcon, falcon->firmware.code.offset,
-			  0, FALCON_MEMORY_IMEM);
+	/* copy the code segment into Falcon internal memory */
+	for (offset = 0; offset < falcon->firmware.code.size; offset += 256)
+		falcon_copy_chunk(falcon, falcon->firmware.code.offset + offset,
+				  offset, FALCON_MEMORY_IMEM);
 
 	/* setup falcon interrupts */
 	falcon_writel(falcon, FALCON_IRQMSET_EXT(0xff) |
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index ade56b860cf9..a3dbb8813faf 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -135,16 +135,21 @@ static int vic_boot(struct vic *vic)
 
 	hdr = vic->falcon.firmware.virt;
 	fce_bin_data_offset = *(u32 *)(hdr + VIC_UCODE_FCE_DATA_OFFSET);
-	hdr = vic->falcon.firmware.virt +
-		*(u32 *)(hdr + VIC_UCODE_FCE_HEADER_OFFSET);
-	fce_ucode_size = *(u32 *)(hdr + FCE_UCODE_SIZE_OFFSET);
 
 	falcon_execute_method(&vic->falcon, VIC_SET_APPLICATION_ID, 1);
-	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_SIZE,
-			      fce_ucode_size);
-	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_OFFSET,
-			      (vic->falcon.firmware.iova + fce_bin_data_offset)
-				>> 8);
+
+	/* Old VIC firmware needs kernel help with setting up FCE microcode. */
+	if (fce_bin_data_offset != 0x0 && fce_bin_data_offset != 0xa5a5a5a5) {
+		hdr = vic->falcon.firmware.virt +
+			*(u32 *)(hdr + VIC_UCODE_FCE_HEADER_OFFSET);
+		fce_ucode_size = *(u32 *)(hdr + FCE_UCODE_SIZE_OFFSET);
+
+		falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_SIZE,
+				      fce_ucode_size);
+		falcon_execute_method(
+			&vic->falcon, VIC_SET_FCE_UCODE_OFFSET,
+			(vic->falcon.firmware.iova + fce_bin_data_offset) >> 8);
+	}
 
 	err = falcon_wait_idle(&vic->falcon);
 	if (err < 0) {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
