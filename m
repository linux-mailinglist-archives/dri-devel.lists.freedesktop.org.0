Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A500F3D65FB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F086E91E;
	Mon, 26 Jul 2021 17:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jul 2021 14:11:17 UTC
Received: from forward106p.mail.yandex.net (forward106p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597D96EB89
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 14:11:17 +0000 (UTC)
Received: from myt6-b9434eefd3a9.qloud-c.yandex.net
 (myt6-b9434eefd3a9.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3716:0:640:b943:4eef])
 by forward106p.mail.yandex.net (Yandex) with ESMTP id 1453A1C8244F;
 Mon, 26 Jul 2021 17:01:27 +0300 (MSK)
Received: from myt3-07a4bd8655f2.qloud-c.yandex.net
 (myt3-07a4bd8655f2.qloud-c.yandex.net [2a02:6b8:c12:693:0:640:7a4:bd86])
 by myt6-b9434eefd3a9.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 aWwfnNXN5N-1QIiIub2; Mon, 26 Jul 2021 17:01:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1627308087; bh=3nQkguDaDVoFMfRdWhldlojOcsExpGUkNV1oslV7XF8=;
 h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
 b=CxeuSgKeQCXTKfl2CYEvEwzqoVAPe8TW3+xzHdu0/r+vqXalVXp9p3YmfvU9lswQc
 2yULmlkES1pfehIvnju9QZrNEgSR7m/QaNAFJ9AQX6bRydXdFjs4DOfV3DKE+fNuW/
 2iqpVpNQCFppK14n/GwGyNi892GKN9ZcvpHmGNPM=
Authentication-Results: myt6-b9434eefd3a9.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt3-07a4bd8655f2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id olJ9yWy468-1Q2iis4C; Mon, 26 Jul 2021 17:01:26 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 4/8] video: ep93xx: Prepare clock before using it
Date: Mon, 26 Jul 2021 16:59:52 +0300
Message-Id: <20210726140001.24820-5-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210726140001.24820-1-nikita.shubin@maquefel.me>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
 <20210726140001.24820-1-nikita.shubin@maquefel.me>
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
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
to Common Clock Framework.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
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

