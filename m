Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A89403E5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 03:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0715510E1FE;
	Tue, 30 Jul 2024 01:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a4Z4K+ZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532310E1E1;
 Tue, 30 Jul 2024 01:38:57 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6b7b23793c1so21718696d6.0; 
 Mon, 29 Jul 2024 18:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722303537; x=1722908337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwijiQXrp5DlEM6JJIJ/GaHG36m5U+A+7dOKNwuF2TM=;
 b=a4Z4K+ZX8R0tFvvemXxpydalfddxW9eP1apfCy11vaS7gSqStLL4ceVpf3dTkBsXD5
 OvXfGLuQzH2A2X/3QEqUER9BKW4h09zOYOVQXh5oY0dpZf3g6c6XnsMOWmyUlRvcxEQz
 Qe8paZghDVwgUry7Y3tBpUCKefRTH77IF2bRJLvx7MVcRgzCnEkxorCOiRrLkRVDFdHg
 5rGfQFtq5Gy+kuMyboD7WVtUjcnW+7sMSmBGsCIoP+BhBU+leElwWKxhIk/SQxHGdsNa
 9PHbmlasqYUYJkBPcV0Mxr1fFe7OyuSlV+quHX7+N4j15xtJxNEiMybaNd4MlpfeVtCt
 HgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722303537; x=1722908337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwijiQXrp5DlEM6JJIJ/GaHG36m5U+A+7dOKNwuF2TM=;
 b=KOd2fZDtwxKYNgDEEU2XOwrEhjkngm9Oek2yD410659AokaE/uX95Csx5qFMXO7nLS
 Z1N0lChyYwq4nrm8jr9ip+CaKAJii5lCfemhtP034Y0q7lRFNmmvBMRNBReHmduVFloC
 ihtstcUwAHCKY8UGOZx4yee8lij1TZadW91b2ZoSC+sE7GFZlTn+94nSNM+YrsAJlLzr
 OmNoIxJ0UnFaZx1Xv/52N1Ppm/mwFACDHKk3EgV3Ge+P+bxShUp55iPGPWmaKQIUo+em
 jOW2D77cpUPYh1StIZfSZAZh5gSrIreCoPkaj8zueatF+tX20McTlAeoDmuWuxUa1oXu
 6bdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlI7kevs4Vx6OzVrjn1R107q5Urbet5g/UfuqVuoyuUhLIySLedx5XoYk12qUYc2ajfT1BJ3UoSCSU2M+4pEtpHTGhsSJdavUhe2JzVW532qO0c3EN1Bat4j93GwvAwywJn58jrLX/30XiMHuLmZdo
X-Gm-Message-State: AOJu0YwTj7FHhAf7h+V7vk8773ujDJeh1k1HBJ6oLQlXL6C2WQDaIpul
 YGsBRp/cgqP40Xpzwckn3DyrszVi/RMor1o0wuW5WMDjSOC8Q8rU
X-Google-Smtp-Source: AGHT+IFV16qAcfMqLWnSDqEkg2eRkXAFyIb+aIGVTG94FYyBQh9KiIsTQXx20fyc3j8qOo7IH/YlCg==
X-Received: by 2002:a05:6214:402:b0:6b5:80e0:1301 with SMTP id
 6a1803df08f44-6bb55aeca19mr135400336d6.55.1722303536758; 
 Mon, 29 Jul 2024 18:38:56 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa950a3sm58221016d6.90.2024.07.29.18.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 18:38:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 4/4] arm64: dts: qcom: sdm670-google-common: enable gpu
Date: Mon, 29 Jul 2024 21:38:49 -0400
Message-ID: <20240730013844.41951-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
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

Enable the A615 GPU and GMU for the Pixel 3a. It has zap firmware, so
add that in as well.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 176b0119fe6d..7acbcb5b69e1 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -403,10 +403,23 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gmu {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm670/sargo/a615_zap.mbn";
+	};
+};
+
 &i2c9 {
 	clock-frequency = <100000>;
 	status = "okay";
-- 
2.45.2

