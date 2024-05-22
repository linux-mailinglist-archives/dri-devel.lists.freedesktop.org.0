Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A488CBB37
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 08:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465C310F03D;
	Wed, 22 May 2024 06:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EwyP11pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8583010E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 06:25:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso7619812e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716359155; x=1716963955; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LXLCoFAT4Nr83TUnXDuvZrugwAWtGHeO95Weg/poUGU=;
 b=EwyP11pgN3iio7hYBqEEz3MWFzC9nDaTgK45wRX8K87MyFCOczhU1Y8KB9tSgwjJJ+
 cajoyxD6/YH5MdSTonkpBfOEQsiSA1pQ0C5/kVeRm/46L+pcum6F0kkOs130gXuNqng3
 7T9GPBI/NFbyNd3+fEnSqd464Xsi8OefKpp3T9xJnHuqoKiNfk+3BFrpGOUj86joiGl2
 dPa728UiMTDpmEsctCNaJSYocYuLm55EHnsMeb6j1zLiCUbksZZe/zUA/+Fg7UMSb9mo
 jKMd6sLM6NjtiUQASj5zANN96EhS0PCQZzDo3bbQGjLu/6LYWa5m/OBDWuMX3gpOu/bW
 3Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716359155; x=1716963955;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LXLCoFAT4Nr83TUnXDuvZrugwAWtGHeO95Weg/poUGU=;
 b=fpc1waXFB6ksgl7w6gZODvbL0weBQU+v8v4oJ5MWVWtlDnijYBMLd4wf5LKClZvmUO
 Jte0RYSseCgZMnHqXsGiKluOAx7S+OMohWG9M/E7JeWmEZgxVCsEhll6sIxvWB/U0hNc
 y4/th/FH+hnG41XDQM3ac2FGhqZYs6jvKUAMkRgz15xO3jLx1arv4hrKD2Qa7ca4kljK
 UWCsCEndUfuWi/uR/YHVWD2EF9A2GczZwOCL4NhqJ3mOUIgBv0g1vQBI9/yKp3xjlFdO
 wzNX1Nawj/Wi5kI1HbT7vY27QKZjX2hLOFSQj6VhRafnxTvpGt49wC2RfAJBqIhFNj3R
 Y0kg==
X-Gm-Message-State: AOJu0YyJUbsVAeK/PhQDbfGtGNkaiTtPddeLOnRpajRkFNBBrbgX/XoQ
 2AvE2d7pRJkpmDt+4jla2flrL9xPLCeMphsDWX2uP6vbrtUZPy/Cwr0rF8ZT2z8=
X-Google-Smtp-Source: AGHT+IGX+HGpof31CbGG3ey+krSYpZvkL10bQ1Csjx7rDsXyKZf7WF8br6dYBsvJYIvPPjp//uYZNQ==
X-Received: by 2002:a05:6512:358f:b0:521:f000:5d1a with SMTP id
 2adb3069b0e04-526bfc02c3emr486204e87.59.1716359155168; 
 Tue, 21 May 2024 23:25:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad4d0sm4910023e87.49.2024.05.21.23.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 23:25:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/panel: two fixes for lg-sw43408
Date: Wed, 22 May 2024 09:25:52 +0300
Message-Id: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPCPTWYC/33NTQrCMBCG4auUrB3JTFPbuvIe4qI/kzZQkpJIV
 ErvbtqNCOLy/WCeWURgbziIc7YIz9EE42yK/JCJbmzswGD61IIkKalIwtxYniA8VK5kBdo8Qet
 ToeoOCVsW6W72nObdvN5SjybcnX/tLyJu6z8tIkhoqSKtSypI0WUytvHu6PwgNi7ShyjwJ0GJ6
 JF1jczYlv0Xsa7rG2ClSEP2AAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2570;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oRcVW2b7RmaHCnZgU9s+liJiuQhOof/Wv7h+/P64vIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTY/xD9ITufJQSk92eKn4zrpAjtoqX7DTPDRhO
 pcE8CPeuxqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk2P8QAKCRCLPIo+Aiko
 1fxLB/4q18LHEJ28oA5ep3OXXNTUN19o1mCkDD3brnUoQ8pC9gwRIaQriJw5p1tNseccfBTK3wR
 tuBJAdnZjzi6rlANM+JVasAlooV9fVtWi/HLaF5QDb+r4rb4nUbFBGr2WLD5DnkTjEcaeuQ4ucj
 Z3tXVxKBh+f5fq74jtPYIglVBdFt1r5x6RD0DTXAKL3BF0HsI6esPyiAGQCyreQjQd9Fhf8RSUG
 BU+ZQyuzoWyUmwp/yyJfyTGxFnRkxZ3kVyoEQRfys7hR2+4BhCTCMENhyMK+0LERl0qKLDV6UCr
 BXjjWSgi8V4Gsw1gHHoFqSodE+W5HRDBlrZEpS712YzAICCm
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

Fix two issues with the panel-lg-sw43408 driver reported by the kernel
test robot.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
To: Pan, Xinhui <Xinhui.Pan@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Changes in v3:
- Split DRM_DISPLAY_DSC_HELPER from DRM_DISPLAY_DP_HELPER
- Added missing Fixes tags
- Link to v2: https://lore.kernel.org/r/20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org

Changes in v2:
- use SELECT instead of DEPEND to follow the reverted Kconfig changes
- Link to v1: https://lore.kernel.org/r/20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: split DSC helpers from DP helpers
      drm/panel/lg-sw43408: select CONFIG_DRM_DISPLAY_DP_HELPER
      drm/panel/lg-sw43408: mark sw43408_backlight_ops as static

 drivers/gpu/drm/amd/amdgpu/Kconfig       | 1 +
 drivers/gpu/drm/display/Kconfig          | 6 ++++++
 drivers/gpu/drm/display/Makefile         | 3 ++-
 drivers/gpu/drm/i915/Kconfig             | 1 +
 drivers/gpu/drm/msm/Kconfig              | 1 +
 drivers/gpu/drm/panel/Kconfig            | 6 ++++--
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 7 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240420-panel-sw43408-fix-ff6549c121be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

