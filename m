Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D008B0969B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 23:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342510E8C1;
	Thu, 17 Jul 2025 21:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Op51+9z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24F810E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 21:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752789490;
 bh=MpnLCBk/z6fk9C4FatnsuMYJlg8KasyNf221+sK6I1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Op51+9z5d5GqRGudh44ZP6IOiW0kiMFdowhA9L2S2s9wFqcvH/rp9sB6KPDJBm0U7
 IuHGMUnuw9GUNABGypcY1Th7fFKzgSpvinihXQteyggcZOyJg58aIJllc7NfPmc5W7
 P2zxmeH00tOFQkjuuQk5zf9MjCwDGciEwAriSVarS+56YpNCXjmkicpN9stVTH4t5H
 nhWNQfvuJMPCQCgUAuqzs1ajET7BwLxxoLtgZ+BDUIlXj3DZ9QruVv97Zzq2lhSKVe
 kV7aBFCpa5o6rtbruOZYzp8oQq1SA26UC2jL2KCBSwLPbkSeLQS86Egi5Kk82t8kb6
 2o4XXKbaeXPpg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 68CF617E132A;
 Thu, 17 Jul 2025 23:58:07 +0200 (CEST)
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
Subject: [PATCH 1/3] drm/bridge: dw-hdmi-qp: Return 0 in audio prepare when
 disconnected
Date: Thu, 17 Jul 2025 17:56:18 -0400
Message-ID: <20250717215620.288651-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717215620.288651-1-detlev.casanova@collabora.com>
References: <20250717215620.288651-1-detlev.casanova@collabora.com>
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

To configure audio registers, the clock of the video port in use must be
enabled.
As those clocks are managed by the VOP driver, they can't be enabled here
to write the registers even when the HDMI cable is disconnected.

Furthermore, the registers values are computed from the TMDS char rate,
which is not available when disconnected.

Returning -ENODEV seemed reasonable at first, but ASoC will log an error
multiple times if dw_hdmi_qp_audio_prepare() return an error.
Userspace might also retry multiple times, filling the kernel log with:

hdmi-audio-codec hdmi-audio-codec.0.auto: ASoC error (-19): at snd_soc_dai_prepare() on i2s-hifi

This has become even worse with the support of the second HDMI TX port.

Activating the clocks to write fake data (fake because the TMDS char
rate is unavailable) would require API changes to communicate between
VOP and HDMI, which doesn't really make sense.

Using a cached regmap to be dumped when a cable is connected won't work
because writing order is important and some data needs to be retrieved
from registers to write others.

Returning 0 to silently fail sounds like the best and simplest solution.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 5e5f8c2f95be1..7d3d7b5084c8d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -459,7 +459,7 @@ static int dw_hdmi_qp_audio_prepare(struct drm_connector *connector,
 	bool ref2stream = false;
 
 	if (!hdmi->tmds_char_rate)
-		return -ENODEV;
+		return 0;
 
 	if (fmt->bit_clk_provider | fmt->frame_clk_provider) {
 		dev_err(hdmi->dev, "unsupported clock settings\n");
-- 
2.50.1

