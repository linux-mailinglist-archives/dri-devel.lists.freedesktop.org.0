Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A224DB0EF49
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD52810E79A;
	Wed, 23 Jul 2025 10:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xtq+tOdu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B92110E793
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:46 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59BA811EB;
 Wed, 23 Jul 2025 12:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1753265107;
 bh=GKcU1UDIh+qNv6o0wu+RLbDsP2jO/MtpcsqLrcqVXJU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Xtq+tOduJR8iGODWJ2SARLbVYE5At9AIhgY7+mn6vEX8J9eJKIQP9HEfDKkgsSnYF
 FsqENAEn8OQpBRYn/s6/28wvcU49K4l2FTg0J7ZwaYDTmKV/9b1kSPXPo51q7CjZQX
 vNB24CWA2rA9ywDxCnDlQS3SwM5QxBiJTXds44zs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 23 Jul 2025 13:05:13 +0300
Subject: [PATCH v5 07/15] drm/bridge: cdns-dsi: Drop checks that shouldn't
 be in .mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-cdns-dsi-impro-v5-7-e61cc06074c2@ideasonboard.com>
References: <20250723-cdns-dsi-impro-v5-0-e61cc06074c2@ideasonboard.com>
In-Reply-To: <20250723-cdns-dsi-impro-v5-0-e61cc06074c2@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GKcU1UDIh+qNv6o0wu+RLbDsP2jO/MtpcsqLrcqVXJU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBogLPrXDOKTajwpiWsvJg/fjW9aMV6vKjSC5ngs
 N8WHfpn9tmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaICz6wAKCRD6PaqMvJYe
 9eXDD/wNul3Vpi6+NHNqLrIHcNuGnMTOhgLHR+YpIOHcI+zK7IecB24a7nc4srlTZtnhsp0SlNE
 StA6bcE95ADqqltoPyK49R2Xyh5Yi/lBhDMsdnPslIq5c/KGNTkjO941Z0NDINCAnNNr4ugeV7A
 d1r8yRRnsa2ZUuOVL+TsVWU6MwwfQPGcEzc6HktEuTG5NyDAlBnGDLW9FqQZRem9SoaOJWxZIg3
 s+aOwFJFE+HhivjWkyAmqrf3fF8XpQn+XsaW/SH2S/VwtBUlda9SUkeeQG9HIx90vra/FIcEpqA
 eP9b4+dX2Itdd+LpLnEAT3+qXcEOEOK7UTMr1fL77g4I2txOr8lSJo1YNG2hkay2IWERlv4gTTU
 TvVNVKIF3Ri3/J4rHVkU9BySBP41S334VK8+oRyyjeLY65Tk17QiivokJh5rYtadsjYGy0fIKW3
 zy5fD0nmzzrAKVkS4GkUbGZlov8ob6NGkn01tVcjybQ2UrkbKxmlG337OLkaEq0DoBxgmWBo8Qf
 VK9qqfwQwMmOQ644yUrlw11rODFyKlroHFbx+wLnBnMLLU8AH9+HI1pRBOUDSDwyQI0R9w6VBrM
 UtMPAWWz8vG/AEz2JzWvNx/I3qpF5V4gcdR5uODq24lU1cSZeCAM0KI2XJx8n3LoH7CBx3hnB45
 ljaYeCttdHMWoqQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The docs say about mode_valid():

"it is not allowed to look at anything else but the passed-in mode, and
validate it against configuration-invariant hardware constraints"

We're doing a lot more than just looking at the mode. The main issue
here is that we're doing checks based on the pixel clock, before we know
what the pixel clock from the crtc actually is.

So, drop the cdns_dsi_check_conf() call from .mode_valid().

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 000c5a2367fe..b2b6529b1c70 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -603,8 +603,7 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_output *output = &dsi->output;
-	struct cdns_dsi_cfg dsi_cfg;
-	int bpp, ret;
+	int bpp;
 
 	/*
 	 * VFP_DSI should be less than VFP_DPI and VFP_DSI should be at
@@ -622,10 +621,6 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if ((mode->hdisplay * bpp) % 32)
 		return MODE_H_ILLEGAL;
 
-	ret = cdns_dsi_check_conf(dsi, mode, &dsi_cfg);
-	if (ret)
-		return MODE_BAD;
-
 	return MODE_OK;
 }
 

-- 
2.43.0

