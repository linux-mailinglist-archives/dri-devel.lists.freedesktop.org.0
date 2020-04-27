Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0091B99DE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7067B6E0FC;
	Mon, 27 Apr 2020 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0C6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so16613688ljd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ko7ECkbpkrfY4zRKx21hcLUoTE3ne5ZVCyMO+vbIqD8=;
 b=els4jAlplL1YN1+7Ymn7N99XGmW60iCbzDoo3MReeet8oHMQl/ORWvvv+8Yj2oab91
 nE87K83GiVlBjYOMA0mrp2Y7k1mdQwDxGtsqe9HUiBLpuxGXujszOxxbLgZo6fanTIAI
 sa+tcc8v6m0/MMgl7z6LNVSNZu5H2ezw7GZ29Sx7BzqqTkq9EKfWzv6x0MAESUX3GWML
 Ft+RXkXl96ON7a4GjZOfj6f2v7b3yPogJSToV61VyyC1oFiJYbwRKLlHmWaZamEU2YdC
 knbl0sMg9vCd1BGp6cOW5pbrDC/7fBL2lIUrTI9b7clfutlt/uNmhjZimU1Llw7AN4Dz
 9hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ko7ECkbpkrfY4zRKx21hcLUoTE3ne5ZVCyMO+vbIqD8=;
 b=nV0O5FdASiPpxcZUT5iAI2NLy7op71C+4odOxX69U8BZRiwTvTOLRAX2lSFoZ3CzBp
 +6HctCtd4T0s0k17q+MSlV/0xOwHMotLjLegrtcFDL4cvMnBNdRU2kGFt794Y5XfSW4Q
 PXyiEcmO7MuhDHDV+drUT7we4hwsNBPbb27SE01YT0V326mMspoKmWPLgKBIBqAh5I8X
 1U8O3tmVaEolAGSQdUZ4GgtdmxH34ayjhwdRula1SRnVX82ddf7ZQl436ewIN4sxbwIa
 Vl+c0t89I9RIJYHv1sMuaa9wmm2zYf3GYibgooGI9ZXojYK/fQwZZ0UWXDoZuta2F9G1
 h/NA==
X-Gm-Message-State: AGi0Pua+dMjrX/uHtwb1axfZPS1aGijx2NflKq4Mp6+hXWLOWOuEApvi
 n1M+11eDBYFgwX6paSQPnaN14wta
X-Google-Smtp-Source: APiQypLoJvNFvtfW4LTmWbf2iV70ATmDA81pckGQq7lyU4lWS/z80rZa36RBaNum6PWTb2LesSMC2Q==
X-Received: by 2002:a2e:9207:: with SMTP id k7mr13520918ljg.124.1587975562137; 
 Mon, 27 Apr 2020 01:19:22 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:21 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 17/21] drm/bridge: megachips: make connector creation
 optional
Date: Mon, 27 Apr 2020 10:18:46 +0200
Message-Id: <20200427081850.17512-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the connector creation optional to enable usage of the
megachips-stdpxxxx-ge-b850v3-fw bridge with the DRM bridge connector helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 5f06e18f0a61..991417ab35b6 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -251,16 +251,6 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 {
 	struct i2c_client *stdp4028_i2c
 			= ge_b850v3_lvds_ptr->stdp4028_i2c;
-	int ret;
-
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
-	ret = ge_b850v3_lvds_create_connector(bridge);
-	if (ret)
-		return ret;
 
 	/* Configures the bridge to re-enable interrupts after each ack. */
 	i2c_smbus_write_word_data(stdp4028_i2c,
@@ -272,7 +262,10 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 				  STDP4028_DPTX_IRQ_EN_REG,
 				  STDP4028_DPTX_IRQ_CONFIG);
 
-	return 0;
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	return ge_b850v3_lvds_create_connector(bridge);
 }
 
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
