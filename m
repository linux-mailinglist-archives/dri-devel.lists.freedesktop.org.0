Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7DD8949A0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1C410F81E;
	Tue,  2 Apr 2024 02:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ih+ZPbqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681310F81A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:51:49 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-515d55ab035so1578380e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 19:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026307; x=1712631107; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8nAoWwlePI94p1y2muaLUzxrPgMrou5m/LTN89EwtK0=;
 b=ih+ZPbqhVqyfMT/VW0Xb5PJygp+PSfh6SOgzRX45QsUhgwaz2oYc2rQLrz8Mo7KAhc
 oBfZCJaXnejMdBTyMI+KGi9FXdTLQrOJxHWi5ttQFI3SjVS80tX1zZHpVoiIpio+B5k6
 t0YqcmoPGrOBbPNumykNvwawZphFM7ZYNwDeB6lnP4SeI2p4P5Xtq9m1z+pH++M/IK/h
 iLaSRvy5R0AWpGgmAD58K8dh6GhfNge3srTZjQKQAM4aJzGYrqUpEyrW345ATa/tHMxr
 X6LkzWH1i0iBa/ph0aoGXaW5Mrpf6OsorWXSoWpUoKONw4BSYznvDXryS1wNTh2KjeLn
 53MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026307; x=1712631107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nAoWwlePI94p1y2muaLUzxrPgMrou5m/LTN89EwtK0=;
 b=IuXZMn9BUwFzVIhajgbVH6WIoq3kdJ3+vsQAvBgFKR5gPvb2J8JGDaYNVIZjNVy5ug
 7q2X5d6gwHwy+79L1PApW4kZjwtDUbRLAf7b0XDp1JrEi1FeKu6FHcJUe5g5JG0i++BH
 rF8jFtRPC0PQNnraxr2DMYxb36TD7vRCFGt2dulWLlhNa5x8UiGK/ll/8dCF2dT9N126
 XHeJTDmwzBEzC74IVC6vi4oZaVHliLNfv4LaOfEqOoVmzDL1CsihIojVxWWRx0YRyjMO
 I6ZWsKNZ50B4TbEv6EhFtKUFfeZEA0WTy5EzYlezsTi6A/4O3lb5uLblfZduB8jZURxX
 jT+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+A1DOBT8qzbtZRzjlW+QPZjPBfaK84/ggXerw1UCIbiqwKvg2EU3LshThJIcilTLcyM7rSEiYYlPYNnhX+E3nglTYKCIGg5p+uiFf2f40
X-Gm-Message-State: AOJu0YyvfE30ui0dBl2sR1igNsHUi/bHmoCktZhvSq0Qh/WZi3Svf3ci
 stLBfb58PzPZWfXBFGZgybXAIdP2DofYMQIvSaEn/cImtrt/uPLohFMx5ZUvCzU=
X-Google-Smtp-Source: AGHT+IET2m9gjZhGc5OFILt6GqKIA3041PJsDcEchORoLXq729R52Gnp28l0y/Wvu5IKew3O/PE79Q==
X-Received: by 2002:ac2:47e3:0:b0:513:d640:ff16 with SMTP id
 b3-20020ac247e3000000b00513d640ff16mr7317518lfp.29.1712026307344; 
 Mon, 01 Apr 2024 19:51:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:51:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:51:45 +0300
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v2-3-39bf90051d83@linaro.org>
References: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yPu9lShLWjrX8FbgY01q1INaNP1kyI/7w03v1seDbHM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3K/+s6D2Mv/a6xTE3hAK7CO3aR3c7PdH9/z1
 +f2F8W/QfyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtyvwAKCRCLPIo+Aiko
 1ZIPCACrEOreU1YwzolZIv5IPL5fLijl5LGwROYqgPHaQAd7CwVQvnEHjCzc6fukZv1RNrNeamU
 50dMOIn0oLKHfkLSNznbMSfBbRh0nKgnYUJvR90HLPp2xfJguu2uB8wpIr8iV+WKkIvvvA5bSgA
 sN1yPCPnZTF6S9A5gmfgr/HLYtsErlEuziswTFDb8XIMdcUWblfb95w2SZ1spLVrKeAcFDBN5Ja
 cGiLF2CMSIaP5jkrBGyjqFheG979zaWjGbFigZesCQSBtnpdVftsquA8JLVcUc+TaY3AxRoctCv
 FP6j2lZ4G9BY9u8zdXRAVxt5aSSA0WnQ1jRVA/aoW+t3ZvxQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 99462b42cfc5..6d74867d3b61 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2804,7 +2804,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SC8180X_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -2877,7 +2877,7 @@ mdss_dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -2963,7 +2963,7 @@ mdss_dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,

-- 
2.39.2

