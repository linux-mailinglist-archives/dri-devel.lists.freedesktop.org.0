Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED388CDCB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6F210F260;
	Tue, 26 Mar 2024 20:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CZd2CTZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AD910F25D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:03:02 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51588f70d2dso7169839e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711483380; x=1712088180; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bQopQsz++KyAxMIyytKdPL33zkWupusjZ2yKHzV+hFA=;
 b=CZd2CTZDo9L23uj9IrdGnOOpu8X4TriOBMl1+hbnBTv+lrEENWR9b9F7+/VLnDHRN+
 fbb6SfuC4Y3d/KAsCYV7/lWpC8Pjcx1w+583Js+w4laWl44xErLnTYqZrtfWW1N0WaUt
 cMNe/ImjvVtAAj2yPWIsotBPCZKH4Rap1rVc0Fs8UUlzf88eTJdGsypFHSmWkT6VeNkm
 IBn+0i+daoVPHGO0/UgOfYy1ztqMDgGYvKGt05f706WqE8/XO424Q+wcnPReq/z/GL9Z
 FdDiQE2t+5m9HvDO4xmXE0Kt8DHN+qDdNlsPO0eD0QS2GkZMNOjoCf7NzPKKSsvb2iBt
 cKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711483380; x=1712088180;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQopQsz++KyAxMIyytKdPL33zkWupusjZ2yKHzV+hFA=;
 b=wDZL9rZYep+cH2AjIDUs6YQ1CcuE84eMacaXpg+xud1c3Xr248j+M2bCbxIY9VY6lh
 Ppe0aVsb9nuorP00OxF9ws0230hved4W3tmIDdDpElQeSSKblZkg/MjOu1tqb+SK8WBC
 OftQMD/YA3pjQuMT/3LP8h75sTW9lfDWum2vzqUznqubn/dy7D0vNIpQVHbkwBjbk87C
 Q2pwBdN1o+Td8bhk21Fg6+NxVLUTvYgB3GXxNxxTDuYqdLpZXPIf3K6Q4znFYpoHmqMk
 M0gPa8UYma1jHAcCeyF7hlJhDGJZerIWkJadP2LmWiDfDYDgytDLDbp9td6HJgHgibm9
 /SLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQQmDTMOG2qs2Opp/23zxl/qmxBx3ZkVpBwGaxQc3uI5trvfXQhch1Yd9eXOjkou1aUOhIyj7z0Fs9CRL8RjtSjZvU1BoDaNf/Z19R1lHq
X-Gm-Message-State: AOJu0YyX6la9eavmszmUzP9010TTkvOzENKvIeZYtjvkF/YgRsgoRXkU
 NqrVP4keRNNJ1X+/pEA2DPab5xZMjdhIdlTcQg6qYjr6pO/hNUqI1i192qU8PZUTwuqygXF7opw
 Z
X-Google-Smtp-Source: AGHT+IFnIUQKR1NUHfXxdzxBsBRq+4L8hLoiAjx1D64J0vm1IDre8tnXPZKedRXEjfkM/rwyZQDgeQ==
X-Received: by 2002:ac2:5bcc:0:b0:515:bad2:825c with SMTP id
 u12-20020ac25bcc000000b00515bad2825cmr1375441lfn.30.1711483380262; 
 Tue, 26 Mar 2024 13:03:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a21-20020ac25e75000000b00515a7984acbsm1279408lfr.94.2024.03.26.13.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:02:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 22:02:57 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sc8180x: add dp_p1 register blocks
 to DP nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-fd-fix-schema-v1-4-4475d6d6d633@linaro.org>
References: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
In-Reply-To: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=M5PDgsfLVIKABExlt6TlS2fGlnl3XAgxVoXclxwHIH8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmAynwQqmWzf2igSonGtm/LlpImWQsxvrhjNxo5
 oGaj+uthFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgMp8AAKCRCLPIo+Aiko
 1Vk1CACOjyNVYW+tkP4qhqZ5fM6vXzj0fu29rVIteeUM6ExFg05XKzDZeZiVsZtlxlkAYZkbSe6
 UGxOEw4joPudBSyWwxGQ/21v9JVEg9SbarVapzr3Hvb4HOzJhxpZgtLXGkN5FyQA71kwIJHygUC
 zUIOa2G5/f/AIv8Opw2vopG+QTcOif9NLN+ox3ylKEoW5jMYSSgH9hTMxQlGLR7gXIi27yAcfvJ
 EfqMOHiQt6eyh+tRYEMBUFT19EZujmFrXEmBvzLuSgbKa1XS+4VwFVdo21uGibXTtf3UBXTiTbd
 PL/HJj6VAkggCbKRmrLAR4DbHt0Fo3lHUn2lX28rPZjYM/8x
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

