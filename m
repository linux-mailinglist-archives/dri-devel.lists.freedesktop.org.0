Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3D5AB567
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 17:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D43B10E88E;
	Fri,  2 Sep 2022 15:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F75210E88B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 15:39:15 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-11f11d932a8so5633575fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+6U56AoJu0pVTqLDXXEhuyie64nJRbZENPj+HwQDbkY=;
 b=P/WwaxO4vIxdyfJ7COxmnc7VS/y8qyf1o8pcn7f71yL1RQ222o6DWc2sE6lsGAF6R0
 JsBshSDQ6yxkEWgL20OjoPrr/Qz2u/eJYmV+gGsFeuz3nAlMyuCBkCjR7a5vWjMpEeoR
 WU7/KKMmeSCM2QZVtAMNVqkuEYxjmgxJqsPh137pVg12mMMta9CuT3rI+NXUr7k5Lh4M
 OX8u0s4t7U/UDcAvW1sGmeiqfLCsmKrMz6kxhfs+R8q5zVJ48ZHNq2lBn3LXbn16f7nx
 vXj8b1bY/j86lh4zAu5JQefMmRS1ZUqk80dxbqybPnP4dL1U5HZNyn249JmmTGPScZIi
 ouXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+6U56AoJu0pVTqLDXXEhuyie64nJRbZENPj+HwQDbkY=;
 b=cn9/RI+MxsUO6QYE3Rlvt7kQP9b2qgGpF1HM2mR1bDkKBAgOqCj0IShjqY9U7SB8Jf
 JowOdjQ06ASGNaOmecBJmVbfg18nYxK43fGFf5RRrxL018JFax7THbcepMIEAFv6w9Kp
 YAAGUt+wn9Yfd2uBoZeauf4OV5KQM5G24OYyARXjAQ5GmSaCD5vPYfH7wAGB4DQdpyyM
 YDn0Q4GOw0Pg8BqEN6ggxW/9PqM4H8qGnMBA8AOXmqesuA8Zz1+aMgtUKzwA1WFOYLG8
 Pgd9gYzeLoMFgF5TMp+eJaJ7KVgjNXNlCYY9iZa0Gggw/nvjxUHteVj6gmKiyvJYL0ce
 9J9A==
X-Gm-Message-State: ACgBeo3Sai9ahF4NxC6++XgGrbhjKcUvO7nYKp5g43SIJrpdtC/xqI61
 yLxfV4OEbARQUo9b45FPk0VyJ+48u5c=
X-Google-Smtp-Source: AA6agR6v9a9Wp1TErKTHMNLCTH9pCFCOQ1WCt2ZG+Urr7s+3/VCLoGYxSQ50X6+BRZXw0by7Kc51Lw==
X-Received: by 2002:a05:6808:45:b0:343:50ef:1d73 with SMTP id
 v5-20020a056808004500b0034350ef1d73mr2057851oic.161.1662133154342; 
 Fri, 02 Sep 2022 08:39:14 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 e28-20020a544f1c000000b003436fa2c23bsm1087209oiy.7.2022.09.02.08.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 08:39:13 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/2] drm/bridge: chrontel-ch7033: Add byteswap order setting
Date: Fri,  2 Sep 2022 10:39:06 -0500
Message-Id: <20220902153906.31000-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902153906.31000-1-macroalpha82@gmail.com>
References: <20220902153906.31000-1-macroalpha82@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, jernej.skrabec@gmail.com,
 lkundrak@v3.sk, andrzej.hajda@intel.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the option to set the byteswap order in the devicetree. For the
official HDMI DIP for the NTC CHIP the byteswap order needs to be
RGB, however the driver sets it as BGR. With this patch the driver
will remain at BGR unless manually specified via devicetree.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index ba060277c3fd..c5719908ce2d 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -68,6 +68,7 @@ enum {
 	BYTE_SWAP_GBR	= 3,
 	BYTE_SWAP_BRG	= 4,
 	BYTE_SWAP_BGR	= 5,
+	BYTE_SWAP_MAX	= 6,
 };
 
 /* Page 0, Register 0x19 */
@@ -355,6 +356,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 	int hsynclen = mode->hsync_end - mode->hsync_start;
 	int vbporch = mode->vsync_start - mode->vdisplay;
 	int vsynclen = mode->vsync_end - mode->vsync_start;
+	u8 byte_swap;
+	int ret;
 
 	/*
 	 * Page 4
@@ -398,8 +401,16 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 	regmap_write(priv->regmap, 0x15, vbporch);
 	regmap_write(priv->regmap, 0x16, vsynclen);
 
-	/* Input color swap. */
-	regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
+	/* Input color swap. Byte order is optional and will default to
+	 * BYTE_SWAP_BGR to preserve backwards compatibility with existing
+	 * driver.
+	 */
+	ret = of_property_read_u8(priv->bridge.of_node, "chrontel,byteswap",
+				  &byte_swap);
+	if (!ret && byte_swap < BYTE_SWAP_MAX)
+		regmap_update_bits(priv->regmap, 0x18, SWAP, byte_swap);
+	else
+		regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
 
 	/* Input clock and sync polarity. */
 	regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);
-- 
2.25.1

