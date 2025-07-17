Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CFB0969A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 23:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD1910E8C0;
	Thu, 17 Jul 2025 21:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OphxI+Ei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C26510E8C0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752789487;
 bh=O/kg8t7MbHfNbrdP/cpMCUGufZfwNutHBitrbX/Jpvw=;
 h=From:To:Cc:Subject:Date:From;
 b=OphxI+EiEn+9nNY0msGSfG6PqqLFEHg5J7zuWeL+r4TD2cnc1/PEu3GpskO+iYEVK
 dx0jMfMQnMGfXCW9OTXooWn0GnfFz/CB+CE3n3ajW6zgW/Xx4RfgG3fKYSJkAbAj9r
 cuZfKrYhSeuVQ18ZVMcvMVYmrJvlJRPLOTsj9o3jEiCkiXToIZ9ssoelcjtWnSsoHy
 u8wC1vxpmMzPSpMroNiHmB3N2ib9pZWsUq6Y2ffVguvhoZl1g8R0HqWQIRtnx2AZEh
 iiJPgCLdHUZK4eGvGsQEaQmqMtSSdv9vYlwmMBItJFPgEuXQRGBwdMVdgrhVpyJVoF
 ozgo5u1LhXRhw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D495D17E1324;
 Thu, 17 Jul 2025 23:58:03 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Raag Jadav <raag.jadav@intel.com>, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, kernel@collabora.com
Subject: [PATCH 0/3] Clean some logs on rockchip hdmi audio
Date: Thu, 17 Jul 2025 17:56:17 -0400
Message-ID: <20250717215620.288651-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

HDMI audio is showing lots of logs, particularly when HDMI is
disconnected.

It doubled on RK3588 with the addition of the second HDMI TX port, so
clean it up to avoid missing important log lines.

Detlev Casanova (3):
  drm/bridge: dw-hdmi-qp: Return 0 in audio prepare when disconnected
  ASoC: hdac_hdmi: Use dev_info on invalid ELD version
  drm/bridge: synopsys: Do not warn about audio params computation

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 5 ++---
 sound/soc/codecs/hdac_hdmi.c                 | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.50.1

