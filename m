Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1092A4ACC7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 17:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62010E030;
	Sat,  1 Mar 2025 16:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="OCDTYDmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id C44D810E03D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 16:16:44 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 033702038A3F;
 Sat,  1 Mar 2025 08:16:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 033702038A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1740845799;
 bh=wvjA0okL8MAfHhqldHFyJIiqhL2lCGaRxjj4F04p+og=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OCDTYDmQtEjX+3EMA93BD9bpv8bd8opTo327QRfudpztplU2j0iHdfZnk0kNI5x3a
 2bJXNWgyEzzw5/A1tc/WoY1Cd3slRWpdqCoMLqGAdfnNtU1AFwAtjfpvOwcfsUzQOJ
 RZoiA2jMNm5vaO/STDN15zhJwGk5IKMHY/HkN3us=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, deller@gmx.de, akpm@linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: ssengar@microsoft.com,
	mhklinux@outlook.com
Subject: [PATCH v3 1/2] fbdev: hyperv_fb: Simplify hvfb_putmem
Date: Sat,  1 Mar 2025 08:16:30 -0800
Message-Id: <1740845791-19977-2-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740845791-19977-1-git-send-email-ssengar@linux.microsoft.com>
References: <1740845791-19977-1-git-send-email-ssengar@linux.microsoft.com>
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

The device object required in 'hvfb_release_phymem' function
for 'dma_free_coherent' can also be obtained from the 'info'
pointer, making 'hdev' parameter in 'hvfb_putmem' redundant.
Remove the unnecessary 'hdev' argument from 'hvfb_putmem'.

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
 drivers/video/fbdev/hyperv_fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 363e4ccfcdb7..09fb025477f7 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -952,7 +952,7 @@ static phys_addr_t hvfb_get_phymem(struct hv_device *hdev,
 }
 
 /* Release contiguous physical memory */
-static void hvfb_release_phymem(struct hv_device *hdev,
+static void hvfb_release_phymem(struct device *device,
 				phys_addr_t paddr, unsigned int size)
 {
 	unsigned int order = get_order(size);
@@ -960,7 +960,7 @@ static void hvfb_release_phymem(struct hv_device *hdev,
 	if (order <= MAX_PAGE_ORDER)
 		__free_pages(pfn_to_page(paddr >> PAGE_SHIFT), order);
 	else
-		dma_free_coherent(&hdev->device,
+		dma_free_coherent(device,
 				  round_up(size, PAGE_SIZE),
 				  phys_to_virt(paddr),
 				  paddr);
@@ -1074,7 +1074,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 }
 
 /* Release the framebuffer */
-static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
+static void hvfb_putmem(struct fb_info *info)
 {
 	struct hvfb_par *par = info->par;
 
@@ -1083,7 +1083,7 @@ static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
 		iounmap(par->mmio_vp);
 		vmbus_free_mmio(par->mem->start, screen_fb_size);
 	} else {
-		hvfb_release_phymem(hdev, info->fix.smem_start,
+		hvfb_release_phymem(info->device, info->fix.smem_start,
 				    screen_fb_size);
 	}
 
@@ -1197,7 +1197,7 @@ static int hvfb_probe(struct hv_device *hdev,
 
 error:
 	fb_deferred_io_cleanup(info);
-	hvfb_putmem(hdev, info);
+	hvfb_putmem(info);
 error2:
 	vmbus_close(hdev->channel);
 error1:
@@ -1226,7 +1226,7 @@ static void hvfb_remove(struct hv_device *hdev)
 	vmbus_close(hdev->channel);
 	hv_set_drvdata(hdev, NULL);
 
-	hvfb_putmem(hdev, info);
+	hvfb_putmem(info);
 	framebuffer_release(info);
 }
 
-- 
2.43.0

