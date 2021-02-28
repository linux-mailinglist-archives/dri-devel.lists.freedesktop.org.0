Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64057327500
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 23:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022CE6E42E;
	Sun, 28 Feb 2021 22:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 356 seconds by postgrey-1.36 at gabe;
 Sun, 28 Feb 2021 21:26:29 UTC
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CC26E170
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 21:26:28 +0000 (UTC)
Received: from [195.4.92.122] (helo=sub3.freenet.de)
 by mout1.freenet.de with esmtpa (ID tobias.klausmann@01019freenet.de) (port
 25) (Exim 4.92 #3)
 id 1lGTUN-00062t-0F; Sun, 28 Feb 2021 22:20:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bvmbqBYdqmyXDlb9iC2UD+AE/jgJF3p6Z8kjKsCHDOM=; b=jZ23In8mhbasLA47eZx8u8rHZo
 fnysbwKh8dhbrr7s/zFJXGRNHFuqNpYV0WIgxMO3cEol9wp06O+n+WC7xvbrJGrOVyu9JMjDcUJRN
 DXM2pOJ18TJSazRPQZinOe7bXLZRuKPxrx1EcB9h9vPMOiSTEFXFfXJj5/lXg7N59dJK48UK1dpZ9
 jdixypM43BCIXyzg7fyANdwITHlMoV5/O5ouDG1zihDtQRLrWnvllWL/3dRN7dvoXaFoS4/vgfTjL
 w9MaZzYknWMOd5pTfLJSls2U4gDa2LqQkaZ+kZ0tNSdSZq2m/hSesSSDmfVTppS2SdhRCIwSEO1sB
 YCaxN86A==;
Received: from p200300c7ff251d003265ecfffeba1802.dip0.t-ipconnect.de
 ([2003:c7:ff25:1d00:3265:ecff:feba:1802]:57452 helo=sieben.fritz.box)
 by sub3.freenet.de with esmtpsa (ID tobias.klausmann@01019freenet.de)
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (port 587) (Exim 4.92 #3)
 id 1lGTUM-000194-QY; Sun, 28 Feb 2021 22:20:30 +0100
From: Tobias <tobias.klausmann@freenet.de>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	bskeggs@redhat.com
Subject: [PATCH] Revert "drm/nouveau: fix dma syncing warning with debugging
 on."
Date: Sun, 28 Feb 2021 22:19:56 +0100
Message-Id: <20210228211956.2363-1-tobias.klausmann@freenet.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Originated-At: 2003:c7:ff25:1d00:3265:ecff:feba:1802!57452
X-FNSign: v=2
 s=50ACFAD1FEC28FFEDEC40686C8A03038530A1E1C9D022CDCA495641A72278677
X-Scan-TS: Sun, 28 Feb 2021 22:20:30 +0100
X-Mailman-Approved-At: Sun, 28 Feb 2021 22:56:33 +0000
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
Cc: Tobias <tobias.klausmann@freenet.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit f295c8cfec833c2707ff1512da10d65386dde7af.

Starting with commit f295c8cfec833c2707ff1512da10d65386dde7af
("drm/nouveau: fix dma syncing warning with debugging on.")
the following oops occures:

   BUG: kernel NULL pointer dereference, address: 0000000000000000
   #PF: supervisor read access in kernel mode
   #PF: error_code(0x0000) - not-present page
   PGD 0 P4D 0
   Oops: 0000 [#1] PREEMPT SMP PTI
   CPU: 6 PID: 1013 Comm: Xorg.bin Tainted: G E     5.11.0-desktop-rc0+ #2
   Hardware name: Acer Aspire VN7-593G/Pluto_KLS, BIOS V1.11 08/01/2018
   RIP: 0010:nouveau_bo_sync_for_device+0x40/0xb0 [nouveau]
   Call Trace:
    nouveau_bo_validate+0x5d/0x80 [nouveau]
    nouveau_gem_ioctl_pushbuf+0x662/0x1120 [nouveau]
    ? nouveau_gem_ioctl_new+0xf0/0xf0 [nouveau]
    drm_ioctl_kernel+0xa6/0xf0 [drm]
    drm_ioctl+0x1f4/0x3a0 [drm]
    ? nouveau_gem_ioctl_new+0xf0/0xf0 [nouveau]
    nouveau_drm_ioctl+0x50/0xa0 [nouveau]
    __x64_sys_ioctl+0x7e/0xb0
    do_syscall_64+0x33/0x80
    entry_SYSCALL_64_after_hwframe+0x44/0xae
   ---[ end trace ccfb1e7f4064374f ]---
   RIP: 0010:nouveau_bo_sync_for_device+0x40/0xb0 [nouveau]

Reverting the commit, fixes the issue!

Signed-off-by: Tobias Klausmann <tobias.klausmann@freenet.de>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 35 +++++-----------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2375711877cf..33dc886d1d6d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -547,7 +547,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
-	int i, j;
+	int i;
 
 	if (!ttm_dma)
 		return;
@@ -556,21 +556,10 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 	if (nvbo->force_coherent)
 		return;
 
-	for (i = 0; i < ttm_dma->num_pages; ++i) {
-		struct page *p = ttm_dma->pages[i];
-		size_t num_pages = 1;
-
-		for (j = i + 1; j < ttm_dma->num_pages; ++j) {
-			if (++p != ttm_dma->pages[j])
-				break;
-
-			++num_pages;
-		}
+	for (i = 0; i < ttm_dma->num_pages; i++)
 		dma_sync_single_for_device(drm->dev->dev,
 					   ttm_dma->dma_address[i],
-					   num_pages * PAGE_SIZE, DMA_TO_DEVICE);
-		i += num_pages;
-	}
+					   PAGE_SIZE, DMA_TO_DEVICE);
 }
 
 void
@@ -578,7 +567,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
-	int i, j;
+	int i;
 
 	if (!ttm_dma)
 		return;
@@ -587,21 +576,9 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 	if (nvbo->force_coherent)
 		return;
 
-	for (i = 0; i < ttm_dma->num_pages; ++i) {
-		struct page *p = ttm_dma->pages[i];
-		size_t num_pages = 1;
-
-		for (j = i + 1; j < ttm_dma->num_pages; ++j) {
-			if (++p != ttm_dma->pages[j])
-				break;
-
-			++num_pages;
-		}
-
+	for (i = 0; i < ttm_dma->num_pages; i++)
 		dma_sync_single_for_cpu(drm->dev->dev, ttm_dma->dma_address[i],
-					num_pages * PAGE_SIZE, DMA_FROM_DEVICE);
-		i += num_pages;
-	}
+					PAGE_SIZE, DMA_FROM_DEVICE);
 }
 
 void nouveau_bo_add_io_reserve_lru(struct ttm_buffer_object *bo)
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
