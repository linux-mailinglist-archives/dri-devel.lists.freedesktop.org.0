Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96A3C2500
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 15:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968736EA2F;
	Fri,  9 Jul 2021 13:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B06EA2F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 13:26:23 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DD37580C84;
 Fri,  9 Jul 2021 15:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625837182;
 bh=sSgqNxTFibSijuHcfVmKDuviBaWK09/NQiHzxkjRxIc=;
 h=From:To:Cc:Subject:Date:From;
 b=F3tfm46SvVom5pE9TLnmse28n0E3SyGODqQnZYvRdqFgMVCHi7UXDCHf6QtaWeT0L
 fettj8uaKhScKQ39GX9XBoJvTIxRStDi6yeNyHAdguxow3JVrSzemdUACC9t80puLW
 HHRIwY4NNmxjRIag+VWdPjrAyJ7URY2Lgp3UYtUBPEfoPhLWyfzC3z0OCXOv+OzMa3
 CgcobFWGGig9ECFxn+oOpNQkuQrX+It0FSu6wPZ4uk25oHbGTY0T4yVEkScySCSaZs
 TtNPzJQ1/o+se8/VYxFvd3snJrHNeDXnCooWqYiGuZHTBPVqE2teF2pw0MiDammgoM
 0qCdNGXmhvRRw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] video: backlight: Drop maximum brightness override for
 brightness zero
Date: Fri,  9 Jul 2021 15:26:00 +0200
Message-Id: <20210709132600.5417-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, linux-fbdev@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sean Paul <seanpaul@chromium.org>,
 Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
in backlight.c") says that gpio-backlight uses brightness as power state.
This has been fixed since in ec665b756e6f7 ("backlight: gpio-backlight:
Correct initial power state handling") and other backlight drivers do not
require this workaround. Drop the workaround.

This fixes the case where e.g. pwm-backlight can perfectly well be set to
brightness 0 on boot in DT, which without this patch leads to the display
brightness to be max instead of off.

Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Thierry Reding <treding@nvidia.com>
---
 drivers/video/backlight/backlight.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 537fe1b376ad7..fc990e576340b 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -688,12 +688,6 @@ static struct backlight_device *of_find_backlight(struct device *dev)
 			of_node_put(np);
 			if (!bd)
 				return ERR_PTR(-EPROBE_DEFER);
-			/*
-			 * Note: gpio_backlight uses brightness as
-			 * power state during probe
-			 */
-			if (!bd->props.brightness)
-				bd->props.brightness = bd->props.max_brightness;
 		}
 	}
 
-- 
2.30.2

