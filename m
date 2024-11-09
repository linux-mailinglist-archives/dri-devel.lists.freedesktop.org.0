Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC69C2D0E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACC210E02C;
	Sat,  9 Nov 2024 12:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rIQCiHj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E3A10E05C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:35:16 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539f6e1f756so3531179e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731155714; x=1731760514; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7v2ALFBdYjyZ6sFyb9Y/ee0T/VtMhjtKVZbW5icBGMM=;
 b=rIQCiHj1vMRd+4vzo7NUZJHIwqEnYaj2389tMV4aU87nWO8gkQxkHiRtYPVcncI8Gu
 sKjHqKEZ7FG0AHu3A/8+8ExIB2HlnEidYMoURAQZC2owRiSrj5fTo1Fver+nOGzhyXRV
 IA3kFOiUx/rP5Uhx1ucABbGwIDgxbLa6bcHu1RI/otiDSdxNpOUWkwx6qD3YEajFfhv0
 ADtS60VqaQX6XjDUTPKJ2sdX12Tu5deuY4u9u6CXuTibx9qiRx78gPklHVPkwLY9BwvW
 GpiesiTnIz8GoqfvA4CYWs+wJHig0jFEnclJc4GrSp8rs2FRWM3mYUNT53ZGHzOYXTyQ
 Yajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731155714; x=1731760514;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7v2ALFBdYjyZ6sFyb9Y/ee0T/VtMhjtKVZbW5icBGMM=;
 b=ruuUKmSVMIur2D1GvdlIaCcp83jA4U2lPG5yYXSXbYEB8aDOo6QuJP2SJnO6vy8rUB
 SXHGKAYw5M8Fg5Lm9Vzcuv2qR9VyuK6rrLjI9ekqgmU1OXUGUNMQAuir9D2oPk6NfIdM
 XmeuTAYSejG6VEE2F5PgcHzD5WCy5QYSRxl/RrdLrQcNExwo6u8p9jB9Zp9ls4MMniId
 +uE3Uma4MLBlYJOFSIclPoQSwlpA2HwhjC2qS2u9IWPD2PzyNnQ1Ln07Betyb2NoxYDV
 a/4q6bVQm2ucv8Ne9R2x7rF84GHLc2F8JI0v6OdYb0QB1BFs1DZ+/dKS6qWuuNwrgURt
 GBkw==
X-Gm-Message-State: AOJu0YyNlCZ88ObwC5CkPWL/fL7FtXcm7GPEaiM6tWvD6SU1W8ZvRIk+
 zlll9Wsgs1fQa/DInCVOEfgCEdkYjorMTkMQxzCSysHFZJd4XrW7K4NS5gk98fM=
X-Google-Smtp-Source: AGHT+IFSDYeqaLjyC9aeiFIrpSqYeLJzWS5ech99oMz9O52R0aPaOJVtYR5urSo+K9hUQ7SDK0W5Xg==
X-Received: by 2002:a05:6512:3e01:b0:539:eb82:d45b with SMTP id
 2adb3069b0e04-53d862f817cmr2360079e87.56.1731155714283; 
 Sat, 09 Nov 2024 04:35:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:35:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/7] drm/display: hdmi: add drm_hdmi_connector_mode_valid()
Date: Sat, 09 Nov 2024 14:35:04 +0200
Message-Id: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhWL2cC/3XNQQrCMBCF4auUWRtJYmyjK+8hLoZm0g60jSQSl
 NK7m3YjIi7/B/PNDIkiU4JzNUOkzInDVOKwq6DtcepIsCsNWmqjpLKidyOLMTgSGQd2ApFaY7Q
 9StVCubpH8vzcxOutdM/pEeJre5DVuv63shJS1GROSMZK5ZvLwBPGsA+xgxXL+gMU4RfQBcDaN
 NY7LT3WX8CyLG+YQFG18AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2fV2XD25ut5vTGewFjeEo8rNWtU13M/szPG8t2HvEoA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2L/f+UEK3NVbN5T87r6we4/e+47HjzdUh8R2Rpl41
 ljN4GDpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEdvey/6/rZXqxJ3yT/vWl
 Sal9CQ/l8xMDBRcJZ5ncmPFSXl466RQ7E+uc5Su+3jC8paB2oMG53dq2ZHosq1ZdfGqNw4Td+k+
 bNzz1LtvQmHu23k3xn9mEIwcPa7K1c9427l1rm6Cxt6NZTvi8s9eEWhfFtqjtbRYXhTIu8SjpVt
 X831v+8Wx7hHTM4Q07L7h/Snf4fO7197Y7+mdstb2vq27hCvZV2ePNt+F/2qInFieUeXf1shzp8
 0+3ilfZ+ND/Uuk82+PTt4QVaHtJKkrcLDdMWl7AsmhRLutHLpbpJt/ZFx9w+5C8yNs44MwXnomv
 FDYovd7jWd4Sa7WvkZlnoa99vvoFtgqbn5YKyQ8TQzgB
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
Changes in v3:
- Moved drm_hdmi_connector_mode_valid() to drm_hdmi_state_helper.c
  (Maxime)
- Added commnt next to the preferred = list_first_entry() assignment
  (Maxime)
- Added comments to new tests, describing what is being tested (Maxime)
- Replaced sun4i_hdmi_connector_atomic_check() with
  drm_atomic_helper_connector_hdmi_check() (Maxime)
- Link to v2: https://lore.kernel.org/r/20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org

Changes in v2:
- Switched drm_hdmi_connector_mode_valid() to use common helper
  (ex-hdmi_clock_valid()) (Maxime)
- Added simple unit tests for drm_hdmi_connector_mode_valid().
- Link to v1: https://lore.kernel.org/r/20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org

---
Dmitry Baryshkov (7):
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
      drm/sun4i: use drm_atomic_helper_connector_hdmi_check()

 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  12 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  16 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 +++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  32 +---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 181 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   4 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 8 files changed, 228 insertions(+), 46 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

