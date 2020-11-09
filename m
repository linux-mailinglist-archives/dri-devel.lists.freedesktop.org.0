Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DD2AD0FF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC77898C7;
	Tue, 10 Nov 2020 08:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Mon, 09 Nov 2020 09:24:57 UTC
Received: from mail.sysgo.com (mail.sysgo.com [176.9.12.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC76894A7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 09:24:57 +0000 (UTC)
Date: Mon, 9 Nov 2020 10:19:06 +0100 (CET)
From: =?UTF-8?Q?Andrej_Krut=C3=A1k?= <andrej.krutak@sysgo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <1708556105.8346.1604913546775@ox.sysgo.com>
Subject: [PATCH] drm: Add SRCU as dependency for DRM
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev12
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:56 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code dependency was added without adding it to Kconfig.
It rarely shows up since SRCU is commonly used by other subsystems.

Fixes: bee330f3d67273a68dcb99f59480d59553c008b2 (drm: Use srcu to protect drm_device.unplugged)
Signed-off-by: Andrej Krutak <andrej.krutak@sysgo.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b9674e..064991e5054a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -15,6 +15,7 @@ menuconfig DRM
 	select I2C_ALGOBIT
 	select DMA_SHARED_BUFFER
 	select SYNC_FILE
+	select SRCU
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
