Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEBA80B78D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068B910E323;
	Sat,  9 Dec 2023 23:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0C810E30F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ca0c36f5beso41654621fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164100; x=1702768900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBuwfYsDiJwVlg4rvr4jjyUZUrTiG1ABFINzPvbdSwU=;
 b=tAADTey8rbsbCGsp8gXzPkOlSrBmKWF4PD9Galze+tgZiYFb+bm5LgZrcXClhaYHTx
 82e4y/HRpxh+XjQ2vug0riAr6WtEAPqIZCENXEwuGIwbn/5ZKjlJn+1dy4bSx46vK3gZ
 D9576ekZym6F4csOTLn2nuGbw9chyKLc+iDgx5DE1RmaZAWVUeDbw/FvvJhYUHzejBQr
 YZuOcp8dTc0gFaf/2AK6e6L1oMPP3qdblZfn79wUwK4PNOncdRHFDpltyJKvZSsdEuwK
 yUGWMg/v4w0EAepqf6zsbXO4hzsC40GF0NRGwIGHUtZ9Kj6uaTgJ73+AomsSv9Z1a+ST
 +DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164100; x=1702768900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBuwfYsDiJwVlg4rvr4jjyUZUrTiG1ABFINzPvbdSwU=;
 b=oimNeOEBfuTzpCWAjhT7qW1iG37eA14wMV50FhmZGzx3TcgsIFogmxkacW7AUG7A9C
 iU/JOW9WpFf53rI0lze+Q+nV/x9Lv166fTvzxGCBTkksxD96mAQna/bEXS9ZsOkulR9Z
 v8k22UILBMxRSWeCjLQdOsEyUew9ebEWN/CAUVKpKEdDpcZm5ci2MmCGQCmzBKdXZNl+
 XQmLspMZWBkw4pgGNeB3Yd9DBuKNXJ85BkXSMzzYgyFStG98KtMKuCgwuuJymVwzCXNk
 pEgB/9LJu+kBGUF2hCLCob44k0yJvzg5lutT9uXaNtNq073zEjwekpCbJq1175lGGzW5
 dzVA==
X-Gm-Message-State: AOJu0Yx//8F7Qo2vJ8HuR6f7WemGlcWHxE4f6LTbcymlMoAdcWSIcL3d
 DGCrmEvrKeegEwBNI6hIbAla3g==
X-Google-Smtp-Source: AGHT+IGPXYdWbn3virBUu7OPjkz+CESPfgEyBwgd0JRLN8vDQrRqSbMdF3S8YNRY5tYiZx1Z4A6s2A==
X-Received: by 2002:a2e:a805:0:b0:2cc:1e83:65ee with SMTP id
 l5-20020a2ea805000000b002cc1e8365eemr29233ljq.56.1702164100179; 
 Sat, 09 Dec 2023 15:21:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 8/9] arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB
 host
Date: Sun, 10 Dec 2023 02:21:31 +0300
Message-Id: <20231209232132.3580045-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expand first USB host controller device node with the OF ports required
to support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 38423a9f8408..84f61e018d78 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3605,6 +3605,25 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 
-- 
2.39.2

