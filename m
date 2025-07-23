Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC124B0EF43
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EB110E796;
	Wed, 23 Jul 2025 10:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dKWk08SQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8910E794
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:50 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BDE51733;
 Wed, 23 Jul 2025 12:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1753265111;
 bh=BrIsZY7PNeailKwzMPwyX4UVV3ZOBX2nZ4UDWTTe6Zs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dKWk08SQQRbx7shGYW18DfnydlpqVcdCBcISFL88SxC+Jpp72zjdJBAkQBykLjSG6
 p7SNfaqYlfGvu+pRI9R01D4EBymMcNK1pPxFDcLNurZeiptx3kDpZ1wqZn3L6KZOPT
 0yTm+qE5tOVR59F2NrZ8mpV447g2Hb5w+1NG/VhM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 23 Jul 2025 13:05:16 +0300
Subject: [PATCH v5 10/15] drm/bridge: cdns-dsi: Adjust mode to negative syncs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-cdns-dsi-impro-v5-10-e61cc06074c2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BrIsZY7PNeailKwzMPwyX4UVV3ZOBX2nZ4UDWTTe6Zs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBogLPscCoAuwajUn2NN5f7RfvfrQq2bchc1EgAb
 aUXF1Bd6g2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaICz7AAKCRD6PaqMvJYe
 9UEBD/4jCgkBMOcT6LN6eNoYdt8E6YjbnhYxs9n1s5bVd7ihVrU7yvCIUf4mgUt76VvMxw0w22n
 YaFcI96dDz+ZrY+efGkDBCXCnQKKvMDhqA+jAUCrtyjL6Hur2mlFzAsnb6YSEmLW35dzGPFXT72
 tUFhBUc9c5vTURqLMXGd3frgTn+VTlOczs/ASDetnWVwVeblUDPJl5Caq+alRVZei6UR6KCFiNL
 X7VqsN5vfWFahRAFqgCZk+JbPxR3A0+ixxgCNtrH+FRMoBJSZidp4JwBrp8UdzJYwPU4ZKeYfF/
 hBztx0Ew/IqM2SpkW58DSzh4bROaJHQG1SDC/JAWPXfpq5q4dHmojkwUjO2uk6rJoyb5Y8/tDG/
 cYQ6bbuj8zgtUNmVD9Cbc8M9vchV59hf/JOrvVv8HjDv3m9LmAplwvGhEPADMeJWxXLOHVrzGGN
 +H87rfLbtn3TAdtcMZOjnmNWGj71hOB2/ywg34ST88pBDCtX8M6BkAqSQB/P/9gguGRCWs9zS2r
 ZX8wz5mJSBaoDi3f2oMLptxXdYFDIbs693UVaGXaJKNmMeOaZzpoX7NUx5DkAmbfySS12xY557M
 6nZLOU9N5ky35neRsyYSNBEHOAqI2QwGppt1Kw2tf4idH9EixQjbrvrc1dNks6PME24UcRqu9A2
 qsDnKImp/kaYftA==
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

The Cadence DSI requires negative syncs from the incoming video signal,
but at the moment that requirement is not expressed in any way. If the
crtc decides to use positive syncs, things break down.

Use the adjusted_mode in atomic_check to set the sync flags to negative
ones.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index f7d7d277367e..d49b4789a074 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -908,9 +908,13 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
-	const struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
 
+	/* cdns-dsi requires negative syncs */
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	adjusted_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
+
 	return cdns_dsi_check_conf(dsi, adjusted_mode, dsi_cfg);
 }
 

-- 
2.43.0

