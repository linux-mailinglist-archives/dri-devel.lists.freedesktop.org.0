Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49BF88CDB9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B628710F255;
	Tue, 26 Mar 2024 20:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FkmBb7ci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77FA10F250
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:02:59 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-515a97846b5so3232214e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711483378; x=1712088178; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j2lHV/OHCqfe7Nek5g8QCJ5Ns0UmvS2CSdkqiB49C5E=;
 b=FkmBb7ciKCVTQNa9YKKRO5lXPYZpXoLWN0fEQ+anTkwa0Amfm/0Gx8skgSfPu31Zxd
 Q8sISHFcL42Rgep5pBfVusu4c/OKUfbpFajkul2sg1BjPCwlnIYI0FDRceRRr2uuS2hS
 22Mm60WyU+deoGEAJpc/ujm5qESbs5IBgBhgNibIvDmGJVxmymXMGNU7FEsoolGJ3q67
 GTCGsV5kUe+uyu8zCTW0kWbS109P4PJbdRnYmzSaO2P0tn6WBIvvaM+U4w86xyJ6+4fr
 zMcabzsXGSjvOo3Sr9LPs5pw8+qkiXfyHv1IySbPh0evzmgYs8Q4UPPz6Pv9uI+P/pfG
 3Kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711483378; x=1712088178;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j2lHV/OHCqfe7Nek5g8QCJ5Ns0UmvS2CSdkqiB49C5E=;
 b=jfOKLaWewXsG0bMHPBnP1mEbC6U00Jpw0003jgqrgYIMvYQeH1rTgjLDP3XcmnKUyI
 +IQ0kfWPQm7AtYSLDG58T585C6pMJ0YIX3DSZGG3p1e4OGvqS8vg1gqy41bc84bG7T2C
 woDlyoMItUntJoEXqwjrH3lmvlKTIjEbNIYGfIVNbg5oUTb7hhZ6pg3V2b1X8s0Nq4Fr
 Ih5w+mfJcHs06dgeGEufKSZjjLhqY2BuD5q2p58Xnd+KL5jpavZOv0VXXsIXpPTepDc3
 Diobc26ZSLjzcNFeE7yrWLpTcLZsb77nySgemQDfmUl7bB2tFMqHs1B1yYeShnS64E+5
 rrFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhsthWBAnnt9j7nCAMw4Ya9oHcd3fukMJ6qPv7f83gGgbedQi58LAzG4gIfDK2p8Dw1uWL+W/4FHEjOXNASYPqM+CBdwSPkGZInoIfL4yI
X-Gm-Message-State: AOJu0YwOF2BiN6k9PQlYdptI5U4+ehgjWb/DZUQOTQiFthC1WU2UKLlj
 8cpTXVV/N987HkHD2POMFX/GAmcbsFPwxdMCPPJhgT1Eikl0lxtUARO4PfJqPl9XhL1zUhSbGwY
 p
X-Google-Smtp-Source: AGHT+IGZo3966n6r9TccyzZ0QA/JixvswpLjAc92CRn92e6XWXB6dSZNAnLZOUf4kh4wEQURJripFg==
X-Received: by 2002:a19:5e58:0:b0:513:a724:3b9f with SMTP id
 z24-20020a195e58000000b00513a7243b9fmr7416124lfi.7.1711483377475; 
 Tue, 26 Mar 2024 13:02:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a21-20020ac25e75000000b00515a7984acbsm1279408lfr.94.2024.03.26.13.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:02:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] arm64: dts: fix several display-related schema
 warnings
Date: Tue, 26 Mar 2024 22:02:53 +0200
Message-Id: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO0pA2YC/x2MywqAIBAAfyX23ILPwH4lOliuuYceKEQg/XvSc
 RhmKhTKTAXGrkKmmwufRwPZd7Amf2yEHBqDEsoIrQaMASM/WNZEu8fFyeiMd1ZqC625MjX7/6b
 5fT95QY4XXwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RWQXQAKN7KVRdFiOpjgCoEEoGNI1cTcKyz/5WyufIYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmAynw3ac+cfKVGKWXENlS14UmEQ6NE7Jl+Axwr
 5bJiyMEMS+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgMp8AAKCRCLPIo+Aiko
 1ZKpB/wLHJQ+d79aFqPld+Jyd1moiwje+nvFXrNZvI0OwBY4KfhCPBGJyMCLmbv2MWbfghtwoZC
 vgLZAzOOzxoZrCcSZCIVxU5Pvh2TeZuj0Ra33TkWVq8pciT54nuX3C+RMGoLIrJ7pULKtgY0EKg
 NtloV5GhibGmeWDpNMBpfEGHj7EJFUOS+Lv+B0Po5rWooujP8wmquvSB3vyFU1BiSyOxUjjV+9+
 8IRq5XoW5JX3pmi/LuG4F/n/CdkjjcPvp+ouXYZZpCham6Cf/AsaLHNLz0/Qr2uAesUHNc9pHo2
 xpq75TuFHXy0uc56XHQm3FB4id6o2edrSozRii80L06RcHIx
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

Fix several warnings produced by the display nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: sm8150-mdss: add DP node
      arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes

 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                       | 13 +++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240326-fd-fix-schema-b91f94a95135

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

