Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C727FF424
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5DA10E71C;
	Thu, 30 Nov 2023 15:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9205410E010
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:39 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6d80245b6easo647519a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359799; x=1701964599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
 b=Aese5bMriPxYSt2SrJDqTStFBLYtiHTtVvegk/2wkwbW7ed6V+DCZj8RZqdcRt+D2s
 Fi91Oo8KNFd7+kqFVwnPrfyjhgo2+x78D7yBQG3C1f9GULPvN+P07dr6Wtv90yg/0JOz
 grOo6DbdIbPGNSDUeMt9h0PWHCCERZPrAD+1MbOoJ1V/H7mpgHCk5EBA0fNzZcIf+kgO
 rTNi4TaMNOYcYc+qU6q9Fa04ehiyUDTYFgGWoTdatcdTxfMo1S3K02ijln53QeYUQxTn
 8V1xgu5LusTV5DZPkhKpmtnyixhOrN+UOny61AwWQzVQjkoA1sn+vt669+0Nwjn7uw2/
 Z33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359799; x=1701964599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
 b=IZYRwiHxKtMZfpAhI6+7YS/gJM9KlDkFfefyGA+xfxvQ1irqCawmBTm9fLjadEkr7Q
 AZ6n1MT9tgwT8HBhvh9aOarTlJNJE097BaUcFHOWf1uZFRX3T5GVNQIcTntv8xTEYKPk
 Blr9xmnfJ9KFW93+fxOsUVgWHZve+GmlJ4QfrgL8j8Yj131M0ePFCan4aZ1d/wdY/Jwb
 O/5VgGjErQdpkbU2MtCRz4p37p4T9GXbqE4NUgYZCHMsuWZIl1KF7+yiJ7j22RfY415k
 didD+TANuWBye3Ij+qu1nxqO4t/r97JKOKYIX2Z4XZRFl2yBf4sGnn3Fi9BJGko6BDKc
 2KpA==
X-Gm-Message-State: AOJu0YyVEw5ZyX0BhnpbeCt9Tc5XU+PbFzDXpX+QZnPEYWoyDjgIPQq0
 XJZgA11XwQEtaE0m2LBipNE=
X-Google-Smtp-Source: AGHT+IF5jM0pqDMvI16N6bFujnbVlKLkC7G5DaqBhEmXPRDkOyCV7zG2glIlQbuFemOOUGzoI3p2mQ==
X-Received: by 2002:a9d:6b18:0:b0:6d8:2883:cb5a with SMTP id
 g24-20020a9d6b18000000b006d82883cb5amr14210032otp.24.1701359798769; 
 Thu, 30 Nov 2023 07:56:38 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:38 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 4/9] drm/panel: himax-hx8394: Add Panel Rotation Support
Date: Thu, 30 Nov 2023 09:56:19 -0600
Message-Id: <20231130155624.405575-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for setting the rotation property for the Himax HX8394
panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d8e590d5e1da..b68ea09f4725 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -68,6 +68,7 @@ struct hx8394 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
+	enum drm_panel_orientation orientation;
 
 	const struct hx8394_panel_desc *desc;
 };
@@ -324,12 +325,20 @@ static int hx8394_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation hx8394_get_orientation(struct drm_panel *panel)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+
+	return ctx->orientation;
+}
+
 static const struct drm_panel_funcs hx8394_drm_funcs = {
 	.disable   = hx8394_disable,
 	.unprepare = hx8394_unprepare,
 	.prepare   = hx8394_prepare,
 	.enable	   = hx8394_enable,
 	.get_modes = hx8394_get_modes,
+	.get_orientation = hx8394_get_orientation,
 };
 
 static int hx8394_probe(struct mipi_dsi_device *dsi)
@@ -347,6 +356,12 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
-- 
2.34.1

