Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A96B53217
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5A910EAF8;
	Thu, 11 Sep 2025 12:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Iat3U2Ym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D142010EAF8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:29:15 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3e4aeaa57b9so733717f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593754; x=1758198554; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M7jUWByvFECPwazBbFEH1CWu4/FyyuDx2jex9LWCqcg=;
 b=Iat3U2Ym6Vz804XDn/KWaPKLiBgCsCU4dVXjV4BzqIRxJ2o0IPGWCxyNOLbyGKjIBU
 idBU6AUGMBoyIxdsbbUYQRPxZChExBkUG1m9nA+KQjgC0vqQAZh54rk/cfqBSUfJIoDI
 v/Gu2vP92ox3hScD/C7YQcD8MeQuVrVh3OhiPtqTsseK6cjcTnB1xPvPWor0wbxXk3Lv
 UM14uwsDndcKcnMWy5VSB/j1FQfY1La44B3yFd+NLUi2HF11uko6FhtCbt5Ikx/GzcD1
 tLVNJlq9s95xrI75WIxcMr2FXkOxsf7kh8ylzdIVDom+wSJeCLNwCOhBhhbIosvezPZX
 kbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593754; x=1758198554;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M7jUWByvFECPwazBbFEH1CWu4/FyyuDx2jex9LWCqcg=;
 b=ZPBPaaXiJw2aUZ6WCz1SgmP6RS0Eyot4aPWxG/Xm3CkBo3RmwJAX0ILdmmMEwJ9QSU
 Y9rvNjlCRo388pjJqr9RD8a7TkFmVksDZoswW5WU52HkenEW7+Dy/QG6D4ahbIDK707R
 zzk2F4t8YgXt5Ile3ezxLdhAeR555B14JbPXLTXjFKTK6ed7pKsxZxPUaApl3d7dXhh4
 QujhxUDp6g77JxixcXebe8QDypTqJuCQ16hNLcfMdGa+uITBkzZTdHfAJrMbSewLBO7I
 i1dH2m87H6Dvyx2zgqvYM6qC9HwaqtVMyUWS6KRhiBIak65r7LlsiYAq/dO6xIv4kl43
 YhuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG1wvXjDGIdPuLH0bksOxUcBZvasVxCehXzYbUcRpA7im7qXeRpPDujvDeLnKdz86stPul33GwMXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2qohzb4PYQBp4+1EFXOacfIPpX+3goSNAIVujS2xmJedlnpBx
 /lSNXHYz5fUbtOJGRqIZvUuN0MMdtTtK6FUU5x3OgZV8Zc/fTT/hzw3IgXbNSDOHY6s=
X-Gm-Gg: ASbGncs08xf6k9ngriKWULetUI1oygniySmk+PHrPdU0NPismWtSJreME+P7/e2holY
 w7WttRSz3GKtMx56MFSwOt5n+ZG4IFKZqiY5gKI7nD+H/oefj5ywmMrYwNFYS+3RaU8FXWFRuC0
 lP00WLI75KYCnPipn6jq/NEKt1ookrb0nPP/uAhgMeSS++ZdmvGqfI9y01D/0CSUdtiggUKf6Jw
 hLPm6+DVW9UHUWxXRpo6C4jGAdvLD2nZtry8zn6LdWT31C14fuDNSE6uB7JvROHPe4yjDX3ErK7
 LXxPwuxTuEsyefPApOR7QCZU4x0S3SjrEiB1H0HEKTAvblWmbpaV1QrzzxqwaKMOI6DQOzyo+jG
 a1VBcU1roZn2GQrEjnJT/++FWJO0MPwvZbQ==
X-Google-Smtp-Source: AGHT+IFivbwBDhax9/vD1/Z2k59af0UA+udS9AYGBjFC3i8fowSQAZAx/4n6gr0/W/KZf7ttitcR8A==
X-Received: by 2002:a05:6000:25c5:b0:3e7:5edd:ce07 with SMTP id
 ffacd0b85a97d-3e75eddd171mr2860539f8f.40.1757593754308; 
 Thu, 11 Sep 2025 05:29:14 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:29:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Date: Thu, 11 Sep 2025 15:28:47 +0300
Message-Id: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/AwmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0MD3fScytzSIt2UzOKCnMRKXUOjFEOLRKOkFHMTQyWgpoKi1LTMCrC
 B0bG1tQBqC2ypYAAAAA==
X-Change-ID: 20250910-glymur-display-12d18a2bd741
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=UQ5TvznCATcmW7TKNpwWYXlNr4pPB+TVdlMyODvkOAE=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCHPeqOhMBzz4He/Z4IkOQmFd0kfNeUmdPAN
 g5tuRd0NFKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAhwAKCRAbX0TJAJUV
 Vgd4EACf0BbVhV+xN5B/TsmSSgYOg73ZeFP+I+GoXeHKWl32iz7eGNPrvOTY1m10FUSnDMVZ/Dg
 WFyvv9ffTz9Gu1AkOLjT+Hgx1sIgVv0AYil1bwHNNaUbNqEUJOk4vwNUXZAe6g7XCsGLjDlMJ/l
 derLO34kRwFpSNoucU+yJuQJ32zt5knYJWwQ0Pz+2w6o2odUrf5Fpy80XtjV4YaCOGwhm0Npu/P
 AaqZluigHo5oCRZitxRBlmtPj/wU9c8i3i89RnCqelO9ir00YEsfItkshbNVMP+7OLlrHSsViwE
 KmK5mvW1Jxa1hhAifrha7x1oLxHUqlLGE4sA0ONLBvikYvgvQkFVErT/ZotpcpNzmdVo9UwN1CC
 1AMMokEvHrzqSbgsg7vhdbgwE2fFil3U9/Y4jtlq+QEkizyvZiI6hpg8gLGwM2Tqm10mtWu4xG6
 L3++ryTG9eWYrmb9yzgHT9UQnPYazDBH0VDtLXLkuKac2js3Q8Bk/2RFhLyhyuOney8Poqp0Tdp
 Ea8tCYp6zfKavtlqHnMiBy5RX9zdr0V7dOV8WfyQLfAWRN8hSZd7BHO2fdTQWp7t3BwQEVIuflg
 RoMBpbfFp6ujyS/Bas5yfEUt1ku6Q71YqR2SejHpCEXqKFIUMyfA1KAf+q1ZzEBOCD4rdAZabd7
 wZh2R2gzu7SdHOA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

The Glymur MDSS is based on the one found in SM8750, with 2 minor number
version bump. Differences are mostly in the DPU IP blocks numbers and
their base offsets.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (6):
      dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      dt-bindings: display: msm: Document the Glymur Display Processing Unit
      dt-bindings: display: msm: Document the Glymur DiplayPort controller
      drm/msm/mdss: Add Glymur device configuration
      drm/msm/dpu: Add support for Glymur
      drm/msm/dp: Add support for Glymur

 .../bindings/display/msm/dp-controller.yaml        |   3 +
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 260 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 10 files changed, 824 insertions(+)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250910-glymur-display-12d18a2bd741

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

