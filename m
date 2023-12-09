Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087B80B788
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9755310E31A;
	Sat,  9 Dec 2023 23:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B9810E2FA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bf4f97752so4230605e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164095; x=1702768895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iqjo5dHisDRwrhKSHqJTPFQ5wOEs+diDPVCxtZ4wynw=;
 b=gcJVMkuSbXIRebUE9/vFSG1nxs+svuHFq2a2LIlyhz0fPhH+Wrj5tBlS9kxiCnfhge
 /9UPKN/F+M8KEiQJl6NW/LKWi2rs+H+WVZ39W3mlY1hH9YjR8uvTkPNyoBirQOAQnVU6
 m0ioW5juP5ArVTHQ/JQBE8P56MaXF/eCY842DbmQAu6lZPGG6bWJfnVAsRWnsUjMpoyA
 /9hEouhIMCyReWPmtDUbUl8JcUyABVTlrOya7gZDpgRtJd50iqbtRlrV8Eq+SsiBPcco
 GKdWE0WsKalBWh3ZhxA5V0CgycnZzl2w9bMM9Fz0E2MdzrR3ta+MOMFFprDIgBh1BLVs
 6big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164095; x=1702768895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iqjo5dHisDRwrhKSHqJTPFQ5wOEs+diDPVCxtZ4wynw=;
 b=wOJPLCJ0rjT5X3yWfhOIdbx191JmDrXd2in1oOrt/kg51mP0GKetmdhDKC8CtphE+J
 rYx/C9GRyF870pjmJMLgeZwG/ky5c5MD8qI2jDn5zL7fI9VrWfrW1IpRSVAgAa+t0IXu
 fRfS92md2WxvFek8BL/XoPvFVzVe3lZdVmEwNs9Q7xYoQMVotjWn5VelosaiWD2L1MfQ
 sVLvNdHfqIh9VuLQxECzVoaMIIbCIomoNhHHbtXdGxagkPjxHoJKO4ThOqQpoF6qaPQc
 WVKFnLAG9Abc35Fk2GO8FjKWrREkxIgPHIDnpS+qipBMfAXVOsnradIggfurxzlUkrLA
 AnUw==
X-Gm-Message-State: AOJu0Yxse/3EjmEpZa0fBGw0dukkoIpVgA8zbxRXHSJcbbKqAdJw+h19
 heV/koZRcZd8NaCWIcMmC3hlzA==
X-Google-Smtp-Source: AGHT+IGjlkOAdxRdEwuOXcdWZKXok3jGpK1DX0l0Bpjd6yJvBkJ2iYlPDjshubK+uz0Rkd6Z2bFwFA==
X-Received: by 2002:a2e:94c6:0:b0:2c9:f6af:300a with SMTP id
 r6-20020a2e94c6000000b002c9f6af300amr895710ljh.39.1702164095380; 
 Sat, 09 Dec 2023 15:21:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/9] arm64: dts: qcom: sm8150: use SoC-specific compat for
 RPMh stats
Date: Sun, 10 Dec 2023 02:21:25 +0300
Message-Id: <20231209232132.3580045-3-dmitry.baryshkov@linaro.org>
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

The SM8150 platform doesn't support DDR sleep stats, so it needs
SoC-specific compat string for the RPMh stats data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 3cba87e00123..fb41f91cefc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3950,7 +3950,7 @@ aoss_qmp: power-management@c300000 {
 		};
 
 		sram@c3f0000 {
-			compatible = "qcom,rpmh-stats";
+			compatible = "qcom,sm8150-rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
 		};
 
-- 
2.39.2

