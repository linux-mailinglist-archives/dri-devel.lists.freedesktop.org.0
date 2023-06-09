Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F9729D99
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9585310E6BE;
	Fri,  9 Jun 2023 15:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 667 seconds by postgrey-1.36 at gabe;
 Fri, 09 Jun 2023 14:59:57 UTC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFF110E6BE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:59:57 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686322795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOXmbDeINpoIDU/vXw0yK73QV+pWdXwKgrY443WDF0c=;
 b=QUwyXPjor572e2TjjtQxrFxJHfm8wwz/SEkCiifzuHh1it6PtCu2pId/zUAfKqIR8dx+Iz
 EOKAlWdba8cDelXYokYfmFGh7jyc+rFU/LrMcEZtbFEAObR3/BI+oI5jtox8wZDoJbmHk9
 f5DQhcmBLfbGkwXdxd2W99Uc2szW5h9Wd1qqU4VdrJQ+w2tZ8yfAMrOXyPfLD3diySwIXf
 nK5XevurV9SwDreS09Jnjer2EGwTigCtWcgTsEHFVaBBnxeq9s4SDnlVi2eejhsyF3TTuV
 wSrikPg+y2kUsu1ill6m8s54ni5ndC47FAjpWM+Xj5C5HJGpQDxShFVVZqXOig==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83A9D240007;
 Fri,  9 Jun 2023 14:59:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/panel: sitronix-st7789v: Prevent core spi warnings
Date: Fri,  9 Jun 2023 16:59:45 +0200
Message-Id: <20230609145951.853533-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609145951.853533-1-miquel.raynal@bootlin.com>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The spi core warns us about using an of_device_id table without a
spi_device_id table aside for module utilities in orter to not rely on
OF modaliases. Just add this table using the device name without the
vendor prefix (as it is usually done).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index bbc4569cbcdc..c67b9adb157f 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -400,9 +400,16 @@ static const struct of_device_id st7789v_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);
 
+static const struct spi_device_id st7789v_ids[] = {
+	{ "st7789v", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, st7789v_ids);
+
 static struct spi_driver st7789v_driver = {
 	.probe = st7789v_probe,
 	.remove = st7789v_remove,
+	.id_table = st7789v_ids,
 	.driver = {
 		.name = "st7789v",
 		.of_match_table = st7789v_of_match,
-- 
2.34.1

