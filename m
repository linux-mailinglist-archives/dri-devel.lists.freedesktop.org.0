Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2A84EE4B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 01:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159DD10EA98;
	Fri,  9 Feb 2024 00:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d/L/7uxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6B910EAAF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 00:17:39 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so412244276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 16:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707437858; x=1708042658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDQauiVymLL7U9PR9tza9FE62lAGc6Sh+4W4yotRVSw=;
 b=d/L/7uxA2CKq+CjB2vBFYDBViG29qXDC+pNUl1KBe6cXrBH7yvRtEfZS5h5Jni/BkU
 7YRcCQJc5pofJFPgqybMHNxRW6IFg/h31c4ONEMAYbEJ8Nvfb3DRG+8sNqFRGgf21cPQ
 wN+Dv62//+FOQLhldRWBMCAerxa3Gihgf7TP5iuX0KdBJGU4WbRVzhsiaExbf2qsqlRj
 tNdaA953PIGTFQmOOLFnWhnMOtubStR0nUYZlpEFIykGL2HJx5avtgaH/trCKqA185yX
 /LB09wZmVBdUqdDhyrgJA9wGcNYdiuzlqskNdp7Xa0z1Gu9jFbxlyWsTbfzfNh/KSvnE
 1M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707437858; x=1708042658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDQauiVymLL7U9PR9tza9FE62lAGc6Sh+4W4yotRVSw=;
 b=j8j8AKROmFnlZFZemHbWyKNNyNEBY9cmQJCsS7Sz81TD08GOAHykSUndMCHvD4mw+m
 OIC6D2XIUHT5XvbY3PRFr2Kp4IcRA0WLS/ZUNdWuWS6DhAobwtVP8sBXa89f4Xvr/Yxv
 V7P4NnAr+F67HcpyJIU8cimr6auurkXmXOLzQouWVybgSpgA8MU6nHnojyh2Qotweoil
 BmPILDbKdEO9LlQSte6Oi61zm2360nJY4bKQSbjDjcNj2pGVl5MqpLnlYBucs6TQFpG0
 kRl3EeowBjGA60oX04SwSQNfc3e6VT6OchLZxR4d2OdvVhW9LCXrhN1xDlcvNhFkjjSp
 WqXQ==
X-Gm-Message-State: AOJu0Yz3cVBmf30Csvadg6DjKOSvhcQZNkYeFOKt2hIRxuV4yz3EsYeV
 uaeTeeJWsSqnlpPi6sU2kns1yBH4x4VmiuSXPCH8Qu9UBCH8uV2y
X-Google-Smtp-Source: AGHT+IEo1iut94rube4CfxWdBcqxaVVTwH5a48TYQAu0VyqwSE3ThAcB84fFQZnIA5Q5BkHvkvKh4w==
X-Received: by 2002:a25:804a:0:b0:dc7:4775:5fbd with SMTP id
 a10-20020a25804a000000b00dc747755fbdmr1096600ybn.12.1707437858058; 
 Thu, 08 Feb 2024 16:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+YAhu2I4unqax8AF/EdGwYvR4g9OqCh4L1WWTp78iDIuhNxgDQjbLZnvRN9NClFBh4f//5eEZO72dF+2AeySK8buerSzcKkaxAp25JbmmrHNCd14atEGIdOPOUDJo9qZZBF1qLRf1PEJmmibj/M+ay8WlO92E9r8xEqYq1nhJInBwcVzByQJmPi8M60+v8AnYQwHwJ/NTxjdAYPH0hY9YgcYE0Ku/EnYvt1je0FB5XSPkHffyUGRtIbffscJnLsX8h7zltFyYS+Wm+FZDAAApTvnPRuszjscPUzvB38yWsIgB+e+1HXZXZIGmdOepdzoy4KMjlE43ADNBVsxHm1+kSFbxDYd6bu7qNL+cowNt0QXiqUTBAoe/I6ewcn/znWuN1iwvWPTWPAuMaE3pbeByMsoBh8ThDKrCMNLlpckyaPqOXjarYq8vw1uFrk/H2WWkfZ8VuUD8fgSnqmZ/0HVbqjEqyRta8y9632T7n5lrRmL1L/VUe1GJEdhbjIs3Blzgb1bgl8oThak79uIlmMnxVbKxiYNvKz3gfti8MroDNs+OPfWrH1uZk/be3nuVQrvrbkAZ1dlAF0ja
Received: from localhost ([2607:fea8:52a3:d200::42b6])
 by smtp.gmail.com with ESMTPSA id
 nh6-20020a056214390600b0068cd2feff0asm87408qvb.117.2024.02.08.16.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 16:17:37 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670-google-sargo: add panel
Date: Thu,  8 Feb 2024 19:16:44 -0500
Message-ID: <20240209001639.387374-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the panel used in the Google Pixel 3a.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 32a7bd59e1ec..176b0119fe6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -441,6 +441,47 @@ rmi4-f12@12 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l1a_1p225>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3fa7-ams559nk06";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_default>;
+
+		power-supply = <&vreg_l6b_3p3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1b_0p925>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pm660l_gpios {
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
@@ -481,6 +522,29 @@ &sdhc_1 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	panel_default: panel-default-state {
+		te-pins {
+			pins = "gpio10";
+			function = "mdp_vsync";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-pins {
+			pins = "gpio75";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		mode-pins {
+			pins = "gpio76";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
 	touchscreen_default: ts-default-state {
 		ts-reset-pins {
 			pins = "gpio99";
-- 
2.43.0

