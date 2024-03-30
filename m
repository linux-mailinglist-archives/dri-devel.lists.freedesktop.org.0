Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5934892BA8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 16:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51B710E886;
	Sat, 30 Mar 2024 15:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W6wyLFNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F06610E892
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 15:00:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-513d212f818so3047164e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711810848; x=1712415648; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qeFUNYhrsBvDmXfNh3GP5CFwWeV+2KjCY5GUTF19i58=;
 b=W6wyLFNrf98VYZ7cGnSQ6Lr1c1NNvi8D7YT+lVurUqzCIgtyNocLamoxFmczTGOO7w
 7lE0mHr28YmNb1l8Qh0meRouSabeoH1gybLMg9k60tCEMnXUk7m6wk49UPjQo0Oldrip
 SEN+9TtZprVytWY6dOUfxqMKLO3X5MBOOQeiYQLvm2uXNwK7e0USYtcKN4tyiKex+Q3Y
 H0opLar4UIkoV99rmEl90zG1vZZtYdApAp07v8qKEtH+0i6xsZElxiNE8rBUX5wrsEkQ
 G5BMUu4CS+4kaegDBqcIuRcpLxWyYNQJcaQaDJggi2YplQnaXenmk7wm+uYQ5bqyu2rM
 9Rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711810848; x=1712415648;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qeFUNYhrsBvDmXfNh3GP5CFwWeV+2KjCY5GUTF19i58=;
 b=OOvzzs1HUFKisZIxJe62rlx53tIY0BM7YgK3aVH+MY0PBX+0XR1jttcVLeKk1nHxGC
 KLXhuQGzz4KdfgnBfPURomWUNf0O+N79bWc93QzzaAXuKoorYJdbZXXDMLL21uBhr2j+
 aL4Y3gf/uHf4A601ucNFuwffQrxDWfAvZNCjtlii4ZE568UfOpYSNDMZRC5xH4cz1dfr
 eZr6Gk0Uic5CZGOCrhrxiNlOfAzFtHUW8/QbuWhEbz/tWlU4fPC3IauVZUynsnb4+jRS
 2E9PpL1Xf9nFPKgoROzbNeIzz9hirREipEaEIH04f2VftqqccZoD/I8UqhVHG7MDMcO/
 ASIA==
X-Gm-Message-State: AOJu0YxWiXFRheCQnul1lVKvUWY1B0MJXqeLs/xvzRVygV8XLHC3y77I
 TpuK1t2N6PznwcjuQw/yS70gZUesccgtCzsvi9u15rb9DQaF5rLGlPCNGyytO30=
X-Google-Smtp-Source: AGHT+IHN7f4UYparBiAGyFZQsvMsLXikA/nW80TyS4l4HLUhBjxfSbN21Vqi/NPZ7qlAf4/qE6rLmQ==
X-Received: by 2002:ac2:58f2:0:b0:513:3d26:7cc6 with SMTP id
 v18-20020ac258f2000000b005133d267cc6mr2848569lfo.15.1711810847829; 
 Sat, 30 Mar 2024 08:00:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j5-20020a056512344500b00515d205a6f0sm496199lfr.29.2024.03.30.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 08:00:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/panel: add support for LG SW43408 panel
Date: Sat, 30 Mar 2024 17:00:45 +0200
Message-Id: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0pCGYC/32NTQrCMBBGr1Jm7Uh+obryHtJFbCfpQElKIlEpv
 buxB3D5Hnzv26BQZipw7TbIVLlwig3UqYNxdjEQ8tQYlFBGaC1wCVheRhvR4+oiLfiwVnkj5Wg
 1QZutmTy/j+R9aDxzeab8OR6q/Nk/sSpRoLe2F368eDW528LR5XROOcCw7/sXkSIEILEAAAA=
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TbTHOui9nRbzInfWv54rG7ybH2YP9w+pNQe9Uik8Gy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCCkeW9RMtkNd3jg/F4YF3+7GbRlOaHo4dt3gG
 f5lWmdi9/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZggpHgAKCRCLPIo+Aiko
 1aABCACVd6NQSpXlyfAImYk+V5+sCXVWy/Cu78jlO/LPhB1OjoR5DQ/YwVOttpOAg7b5pZ5dd3I
 faWpAQ32mUBBtU091NXtPFmAZVmbrjplgCg8HQ3CSuAq266/Y7b5NpwEPLe2u8sGL0sB+EjyDeu
 Jj9uD9DMDDmAS8ju3jFcWEkehWec1SHrJe97vzFWa9iDp3I8uDC80MXXYSAjdZbzL7fud6GPbcC
 LRMfhO7q38gMBkBys2rirGZhoH5gaxbRzel22HcaIXCGGRSnw1ZtiFFZtvfLvrpTNIsVeGLY+Q/
 q/ccLjijPHfpvLswPPiYTttJM7pdyO1DVcrICuq1NRTZFqQy
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

The LG SW43408 panel is used on Google Pixel3 devices. For a long time
we could not submit the driver, as the panel was not coming up from the
reset. The panel seems to be picky about some of the delays during init
and it also uses non-standard payload for MIPI_DSI_COMPRESSION_MODE.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Removed formatting char from schema (Krzysztof)
- Moved additionalProperties after required (Krzysztof)
- Added example to the schema (Krzysztof)
- Removed obsolete comment in the commit message (Marijn)
- Moved DSC params to the panel struct (Marijn)
- Changed dsc_en to be an array (Marijn)
- Added comment regiarding slice_width and slice_count (Marijn)
- Link to v1: https://lore.kernel.org/r/20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org

---
Dmitry Baryshkov (1):
      drm/mipi-dsi: add mipi_dsi_compression_mode_raw()

Sumit Semwal (2):
      dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
      drm: panel: Add LG sw43408 panel driver

 .../bindings/display/panel/lg,sw43408.yaml         |  62 ++++
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  34 ++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 321 +++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |   1 +
 7 files changed, 430 insertions(+), 8 deletions(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240330-lg-sw43408-panel-b552f411c53e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

