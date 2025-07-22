Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68693B0E472
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C956110E707;
	Tue, 22 Jul 2025 19:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Kepk5EVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFFD10E706
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753214095;
 bh=I7PZbKqL4kwtVAmBKVfDZdnaU2GuujBflmjQGhxXSaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kepk5EVGVHqu4n9LHGOJrKdeNWiJUdTRWXGWtrruzydHc9+vlx8TzNmMg5gxZoJ32
 kUDf6aOe6gNvzbppm9qDFamWSxUvo/loiqxgGP5vsBbdx46oVsOFdzwqsyzJBtvTVr
 Uc1zLxe/D39R/uUv+O1fNbrFtkV6puB7AY9VARApdxr8RCDc1pW0zOAuJzWx46qT6l
 D20UjQs1HFM1Jt2RPlXQXXxVVxZ953lFPBTN9O+8kGmHFqninrKBbL+NgmK6TRh/08
 ptMph/fD3acESRN1HQwqM5rCpiR0jtLdpPdlrTDAsLE5Li24aiORyr1N3QKn53VQjf
 m0ag2VHwh1iAg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 59E1D17E0497;
 Tue, 22 Jul 2025 21:54:52 +0200 (CEST)
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
Subject: [PATCH v2 3/3] drm/bridge: synopsys: Do not warn about audio params
 computation
Date: Tue, 22 Jul 2025 15:54:37 -0400
Message-ID: <20250722195437.1347865-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722195437.1347865-1-detlev.casanova@collabora.com>
References: <20250722195437.1347865-1-detlev.casanova@collabora.com>
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

There is no need to warn about non pre-computed values, just change it to
dbg.

Fixes: fd0141d1a8a2 ("drm/bridge: synopsys: Add audio support for dw-hdmi-qp")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 9b9d43c02e3a5..d974bcad8f94a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -276,8 +276,7 @@ static unsigned int dw_hdmi_qp_find_n(struct dw_hdmi_qp *hdmi, unsigned long pix
 	if (n > 0)
 		return n;
 
-	dev_warn(hdmi->dev, "Rate %lu missing; compute N dynamically\n",
-		 pixel_clk);
+	dev_dbg(hdmi->dev, "Rate %lu missing; compute N dynamically\n", pixel_clk);
 
 	return dw_hdmi_qp_compute_n(hdmi, pixel_clk, sample_rate);
 }
-- 
2.50.1

