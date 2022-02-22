Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431904BF3FA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF3310F6CB;
	Tue, 22 Feb 2022 08:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A37310F6CB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:47:50 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso1173306wmq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UA23N42q/lRoQ03s/G51RuYi88oEfXR7cAXj33qu0L4=;
 b=QhojUfQRth8kFmKIYEISF2TmE7MQkUt3yWjyXHIu4C5TmXpgwVKIADdh6tXITaGCph
 xebvCFHaGT6+RUZ7vYkvxZdYrCt7UluX7kZwIRudM2nxGyIaQ1wQQiOutbtxj+QDHiAT
 kEj4FJ74AFUnrI6nzIYtOe/1EC69MrQdxTLKCeDBQeR1/UuRhK7AYLf4erpSWWIZqJKD
 OPThzFv+T1btYPEtM743lGWWHAa5KZnaFNHjKoHh55Qcygr6CdEhHH56WYrmkmX3E/AZ
 oMcv9xnR338eHew35wtUQl6OO+vDCQqhlRtk7iK6wCh+nDVZnt02v1ZxrgjGg2VZvQ30
 0pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UA23N42q/lRoQ03s/G51RuYi88oEfXR7cAXj33qu0L4=;
 b=Jwaha6R+e0Coh9a+W+KQ6QIG54UvjoIDpW2Pp7cC1vyo9tai2Peu7jaax8aN6P2+0/
 XhBCWjBV9/IDgmdh0hkwtiQzF/K9ddX1tj+9cEpVkw1X8x84Ds2aizzGhf5cuucE1wtO
 zDWQ5z3e51crfTnC+nJrKdwyQjHiChjrmGETFppftIY9hEwNxGxoUdajNT5Pk8XQ+o+D
 RsKXkBmhIKsiOJ6hSsMJ64QCz6VYDzDQfSYW2FRonMPEmGWfDszI/MHG+7TBP/gt5/zs
 bOeQRHI2uD3QpyQQuEOT3OWzALSwon4CG8HWsglTmkk7pdHvzWNi0OZ+kE0I6c3VmKE3
 avgA==
X-Gm-Message-State: AOAM530EArWec7/xy60xm5S+YIMZH2BNbXprKLH2hoRPU2gJkTEel3nH
 l8P3Vcty2hXxcHfPKv5JAmXW1heCNo7mVgVF
X-Google-Smtp-Source: ABdhPJwVEJ5ythwuNO7BkCRHp8zihw31svxZXWmQ+RmQO7NmQ5pyT7zvV1X64X9bJfEJ9+OwHlw7tQ==
X-Received: by 2002:a05:600c:35c4:b0:37c:debf:6f2d with SMTP id
 r4-20020a05600c35c400b0037cdebf6f2dmr2343135wmq.142.1645519668271; 
 Tue, 22 Feb 2022 00:47:48 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
 by smtp.gmail.com with ESMTPSA id t30sm1037919wra.19.2022.02.22.00.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 00:47:47 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set bpc
 and bus_format
Date: Tue, 22 Feb 2022 09:47:23 +0100
Message-Id: <20220222084723.14310-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>, Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new property bus-format to set the enum bus_format and bpc.
Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

Relates to the discussion: https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/

Max

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c5f133667a2d..5c07260de71c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
 	struct panel_desc *desc;
 	unsigned int bus_flags;
 	struct videomode vm;
+	const char *format = "";
 	int ret;
 
 	np = dev->of_node;
@@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *dev,
 	of_property_read_u32(np, "width-mm", &desc->size.width);
 	of_property_read_u32(np, "height-mm", &desc->size.height);
 
+	of_property_read_string(np, "bus-format", &format);
+	if (!strcmp(format, "BGR888_1X24")) {
+		desc->bpc = 8;
+		desc->bus_format = MEDIA_BUS_FMT_BGR888_1X24;
+	} else if (!strcmp(format, "GBR888_1X24")) {
+		desc->bpc = 8;
+		desc->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
+	} else if (!strcmp(format, "RBG888_1X24")) {
+		desc->bpc = 8;
+		desc->bus_format = MEDIA_BUS_FMT_RBG888_1X24;
+	} else if (!strcmp(format, "RGB444_1X12")) {
+		desc->bpc = 6;
+		desc->bus_format = MEDIA_BUS_FMT_RGB444_1X12;
+	} else if (!strcmp(format, "RGB565_1X16")) {
+		desc->bpc = 6;
+		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+	} else if (!strcmp(format, "RGB666_1X18")) {
+		desc->bpc = 6;
+		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
+		desc->bpc = 6;
+		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+	} else if (!strcmp(format, "RGB888_1X24")) {
+		desc->bpc = 8;
+		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	} else {
+		dev_err(dev, "%pOF: missing or unknown bus-format property\n",
+			np);
+		return -EINVAL;
+	}
+
 	/* Extract bus_flags from display_timing */
 	bus_flags = 0;
 	vm.flags = timing->flags;
-- 
2.20.1

