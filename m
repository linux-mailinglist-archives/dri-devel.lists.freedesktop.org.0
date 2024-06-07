Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3B900488
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADDF10EC29;
	Fri,  7 Jun 2024 13:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xFqFELzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF8E10EC29
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:06 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso2387601e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766584; x=1718371384; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L546UJDJwDhNtD4MhBT8mwI/8o9qvecKvmvta6wWkb0=;
 b=xFqFELzlWqSiz6rmaor2lKdQYj8eyusDiNBXR66A7jHT0jsU5yzSv1qQ9IK51AbPXC
 4ohksW7huszT6NPsnSngO7FS4az+04Y1jRXxFB3NwsEQjKCZomtUy1lN5sYSJQU12/BR
 9OgBCdfBCvhgqSXuA9r+aUfN3vSse/hKyX4FSLo5CzniXPMFEYW37pDP+3M2U43Kqk2Y
 /JdxM20BAveWEUdLjuwLX/0hx/7GJAR3L4OR34HKex75FioMaqI3vjfG/TptNcU2bmBQ
 +3AcegMDmPir3vjOz/10S8L/TPR/PZkgwZdZEjeXZySlWO/zs98X55P9+iEEPNqpska2
 Sqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766584; x=1718371384;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L546UJDJwDhNtD4MhBT8mwI/8o9qvecKvmvta6wWkb0=;
 b=IBJRvvTXnxAUwasHGPIY6cwORMUqeegwEI1oiRKFH+FkiI5dHjjW8+9OmBWAgMXnta
 ZGXtWYZJLs988oHr1GuzCZj3QE5S0x3/PObWpWTJiDWAqIUPIN9sHWPbR/u6CxvN6XnL
 iTl3Ka8W4Pdada7dnmV8/v/0gT87z6b3uZ+H/20VffKQaC4d69ROuVEaDdeHtDGGbAFS
 +gQ1FIoJTZCCNYKC8cjcJSPbXs2IfgFJrNz9TxtB/rIsH+g3xeULzI1LJgzAXC0XXr/M
 RepzcBKLK5+FmQTLJ0HayvhB33qVqd2Kug3xPbS+A825Jm0Yh3y7rfZBA/qJnr7rpyeu
 QHVw==
X-Gm-Message-State: AOJu0YwLSULLqD39XnMuSFSm4pmNQTuANRKtCiHRAdNxnP/AbxsOhnyn
 PkpaPFUEVOOfHWFugmU/LxWh94RpWnHzZAfZLcO4/OW/Wimxo3oYX/ktfb5gLmg=
X-Google-Smtp-Source: AGHT+IETFIbMY0Y2oLYRx8o9U2fmxMfpNQDewBvZPnUdqZCTzhxVb1bTC1GHZmV1wsrekpTCCZU94A==
X-Received: by 2002:a05:6512:3d0b:b0:528:ce56:96d with SMTP id
 2adb3069b0e04-52bb9fc57bdmr2387528e87.50.1717766583904; 
 Fri, 07 Jun 2024 06:23:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:23:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/9] drm/msm: make use of the HDMI connector infrastructure
Date: Fri, 07 Jun 2024 16:22:57 +0300
Message-Id: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEJY2YC/3XNTWrDMBAF4KsErasw0ujH7ir3CF3Y1jgeaKUiB
 5MSfPdOAiUpwcv3mPfNVc1UmWb1vruqSgvPXLIE/7ZTw9TlE2lOkpUF6wAh6r5yknZKX6yHkjM
 N51J1JIzeUQgmgZLtd6WRL3f3+CF54lnOfu5vFnNr/8RmQ1yMBt1CH1r0HmyAwyfnrpZ9qSd1I
 xf7zLRbjBXGYAM9dUgUXxl8MB5hi0FhOpNM41JoRsIXxj0zZotxwnhjYIytw2DtP2Zd11/RWnJ
 +kAEAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4310;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UrMGMcNriQlSOJwP/1Zz6CgLy9Xu2g7DPohrk5dATq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm18SLgn8aWyu2mlHE6QjZVyAXZw8OOMk4Dk
 pUidJfNbuKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtQAKCRCLPIo+Aiko
 1RIEB/0dVe7IKSj692e/FGCihXn4ugrt/2cRxNJO9bwpQXeaPV2gqXe82A2MwkmIDPoenwnQ5Zx
 g0J+xJgGxRspZ+Zq7mJL21Mb/n/hcp9nIRIbkGUYH7XqcoxC14M1BlGbI45hjq8SxvGDGbCUvwO
 O/sho5s09CLF37PeF82MifVaMcrRgZtcbCpxXdf+UKQMn+iP2Myvh8Vbdg9XT2bVQLRJDM6LYku
 QGTnRn40+CeepvN9TSryAF6jNfOJLHUn3moXEVcfjgUu2kkj9dNeecC+FSH+QDvUtLoGMBrNC8S
 2LFQ8ZsTkhrVuz6UK+MNK9ULelUyhdFt2ily3UmYDE91dC07
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

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Made drm_bridge_funcs::hdmi_clear_infoframe() callback mandatory for
  DRM_BRIDGE_OP_HDMI bridges (Maxime)
- Added drm_atomic_helper_connector_hdmi_disable_audio_infoframe()
  instead of passing NULL frame to
  drm_atomic_helper_connector_hdmi_update_audio_infoframe() (Maxime)
- Disable Audio Infoframe in MSM HDMI driver on audio shutdown.
- Link to v4: https://lore.kernel.org/r/20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org

Changes in v4:
- Reworked drm_bridge_connector functions to remove ternary operators
  and to reduce indentation level (Maxime)
- Added hdmi_ prefix to all HDMI-related drm_bridge_funcs calls (Maxime)
- Made vendor and product mandatory to the HDMI bridges (Maxime)
- Documented that max_bpc can be 8, 10 or 12 (Maxime)
- Changed hdmi->pixclock to be set using tmds_char_rate instead of
  calculating that manually (Maxime)
- Changed mode_valid to use helper function instead of manually
  doing mode->clock * 1000
- Removed hdmi_mode in favour of connector->display_info.is_hdmi
- Link to v3: https://lore.kernel.org/r/20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org

Changes in v3:
- Rebased on top of the merged HDMI connector patchset.
- Changed drm_bridge_connector to use drmm_connector_init() (Maxime)
- Added a check that write_infoframe callback is present if
  BRIDGE_OP_HDMI is set.
- Moved drm_atomic_helper_connector_hdmi_check() call from
  drm_bridge_connector to the HDMI bridge driver to remove dependency
  from drm_kms_helpers on the optional HDMI state helpers.
- Converted Audio InfoFrame handling code.
- Added support for HDMI Vendor Specific and SPD InfoFrames.
- Link to v2: https://lore.kernel.org/r/20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org

Changes in v2:
- Dropped drm_connector_hdmi_setup(). Instead added
  drm_connector_hdmi_init() to be used by drm_bridge_connector.
- Changed the drm_bridge_connector to act as a proxy for the HDMI
  connector  infrastructure. This removes most of the logic from
  the bridge drivers.
- Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org

---
Dmitry Baryshkov (9):
      drm/connector: hdmi: allow disabling Audio Infoframe
      drm/bridge-connector: switch to using drmm allocations
      drm/bridge-connector: implement glue code for HDMI connector
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: turn mode_set into atomic_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames

 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  36 +++
 drivers/gpu/drm/drm_bridge_connector.c          | 107 ++++++--
 drivers/gpu/drm/drm_debugfs.c                   |   2 +
 drivers/gpu/drm/msm/Kconfig                     |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                 |  47 +---
 drivers/gpu/drm/msm/hdmi/hdmi.h                 |  18 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c           |  74 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 310 +++++++++++++++++++-----
 drivers/gpu/drm/msm/registers/display/hdmi.xml  |   2 +-
 include/drm/display/drm_hdmi_state_helper.h     |   1 +
 include/drm/drm_bridge.h                        |  81 +++++++
 11 files changed, 496 insertions(+), 184 deletions(-)
---
base-commit: 222d50ef3700aefb694e55a7a1f03d3fe2cb67f9
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

