Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA26ADE799
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E17810E7E7;
	Wed, 18 Jun 2025 09:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T3iYIrar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F3510E7E1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:59:43 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998761C0A;
 Wed, 18 Jun 2025 11:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750240769;
 bh=J+6mryuTRX2gB2Rgwr5vt3wvRXw/gjqeHL//L5Wxqhg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=T3iYIrar75xKvopy8iyPp682uIw3x4Y9FogbGQ7mismuvIRBMulfwMqJVHPZey7wE
 HHB93oOnGr6PgCJO3BzEKv+hbejUqy9sBhW/llHyDHBuVfdani2k7VEO8BVLD6nwlh
 U5pWGxOFQoZfc5sGY4s90fApu92lDoThyFgMVhUI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:11 +0300
Subject: [PATCH v4 08/17] drm/bridge: cdns-dsi: Remove broken fifo emptying
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-8-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=J+6mryuTRX2gB2Rgwr5vt3wvRXw/gjqeHL//L5Wxqhg=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGhSjf+jRxOSwxnZRMFSceTkzN1h9dgwbT4lCoGBjujnNms6U
 4kCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJoUo3/AAoJEPo9qoy8lh71lpwQAIfJ
 VrMy5bauKUmd9xIUo0jiekemLRGhuaztMb+is2MO0QH8ErEsgc0IMiM8XMVtkq5Ca1FqOlwT8KB
 zkzM/10coueclGz+Z0zx/GW8Y18RBO7gtoysWorMmMt+ifiBAl0juBpPExXr9/UOp6ENDK0pe/Q
 2Xp1yoTtxe9p+2KgVO3EC+RFU31r/62bX3YqOL8D+w3BgJ/vv4ajN8jJqBwcXG0JsLfG+nG06zM
 6m12aWPYwhdLcN3xEboR6Y+eitY4Us7sBnpjbeJj1+DhgWZsFe37m2kYGKeP65M0a0MuKMZqdYv
 dPRWbg20uLx1dafO2ovAWvzsDvHijyqlHfX1DxMFKbMqJj4QOgqrXQAHlYsBA4xWFVAxyAFjcVy
 qzvYtrjs4Dk7xGtLkWTtYBjL7oK67BlLdpiP3UF3fvxIQNLj9i/uy2LHFFfRtDfbVT9CggJSdyR
 hNbURV9cqIix4TYLxRMhD/AbHpiqUHzKkfg/P5m7ZzwRmmDnohil5BXBi2pWEQfxh6uYKtATlO9
 lui7zCmOPxb3nEuAu4jGtcdYrjAicjEDzOU0gyVMRmG2UYzSHe5o+NONbVNwTIBHAjT5MnvlpfF
 XBSXj0/Jw656GXz3n3llzxTKb9UVJihrZD5vP6vmbOGttmQtN3jGboqSlXzFNM1IEoXTqK/b4IU
 AH279
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

The driver checks if "DPI(HFP) > DSI(HSS+HSA+HSE+HBP)", and rejects the
mode if not.

However, testing shows that this doesn't hold at all. I can set the hfp
to very small values, with no errors. The feedback from the HW team also
was that the check is not right, although it's not clear if there's a
way to validate the FIFO emptying.

The check rejects quite a lot of modes, apparently for no good reason,
so drop the check.

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index eae9469ef431..000c5a2367fe 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -553,7 +553,6 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
-	unsigned long dsi_hss_hsa_hse_hbp;
 	unsigned int nlanes = output->dev->lanes;
 	int ret;
 
@@ -575,20 +574,6 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
-	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
-
-	/*
-	 * Make sure DPI(HFP) > DSI(HSS+HSA+HSE+HBP) to guarantee that the FIFO
-	 * is empty before we start a receiving a new line on the DPI
-	 * interface.
-	 */
-	if ((u64)phy_cfg->hs_clk_rate *
-	    (mode->hsync_start - mode->hdisplay) * nlanes <
-	    (u64)dsi_hss_hsa_hse_hbp * mode->clock  * 1000)
-		return -EINVAL;
-
 	return 0;
 }
 

-- 
2.43.0

