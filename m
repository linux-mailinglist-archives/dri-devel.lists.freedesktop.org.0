Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806E886AAD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 11:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EAF10F20A;
	Fri, 22 Mar 2024 10:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="EGI2bvKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E84010F322
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=J9CuZ33LUi+k6FzE7felhvKpLH81dmZUIoVLkX9iVZc=; b=EGI2bvKt0dsRuvymeSTE44Lu0C
 0dY91Sy6D7CK+hkso1Zc+qs3iwd2r8eSK48LENFGHkTjwZdiDjZ7+yx1AoUVhC8q4hBiCAQkWYbJS
 wrH8OKsCg1NdlTi8egsT96mJyYWS0/3XkZPGHG4VbD7NBE6KryqudkAty571UJoz6tja6gOdhzyAD
 DTwM0GQRaQ5+SFWH9dHvORKJ+nk8wsCixkvZPLOlUSYF5gOLnXG0lTt+lktVXLkCRIdlPXLUbtfid
 fmUSGQg7AtwpXEUZbt4c+zts15I1jhjPAhRro7UEeVSvRQvnY87RDefXL6XnST34mgRnqWsG4aYcI
 DySFbOHw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1rncRL-000B01-On; Fri, 22 Mar 2024 11:47:59 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1rncRK-00G8Yg-1h;
 Fri, 22 Mar 2024 11:47:58 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Robert Foss <rfoss@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Sean Nyekjaer <sean@geanix.com>, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/stm: dsi: relax mode_valid clock tolerance
Date: Fri, 22 Mar 2024 11:47:31 +0100
Message-ID: <20240322104732.2327060-1-sean@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27222/Fri Mar 22 09:30:59 2024)
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

When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
to reguire the requested and the actual px clock to be within
50Hz. A typical LVDS display requires the px clock to be within +-10%.

In case for HDMI .5% tolerance is required.

Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mode_valid()")
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index d5f8c923d7bc..97936b0ef702 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 	return 0;
 }
 
-#define CLK_TOLERANCE_HZ 50
-
 static enum drm_mode_status
 dw_mipi_dsi_stm_mode_valid(void *priv_data,
 			   const struct drm_display_mode *mode,
@@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
 		/*
 		 * Filter modes according to the clock value, particularly useful for
 		 * hdmi modes that require precise pixel clocks.
+		 * Check that px_clock is within .5% tolerance.
 		 */
-		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
-		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
+		if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000) ||
+		    px_clock_hz > mult_frac(target_px_clock_hz, 1005, 1000))
 			return MODE_CLOCK_RANGE;
 
 		/* sync packets are codes as DSI short packets (4 bytes) */
-- 
2.44.0

