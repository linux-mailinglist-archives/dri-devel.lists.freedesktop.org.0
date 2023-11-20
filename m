Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8132F7F1FB2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D81B10E1F4;
	Mon, 20 Nov 2023 21:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562F410E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso20452485e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516800; x=1701121600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YucjSL5i0nwNQb8TgcsZe7VSoyFWTM6YGwWJl941dgc=;
 b=QzQnLomIhk/qC8fQ2LJv6C1eVLgUT2x/bJ6NxvpxZY5BS8+DilwA+ZJKUnO9HDooze
 DrHsf7MphmCY+4uH6dM8oz6E8xxPU+LluqdZaJtjhWan+8YQlA68c6CHTPlzZncbIPIu
 7Uiyp4YtJ1q5Z444V1WEZYJjuNOU36N0x6HSoiDvppQntoAxIoH8zuFxR5cYXyflkZIW
 gYEl7BJRELb4d8h2dQJbNMcMGD2IeHWn0TEq7IiYwfed1EOONMRRjVzP3SZTs2XVnZMf
 m6dNXYfxBqy9yEZpA2CYEvleBXNrbC1L2hNXUq/6Mtmuqutmjl0n2MYPq1h+fvXDRuOg
 VdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516800; x=1701121600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YucjSL5i0nwNQb8TgcsZe7VSoyFWTM6YGwWJl941dgc=;
 b=RIJz26Sm2Ij9qPZLG3CzYNejB2ujRH2BNehlfn4N0sQ6SYQznx/rTq4s5clObV07Qk
 jjBrrpCYgE97gHxqLFKpAdrTbrUw2ChdZQlMhBc2GSoZpla35e5Dib+1qGNewNCQBiUf
 1QGuwdANkmghPkhKkx3jBZ66THyPm2bivQcSr0GLSX7Rai5TJYdY1pHPtqlWMWiEEr4j
 1beoYKK6pyvtg3hObAk6R1dQh9IYbdBMQ5YJxg0qPI99sVYT1nPHRPPI4Zs8cYFPrad9
 ai5hd/fGo9fdPZpjJJDl8+aslfRdtuRHZZ0M5vH1hwFBj12r/I+F598kMyJyzQ+PcgZ3
 8PDQ==
X-Gm-Message-State: AOJu0YxR9t7G77snFX4RzpLGI4mo/iJ1LCHQzo7d8qiTQUYdEcczi8g2
 S8nfwAMg/ZcWbXARVTLZ5uZzyrCYmRw=
X-Google-Smtp-Source: AGHT+IHI1MXMavn+Gq00D5IWRHVWhxn647ptsSuePBK36r3qhuByg6Z/4wSKnRhzWG0O01cnuBnrlQ==
X-Received: by 2002:a05:6000:18cc:b0:331:6b5d:84d2 with SMTP id
 w12-20020a05600018cc00b003316b5d84d2mr5455372wrq.19.1700516799569; 
 Mon, 20 Nov 2023 13:46:39 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:39 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maik Broemme <mbroemme@libmpq.org>
Subject: [PATCH v4 13/20] drivers/video/fbdev/intelfb/intelfb_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:16 +0100
Message-ID: <20231120214624.9378-14-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/intelfb/intelfb_i2c.c |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/intelfb/intelfb_i2c.c b/drivers/video/fbdev/intelfb/intelfb_i2c.c
index 3300bd31d..f24c7cb4c 100644
--- a/drivers/video/fbdev/intelfb/intelfb_i2c.c
+++ b/drivers/video/fbdev/intelfb/intelfb_i2c.c
@@ -99,8 +99,7 @@ static int intelfb_gpio_getsda(void *data)
 
 static int intelfb_setup_i2c_bus(struct intelfb_info *dinfo,
 				 struct intelfb_i2c_chan *chan,
-				 const u32 reg, const char *name,
-				 int class)
+				 const u32 reg, const char *name)
 {
 	int rc;
 
@@ -108,7 +107,6 @@ static int intelfb_setup_i2c_bus(struct intelfb_info *dinfo,
 	chan->reg			= reg;
 	snprintf(chan->adapter.name, sizeof(chan->adapter.name),
 		 "intelfb %s", name);
-	chan->adapter.class		= class;
 	chan->adapter.owner		= THIS_MODULE;
 	chan->adapter.algo_data		= &chan->algo;
 	chan->adapter.dev.parent	= &chan->dinfo->pdev->dev;
@@ -144,8 +142,7 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 	dinfo->output[i].type = INTELFB_OUTPUT_ANALOG;
 
 	/* setup the DDC bus for analog output */
-	intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOA,
-			      "CRTDDC_A", I2C_CLASS_DDC);
+	intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOA, "CRTDDC_A");
 	i++;
 
 	/* need to add the output busses for each device
@@ -159,10 +156,8 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 	case INTEL_855GM:
 	case INTEL_865G:
 		dinfo->output[i].type = INTELFB_OUTPUT_DVO;
-		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus,
-				      GPIOD, "DVODDC_D", I2C_CLASS_DDC);
-		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
-				      GPIOE, "DVOI2C_E", 0);
+		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOD, "DVODDC_D");
+		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus, GPIOE, "DVOI2C_E");
 		i++;
 		break;
 	case INTEL_915G:
@@ -176,7 +171,7 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 		/* SDVO ports have a single control bus - 2 devices */
 		dinfo->output[i].type = INTELFB_OUTPUT_SDVO;
 		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
-				      GPIOE, "SDVOCTRL_E", 0);
+				      GPIOE, "SDVOCTRL_E");
 		/* TODO: initialize the SDVO */
 		/* I830SDVOInit(pScrn, i, DVOB); */
 		i++;

