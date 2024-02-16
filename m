Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E777E857AEE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5810EB08;
	Fri, 16 Feb 2024 11:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rWYRQMEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A7110EB04
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 11:04:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51299d29e43so141707e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081442; x=1708686242; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M4VUVivuxhBItwCnLx0xGdHQH3tLZmkPnVy151EVhso=;
 b=rWYRQMEdHKZFZpFE6OGpYr9DXWK3dNdelT44ZprkQY3qil6H2BMRtFrql+owYspK1c
 5m4bZahKFsuKNJiiy3KluRdFtPm6dcCB7krctdifOkIwRJ/ncfb8WqRF++m7Fwh3+8dV
 rc8f8uLoLxnUppVV0fog/E/7ZFcKYVGwjwj2K2kwQa4WWaiRBuvWa7BKrNvjOd20XCo5
 3YWPrwJz1ot25VlQ+Tfy30n1m+1togH9RTHtLZIQbStD4c48DbsjNBMQVd++IQwlWPNA
 t2uq1hynSC0yEmUUWUz5O2eSCdMbU5OkzbzfXFGahR8o14LquJ7MdBMuwXE/H8m9kRC5
 Ul0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081442; x=1708686242;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4VUVivuxhBItwCnLx0xGdHQH3tLZmkPnVy151EVhso=;
 b=pil7LfDAb6/OpkNsvvpAzi69WQ78QToI1xndC0xx4qEQrQn310/jjeJU74Vi4D8YRw
 eNkx//I13R18xGEGjXoVqSIuwvYTP7Kdc38qC1TmRQJA3pYA/FCYc9sjqEed/AmkThDX
 d4tHYGXGA5e+8WoVelMfBKuNP5y5y9UM8fpY/Dn3CV1Sn7oVDbxq8cnsVxOpNea66Ng6
 4igloUKeLIQdsturDy2+4haF69ICUvsK07af5kUkLnFnZX9Or1h/vgCRnJ3ShsKhBnxM
 kTZ9PqmtyijsTYAKexOrYHgzeJJnNW1CqfNolF35uI/iSCmSEtuERU/VvSEB9pS2GMZN
 sHeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCrg+SqILzMK14Ay1WPJXZTauKA/E9kcetXltiPW2k0H0d0giV/+l8VuV5cMo0qKEWwL22QJ8NWqmxui42OxYAuw5cy969q410EUMwOWVI
X-Gm-Message-State: AOJu0YzTApQUKJ6LPpYGKQe6KfW2fWShx3FNcFpBRdptXPyv4OYARcBB
 7LtYRrQhydXZuxK15MUFyILWfarBpsk5gO3wRUiRVuXp+6vqL4zjHNpUyKEMAgc=
X-Google-Smtp-Source: AGHT+IHxB3djXOGZfctfeVjRtqPgl9AKJgisKXW/R9yWRkrHNQlUHO3cV2qVMp5FEgY5CP4mPAbs/A==
X-Received: by 2002:a19:5e17:0:b0:511:ac7d:97ea with SMTP id
 s23-20020a195e17000000b00511ac7d97eamr3150124lfb.64.1708081442471; 
 Fri, 16 Feb 2024 03:04:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm1993174wmq.37.2024.02.16.03.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:04:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Feb 2024 12:03:54 +0100
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm8650-qrd: enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-topic-sm8650-gpu-v3-7-eb1f4b86d8d3@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
In-Reply-To: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=eK619A8Ja/rJOcWssIzBbWM6D0kuHt0880KvRuYuMKM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlz0EXgNVUxVocIorRrq0+P4C1WxED54Xsx9AbKddq
 wgYEbneJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc9BFwAKCRB33NvayMhJ0YOAD/
 9ZA0e00w5hdxUVtWcA6R6L8Sgxzl3TGs4M3N2DO257wMbYrseQYYIgISUaSYCbllijwpWn1MBoP8Qd
 kzme7tsEGbUVLG9O6BJPJbjX09Zv7bXFZVw9RycdKfud7WcBFwmzeqpRbC7QwjLciEp8zDR7znYBqV
 haPQJktNh0x/DL7qpS5EQ3VaKKLL1pQiTBjBNCKPsGaDS+Cqkam4OmvgE7b/l3cLSdMZrIrLxwMejY
 uhvkCzU0vPLhb8Jq9mCQ1qtn08KIiyMEcwTKtgmByA1HeGgDfqiaM2g1otALWizNT7rgK4UawovqPd
 FDd4LqZFqfELA5MCRnccpH6cBKOpygQPnTvNLUDHVnQOmHFYw+Z2mtWZZ1r+OoS8i5Np0BsS8/lVIh
 eG2fNRzvP2bMWyMNFmvFBaJ7iFLOF1+Hg5rf0p1cmhL0i44NaMJUTU55ETQG07vaI576kx8EySb38r
 FSYOk1qFs39QNdP0Im4SfbF0JmSDnmfiu8/yTBNkkAjm8hPNqZIk30Ff8E79573ZtHkrk3QT1X02bT
 S8ktDMv0EQkAkRe5UTAoxMeDd9LRLPU/H1jCPotM9oPddQn5Tu+Eta6m3nz2eAHYhymFLrbRehF+oy
 /bZ3CeZECCad5xmda0Mz37zofKY/CPQaeae/Pv0QG6vSxXdAsaFD4yNhkLaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add path of the GPU firmware for the SM8650-QRD board

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b07cac2e5bc8..dc91f0bf4b8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -766,6 +766,14 @@ &ipa {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8650/gen70900_zap.mbn";
+	};
+};
+
 &lpass_tlmm {
 	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio21";

-- 
2.34.1

