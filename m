Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E5946C53
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 07:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D3010E0C8;
	Sun,  4 Aug 2024 05:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WsBwzyDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C74010E0D6
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:38 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so20416436e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750036; x=1723354836; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XXeR89FVIJZ1QYlIHMei/0fKATGUZGncxK0+auVBf0M=;
 b=WsBwzyDAy2AeYeBi5ifkyojRhMz6V9W5jkwBBQ7F/MV9uVKcgL5Av4JSynHy03YiNn
 d76Z+l8OYoGh8XKmwH7zg3W4SjcipkPjyEgf+ex7tiSUpdVRagnbP8xNZExYKdAP5I8G
 ACU7xAba7hY1HDP1caR6V22elHz76+9v+T4hiBG/9kqxBb1LnwvfsIZ3nQPpBpoGJgo5
 9fVRp5Vcmmjhapx74D/QNe3DHge8JdgASS15og9Ku/kzZXmTXztifWRKe31U+wtC03BI
 K0jiz0p5Ibxq4ztZTbVeMHsPh47jJLG2AHcZzTpIE9suqJYWppHpUjEMJg0+FBg7oGIN
 seTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750036; x=1723354836;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XXeR89FVIJZ1QYlIHMei/0fKATGUZGncxK0+auVBf0M=;
 b=g1KTAklO1CdEG9XCe8Jk5MuxDbVp68e/JPMm2JYSHz9dGpwKDtPEYAsx3/BZqs9Eff
 ZMr44/WQtLxUh+wNpClcvMWcn69RUzvESkZhU1NWZFbnOJiqfjVqDjFpJGeUg7IPSPA8
 /QbNTtkNlg3JEFXf5zU+S4Jlie5ZxPAykXn88pnZANLZPs0288zLf4GCX+bjM6gUl2JB
 fCJER/1ngaEKkvhDhworjLmiuNa1j7ZB/yjOP6XluSF42g0YUfKWJocwJNkvkPJsnR7m
 Kris1qp/NfoTFDgGh2uCoJYQfRVdqbTyFVqdINbl81nsZyyJKz2k6TefrQIBIE0euWfo
 cleg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWiUqo+vfsNr50ihOFzGUxy+RSfvc2HUrwhiORlVzqSc+7l3zs1KwqG5Ev4ROwXcSj3MZHrNlOFVeYenTTq1YlW3gIA5Zhwybo3Brgp5x+
X-Gm-Message-State: AOJu0Yww+H8diuwdLxXMjbAvsbp9opHh5V1QW+ZdwLHMyRX37/4h0SQp
 E4fsK00vzSB54msYuomja7j+vVQZJWPhO9zz4TkNkrn+amz2/mWBUQk4GxMChMg=
X-Google-Smtp-Source: AGHT+IEzUJcr2/eYzNRxco80M9GSQYJGQHfmdybo4///4ibYBJxjdyGj5/rEDh0x2sR8bPV+/8p/Qw==
X-Received: by 2002:a05:6512:ba3:b0:52c:df8e:a367 with SMTP id
 2adb3069b0e04-530bb3bbfd1mr6797281e87.53.1722750036270; 
 Sat, 03 Aug 2024 22:40:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:15 +0300
Subject: [PATCH 11/11] arm64: defconfig: build CONFIG_REGULATOR_QCOM_REFGEN
 as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-11-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7W77DHzgi+hLXIXlbdxA6fq9mb4+K6aSLuzwwza3sX8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ/eMRA4Offoaww9Ngbll18r3n+dpMYOd4zk
 1LX05cPA76JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPwAKCRCLPIo+Aiko
 1fvWB/0R2sNi/9ToQYvmH1y02gU7itzPPtSuSYTjQe3wK3HxfagVOQ+PRhSPWQVs0A7TkiFTAHF
 2zh+KOHutngVNaCrW4/J1z9Ht75Z9yBk+oNzuoS7RHXtc3eXoyfBT3NXaRX5+sCBTlSGF5VX2ee
 njIFhdPDBBM4U2DdRC/bt8XEiT3OvUf89NWxoRJG87uH2jrv+mkWUiTMejKzpM9GynjmEJMI/+j
 XqromIoKcDYND0GkXZcw/4iuOoU2bOmcX7CJq5vbAX8NN2LmJCIJ2PGlyYQKzLBy1U01AXPK2KV
 6+EDFfDZfRvpa9dICunQw3XJDPHE1krN5s3aTxCHpt7law+D
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

Enable CONFIG_REGULATOR_QCOM_REFGEN and build it as a module. It is an
internal supply used by the DSI on SM8350-based platforms (e.g. on the
SM8350 HDK device).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..20e07ceaf239 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -785,6 +785,7 @@ CONFIG_REGULATOR_PCA9450=y
 CONFIG_REGULATOR_PF8X00=y
 CONFIG_REGULATOR_PFUZE100=y
 CONFIG_REGULATOR_PWM=y
+CONFIG_REGULATOR_QCOM_REFGEN=m
 CONFIG_REGULATOR_QCOM_RPMH=y
 CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y

-- 
2.39.2

