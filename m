Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61D731136
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF5A10E492;
	Thu, 15 Jun 2023 07:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9705F10E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 19:09:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso961007f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686769740; x=1689361740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dAUtpUkmmhsyD80FnhDUBBy4OWnp591lWDfp6Sr6AQA=;
 b=Y7iKWvFqR3xMVaVi6SLvCGA0HJuuGysh1kRcF/Dq+qpdCR0Eyh02TsQ68Ade4q5+Bl
 gDxWvT/iTsLIwQNiOGiCenuheK0g0rES1g94SBMChOe0DPHfj7PBb6OR1vi4TfoDJxo/
 9q05owb/naGthGDNDI7BvxfWCHEqiabs+ewAthdFRLxCRTexSVuCO8+5Bdd+UcOLj3mj
 uAETR3sLMTN6jsnWI6fqbuqSSnyN8dBFqinKR4GJCpf+lgDP/vdKt/c+Rs3U0WRuzmCs
 j7Ut+Ew26g2g0z6Dxnr94jp4T28jBOxyH82YRHW3W3kSETE2epWoSfjVDStUrCkXZ3aB
 i1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686769740; x=1689361740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAUtpUkmmhsyD80FnhDUBBy4OWnp591lWDfp6Sr6AQA=;
 b=lb7HV8wX95IjTHw6Qa4tOgCgukZAizsiYALMMWziKWrGzLBARO3BdqKimDehmln+zo
 PW7k2U42eQ5oVQMS8vh6norPwLgSYLzHEjku5ljSvHv3ZKKxvsFL7JGyMJIHpvLsjJcK
 LN+LrU64oRJcdRrlW5nqmWbfPkheaKWtlqL+o3HuNPGuHR5s0XV93Vnz1K9whq9cFx36
 R5iBlMvJd2Q0LI0JGnAW/FUVLvK/YbEeQqdSBEzHwDh67ehsT0TpOx4zetq/EAI3jEKf
 BHisNkx9DjEyVPphzX1zkmURYJhDVBTQRWMDoPegRtPWBIZl6xYVPDgDBXlFxx3RPfG+
 hHgw==
X-Gm-Message-State: AC+VfDynBzaL0GYOI9dbBtm0ntg0IjeuWGyf0JIaYFGW8ji9IOo5ly3x
 t+UG9TIazY+e1chf3mYaHrM=
X-Google-Smtp-Source: ACHHUZ6Jn0/GSY62ytFj0l9l8DWHDmZVjOfGQa0PejhOUnsR8P6+XrFk96WHW+De2W0lOy/SONNTYA==
X-Received: by 2002:adf:fe8e:0:b0:311:f28:c65b with SMTP id
 l14-20020adffe8e000000b003110f28c65bmr1545941wrr.23.1686769740607; 
 Wed, 14 Jun 2023 12:09:00 -0700 (PDT)
Received: from [127.0.1.1]
 (2001-4dd6-393b-ff-f59e-4402-63f8-7ff5.ipv6dyn.netcologne.de.
 [2001:4dd6:393b:ff:f59e:4402:63f8:7ff5])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5306000000b003110ab70a4fsm2341094wrv.83.2023.06.14.12.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 12:09:00 -0700 (PDT)
From: Maximilian Weigand <mweigand2017@gmail.com>
Date: Wed, 14 Jun 2023 21:08:52 +0200
Subject: [PATCH 1/3] backlight: lm3630a: add support for changing the boost
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230602-lm3630a_boost_frequency-v1-1-076472036d1a@mweigand.net>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
In-Reply-To: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686769738; l=2973;
 i=mweigand@mweigand.net; s=20230601; h=from:subject:message-id;
 bh=wQuvpc/SGDC/TXlDGAxz9aEj3nBI4XnZFq1GHSX9eFY=;
 b=MXZMkmZjabryYF/am5YsxkzeHOPo8Y9hH1lMYmwWqgDHqSVYdpnW0TIYVT1Z4bkLVSl1tKpwR
 +pMYlaGXRrhB7uSH2NS9ouQ+Pdq6jQB2MjWbRfBztW2dcBVfCwSr+/G
X-Developer-Key: i=mweigand@mweigand.net; a=ed25519;
 pk=Tjuj6PXmCCxzGTRw+9suZuZ41q/etgDHrIbPdkAaTpM=
X-Mailman-Approved-At: Thu, 15 Jun 2023 07:46:51 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Maximilian Weigand <mweigand@mweigand.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maximilian Weigand <mweigand@mweigand.net>

The led driver supports changing the switching frequency of the boost
converter by two means: the base switching frequency can be changed from
500 kHz to 1 MHz, and a frequency shift can be activated, leading to
switching frequencies of 560 kHz or 1.12 Mhz, respectively.

Add this functionality to the led driver by introducing two dts entries
that control the boost frequency (500 kHz by default) and the frequency
shift (no shift by default).

Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
---
 drivers/video/backlight/lm3630a_bl.c     | 9 ++++++++-
 include/linux/platform_data/lm3630a_bl.h | 5 +++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index d8c42acecb5d..1e8645694ab5 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -92,7 +92,7 @@ static int lm3630a_chip_init(struct lm3630a_chip *pchip)
 	/* set Cofig. register */
 	rval |= lm3630a_update(pchip, REG_CONFIG, 0x07, pdata->pwm_ctrl);
 	/* set boost control */
-	rval |= lm3630a_write(pchip, REG_BOOST, 0x38);
+	rval |= lm3630a_write(pchip, REG_BOOST, pdata->boost_ctrl);
 	/* set current A */
 	rval |= lm3630a_update(pchip, REG_I_A, 0x1F, 0x1F);
 	/* set current B */
@@ -528,6 +528,13 @@ static int lm3630a_probe(struct i2c_client *client)
 		pdata->ledb_max_brt = LM3630A_MAX_BRIGHTNESS;
 		pdata->leda_init_brt = LM3630A_MAX_BRIGHTNESS;
 		pdata->ledb_init_brt = LM3630A_MAX_BRIGHTNESS;
+		pdata->boost_ctrl = LM3630A_BOOST_CTRL_DEFAULT;
+
+		if (device_property_read_bool(pchip->dev, "ti,boost_frequency_shift"))
+			pdata->boost_ctrl |= LM3630A_BOOST_SHIFT_FREQ;
+
+		if (device_property_read_bool(pchip->dev, "ti,boost_use_1mhz"))
+			pdata->boost_ctrl |= LM3630A_BOOST_USE_1MHZ;
 
 		rval = lm3630a_parse_node(pchip, pdata);
 		if (rval) {
diff --git a/include/linux/platform_data/lm3630a_bl.h b/include/linux/platform_data/lm3630a_bl.h
index 530be9318711..fb5ffb906dcf 100644
--- a/include/linux/platform_data/lm3630a_bl.h
+++ b/include/linux/platform_data/lm3630a_bl.h
@@ -33,6 +33,9 @@ enum lm3630a_ledb_ctrl {
 };
 
 #define LM3630A_MAX_BRIGHTNESS 255
+#define LM3630A_BOOST_CTRL_DEFAULT 0x38
+#define LM3630A_BOOST_USE_1MHZ BIT(0)
+#define LM3630A_BOOST_SHIFT_FREQ BIT(1)
 /*
  *@leda_label    : optional led a label.
  *@leda_init_brt : led a init brightness. 4~255
@@ -44,6 +47,7 @@ enum lm3630a_ledb_ctrl {
  *@ledb_ctrl     : led b disable, enable linear, enable exponential
  *@pwm_period    : pwm period
  *@pwm_ctrl      : pwm disable, bank a or b, active high or low
+ *@boost_ctrl    : boost converter control
  */
 struct lm3630a_platform_data {
 
@@ -60,6 +64,7 @@ struct lm3630a_platform_data {
 	/* pwm config. */
 	unsigned int pwm_period;
 	enum lm3630a_pwm_ctrl pwm_ctrl;
+	unsigned int boost_ctrl;
 };
 
 #endif /* __LINUX_LM3630A_H */

-- 
2.39.2

