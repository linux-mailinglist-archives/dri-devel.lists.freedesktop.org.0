Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D59B8EF1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 11:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3222710E976;
	Fri,  1 Nov 2024 10:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yT2kRB1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F408110E976
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:19:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53c78ebe580so1921414e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730456348; x=1731061148; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=le/PASSZxeUtTWMl/wNKSD8ec0kDdmO9btc+axn7CcM=;
 b=yT2kRB1mSOXuMl/Zuk7yceqMsLqecL98nSdQv8oYaeGS3MFfBF2GD+IK54U0POSYTf
 rzVgZYIjVYAxV/izmQJVm1ersGx9+QfylD8KnaXZTpr3WBFMbdDHewWFDEmleNXqXCAK
 zs1MGVb4NmbUgFs3Tp1wI9Ij9LxzolSrFFiTaDg0DwKgxD14LGlQGtxuRcZMBMtA2Vue
 aKXh9/O3B0F9kj7ESzAjSXOO8wsxt7sJE8QdJTxz5WrwuqDqTizgqEyGI9TOPhsGv0NC
 7qOdgox5BjQqQ/O1FsA8VBqoTCfI4LnvzZn6VElTl5rm5qoE2cPncuHNj3gEa2Ci5DIS
 C0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730456348; x=1731061148;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=le/PASSZxeUtTWMl/wNKSD8ec0kDdmO9btc+axn7CcM=;
 b=gGrAiBGzYnT8UKZuK9wC1mZBTjAE/Jn/7Oad5buHLd/naG8mb//G3H52js1APiBojE
 JyfKi41ToQCNQ9RURpgx1T6wZuvYEv0INGg5skLKVYe2NdkPnu5uHNJGY+1MvCRfEuck
 0v4vfvPkAqEK9PlDDyzXDz3Z73LKVrt/+zN1HjSSmVZ0hQjlWToFJ21k/UGEhB3I5lmO
 WF5mYB3KuiaxSPHDA39k9hXVaZTPmT2xpMG0Is4cAjgz+0J7zmykbsUw0ydBZJZHaxf+
 X5Te3iq0Gfa5oa6DK8dLl3wPeEcyQtX077eQYn/kzP0VGYp4uaPxZ6P/sUhmLS0crAYQ
 Ko5w==
X-Gm-Message-State: AOJu0Yy6w/+uqEv7IoBlobMx1kSrRKXDX66C9FcnB/O44sOAGqQaU9sk
 8IGP2eZl13i12F5BcynB4JQboBY3FD8ssQ+yFTXz68jlJWARoMogkHFQ2pNkxME=
X-Google-Smtp-Source: AGHT+IHY7ovUMeRzJsMU5xMtc2Dvgev8mxKT+oIlhDInundzFyWvx582oufvDDooCRwUY9gtgQ/5NA==
X-Received: by 2002:a05:651c:985:b0:2fb:569a:5543 with SMTP id
 38308e7fff4ca-2fedb488babmr9537901fa.19.1730456347942; 
 Fri, 01 Nov 2024 03:19:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 03:19:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/7] drm: add DRM HDMI Codec framework
Date: Fri, 01 Nov 2024 12:19:01 +0200
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWrJGcC/32NTQ6CMBCFr2JmbU0pFsSViYkHcGtYQDvAJNKaq
 SEawt2d9AAu39/3VkjIhAnOuxUYF0oUgwiz34GbujCiIi8ajDZHbUutPM+qZ/KSTH4m5WII6N6
 RVdProaqNbeoSQfYvxoE+mf2A++0KrZgTJel+899S5Cijq8L+QS+FkmfbDK4+VbbrzeVJoeN4i
 DxCu23bD0dTIXXIAAAA
X-Change-ID: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4653;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QgZZzJg9ZFJE02xI1Hrtot2oVYSJiceonkhnIgQN/h0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsY88bZNto8DqlmNoOzOCbmLPcIj7Q20qCAJ
 JjoQmszobCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGAAKCRCLPIo+Aiko
 1ZMxB/9PlgUbk1D7PhNPxChE5hultBBglq08GH0Umkd+Za2/2Io/+TRzSawGpJdQvyxkjlgfR0V
 0y4x1NxVaNkUE0lL9SCdxQENW6FuWm204EDKSf12UssCKVaaxSBhb18R8Y5pevOS+ZxuJiSRann
 virCc8/G78fIZmOcG+fMTmaAK3JSG29OlKMAzDUMON9dZj7DQVBpShmW5IkenDcOz9Rw7tBwDRl
 7MZevUXEUJa6Q458HDM/jZM4XSAiLfaB+vJISqffjuKFlvfRC99iOSplpF6789oJDrsBwunWAe6
 n/wG5kc77eAVv8XoWMc/5iYXHHRut+GnvvCeHuKnPEFbapd6
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

While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
framework, I stumbled upon an issue while handling the Audio InfoFrames.
The HDMI codec callbacks weren't receiving the drm_atomic_state, so
there was no simple way to get the drm_connector that stayed at the end
of the bridge chain. At the same point the drm_hdmi_connector functions
expected to get drm_connector instance.

While looking for a way to solve the issue, I stumbled upon several
deficiencies in existing hdmi_codec_ops implementations. Only few of the
implementations were able to handle codec's 'plugged' callback. One
third of the drivers didn't implement the get_eld() callback.

Most of the issues can be solved if drm_connector handles
hdmi-audio-codec on its own, delegating functionality to the actual
implementation, be it a driver that implements drm_connector or
drm_bridge.

Implement such high-level framework, adding proper support for Audio
InfoFrame generation to the LT9611 driver.

Several design decisions to be kept in mind:

- drm_connector_hdmi_codec is kept as simple as possible. It implements
  generic functionality (ELD, hotplug, registration).

- drm_hdmi_connector sets up HDMI codec device if the connector
  is setup correspondingly (either I2S or S/PDIF is marked as
  supported).

- drm_bridge_connector provides a way to link HDMI audio codec
  funcionality in the drm_bridge with the drm_connector_hdmi_codec
  framework.

- It might be worth reverting the no_i2s_capture / no_spdif_capture
  bits. Only TDA889x driver sets them, while it's safe to assume that
  most of HDMI / DP devices do not support ARC / capture. I think the
  drivers should opt-in capture support rather than having to opt-out of
  it.

This series is in the RFC stage, so some bits are underdocumented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Use drm_atomic_get_old_connector_for_encoder in atomic_disable() to
  prevent it from crashing
- Reworked HDMI codec init/exit, removing drmm_ calls (Maxime)
- Drafted the helper to be called from .detect_ctx() that performs HDMI
  Connector maintenance duties (Maxime)
- Moved no_capture_mute to struct hdmi_codec_pdata
- Link to v1: https://lore.kernel.org/r/20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org

---
Dmitry Baryshkov (7):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI codec helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement connector update functions
      drm/bridge_connector: hook __drm_atomic_helper_connector_hdmi_update_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 170 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 160 ++++++++++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  56 +++++++
 drivers/gpu/drm/drm_connector.c                    |  10 ++
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 186 +++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h                     |   5 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 include/drm/drm_bridge.h                           |  23 +++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 24 files changed, 601 insertions(+), 136 deletions(-)
---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

