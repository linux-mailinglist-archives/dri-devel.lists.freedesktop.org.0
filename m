Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB48D24C5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 21:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB43D10E551;
	Tue, 28 May 2024 19:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O1SyDtJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6658610E2FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 19:39:22 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52a54d664e3so72904e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716925160; x=1717529960; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GsvN+JKnRavl5QSzlBkV48YEdvFno7OOnb/yOsGADHU=;
 b=O1SyDtJGpK2KhT/WjeL6bxM5IjHKJN1tR5zccbzeqcCkxAWdteZMtxadcGyQA3+yvy
 yQFaFngRrwJ6kxUImixiKKoDz/20tn5lrNwI3QDdOG1AHX5O315H7gsTzN2jhnvGE1AL
 sSMXGBapQ6f2aJq2nC2kdV9SyOQkskMIkhzOynb0+RXwRFrb+K8ZY7mLvHgjtkj+Gg0C
 qUhqsitPJBQcUTY/+1Z32s03Oki+ifZ1uUEio5WfuF7odLZuOWpmCx83Oc88pxYR2O5d
 ryxCgAP2Tl9nBwl/Y+KorCP1Z1CoPZ8qvOQdHkydgM/YyIbvyAAFuC8ZoNB77xN7ANR7
 MULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716925160; x=1717529960;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GsvN+JKnRavl5QSzlBkV48YEdvFno7OOnb/yOsGADHU=;
 b=U3FE5FOOIUvt7jL5IwrOntW0QQFN0GHLBGKArJHYiPrHNPVRYSY5gYQtdIcNolHriL
 m0FWuQChSFFIcwgkR/vWSLykhbIWi4kughfbKxafqnuNYm/R2xR7DjJUJcwjWWVjRlfM
 /fa2O+eKGAur+HhtHMHhwUZjBQoP2f+KDD1DOvPY6IUYN/+iyilCB+sttfLNc+Mch1R4
 DsQHIaoix1qLSKAcpmkCdnXK5LLehJScyEhVJitXRCxo0x662HqwMWJHhf0Y00UpdRao
 IOIbiWkDJnOoufGwHzlDzzW/GGDVxWdfQvLZZNs/1kXRULbffFKqR59PIYBpSlqCHFfp
 S/rw==
X-Gm-Message-State: AOJu0YxQzhFgJb2CCdd/lX477dmtn7u6jTiP8EV/3xfb8uu7R5dgKcea
 ZYkSrbh7dMjEUburfwkT9R/laEc9m4/rS+hrxuyFJoOGvOmM9wSw4nnskaWD+G4=
X-Google-Smtp-Source: AGHT+IG4Bg7IjMdNadZXXn/36zsu8ZDorgbs/IEsWcGO+A4iZozCmrOizaHidaPk9MqyT8DHXEBeFg==
X-Received: by 2002:a05:6512:4004:b0:529:a55d:8d7 with SMTP id
 2adb3069b0e04-529a55d0bbfmr6389655e87.14.1716925160173; 
 Tue, 28 May 2024 12:39:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529711f96c9sm1045234e87.245.2024.05.28.12.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 12:39:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/3] drm/panel: two fixes for lg-sw43408
Date: Tue, 28 May 2024 22:39:17 +0300
Message-Id: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUyVmYC/33NTQ6CMBCG4auQrq3pDOXPlfcwLqBMoQlpSWtQQ
 7i7hY0aicv3S+aZmQXyhgI7JTPzNJlgnI0hDwlTfW074qaNzVCgFBIFH2tLAw93mUpRcm0eXOs
 8k5UChIZYvBs9xXkzL9fYvQk355/biwnW9Z82ARe8wRK1LjBDiefB2Nq7o/MdW7kJ30QGuwRGo
 gXSFRBBU7Q/RPpBIO4RaSTySiCWWd0qJb6IZVlermC2JjkBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=onL8Mw3fVTnsVXTG9+UAfGyF9JpZXOhojGn8QWOqrnA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVjLmMvog05l/rjjZInaoUZ1R3/bqphbSLBIfW
 aq0YIVDkQWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlYy5gAKCRCLPIo+Aiko
 1QNTB/4zOPgYNZ7IwjqDIlZP52hwwALdFOgW40rNUxQK3Bt6S4RFuv5WnMmuoCt5j9FHXYdykoC
 CtUjUijy6ejoLZM0sEpqMUpxzMcvLjY+XONRDuCJQPUx5/4G7PUOxkVwafCxCoKm1DGagx0jEYO
 VnSsUqRcNqmx+em7fuef89wv+7WQIENkqTGMF7hJ/5tiSzTlYcr29p+NkYF1uR+GC5qS5+Up4kt
 ifjq01NFjn4Jp6VqjQJLB8sXMZZurnY0uP/k8i4DCW2HyvFfA8EVqXn/dwwBiUBy9J2l366rpiI
 ypKLjqXG3bsSObFF8OvQitHTwmnrEEcD1LlWNloeahJPpj6N
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Reoder patches so that fixes come first, to be able to land them to
  drm-misc-fixes
- Link to v3: https://lore.kernel.org/r/20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org

Changes in v3:
- Split DRM_DISPLAY_DSC_HELPER from DRM_DISPLAY_DP_HELPER
- Added missing Fixes tags
- Link to v2: https://lore.kernel.org/r/20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org

Changes in v2:
- use SELECT instead of DEPEND to follow the reverted Kconfig changes
- Link to v1: https://lore.kernel.org/r/20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org

---
Dmitry Baryshkov (3):
      drm/panel/lg-sw43408: select CONFIG_DRM_DISPLAY_DP_HELPER
      drm/panel/lg-sw43408: mark sw43408_backlight_ops as static
      drm/display: split DSC helpers from DP helpers

 drivers/gpu/drm/amd/amdgpu/Kconfig       | 1 +
 drivers/gpu/drm/display/Kconfig          | 6 ++++++
 drivers/gpu/drm/display/Makefile         | 3 ++-
 drivers/gpu/drm/i915/Kconfig             | 1 +
 drivers/gpu/drm/msm/Kconfig              | 1 +
 drivers/gpu/drm/panel/Kconfig            | 6 ++++--
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 7 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
change-id: 20240420-panel-sw43408-fix-ff6549c121be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

