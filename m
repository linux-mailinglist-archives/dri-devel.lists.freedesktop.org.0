Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAA6E08F4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9787710EA50;
	Thu, 13 Apr 2023 08:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AC210E036
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:10:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E9864C4C49
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 09:55:53 +0000 (UTC)
Received: (Authenticated sender: cyril@debamax.com)
 by mail.gandi.net (Postfix) with ESMTPA id 954CF1C000B;
 Wed, 12 Apr 2023 09:55:48 +0000 (UTC)
From: Cyril Brulebois <cyril@debamax.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] fbdev/offb: Update expected device name
Date: Wed, 12 Apr 2023 11:55:08 +0200
Message-Id: <20230412095509.2196162-2-cyril@debamax.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230412095509.2196162-1-cyril@debamax.com>
References: <20230412095509.2196162-1-cyril@debamax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Apr 2023 08:33:23 +0000
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Cyril Brulebois <cyril@debamax.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michal Suchanek <msuchanek@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
as spotted by Frédéric Bonnard, the historical "of-display" device is
gone: the updated logic creates "of-display.0" instead, then as many
"of-display.N" as required.

This means that offb no longer finds the expected device, which prevents
the Debian Installer from setting up its interface, at least on ppc64el.

It might be better to iterate on all possible nodes, but updating the
hardcoded device from "of-display" to "of-display.0" is confirmed to fix
the Debian Installer at the very least.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
Link: https://bugs.debian.org/1033058
Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
Cc: stable@vger.kernel.org
Signed-off-by: Cyril Brulebois <cyril@debamax.com>
---
 drivers/video/fbdev/offb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index b97d251d894b..6264c7184457 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -698,7 +698,7 @@ MODULE_DEVICE_TABLE(of, offb_of_match_display);
 
 static struct platform_driver offb_driver_display = {
 	.driver = {
-		.name = "of-display",
+		.name = "of-display.0",
 		.of_match_table = offb_of_match_display,
 	},
 	.probe = offb_probe_display,
-- 
2.30.2

