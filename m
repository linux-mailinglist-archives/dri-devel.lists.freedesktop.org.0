Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84860ECE0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 02:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EA610E004;
	Thu, 27 Oct 2022 00:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 335 seconds by postgrey-1.36 at gabe;
 Thu, 27 Oct 2022 00:11:55 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D15510E004
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 00:11:55 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4MyQvF1097zBJ;
 Thu, 27 Oct 2022 02:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1666829178; bh=RSJxyVz8Wp0ZC04fPiuQJGAr4G/ZnkUAptmDTf6i+zM=;
 h=Date:Subject:From:To:Cc:From;
 b=KuY1fW0OZvy3E8gkGpnLiHBpnPo2EtFy/+OpEqI3h01ek23eIKT5uD7GsZPLkvnWa
 Bu7CBlDNBdNPyuWgnmYNLIYrxLjy9i0zJ8+1qKr6C2y3T3JAzcTNB6fyuAZG+RTGzi
 a/Z2o+e9UqwlV4nXK3rpT6vUP44HzIXj4MZWVqtcT/oCNWvreJQJnaatdYNoPGxgBb
 GMjcyoMigAvsL1ZO5Kd52FycQ2p4Pfbgj5qyLeHZ2WL3bgkmdcsb0uv1yG4GKI1iPa
 PDescXJrfWwmg3Kbyoi36KpXERRDUN60YtXPEk9I9kXTMGAKj0nRwdhQ7qK1pLbz/F
 N0scZAP9lQ4lw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.7 at mail
Date: Thu, 27 Oct 2022 02:06:16 +0200
Message-Id: <e75323732bedc46d613d72ecb40f97e3bc75eea8.1666829073.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH] fbdev/core: Avoid uninitialized read in
 aperture_remove_conflicting_pci_device()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return on error directly from the BAR-iterating loop instead of
break+return.

This is actually a cosmetic fix, since it would be highly unusual to
have this called for a PCI device without any memory BARs.

Fixes: 9d69ef183815 ("fbdev/core: Remove remove_conflicting_pci_framebuffers()")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/video/aperture.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 9e6bcc03a1a4..41e77de1ea82 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -340,12 +340,9 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 		size = pci_resource_len(pdev, bar);
 		ret = aperture_remove_conflicting_devices(base, size, primary, name);
 		if (ret)
-			break;
+			return ret;
 	}
 
-	if (ret)
-		return ret;
-
 	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
 	 * otherwise the vga fbdev driver falls over.
-- 
2.30.2

