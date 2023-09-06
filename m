Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC879359F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9B310E56E;
	Wed,  6 Sep 2023 06:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4945810E565
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 06:51:28 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 159893F1;
 Wed,  6 Sep 2023 08:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693983000;
 bh=9+YwYctXLvEJs60zHSY6wyocIempjTo8N/jz3tZYYWs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CxVNxPU10s7DOQfefseCeLnJm0SCXvAjr3ovcET/0Zh2SIq6xdpO17VynY9LdDbCu
 W2rK2DwkCwffnVhnlp0L6sAUoXLrY5utWGBd5mNxeOmdeQmOODjErufYsH8QwoCPkJ
 3d1ihI/TdxyViHY+dSKOSluLfLstYNbombmvfPKM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Sep 2023 09:50:48 +0300
Subject: [PATCH v4 01/12] drm/tegra: rgb: Parameterize V- and H-sync polarities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-tc358768-v4-1-31725f008a50@ideasonboard.com>
References: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
In-Reply-To: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5+8Qt0dRuDZPu87i9IUGZHmIGywuwwho4mCUeHWUimE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk+CFo42NyY3wZOfzyAaJpXzsTa8M/eIixjIMdf
 P0mGzr/tDeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZPghaAAKCRD6PaqMvJYe
 9eGcD/98GTtyDMsinnUuVZ0ttkVS66umqHonmBjmpb9xvv2Ssu5eGmbc5OCNcrkvNqeS/+M16Cp
 fRwUjK3o1H6oKYsEJ6Z7J2/d1CYd1t0wZTDdRIPylE6zWRhT3oOOsbcANVH1k3xg+0gVu7Pla+c
 5tZzEFHKn9zRGMfpdZ8YVohQEU6VyMA5N9CNfZDl5vsGcz4a7HvXRdvtRvsKyrHI4xJv19c8WvV
 B9bxI9tcFl2/xJbriJIIdnt3oeIildyiG4IV+LOM1docg0EvykYFVMUYVfG51pDGTjzxPfF0M6z
 KQkJulnX9qbW7Qpi/NQzMugLvO9aqSX4sCCkghwjvIdb/pUQbDPuCfL4IVYbNS3FjhrM9U91Lqm
 4ZoXeK/bXkOKKrTVTxdNWRKxGVJf6zNrKXDY3lC3y6yjRxa0343Z+GbiqlDAPoEav4lvfksmPd0
 FerZv0sWtjQENxJHB3VNGfngtNzGyG/g/8Vx4mXEI67Ai6cfXpnNyvK34gTETP4A5Rwl549MVdU
 tZNpUi2RQeBnN/osasFp+UZwDjNYjnvK9YOfMMgdfPbBz2fJnVoYz43H8qRbehJGKgSyEWw60yj
 cbtTG3zGIubB2LzUDFI/TpgW9k2pMU/tYikmalRft/biRwJFZlt4Sg6r5P06qpfIqc/MPOnRzor
 jMcK1CbHPBt/8mQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The polarities of the V- and H-sync signals are encoded as flags in the
display mode, so use the existing information to setup the signals for
the RGB interface.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
[tomi.valkeinen@ideasonboard.com: default to positive sync]
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tegra/rgb.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 79566c9ea8ff..fc66bbd913b2 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -99,6 +99,7 @@ static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
 
 static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 {
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 	u32 value;
@@ -108,10 +109,19 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* XXX: parameterize? */
+	/* configure H- and V-sync signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
-	value &= ~LVS_OUTPUT_POLARITY_LOW;
-	value &= ~LHS_OUTPUT_POLARITY_LOW;
+
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		value |= LHS_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LHS_OUTPUT_POLARITY_LOW;
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		value |= LVS_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LVS_OUTPUT_POLARITY_LOW;
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	/* XXX: parameterize? */

-- 
2.34.1

