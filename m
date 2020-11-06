Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689362AADF8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA36989291;
	Sun,  8 Nov 2020 22:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 705 seconds by postgrey-1.36 at gabe;
 Fri, 06 Nov 2020 18:51:55 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44B86EAE1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604688714;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=hHXqYa5IRM8lVFD4kWWag37WTKepOwX6VuBzNs094kA=;
 b=BDBccrBus1LkhLSEBOkIf6Iy5yd/sxSnA++NWtSnee++5teAnGL05vIdCn2YxE0bfU
 b9pr5oQ2UO3hQeVEVr28qX/vwJJIbNCsPQ1SYCLUd0BJ0vPSjRmBIsmgGOEH8VJI2aKE
 W0N5AzDzakcmJhEaPvancw9AQjMnJVpS/0PNo/bTmHUdvNgWl8/tI7J9g67yrx4F2Zg/
 Rtse5xoEJK848d/Wl5TUkzp+zdtyqMALlK4H5hVAkq5b1uk8NcgfRA05Jl2Bdt+W08t3
 AigJ4vo2xl1doJ/5lCO9n0Xq1Uq+o/pvRUbUgHtmJ66FUT32WG88DCdq+1pZDtnsNwYy
 hm3g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GhJjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
 with ESMTPSA id j03b7dwA6Idp358
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 6 Nov 2020 19:39:51 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] video: hyperv_fb: include vmalloc.h
Date: Fri,  6 Nov 2020 19:39:41 +0100
Message-Id: <20201106183941.9751-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: Olaf Hering <olaf@aepfle.de>, Stephen Hemminger <sthemmin@microsoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hvfb_getmem uses vzalloc, therefore vmalloc.h should be included.

Fixes commit d21987d709e807ba7bbf47044deb56a3c02e8be4 ("video: hyperv:
hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 drivers/video/fbdev/hyperv_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index e36fb1a0ecdb..5bc86f481a78 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -47,6 +47,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/completion.h>
 #include <linux/fb.h>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
