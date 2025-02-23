Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E49A4213E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547A710E462;
	Mon, 24 Feb 2025 13:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="FO8WQ8i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B196E10E02C;
 Sun, 23 Feb 2025 19:06:21 +0000 (UTC)
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
 by mail.mainlining.org (Postfix) with ESMTPSA id D1940BBAB1;
 Sun, 23 Feb 2025 18:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1740337128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAV0Qe0+FmS/ZCfAzMOGXS1xl5PRcB7p0GeHYLx+/po=;
 b=FO8WQ8i41spKCC9MqV832IxK0b50nrm7ugQJ+4YIybi1fSZ8CBIfLtye9O8h8XwJOFvwgx
 DDWTx2FSV3G92j0cVSpewBgMpEqLkpeCdFIn5Ky030Yj0mWsjofEtYlL2wmAM+avizJiLM
 ZWy4XD5OsOygDDw8DT7UcMQQwbwGf0TNX1wgZpFZKVRf0QyG30FRCGAa3d0U2WFHhoW19q
 5OVSHmhyh0EkSfWsCb5f77RET4O4icJFKpUc/Y1v0wf7hpjrZhvQ1hBiuAYAgQX6pm0aX0
 nXJZsrnt/V95JcF5wTs98t2F9Cjn1GrxKF0Uir2zNPPU6cabf0eZEsmitZv1bg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Sun, 23 Feb 2025 19:57:48 +0100
Subject: [PATCH v2 3/8] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250223-msm8937-v2-3-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Dang Huynh <danct12@riseup.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740337120; l=2411;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ATKVPnPAnxLDqZY8gYpdG3Mfkq8Qieu8l9ptvDkctEI=;
 b=/i7b896LZsXxFwQVIpwXMGgL7eB8bBsr7xzx7pi1RkYYlRPQqdEHNYItsOHk6nKsJeeDyaG+E
 DlQnYu8rohfAWiMTjbCtoZY+sQBVHr4daHDBIKp5b7mLn7O4U2Xlr+9
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dang Huynh <danct12@riseup.net>

It looks like both 8917 and 8937 are the same except for one pin
"wsa_reset".

Signed-off-by: Dang Huynh <danct12@riseup.net>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/pinctrl/qcom/Kconfig.msm       | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm8917.c | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 35f47660a56b1a730d7724fd5a4fb490da9c7880..a0d63a6725393496e034ca26d218265b7ba4b53f 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -138,10 +138,10 @@ config PINCTRL_MSM8916
 	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
 
 config PINCTRL_MSM8917
-	tristate "Qualcomm 8917 pin controller driver"
+	tristate "Qualcomm 8917/8937 pin controller driver"
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-	  Qualcomm TLMM block found on the Qualcomm MSM8917 platform.
+	  Qualcomm TLMM block found on the Qualcomm MSM8917, MSM8937 platform.
 
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8917.c b/drivers/pinctrl/qcom/pinctrl-msm8917.c
index cff137bb3b23fbbe2b2630a7cbbf9f46e39981e7..350636807b07d9ab0e207368de63837bc5fa5502 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8917.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8917.c
@@ -539,6 +539,7 @@ enum msm8917_functions {
 	msm_mux_webcam_standby,
 	msm_mux_wsa_io,
 	msm_mux_wsa_irq,
+	msm_mux_wsa_reset,
 	msm_mux__,
 };
 
@@ -1123,6 +1124,10 @@ static const char * const wsa_io_groups[] = {
 	"gpio94", "gpio95",
 };
 
+static const char * const wsa_reset_groups[] = {
+	"gpio96",
+};
+
 static const char * const blsp_spi8_groups[] = {
 	"gpio96", "gpio97", "gpio98", "gpio99",
 };
@@ -1378,6 +1383,7 @@ static const struct pinfunction msm8917_functions[] = {
 	MSM_PIN_FUNCTION(webcam_standby),
 	MSM_PIN_FUNCTION(wsa_io),
 	MSM_PIN_FUNCTION(wsa_irq),
+	MSM_PIN_FUNCTION(wsa_reset),
 };
 
 static const struct msm_pingroup msm8917_groups[] = {
@@ -1616,5 +1622,5 @@ static void __exit msm8917_pinctrl_exit(void)
 }
 module_exit(msm8917_pinctrl_exit);
 
-MODULE_DESCRIPTION("Qualcomm msm8917 pinctrl driver");
+MODULE_DESCRIPTION("Qualcomm msm8917/msm8937 pinctrl driver");
 MODULE_LICENSE("GPL");

-- 
2.48.1

