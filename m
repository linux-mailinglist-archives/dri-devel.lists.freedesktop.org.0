Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF644AB197
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC7410E1A7;
	Sun,  6 Feb 2022 19:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Sun, 06 Feb 2022 19:17:04 UTC
Received: from ixit.cz (ip-94-112-206-30.net.upcbroadband.cz [94.112.206.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B33010E1A7
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:17:04 +0000 (UTC)
Received: from newone.lan (_gateway [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id D335E20056;
 Sun,  6 Feb 2022 20:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1644174423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UJwP4f8oteGGn0vzBKGJSEJApAsEqkPzF2JBHrzRrEU=;
 b=XdwP9KlByhvaZk6RpTlP3n7bvBlVvaJEY0wOdmjpVjh9o+ZCDhOIAin+BxypxJJWPFz9tc
 1tv1U19vlvL4nOe+DWibYnuffvyO5KiR2YR4V8E1sWXSOed3B6p/OkyNuV2g9SKByp84lB
 LVNdHesUXiWXTBNdo4XI4r35pdaYtWE=
From: David Heidelberg <david@ixit.cz>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: JDI LT070ME05000 remove useless warning
Date: Sun,  6 Feb 2022 20:07:02 +0100
Message-Id: <20220206190702.450643-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: dri-devel@lists.freedesktop.org, ~okias/devicetree@lists.sr.ht,
 David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do as most of panel and in case of deffered probe, don't print error.

Fixes warning:
panel-jdi-lt070me05000 4700000.dsi.0: cannot get enable-gpio -517

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index ea0e7221e706..b5c0b51dc146 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -408,7 +408,8 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 	jdi->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(jdi->enable_gpio)) {
 		ret = PTR_ERR(jdi->enable_gpio);
-		dev_err(dev, "cannot get enable-gpio %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "cannot get enable-gpio %d\n", ret);
 		return ret;
 	}
 
-- 
2.34.1

