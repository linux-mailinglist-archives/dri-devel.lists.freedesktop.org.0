Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63DA8949C5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA38010F834;
	Tue,  2 Apr 2024 02:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p/xrxB98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F206410F832
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:57:21 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d4360ab3daso60057361fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 19:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026640; x=1712631440; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WClQaYoJo0OqeAHKNbfYy5E7bDA6T3Yefi4QjiZ/Icc=;
 b=p/xrxB98/yZe7bHurYxQQj+hnRfql6Rlh/U3PektxGMn3xSwZ+PaMlYX2bJJXdLbSO
 UwmF1Vcbi6KhSkxcHaLSnyUkdutFsNoq5Pn2odA7de6LbNZmBp9m5d5R5BntI5ZmzxdF
 UVyQxWXYDjNsvl/8m/WaW/kLRWHHJwyrtc6NSn8u//gU/ZXeTxXXwMVtojeTyGyrveaA
 YK2OcUY5C2evWyx5zz6n9lZpvUrRjoO69ODyU9Qt5C1K3hFHaecLP4D6cFK0tG7cGFe0
 0FxJWP3IjjxwJbMtdL8odmXggyMTgevtDCwOiiWe+xTSbUAg/qh4tcaqNxeG5g7dbbc7
 UPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026640; x=1712631440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WClQaYoJo0OqeAHKNbfYy5E7bDA6T3Yefi4QjiZ/Icc=;
 b=eIn5N9mqgRT/InKod2jJ6dt0mtumbcQPjkSgYp84dV9vOYkxEvevhacZ3OtXC++UVn
 CVsh63sJC/k2sRyQPP89kvM4s9VE57eeNUXrc5CfppDB3rP5a/SrWgjODbxN8zY8/x6L
 KFwzMJgxi7fSKR/egWdREzbq5u4bKJZ8RiMc9Cp+kAO37a9D1PUQfUZpa5738sVUDxPx
 eRKuJGS3QCiwiabp+ItxsFTx5kk09RvnDyBIxYywi1AgXa9tUMMgdyn84Je15IAf1ndY
 eDzODK4Ysy1KkFZ4qK9Ceif6ECtjG6JsbvoUPS20dwGj5Ubbx4ofJhocQTjWRZceaGMo
 IteA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5yvHlkn3sg4LW+tVX/yUqltIZgFY0lH49dErUkpDrm0wq9fV/ydaFSdqkibBemJlkExER9YQMFeL4ULTYEsFK5KMN+n15e2M5ZGtprXMC
X-Gm-Message-State: AOJu0YxHUdP+xZ9vKVWxKSTHkZY/HorzV56wGM57Dh0RF346YM7wL3La
 UFjlP7s5OXde4hv2DjJMzU/GNplcDtoWR/HoD80ZM1hBibNue8frqjjHaipTwwQ=
X-Google-Smtp-Source: AGHT+IF66hRKxlIKruz0z7xXyICUFCnSOcGo50o2hV2HVegL541sB+XE0+lVuk5faltdSn+D/dwOSw==
X-Received: by 2002:a2e:848e:0:b0:2d4:67d8:7bbf with SMTP id
 b14-20020a2e848e000000b002d467d87bbfmr5982187ljh.47.1712026640319; 
 Mon, 01 Apr 2024 19:57:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:57:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:57:18 +0300
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc8180x: add dp_p1 register
 blocks to DP nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v3-4-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
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
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6D+VpatekHG0iKrzMnt/4fCsZT8ObGcVWTTczmuUXIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QM5ZGzo66Tx0rLjxtUWubhbhfbsftWEv1Zq
 XDOyxGPBwSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0DAAKCRCLPIo+Aiko
 1ceXB/kBWnbXOxX/eppym0Ht8AyLMA2w8Pvs6SxLfAmY9uABIMKNwrUB8AQvSHD02xRSB3y7mst
 jjC6AFj04rI98pLpus6Gu9HNrENvPJyfGVowLhAh8PmXbrewLHZ9Od1J3WmvqPYAUB4zgEHyBrI
 r7XG2lbNPPVDSkHuf3oRXYu7TdgLK7dCl+kayU78pGl8zAcTHsHLIuB3Ud+Vp5WFSlntcRTxAPj
 4kJINCWfnjL3rH5tWqRu5hD/qSdmatIotTZYlr4ivaf3g39MVvynI/UGtZ0zLuqaOFvPM3bkmK2
 I2ENv3aVBkn7VvND5FGlrtmFUeBTqr5ycZtysuR8eCS7nMcw
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

DisplayPort nodes must declare the dp_p1 register space in addition to
dp_p0. Add corresponding resource to DisplayPort DT nodes.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 6d74867d3b61..019104bd70fb 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3029,7 +3029,8 @@ mdss_dp0: displayport-controller@ae90000 {
 				reg = <0 0xae90000 0 0x200>,
 				      <0 0xae90200 0 0x200>,
 				      <0 0xae90400 0 0x600>,
-				      <0 0xae90a00 0 0x400>;
+				      <0 0xae90a00 0 0x400>,
+				      <0 0xae91000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
@@ -3105,7 +3106,8 @@ mdss_dp1: displayport-controller@ae98000 {
 				reg = <0 0xae98000 0 0x200>,
 				      <0 0xae98200 0 0x200>,
 				      <0 0xae98400 0 0x600>,
-				      <0 0xae98a00 0 0x400>;
+				      <0 0xae98a00 0 0x400>,
+				      <0 0xae99000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <13>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,

-- 
2.39.2

