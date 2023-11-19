Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB707F0546
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A310B10E1BF;
	Sun, 19 Nov 2023 10:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EDE10E1BE
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:15:02 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9e62f903e88so446934166b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388901; x=1700993701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gja50uK+VGu03YOVtNxYd9PQDwE60KteuWGZ1s7ZCqk=;
 b=hF8wGjVv6r2XZbgKOWjqYFM95EcMEFu5gYM/B9vx2uKBiivc3qYxtEKDOAIMdyD5MO
 5svLiGLudWbz88+TRdhq+SZvibyCPRxjvJoTX0vdY8QcRVTWZ+LhrEPafPgJgMc1omQs
 5FseeEkzs0N4VmQ1OorQ/eOX6a71MRBfVmduCkgJeve5R3W+htVCuQwVpzYoMltvh5yd
 yzNRVCDdoy1RT1w7VIyvIiJ9XL+lnaeOUTQ5PijZDhFujwH9IxXnpj8jta0W/AjnQcV2
 nkEvO3gM/MreTNtQjUyl2k2/z2hQ03sSZl02D1pV3eZ3c801PIJwBRqxFrii668828qq
 mFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388901; x=1700993701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gja50uK+VGu03YOVtNxYd9PQDwE60KteuWGZ1s7ZCqk=;
 b=tAM5nlVxUG6lQ1MCruz8kLwvWNhGf9BTKGkcwilk166+fi3wdpCJnCIpdYP3GN4drE
 KJqfJ1x8cq+4pi2MQft0VT2ODFNNUSPUV+WhdvzxwGoVoDyDlk2PuSlvm9kl3J+oDuWa
 sQv1F7u8UCyfm3N/3tqKpcxigNNJ7UjZFc1A2/mSWd5pwx5PrVi3bSj0+eIDggnwp0Pb
 fKtYiqID/a7ioSAPEwkAp+MlJAVhuzH46SGVNVyw03vdO3psbNWhfnO3cP8buSmU0il0
 WDKL1aphR7r9bBV95IPN9FqglJXxIMo/g6WwrjjCVZdjDLqaLC6G0APC5DI1AhXGBlR+
 vOAw==
X-Gm-Message-State: AOJu0Yy6pO+WIKBoRL55GBx/T1z1tbR4zNhLj8JYUKl13WbI2CtZ0dWW
 l6Nh+HZgyLqo+Uyswi1dixs=
X-Google-Smtp-Source: AGHT+IEUMMC5ITmLhQ++xTxsq0EC3YjolDxqXOJe5kffmWkOeFgA/YeGu7mWuST9nb8zkP/u6wQ1cA==
X-Received: by 2002:a17:907:d510:b0:9e2:af56:c375 with SMTP id
 wb16-20020a170907d51000b009e2af56c375mr4580366ejc.52.1700388901208; 
 Sun, 19 Nov 2023 02:15:01 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:15:00 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maik Broemme <mbroemme@libmpq.org>
Subject: [PATCH v3 13/20] drivers/video/fbdev/intelfb/intelfb_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:38 +0100
Message-ID: <20231119101445.4737-14-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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

