Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D09B879E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 01:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70F410E09F;
	Fri,  1 Nov 2024 00:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oDqqx3AZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF0D10E09F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 00:25:10 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539e7e73740so1367093e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730420708; x=1731025508; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LPWl0EhL6KI0Pyg9VIPJdMDq/EwgacWWrQ4ao+PcFsU=;
 b=oDqqx3AZxxDHV75cgClpdMNtrBE8OHOyWIM1EUL+nJeVFpUBL2drvo4ImKKm1JQOt1
 Y9cTgMFwVSrIWoL3+nCxV3ob4PI8QW21DnGXtzFhFMbPI9TM06Ye7Cr7saU9ce6sJ2Nm
 uZ2aMidHfR/LBJpy2SedIMyzGV/03u7QF98AZbzl3Y7IkOCKjZ7AF0RPGSPHfbKlsb9J
 T/a/aH9q1SNDWb8Uvq2zwaXgimKRfsaVt3gTLiL3BBll6xOLDlNI4+9TbW6ZW6jCyuYT
 h9rt8HZxDGcrVbvdDWD9ML0DixXpPM+qon/YSsEAvrVKTXn8J+6yJTfubXFoZAZ3QU8u
 zMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730420708; x=1731025508;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPWl0EhL6KI0Pyg9VIPJdMDq/EwgacWWrQ4ao+PcFsU=;
 b=Xu3lkc8lGO2dQG/gzRkkrNBVLAbhOj9xA2eqE13xlhogHs8IN24eJZN5VOyj+9vwNf
 49x/Mg25Z0OzKuyFZ9XjLc2x8uY5NdiastVyc1HaYfnd710vf9PI6S68g+InEjlNuhAn
 EVOQ6p5CHb8EQMZOsyUSJMvPmzeErEQSnDoj/ZYblN3duUiBByuLhid8FUm9+htr7yHc
 7aVU+dEcbnlDIhvs0qNH3SLk0WRc09yIF5C7sijjx/k46st3h0cnRCtUZoUz/N3NgDU8
 BqBY9Jw+YlQPygrNuHYz8V8eum+UlgNwlb69XQcEZTq522Pz68x0zS2iPNPou8Ax0i14
 +LIw==
X-Gm-Message-State: AOJu0Yy3LbFheuKlf7pAN6reU5wJl77k2r3sPyPLz/RjEshw3ld3f/p6
 YXsMFEqIP9uePt7a2mX+qeZjQpw8I0KDDIpDXHavLrtPLOouS0wK2Q7CI2vjwBM=
X-Google-Smtp-Source: AGHT+IGzQdvR9n9N5nsIKtK9Qhx1FHQRUlJs7sw78abE6mZx2jxTi9cQ9DuYKZQZysqMNCy1gebATA==
X-Received: by 2002:a05:6512:130f:b0:539:fbf7:38d1 with SMTP id
 2adb3069b0e04-53b7ecd5970mr5312335e87.2.1730420708098; 
 Thu, 31 Oct 2024 17:25:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 17:25:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] drm/display: hdmi: add drm_hdmi_connector_mode_valid()
Date: Fri, 01 Nov 2024 02:25:03 +0200
Message-Id: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8fJGcC/3WNQQ7CIBBFr9LM2jFAUNGV9zBdEJiWSVowYIim4
 e5i9y7fS/77GxTKTAVuwwaZKhdOsYM6DOCCjTMh+86ghNJSSIPBr4xr8oTVLuzRWnJaK3MS0kF
 fPTNN/N6Lj7Fz4PJK+bMfVPmz/1tVosAz6aslbYScLveFo83pmPIMY2vtCz+UD4OvAAAA
X-Change-ID: 20241018-hdmi-mode-valid-aaec4428501c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2jBD0sl9KT2Qp/EDHaop9tjjGL1eeuSLdTvEobSlC2o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hvEH2fbu10syN0kMJjljMx5W/ESzQUVOsw
 TIFkNSzP9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1aH1B/wOZhTNhYOTk6Qqu7BncZn5jLCtS2Yc3ZKRtmLY2SPPxUlQSH3BJufcG08aT9tcaRJtvzH
 dLiSvu7kKRrptx8XXTTAowIe+PjKHNcvJt6f/DS+Xq09ujGERYNsYJKUmENNauW7tCtInm5iWTi
 FP0Pg2y/9Ekcqir7E+h+S+AvNfXY2PP8cS9krf3a7/mfkI9ZQ08L+YSu7emXZzSvoK8lFP2Xb8q
 zKLnQq9TISsrTJHx/nO3Ex/qPCXDdG0yzSTjb/7JmE5it/eN5z2GMuhJxiw7KOzsWYVeKpTf13D
 dJTT2kruCf1H+YrwsP3YdsqRpFJvq9psMttgI+8Wl1fHfwEO
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

Several HDMI drivers have common code pice in the .mode_valid function
that validates RGB / 8bpc rate using the TMDS char rate callbacks.

Move this code piece to the common helper and remove the need to perform
this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
skip the check in favour of performing it in drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Switched drm_hdmi_connector_mode_valid() to use common helper
  (ex-hdmi_clock_valid()) (Maxime)
- Added simple unit tests for drm_hdmi_connector_mode_valid().
- Link to v1: https://lore.kernel.org/r/20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org

---
Dmitry Baryshkov (6):
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate

 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  12 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  16 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
 drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  12 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   4 +-
 include/drm/display/drm_hdmi_helper.h              |   4 +
 10 files changed, 252 insertions(+), 50 deletions(-)
---
base-commit: 623b1e4d2eace0958996995f9f88cb659a6f69dd
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

