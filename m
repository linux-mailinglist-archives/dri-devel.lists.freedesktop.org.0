Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B82104AD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4218F6E834;
	Wed,  1 Jul 2020 07:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301E66E59D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 00:10:24 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x3so4624592pfo.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 17:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=TfaGDCD2g4XwNF2LQM8smD7Ls5igldEPLNPkOLgGOjk=;
 b=UVBVrK9P5cqI6Y1NbKJi7eCmvRQcGX+HOwTYx+unDNaad18DhCyKSiEY2QkDpHHB+U
 rsPuUxQ1RXhabSz2ckiiKaEchpziF/0Oad9jS6I4aaCCj+0wuFHv9dQ5s6oSYNzB/Gbx
 qKL8EBArd5Tyfyhi1Kst1TjByqif6YN1bnxMhMEpbYBAJtmOcTPzpv4uMdcvRc3h1DDf
 7tyuq5J1Q1sThp1GHY52gVN5AkcnyqO/oRZwsogo+gEvXD+uofuxh0GUckjOaaZ1nMHV
 uPLbz6/PF/pz85nw8+hKVJjpC4kvB81ti9DGtbHq65b29uR1FEsG5dZrcs2smZhlW2n5
 bSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=TfaGDCD2g4XwNF2LQM8smD7Ls5igldEPLNPkOLgGOjk=;
 b=Moc6UfZ4arplobUGyRky+BHed+Q/pc/ogaj+9T71D33nrZlc8gFItQTjE7AktRgzRL
 KKUDiVcsuyeQZ3gFh1YQy2ly7DxpLbX4BXskxWeWm1fFTh06h8QHTPoVQ98r8JTwibMH
 A533Kr0jt7ZKt1Y0WppQc0n40R24hYIGRdNUm/AcJPP7RHXjPVBOW/AggNv5jr/pwOrh
 aLjiVwe+UbP3gYEhk4OUVRQ6F19U2BSw/1rEnybcRFIj67iQ39VeOGnVx68x8dVyfX+Y
 srJmUyjxHY7bvq/jS3UX+nn9jchebm9ABTe1K1bswGYSsnjkEiZlqZtz+slXJ7Wgp6kN
 a6NA==
X-Gm-Message-State: AOAM532LxCZ7AicLTPE5LUS1V9S1HpTJugz8dPRgWwsXwCILWO4y2dJ1
 C69NP6a/VpyFPxpYliE3i+w=
X-Google-Smtp-Source: ABdhPJz9r3Qty0PwtsfLIPdD7xfZz/OUNLuAb7CxkrOcvXON+mz/A23qYNl81SiutlSb899vJeHJ9w==
X-Received: by 2002:a63:e045:: with SMTP id n5mr18249330pgj.274.1593562223698; 
 Tue, 30 Jun 2020 17:10:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q22sm3763535pgn.91.2020.06.30.17.10.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Jun 2020 17:10:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] drm/aspeed: Call drm_fbdev_generic_setup after
 drm_dev_register
Date: Tue, 30 Jun 2020 17:10:02 -0700
Message-Id: <20200701001002.74997-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Jeffery <andrew@aj.id.au>, Guenter Roeck <linux@roeck-us.net>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following backtrace is seen when running aspeed G5 kernels.

WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_fb_helper.c:2233 drm_fbdev_generic_setup+0x138/0x198
aspeed_gfx 1e6e6000.display: Device has not been registered.
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3 #1
Hardware name: Generic DT based system
Backtrace:
[<8010d6d0>] (dump_backtrace) from [<8010d9b8>] (show_stack+0x20/0x24)
r7:00000009 r6:60000153 r5:00000000 r4:8119fa94
[<8010d998>] (show_stack) from [<80b8cb98>] (dump_stack+0xcc/0xec)
[<80b8cacc>] (dump_stack) from [<80123ef0>] (__warn+0xd8/0xfc)
r7:00000009 r6:80e62ed0 r5:00000000 r4:974c3ccc
[<80123e18>] (__warn) from [<80123f98>] (warn_slowpath_fmt+0x84/0xc4)
r9:00000009 r8:806a0140 r7:000008b9 r6:80e62ed0 r5:80e631f8 r4:974c2000
[<80123f18>] (warn_slowpath_fmt) from [<806a0140>] (drm_fbdev_generic_setup+0x138/0x198)
r9:00000001 r8:9758fc10 r7:9758fc00 r6:00000000 r5:00000020 r4:9768a000
[<806a0008>] (drm_fbdev_generic_setup) from [<806d4558>] (aspeed_gfx_probe+0x204/0x32c)
r7:9758fc00 r6:00000000 r5:00000000 r4:9768a000
[<806d4354>] (aspeed_gfx_probe) from [<806dfca0>] (platform_drv_probe+0x58/0xa8)

Since commit 1aed9509b29a6 ("drm/fb-helper: Remove return value from
drm_fbdev_generic_setup()"), drm_fbdev_generic_setup() must be called
after drm_dev_register() to avoid the warning. Do that.

Fixes: 1aed9509b29a6 ("drm/fb-helper: Remove return value from drm_fbdev_generic_setup()")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 6b27242b9ee3..bca3fcff16ec 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -173,8 +173,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 
 	drm_mode_config_reset(drm);
 
-	drm_fbdev_generic_setup(drm, 32);
-
 	return 0;
 }
 
@@ -225,6 +223,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
+	drm_fbdev_generic_setup(&priv->drm, 32);
 	return 0;
 
 err_unload:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
