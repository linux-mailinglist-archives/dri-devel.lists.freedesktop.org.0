Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE378ECB8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 14:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E7710E65B;
	Thu, 31 Aug 2023 12:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FBB10E65B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 12:05:58 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
 by laurent.telenet-ops.be with bizsmtp
 id gC5v2A00V3874jb01C5vkN; Thu, 31 Aug 2023 14:05:55 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qbgQg-00275z-Qp;
 Thu, 31 Aug 2023 14:05:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qbgQt-00CIgY-88;
 Thu, 31 Aug 2023 14:05:55 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] fbdev: ssd1307fb: Use bool for ssd1307fb_deviceinfo flags
Date: Thu, 31 Aug 2023 14:05:54 +0200
Message-Id: <303bb1a5012862f0003d3246a0c8120b97ea995b.1693483416.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .need_pwm and .need_chargepump fields in struct ssd1307fb_deviceinfo
are flags that can have only two possible values: 0 and 1.
Reduce kernel size by changing their types from int to bool.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/ssd1307fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 86dd24022871a843..5ae48e36fccb4e8d 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -52,8 +52,8 @@ struct ssd1307fb_deviceinfo {
 	u32 default_vcomh;
 	u32 default_dclk_div;
 	u32 default_dclk_frq;
-	int need_pwm;
-	int need_chargepump;
+	bool need_pwm;
+	bool need_chargepump;
 };
 
 struct ssd1307fb_par {
-- 
2.34.1

