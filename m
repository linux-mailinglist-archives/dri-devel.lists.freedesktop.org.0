Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A25BD961A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AF410E5E7;
	Tue, 14 Oct 2025 12:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iGF8lKbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538A10E5E7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:39:46 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso53370475e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445584; x=1761050384; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WxfXNbeCWD17r/8Zg4XQzenoQeshlu+uRWMEBxO3DrU=;
 b=iGF8lKbKU1OinD3XDmyIBgcUPbenCW8H5I/n1FFP08c4LiEySr7ZEjog0xA/Y5ip7E
 b8jdbc7abwsxn1DKNJxLLZiv4Rb24oqObgdRDi7pWPQ3sc9oJphSOXdYbzkcxBxiRu1D
 lffgWrJO4g20+Kjs6z5yll5ZrQCXiXyNAFe6S9XprTIfFGJ76YmtBAEy19I2Nvsg8FzC
 Z9oeiHsA9zrzSZ9lQMQjZll8XL9UREu7UpBe1YwC/kTXNdE+1lEJ5dKeUslHVQdUbkuj
 Cu9A9tye65BfLm/znjNEt1iu/LrHOpufBzMuZOtT2M0zpI3M8/ZShe5u8EbGHEFDCX28
 36WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445584; x=1761050384;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WxfXNbeCWD17r/8Zg4XQzenoQeshlu+uRWMEBxO3DrU=;
 b=b/ol+mkyrLAUeDr79TpvKfHlVag8HD98+braKHI8+lL11gdR4jn5iCxoq5nEObXuhf
 fIHb0/R3koOjIijHIjAms4CwboJDCwWDPcDja0lw10vlpPWz79FcZ259MogujKpMi9o5
 lOvdqeww2yA+BJznkh0FiPxPjaSNQ1yD0SoM1KJHKOG87gauEYfYoFS4wL56A6jZk39B
 eFYVlIeTawEYuu4EU7wWjimj0GcRC72VK2mIU3grGtJkr4MjRveY/Jalc8+y5wvKImZs
 iLseH+XCPxuWHBRi1ffZJ+NFUkrzukItgBceIKc8nERJSvVzwaTUzUNgemQu305TRfHW
 WmAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH480pee4GoWjkBd1bNBAM8QGaaxIGl1dYEnctGTTExw1BhglEzFxI5kE0MJPYIgLmRQC6KE7psxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXLxAydm7G7nhXclKJg23vRce12SCv2lLpv9v19ULdjP3aAefA
 7Py1HzprdX4nAgvIL1aZoh7wfVfLoHHkMwX4dzHgfNwrF0xWcqWseL0GhY0El7gu6RA=
X-Gm-Gg: ASbGnctev1es4Xy47fSjnQWQ2B9ozvIIbH2AS43lUgFdbN2b7+VP7d2BEUxsva0mkmJ
 bIoVfx+xMQQqbKROInhKofxxa0XmCYG4xkDLgHqc+EtI4/Ly8+RdG9iApmUcYE2GyPEARRuNyTo
 ewPZB4EAOG6PwRuVQ99WTnLxquyzcasSC+zTOOJI8mpFEr/2EpdQ54DYXBW9/c3MXTXUzfaI0MZ
 hu0mFJhyNuSt4T/HWP9iyCxwRn2MOHU4Zm7Ld55XV1O5PmBFEQwfZR1ufBsT+PcAZ3u2DIdA+T9
 dmBk1z5z+m22xBiRz69lkUMov/6YkWEybuzIlOxSG1YKtpo9x0jZRBQ1IvGyjFu7LDcMojW7+5l
 Lnggz4fSakeWH+jNPUefOjs9nuZKA1FedqxsfLITpMy5TGHlS7TeGQw==
X-Google-Smtp-Source: AGHT+IGSDpXQTDlp1VxndrxWzCAqXHmiwD+D7q+jxH6QwOgs6VZlAYCg4fJPWrsSgEjEu6T2Fe/K/Q==
X-Received: by 2002:a05:600c:138f:b0:46e:19f8:88d8 with SMTP id
 5b1f17b1804b1-46fa9b17d03mr185755555e9.34.1760445584277; 
 Tue, 14 Oct 2025 05:39:44 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:39:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
Date: Tue, 14 Oct 2025 15:38:25 +0300
Message-Id: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEFE7mgC/13MQQrCMBCF4auUWRvJTCtaV72HdBFNTAdqUyYaL
 CV3NxbcuPwfvG+F6IRdhHO1grjEkcNUgnYV3AYzeafYlgbSdNAtauXH5fESZTnOo1kUksWToas
 9NgjlNIu783sDL33pgeMzyLL5Cb/rj8J/KqHSytYtmrqpqSXXjTwZCfsgHvqc8wdPz85qrQAAA
 A==
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=E6rbjBM66wL3IoHHlXeJRdVPT7g2CsyRrCjh7DjI1gM=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kR1NKRRqIO4/VJxX1w0FK4IziT2Nr+YGPX+H
 01KO6LzZieJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EdQAKCRAbX0TJAJUV
 Vh5HD/9nE6fTwwGQFiwiPBHCieNeh9X8dzP0HxIbCfVq1Brz5IOWonJI/Ybt9tAq4ILBNf0citc
 YrhihjdzqHfyJjV6+LkgzPtmh3D3SUEWn0HGmMK9vHLw2QrA+pYLAOb4N/otKxbPwYU0Utuxb4E
 +mqd9tsr+5AvKyM5uDEw6vsOVJsg4VdzZMHSMFwQ0pEMUtljRG9ANtdUuiPGZ5tcrwgTmNRDZsz
 fzR3EHogY3BDWkjjoa2wnBiWOyQfDQYMsLPLYPfS6dPzgZTg2dXJWTOkVqDCwegp+JK4GPtqEUf
 qEGgUqxOOm1QuXh1XExBAOTk60s3920EIJ4IBjbAWHLpCIxsXazznT+Eq3ezfrG4J03b53PgHJp
 E1KWT/Obhamb2Fv/L0WAtX2yhwyLofNVpHvUTkEYP9MSjcmm/1iGLStBHB++8Fv353tgzDrzCiM
 uTYUMv+G9HAJINXgLPNvLYZ/kIJfrQbc61FFcuvO7OoKMUKUDHDSDpGJaAnfjdhk8xKw8w9hb/J
 ZJAiX/x2Ho6kJ+b8vnJM2+goK/EFkG080zjAQHSfS+9RKf1oU/kVxaDGhNMFeXBgcsX4nUQkh+N
 B9/qUdvgLyw/MlGgMOX8g0Tcwi0bRYezbmOLi4kkptyZOFt8BFuNHfvA+evmSY9C0X80bkZNe9K
 s28/pRE6moARlHA==
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
version bump. Differences are mostly in the DPU IP blocks numbers.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
 - Picked-up Krzysztof's and Dmitry's R-b tags.
 - Fixed the bindings check reported by Rob.
 - Fixed indentation reported by Krzysztof.
 - Re-worded the commits to better explain the incompatibility
   with previous platforms.
 - Add the UBWC config patch, as suggested by Dmitry.

---
Abel Vesa (7):
      dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      dt-bindings: display: msm: Document the Glymur Display Processing Unit
      dt-bindings: display: msm: Document the Glymur DiplayPort controller
      drm/msm/mdss: Add Glymur device configuration
      drm/msm/dpu: Add support for Glymur
      drm/msm/dp: Add support for Glymur
      soc: qcom: ubwc: Add configuration Glymur platform

 .../bindings/display/msm/dp-controller.yaml        |   3 +
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 264 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 11 files changed, 840 insertions(+)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250910-glymur-display-12d18a2bd741

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

