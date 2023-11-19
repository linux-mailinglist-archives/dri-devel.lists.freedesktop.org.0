Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019677F05D6
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3A010E1DF;
	Sun, 19 Nov 2023 11:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B80410E1DA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:42 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so8799557a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393321; x=1700998121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gja50uK+VGu03YOVtNxYd9PQDwE60KteuWGZ1s7ZCqk=;
 b=NPOg8n+Q3DN6ydULSd22NuLfXs7H8xt0JQkdx6uyoomDPD6rqesvKfgG2OnOkgpZk2
 /dHzDbGrAbez2+SKUI/GJ00UXWJDNb0Rx4WlzEXTyYGG9Szsc1rsPXo9tukVPhcvQEV7
 MfXezgjS5I+3xregpsfzdQNEI4kxDpT0KeazRLHoBEYJy/OZ5N99LfdYugCJVsQfVKSS
 1/y//zrZs4RiedgukrUWp2frbXRt6Aa5EVeGg91hkaQKunOJhoZkdZ/+dhv81k+QNvta
 2Xi9FBVBAh3kem/qsH/OIu9Yawm7+SwPJOwvBTrzDv3IBpTcmyFIKr80ChfHbTV922wj
 V0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393321; x=1700998121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gja50uK+VGu03YOVtNxYd9PQDwE60KteuWGZ1s7ZCqk=;
 b=Ed7Jg/Tq2dqyJ0BHzATiSJdus32EfYqAsvjNgOEUG6U4ovH2IQclMSOj0fSg3IWrvy
 ooiAXru9paAjzmm0yLNsKDC7ieTt/yWAw65XJ1fmW/iqsEwHo/NrbU3pPxz2T7jPoxXj
 60c+xrXxgMmC1sPUgsno2xccg4ar8ZweNPrJqqmA0lb6/j+CRlf+4GM65cYY//g6IcGa
 LoPArAC0ebbLe92fVMGDFQuQg/xgqWnY7on+jK1uIvmSbbS+qbrzF0Su3RwwVJMsT0Ou
 Rt2vSWEGDCVlr7jyRQJHgi7i0C97EBxo+/jDuWqeoOT8e1bzU2exKHVDQdvxwsAY2AYF
 TZhQ==
X-Gm-Message-State: AOJu0Yx5SaTPoYmuIw4YB0F5ubkH59/xYWFI/MqjNCUe4woPsD85wouW
 D4FAnUWOtoeDZ3smhB/Yw+4=
X-Google-Smtp-Source: AGHT+IFOQx1CLu4gRyNAZImWfbKRXYxuIkAJlM3SnSjaoqSkAxs60CqJJdA60K/QCwcTb894UlOqCg==
X-Received: by 2002:a17:907:d21:b0:9f4:1bd6:2d26 with SMTP id
 gn33-20020a1709070d2100b009f41bd62d26mr12971501ejc.0.1700393321074; 
 Sun, 19 Nov 2023 03:28:41 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:40 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maik Broemme <mbroemme@libmpq.org>
Subject: [PATCH v3 13/20] drivers/video/fbdev/intelfb/intelfb_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:18 +0100
Message-ID: <20231119112826.5115-14-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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

