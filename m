Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E1FA6AABE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E09D10E663;
	Thu, 20 Mar 2025 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RKH8u5aS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C7110E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:38 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE90D146B;
 Thu, 20 Mar 2025 16:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486333;
 bh=3CN4uj1iCwxXdJquhx40R2NHzb/pS+FOmacXJwz76L8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RKH8u5aSXVWsTLqp/iq+B2eLlGuIKtp8yp6U8d9FdFOWASpbjUHjrHLqHbSitf13P
 ACOJSC1bGA2okVuZQOt/zqy6jTFhkE4W35LsmBV2w0t6dz/pGrYD4C0/iaB0eCAU96
 Li151bvaXHLJIBmy2f8ssdfo5zyXtTmXO9MD2vgQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Mar 2025 18:00:01 +0200
Subject: [PATCH 06/18] drm/bridge: cdns-dsi: Adjust mode to negative syncs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-cdns-dsi-impro-v1-6-725277c5f43b@ideasonboard.com>
References: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
In-Reply-To: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3CN4uj1iCwxXdJquhx40R2NHzb/pS+FOmacXJwz76L8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3DuYyWm6CSFiIS3732epB8+j6o1f/O1a2vr9q
 I8LpGvZRp6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7mAAKCRD6PaqMvJYe
 9RGwD/9Qoue7FFcb2i00+wCg7odetrkFYOyeaQHLPdbNDLKZk/WvAoAgmExwsuKA75iHSToZIHT
 wtbt+HK1lSzRyzJiiHD53qzqdmcEilVvroRWPXszOSiqNkGZX+vgK1IW2OR2wuPYWuVelmYP7Q9
 E2NUB+Iv1l/0jFV5nxRrxxadhwxPCwlAvV3VLuKPdIbPfQGi5pQXuDlRTRrRFpJ9cxqDLS6P8Dg
 jrn0DbByZPGh78x4i8DAIHhoHr//yxkL58FM/GPHB8ZiZ8QHZrwYLkB0pTZ5jdNoYS1Lo60Qtg/
 pjY4/sih/rgu36wcpTWvQjsiU0n0TkIbCfnvON1eK+DtMX+E79X2D5ipqg3RYbPPIWyuqMIJNmA
 kwgJcV+EAaHEaXMSTa38ZeZuf8PglWSOXzjQZhQojFR3qTJsukMCHJI8lqTLuFpOMUvLropA2p6
 k89FXwEg5BuWw9Am4QJt3Xc7F0A9NvFX+wqWMf5d9L5IW9CkoCuRvRYlu1MI4TBBy8oGDPvXMwN
 84GFr6sJQ4EQqpXlGU1/9NVZ0J5IjCGn6PbWMJls1Z3sUzoMDTvOXVnaLY3IoVvD95HMRJvleBF
 P08a+5NTQtp6a346g1+szlRa8czlRaiL9D83lxz79+qM7gHGNog5bpC3fUCFjccrpp8PBE54nJ3
 HzU7PtRpKTK8gbA==
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 8a320bd4d34d..53322407c1b0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -992,6 +992,11 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
 	const struct drm_display_mode *mode = &crtc_state->mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
+	struct drm_display_mode *adjusted_crtc_mode = &crtc_state->adjusted_mode;
+
+	/* cdns-dsi requires negative syncs */
+	adjusted_crtc_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	adjusted_crtc_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
 
 	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
 }

-- 
2.43.0

