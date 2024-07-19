Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EBC937655
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69010EB95;
	Fri, 19 Jul 2024 10:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pzkTI1+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73D910EB93
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:03:36 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52e9fe05354so1766507e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721383415; x=1721988215; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3EDgqQLvRSwDrCcv59CmXj7GYAkDehygdnCzNRYYZjU=;
 b=pzkTI1+60vRM9+V2VxmhjAxN9LA7T3crF+2CpzTxvjIaH7QJ1/xsvPxRMojHx96swA
 v3731S66BmS7ZQhij6KxQqogDl3JqQZRgZCzpkDSAUPUKve6RdRcuQJlGOqKCsto4a3x
 kcDlFl6X5rK688ClhoeQSbDwnOQR3egAUK4HppDpPItaTdF00hwdnXfc8iUQG2eoLMXb
 LMq+6w1l3FrDe66pW2WjCiZSE0F+LIc2L6tUidaKP9A7x9V2wWabVsqLctn/gGec8zOS
 oe64cGH7gR9705jUOwIANXwx06z/Auok4HtqAC+vSjf3m5JweR6undicS+TZEos0H05A
 D0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721383415; x=1721988215;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3EDgqQLvRSwDrCcv59CmXj7GYAkDehygdnCzNRYYZjU=;
 b=SfPeDiKNYO8zn8MfK5Cn49FQOaCuWtO8hj+/BYlsN89LwU6/j9uqAtKwRiW+EnKp+A
 l4gnjVqpLNH774oHeR+uY4kN3cJ6/soFOv3VWXGwuq5CmIXjh3H3yNd3eRaRk3piAWyQ
 IF2bawwYqXDbnqSbSMB4bki/z8AVwvZ71mkELfkUBMR0jyR6wR0r1RKUlxRoFynJQdm/
 ygHTYwrEa2ir3GgH9e9Bge52KbIdum85XcK4WoA6P3Al7/jADLWYL0Cyfzra7OEMkJfS
 EgVBMRHmED2Qg4lRjo19v2pwa90CiGyfreActiWsSd3DXefhlB9u5Dla7RCIwGppoa8Y
 Irig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwh0asPTFgobkKPvaxJ4rJO8Vfi7Dbk7LuYZUKgCK1NhIP04ZrRpozYCuJTMoB+VIEy8zFKBeF1GV1g3LtE6DztbA2w7YEx1e7Y1I/Wgk0
X-Gm-Message-State: AOJu0Yz6sXQivlNnXyaHA+UWbq9HR6EkK91a3hN5pN1BmpBjQCAe8m14
 IuXtbjfrvoCB4vYvw9bWSbWrNH2LyTsGpTN3KdZ5I53o+N+zpbI7OPosmJdX0q8=
X-Google-Smtp-Source: AGHT+IGTtksPveW6pC3us/zUAC0RNKQufFymz4YZAckWjFhi189BGPP5AyYrC6CKG/NOilhOcKxVQQ==
X-Received: by 2002:a05:6512:10d6:b0:52e:9481:eaa1 with SMTP id
 2adb3069b0e04-52ee53afb4bmr5128415e87.23.1721383414492; 
 Fri, 19 Jul 2024 03:03:34 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 03:03:34 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] A621 support
Date: Fri, 19 Jul 2024 12:03:25 +0200
Message-Id: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO05mmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0NL3ZL8gsxk3UQzI0PdJNNUC+M0c8skkzRzJaCGgqLUtMwKsGHRsbW
 1AMW8ly9cAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=955;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RXgu3OH6O1t4AFA1c/ztzYKlGP0Ku08ZFQf1VH/giNE=;
 b=c/RgXy6dCMl2d1vMO7rTTvx4ALMhaqE1vHO1hHD/P6O9ZTkdG/pRDnzht+tM4eXuFiTkhO93Y
 i4Xc2YMMSGSBgSW5bylwIp+nHxRkF4vrpnKYFeGzaiDNLMRiiwchTjN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Baby A650, needs mesa mr !30253 (or better)

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      drm/msm/a6xx: Evaluate adreno_is_a650_family in pdc_in_aop check
      drm/msm/a6xx: Store primFifoThreshold in struct a6xx_info
      drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
      drm/msm/a6xx: Set GMU CGC properties on a6xx too
      drm/msm/a6xx: Add A621 support

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 111 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  21 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  52 ++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 +++-
 5 files changed, 164 insertions(+), 35 deletions(-)
---
base-commit: 797012914d2d031430268fe512af0ccd7d8e46ef
change-id: 20240719-topic-a621-b5e83f79b4f7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

