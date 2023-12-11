Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10F80CFF9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3128810E4A1;
	Mon, 11 Dec 2023 15:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893DB10E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bf4f97752so5871957e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309493; x=1702914293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rRpPZt2SIJA5F3cMHV1T35kXBcvXzQb5IQ83qE8OmA=;
 b=GODk9XmiZm2GiIYKgC/JMIwTSmH4NfpUOysz9L80OH+HW8SqGpVob8TcqBVLhLb3W6
 zwuE66tc5ciJRy14owS0VfZl05qHkWi8d8hEsrL8Mz24YgyQ3nSaefUGkHDLN1+9Qn0O
 IqWL5mTrgzKLmrbuuQLdqsKdugiEzQOQc+vs8zneKbLIfLiB8CvikemCE4R1aLsKVdl0
 GiB2RvkAm5cCOssWvoDfzV/3shkfM1iC5J0KAX0C8733OdrV92i/4CmOgYYDK/oDHVfY
 /BfEt9jlmRGJk5iT/VoOpHNG+FGK5wa0+DxKV5b7QUGKkR8cSsnUqcEuV7YemA5tLuSz
 Mx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309493; x=1702914293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rRpPZt2SIJA5F3cMHV1T35kXBcvXzQb5IQ83qE8OmA=;
 b=lOfGyLu+2v8w2BeBHvWVKYUp9KP7zuWoaxnoctRu/c8DlE0/TJIHGfOHj92qn7rb6U
 KKB/uu706vlYDlyFnz2Z4JIOQhNOh7GXhqaLDEWzqprjGb9i8REnAJmohl5unG2dfptv
 5Lrbc2xtibZo/V65Q3eJ0SdsrANWQpA1mk3qs3KoJd27eFr8QSW59BxjExFbaZVTYST2
 pCUQ6LHMEcfmyWDSOC1kj6ORahegpwlExz+f+/2gXTNZECapyun7csxBywH05dIiv0fF
 nVi0hn1vbSn8qJOqoxqIJyuuunePTRm4nDzoY+zAyoC9GPjcmZVIesluUs2YRt7/ohaO
 Ge3g==
X-Gm-Message-State: AOJu0YyPitBZ/QCwouGqfudAc0oH7peQ31LYPSsbTl0mHijXUPBkTh6s
 CUZOzh7zsA2C0rN2mWRXilzcoQ==
X-Google-Smtp-Source: AGHT+IFUQ7tenzLmGboSIZEJbzghc3TiEVAs0ezbRXq678xu7S9Thy7y/lL/0Q2no+4vGl12ga2xGA==
X-Received: by 2002:a05:6512:3d22:b0:50b:c4f1:9058 with SMTP id
 d34-20020a0565123d2200b0050bc4f19058mr2981841lfv.12.1702309492912; 
 Mon, 11 Dec 2023 07:44:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm8150: add USB-C ports to the OTG
 USB host
Date: Mon, 11 Dec 2023 18:44:44 +0300
Message-Id: <20231211154445.3666732-8-dmitry.baryshkov@linaro.org>
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

Expand first USB host controller device node with the OF ports required
to support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 77d32f4fe7da..168d49b01807 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3608,6 +3608,25 @@ usb_1_dwc3: usb@a600000 {
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

