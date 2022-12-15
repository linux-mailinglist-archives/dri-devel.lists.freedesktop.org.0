Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F73B64D84D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 10:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A83A10E506;
	Thu, 15 Dec 2022 09:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Thu, 15 Dec 2022 01:28:18 UTC
Received: from mx.techtum.dev (unknown [51.15.50.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F71510E4DB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 01:28:18 +0000 (UTC)
Received: from noop.highnet.com (ptr134.highnet.com [31.216.14.134])
 by mx.techtum.dev (Postfix) with ESMTPSA id C8F341F3A1;
 Thu, 15 Dec 2022 01:22:02 +0000 (UTC)
From: "Haris M. Bhatti" <kernel@techtum.dev>
To: gregkh@linuxfoundation.org
Subject: [PATCH] drivers: staging: fbtft: Replace usage of udelay
Date: Thu, 15 Dec 2022 01:37:46 +0000
Message-Id: <20221215013746.270404-1-kernel@techtum.dev>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Dec 2022 09:10:25 +0000
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
Cc: "Haris M. Bhatti" <kernel@techtum.dev>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

checkpatch highlighted that use of udelay should be replaced by
usleep_range.
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53c9a..75cf3bb18414 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -217,7 +217,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 101);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -238,7 +238,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 101);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.38.1

