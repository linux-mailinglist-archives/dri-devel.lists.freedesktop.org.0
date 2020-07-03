Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E313213FF4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719FE6EBBC;
	Fri,  3 Jul 2020 19:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B256EBBC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:44 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d17so23485413ljl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDwBn0EdrtAQxrrQgBd693cs2JMOJ8+ROlWibMI4+Wg=;
 b=hsa6YLbq7OaOTzqUA6nsR0NYTKMufFiRhKk9HQC7n2KhFOtxUDIn7R09ok18SY66M6
 5HmJ/7wefGBprYXqiUiQPR2Pdth+sneoOiDMDuuvvjlbOMso52QytbujNSoDMRA2oiq/
 2QP62eOeEyAUjO2878ijymNb+IO9XV5/EC+y/b9VWjH5IDBJgaazAF4b8uQDmUilTM/X
 l4u+lZtFwxxK0Hu5qD1bEVfBQZKRFwrj+SbmaFEtO3J/xMtJKfT6kJNbND7IlzHCHRmZ
 irAYcY3jA5ypgSMaU1lej59M4C48fod7XzBvKQ/Yc/Qg46JIbuIuedEgY8D8jaCGB1eu
 DmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kDwBn0EdrtAQxrrQgBd693cs2JMOJ8+ROlWibMI4+Wg=;
 b=RGwuIcGSemZ4Q+GnGcFosBCIuARL9XYTmlTt89wU3e9RNZMhKnsVkddbbUXDy43qq2
 qOqpInA/R2/5tAmKhsF6h4uITaGpsQe8YgKy+gclQClUOFdQJGAU+Q3FUh9b9OkmnXFl
 HETFBax7CfnW/SGg+KrZVR9mTXCiiQfXrpOVsyh2tEcm3v+TwArPd5d6P6GKGTpJu04J
 NB6sg8LKfyagrzE+mobdcSQI5v+R1jyFLdeHHgI3n7GXqDFnc0ODZ3vJwvo61lZpSqv2
 S3nM1x3/CKN4QzMIBxKyNrMk6MtZqPu/UKsg+ItybgQLCgmzJIsWkoaaMb/ZK9PwfiaY
 8UuQ==
X-Gm-Message-State: AOAM532g7HgHdYbUeOMUHK8h+KWGMGjqxjjwb9WGL87BOa+c5qurfxz4
 OU2sbXHGxPa3ybo52Y7bEcrSfeTqgLg=
X-Google-Smtp-Source: ABdhPJyTIvna8kOqF8Xm/B0XQtz+3XwXiCCBE6hs9C9X7FzLEWoDFb1R8p4g/NqpqmKNB4EzIt/Btw==
X-Received: by 2002:a2e:95d3:: with SMTP id y19mr19970372ljh.60.1593804282386; 
 Fri, 03 Jul 2020 12:24:42 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:42 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 17/21] drm/bridge: megachips: make connector creation
 optional
Date: Fri,  3 Jul 2020 21:24:13 +0200
Message-Id: <20200703192417.372164-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
 Martin Donnelly <martin.donnelly@ge.com>, Sam Ravnborg <sam@ravnborg.org>,
 kbuild test robot <lkp@intel.com>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
