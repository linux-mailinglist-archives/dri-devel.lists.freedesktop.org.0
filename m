Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC443D65FC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6376E954;
	Mon, 26 Jul 2021 17:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 463 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jul 2021 11:59:20 UTC
Received: from forward103o.mail.yandex.net (forward103o.mail.yandex.net
 [37.140.190.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6166EBAC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 11:59:20 +0000 (UTC)
Received: from iva5-76c5c16f2a53.qloud-c.yandex.net
 (iva5-76c5c16f2a53.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:7bae:0:640:76c5:c16f])
 by forward103o.mail.yandex.net (Yandex) with ESMTP id 1ACF35F82079;
 Mon, 26 Jul 2021 14:52:10 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net
 (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
 by iva5-76c5c16f2a53.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 Ay6r08gAVb-q9HqbptB; Mon, 26 Jul 2021 14:52:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1627300330; bh=FgcgbDjWxggREdHTT1qnRWwYLnx7YFzAuhtDLKCU1qw=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=VswILzKGincFX9DATVsVy8uCYWb884fyhoiikHNzIepF0dRvwRF5Jq6bhOE8vDV65
 tWZIV/fBa4iVbycESBTcu+vbwleuulVUMSNnOgCzSFjypCYndzk9li4Ju/t8GAYeWw
 DzrYly6VZTughIdQoUGlCf7NyB69LM+knZ+G0w9s=
Authentication-Results: iva5-76c5c16f2a53.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id PIKatQa27D-q92Sg7Ih; Mon, 26 Jul 2021 14:52:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/8] video: ep93xx: Prepare clock before using it
Date: Mon, 26 Jul 2021 14:50:48 +0300
Message-Id: <20210726115058.23729-5-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210726115058.23729-1-nikita.shubin@maquefel.me>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jul 2021 17:47:34 +0000
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
to Common Clock Framework.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/video/fbdev/ep93xx-fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index ba33b4dce0df..2398b3d48fed 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -548,7 +548,7 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 	}
 
 	ep93xxfb_set_par(info);
-	clk_enable(fbi->clk);
+	clk_prepare_enable(fbi->clk);
 
 	err = register_framebuffer(info);
 	if (err)
@@ -577,7 +577,7 @@ static int ep93xxfb_remove(struct platform_device *pdev)
 	struct ep93xx_fbi *fbi = info->par;
 
 	unregister_framebuffer(info);
-	clk_disable(fbi->clk);
+	clk_disable_unprepare(fbi->clk);
 	ep93xxfb_dealloc_videomem(info);
 	fb_dealloc_cmap(&info->cmap);
 
-- 
2.26.2

