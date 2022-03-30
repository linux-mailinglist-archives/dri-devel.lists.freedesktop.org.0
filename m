Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827B4ECD5B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B27510E5FD;
	Wed, 30 Mar 2022 19:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996BF10E6EA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:39:51 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id j83so23112884oih.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vh80LqWh5yFk4uVlOaVcSfXCQBIqCV/dve0p6ZHZFIE=;
 b=K6Ayo8u8UvKejkKiVlQAMFLPxrXgYk4tBOH+6BGCzBViR2/Di44URGJ6C3QF4GP/fK
 pfJFwu66OU02sAFBL8o8eteJ9aCOIOwBz9TIuM+rVoy95d41tGq/kbMX6jYnuRck84Ag
 hZjQZIGY5OojW2x5uNe2nr7tLA4KvQDo3wMUunEKomFvCimOHL/v4LYmZZAZC3fgMOO/
 VUcabiyRdDBrw0WIdQHA7+7mLp/pATHRDUo4tB2EEB4DUfejA8jMFxH2cwnv6T/0q2k2
 nyMMlm6pmn8ArFJ927xJ6z4BCOqU1Cr8in2n6vHY4o+pQ5QbxsjUXA7sNxsZ4G+Uerik
 S//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vh80LqWh5yFk4uVlOaVcSfXCQBIqCV/dve0p6ZHZFIE=;
 b=hjZE4CYnooL/ADR9PhDIX0up53GWVaM05gFVuqATSqOPwTjvBqPII2tK5I8RTY675X
 Rap8mJKlwZH5he0ZuB2Fq6o4rZdsCDbE5ed9duYKOylKz3bpWPVtsW466E8n/VwnRz87
 4RIZBfBH4hotBzpUkFcUadvcmG6E4tGjZhKkKYXwoueN5DXpHNEZM20fffU9vPj9bJAS
 ZRYd2v7q39vMZ1CyPFHw29AOnVILjosKfwrLYCO4bVgYI8txbW0CWsw6tYG1n54qUTm+
 Kva9+Pq+L40CXd2d7CSs6chpfqfyRodnqwIEek6S9widhLGSBBkl8mRKtHAbad/ApRzJ
 CHcQ==
X-Gm-Message-State: AOAM530kug0JU0sT6jiE0zm0Zan9uo3i5gpINKZxBQxHfkHgOqkCq/9X
 3Dv43Zjh3Tng1Kq9NoqJFnTld6BQ6Ts=
X-Google-Smtp-Source: ABdhPJz3JZ+nWVamrj8yO4PoHqZpxhYq7nLBFxf5FmF8gxYOKSAt4L8iPxBaZBfQG6uaLwD81rs3Jg==
X-Received: by 2002:a05:6808:2181:b0:2d9:f364:b4fb with SMTP id
 be1-20020a056808218100b002d9f364b4fbmr832582oib.206.1648669190597; 
 Wed, 30 Mar 2022 12:39:50 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 bb35-20020a056820162300b00324b9a8121bsm11242223oob.27.2022.03.30.12.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 12:39:50 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: chrontel-ch7033: Add option for setting
 byteswap order
Date: Wed, 30 Mar 2022 14:39:41 -0500
Message-Id: <20220330193941.3720-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330193941.3720-1-macroalpha82@gmail.com>
References: <20220330193941.3720-1-macroalpha82@gmail.com>
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, Chris Morgan <macromorgan@hotmail.com>,
 robert.foss@linaro.org, lkundrak@v3.sk, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the option to set the byteswap order in the devicetree. For the
official HDMI DIP for the NTC CHIP the byteswap order needs to be
RGB, however the driver sets it as BGR. With this patch the driver
will remain at BGR unless manually specified via devicetree.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 486f405c2e16..88175b7e80d4 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -67,6 +67,7 @@ enum {
 	BYTE_SWAP_GBR	= 3,
 	BYTE_SWAP_BRG	= 4,
 	BYTE_SWAP_BGR	= 5,
+	BYTE_SWAP_MAX	= 6,
 };
 
 /* Page 0, Register 0x19 */
@@ -354,6 +355,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 	int hsynclen = mode->hsync_end - mode->hsync_start;
 	int vbporch = mode->vsync_start - mode->vdisplay;
 	int vsynclen = mode->vsync_end - mode->vsync_start;
+	u8 byte_swap;
+	int ret;
 
 	/*
 	 * Page 4
@@ -397,8 +400,16 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
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

