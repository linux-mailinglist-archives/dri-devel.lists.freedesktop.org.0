Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7517233A199
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 23:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F59E6E0D4;
	Sat, 13 Mar 2021 22:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C84A6E0D4
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 22:23:02 +0000 (UTC)
Received: from [195.4.92.121] (helo=sub2.freenet.de)
 by mout1.freenet.de with esmtpa (ID tobias.klausmann@01019freenet.de) (port
 25) (Exim 4.92 #3)
 id 1lLCev-0002FA-0M; Sat, 13 Mar 2021 23:22:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rx81NtMLDejB5eh9lbY3vGiuPwsQvHm8E59wnpkMPjg=; b=vHTTgbtGi4wMagb6sr7CswaQRz
 tpKHWhfI2/oAIrIqD+P+3ishyCQcMqv9dlwY2e7MHuk90cij7VR4RG/UuktXmAySRIYJys/6h783a
 /nZC3zfP0BKlfTYP9yQzFJJXeT5us1pJX66lAOIHt+2bXGiySnist5L7NvdM3qHiLZlEe2vokgDKF
 wtoAfOlvsMJgXktWgEJUbi/1sGyiHL5ly7JBVy3hgWqrH/k7pMMvlNUntouoXMPHlkFF7QyOncjuS
 rbQUODIGURWrDUQxnTRaADd5Vr3cgyMk701ZD7zmBRa3qeIjtt1hgb+8ga5TS4Y7Zz5U5FX8dvDRS
 hibMZyxQ==;
Received: from p200300c7ff19ef003265ecfffeba1802.dip0.t-ipconnect.de
 ([2003:c7:ff19:ef00:3265:ecff:feba:1802]:57790 helo=sieben.fritz.box)
 by sub2.freenet.de with esmtpsa (ID tobias.klausmann@01019freenet.de)
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (port 587) (Exim 4.92 #3)
 id 1lLCeu-0007MN-Ty; Sat, 13 Mar 2021 23:22:56 +0100
From: Tobias Klausmann <tobias.klausmann@freenet.de>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	bskeggs@redhat.com
Subject: [PATCH] nouveau: Skip unvailable ttm page entries
Date: Sat, 13 Mar 2021 23:21:59 +0100
Message-Id: <20210313222159.3346-1-tobias.klausmann@freenet.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <ebe7a994-6a6c-9766-5e35-548821452969@freenet.de>
References: <ebe7a994-6a6c-9766-5e35-548821452969@freenet.de>
MIME-Version: 1.0
X-Originated-At: 2003:c7:ff19:ef00:3265:ecff:feba:1802!57790
X-FNSign: v=2
 s=5F81BB8066AD17478FF97292059350A4793B646268427C129EB6522E37371DC1
X-Scan-TS: Sat, 13 Mar 2021 23:22:56 +0100
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
Cc: Tobias Klausmann <tobias.klausmann@freenet.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

The underlying problem is not introduced by the commit, yet it uncovered the
underlying issue. The cited commit relies on valid pages. This is not given for
due to some bugs. For now, just warn and work around the issue by just ignoring
the bad ttm objects.
Below is some debug info gathered while debugging this issue:

nouveau 0000:01:00.0: DRM: ttm_dma->num_pages: 2048
nouveau 0000:01:00.0: DRM: ttm_dma->pages is NULL
nouveau 0000:01:00.0: DRM: ttm_dma: 00000000e96058e7
nouveau 0000:01:00.0: DRM: ttm_dma->page_flags:
nouveau 0000:01:00.0: DRM: ttm_dma:   Populated: 1
nouveau 0000:01:00.0: DRM: ttm_dma:   No Retry: 0
nouveau 0000:01:00.0: DRM: ttm_dma:   SG: 256
nouveau 0000:01:00.0: DRM: ttm_dma:   Zero Alloc: 0
nouveau 0000:01:00.0: DRM: ttm_dma:   Swapped: 0

Signed-off-by: Tobias Klausmann <tobias.klausmann@freenet.de>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fabb314a0b2f..5902e21d5dfe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -551,6 +551,10 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 
 	if (!ttm_dma)
 		return;
+	if (!ttm_dma->pages) {
+		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
+		return;
+	}
 
 	/* Don't waste time looping if the object is coherent */
 	if (nvbo->force_coherent)
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
