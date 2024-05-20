Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78AF8C9CE5
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F1B10E0BB;
	Mon, 20 May 2024 12:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j0gNmAme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F010E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:12:48 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5231efd80f2so4546665e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716207166; x=1716811966; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bH/LloORtAdJqakmZhy23BG1cTvef7l0ekgFCknTjPw=;
 b=j0gNmAmeN6/lemM1oGLHKmB8zgP0uxjqM2kiHs8MPdTBr3cGmmr6A6+fc4/GJR/Inv
 zoampZAFCAyeul4ld/BOtD/WbmrxAFjhat2i+h0C22Xrc5MNtfXtDZakHDb8YoJyjwKC
 9GCMo6bbN4yX5KHzVwb1SPo+eFCvGvtap/v/NUtxg7rwgxbMWXlvY0VJKNrF+81rvFOE
 l68XnfIOtR2Me8JPqL/qe4aPjDC4viDWfya/lrvfaGmkuSvHxf2wdA9IhMxHjqXFzzqF
 DBQ1fpHEUEhgsw7cwt70QGMZz5o8v8xVm11IXMP/4noM7T/A6yIQTh3uFFDVBNhVAlm8
 YTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716207166; x=1716811966;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bH/LloORtAdJqakmZhy23BG1cTvef7l0ekgFCknTjPw=;
 b=rE/AbqNelCtewVjWt+V5Nk/vjWGb+Iar2i2qmzp8HJio5ooWxIJvPvHAjmDOLLaoka
 8wLQRRiVk+dmc6luOylEUzVOzreHpjlbPE0EmF/YDgJNDczsJd4MU3/ZpTpO3qhfv1Jj
 zKU7YI2ZfQ6cYXUF1nyTWfAGSBwrvktKJpW7S4zwVGbaa6mxrsM7y+gmg++/DMFKb0I4
 DvC8TtqxNtDVbExQ9LV1Hm8Dnq8f7kn6jf8T/muqgHwpsHQOOCFgT1ZuRWDe6vf1yr3b
 Yg9bZNdjjr8jFcz3LxzksHxM/d4PeS5pc4p+8iFW9pSm/nTLeICC5/5B2XA937k9su2e
 t+oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgXbgnHmhSnm9jA2UYAeIYSwyulQ+NpB4zVzPccWhcX+FLl0tiv0AZTTGhhL/ZufemuDkNPSvs+xShsB3mpxLlT2+kns2tP4YbuqfUMI+M
X-Gm-Message-State: AOJu0YzqhNdsg5IDl2Nz6Ia+w0bvjlDUPkDAn85HVKrdQ3vQFGLgjYgM
 5jJ+aiEO6k+GtjNei2MNfcT2Xw7TgsUz1TW3tIkms6leJxg2Pll5GGg9kjNCLK0=
X-Google-Smtp-Source: AGHT+IFLqYhkFTSfEMengeFM9Uixm1e8E4F2WchZdLT/7cV4/a/D9WE0HWBrmfZuNn4yGUJDqaS60w==
X-Received: by 2002:a05:6512:3ca4:b0:51d:67a0:2433 with SMTP id
 2adb3069b0e04-52210074979mr23298869e87.46.1716207166288; 
 Mon, 20 May 2024 05:12:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:12:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/7] drm/msm/dpu: handle non-default TE source pins
Date: Mon, 20 May 2024 15:12:42 +0300
Message-Id: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADo+S2YC/x2MQQqAIBAAvxJ7bkHNIvpKdDDdakFMtCKI/p50H
 IaZBzIlpgxD9UCiizPvoYCsK7CbCSshu8KghNKilRpdPLEI5wkPwsxrMB571XWNFUrK2UFJY6K
 F7387Tu/7Ab5JQl9mAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DX93PVbvVm550XJ59hPJYzMq0R5QP/h0qcUJAnqZViU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5q3nc2rPoM8cbUfKw6Z8B5c9+LDB33zPGWRzaH3z+7hS
 Hm2PaS4k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATiXnL/j9yqUNBoLjfdW3N
 PXxeK15W8Va0J/3cIbd2dfrSRMHSJq+vwpu9Q5ZW9vZcu3TP9uyJH4vK8+fvirBwN1cMYvC7NYl
 900H1thDroFkmuRPWrP/lMOdMSLS2yHSPLrZTlaed9zJd5pL2toidc/3VaduWHYURah9NV6Zt+e
 V/5vGa75OjjLySrN3qOkoLa+/e/C2Vrvkurc7mzmKzNoUL+4+Kb0s83V2oeyCsq8sk6MWGJaZZP
 Mc+7Lcuj3kVypHT4KHLlf5C6AGzwGJdzTsiBWVC2x57njoR92NDi8210pBrgvkrmZUXljzgXahl
 yRsk0DxrhrvnO9PwZ+zuhxhSopQrVHr6Xfw6NymX3/wFAA==
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

Command-mode DSI panels need to signal the display controlller when
vsync happens, so that the device can start sending the next frame. Some
devices (Google Pixel 3) use a non-default pin, so additional
configuration is required. Add a way to specify this information in DT
and handle it in the DSI and DPU drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      dt-bindings: display/msm/dsi: allow specifying TE source
      drm/msm/dpu: convert vsync source defines to the enum
      drm/msm/dsi: drop unused GPIOs handling
      drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
      drm/msm/dpu: rework vsync_source handling
      drm/msm/dsi: parse vsync source from device tree
      drm/msm/dpu: support setting the TE source

 .../bindings/display/msm/dsi-controller-main.yaml  | 16 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
 drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
 12 files changed, 106 insertions(+), 62 deletions(-)
---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240514-dpu-handle-te-signal-82663c0211bd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

