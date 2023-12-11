Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38C80CFFA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EF410E4AF;
	Mon, 11 Dec 2023 15:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAF310E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:53 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bffb64178so5419259e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309492; x=1702914292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7zbPBXHSyKs8YSU00zvyJoXqedAJO62IkrIlwwzL9k=;
 b=ssD1rCvWGlPEUGFC2CQ5yGEM8UrMagQD6sISdC7jUnFR9xSi3vwvoBuIxy6ZBrycnU
 GcB0N/Fkr5hhQ3GgD7I4Seg8ghtwMov59M6jHlTIB2r3itK4EnabbE33WoaT18wpO0Nj
 fFtr9xcQTF5kof62/dYzDBYDv26rhgC1efca0P9AM3CxgE/o+2aZXLIIhtJsJ5HbAzLd
 KLG3eU5tSAX8Pa4+t7ZJTEKzrueSSLwkS9DDaoq7mX5zhsOSlEnRyDWySRJHMbV0fRKe
 LDEHwCvL+X1OFinyJsWund113JjbFrjaU1EbK4oCrpN3uAX1OUIETu8yETX7eppKMFuu
 6j5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309492; x=1702914292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7zbPBXHSyKs8YSU00zvyJoXqedAJO62IkrIlwwzL9k=;
 b=btyfgAqNJsSPPc5zxaIlDrGQE+90QDx+zmTF7aaiYyXL+6tXelXuwHWu2k1hOMf5eh
 YWouGQ1/KsEGilpZ3THoQe+zH4c27Ww86Pp9lvhZyBBBRK4A1OzZHqiCKHRUNgIqJehS
 TpmiyRhBT9DM1UwmJmC22+F60kaD+tbCI72gW7RQu8ICe+HHGgTKygAbjVb1fJK/QzJo
 1i0gUag7Mzz4RmMDwTJyil33bi5TSCWNe84MKQjTNimeszIKGa/6xEsm8gIgNCKYARJ0
 RwqlxQzBN72crx3prPRxauyaOn2SPXrCsGSNBwHKP4vQcBH/MCsvF3Ziis+JGUtq7ddN
 N0LA==
X-Gm-Message-State: AOJu0Yz3KCXd6uGfpGU5OuPRyDk32I8woODjzoN/fLpTb5lsZ3cpm2c2
 yAh7hk84LEDN4FMPhu8mk5pEXg==
X-Google-Smtp-Source: AGHT+IE9OuQEWQ5+fcXdonkIzS+wpF86y98xG8VCNxpAMGPUXaGzcDFlGvisOKQdi87Y32Tw2Zz1og==
X-Received: by 2002:ac2:4c08:0:b0:50b:eabe:89f7 with SMTP id
 t8-20020ac24c08000000b0050beabe89f7mr2030043lfq.91.1702309492179; 
 Mon, 11 Dec 2023 07:44:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm8150: add USB-C ports to the
 USB+DP QMP PHY
Date: Mon, 11 Dec 2023 18:44:43 +0300
Message-Id: <20231211154445.3666732-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expand Combo USB+DP QMP PHY device node with the OF ports required to
support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ea7c92c0e405..77d32f4fe7da 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3447,6 +3447,32 @@ usb_1_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.39.2

