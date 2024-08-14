Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB4952132
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 19:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405D10E4F7;
	Wed, 14 Aug 2024 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="XkJFtD1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1436 seconds by postgrey-1.36 at gabe;
 Wed, 14 Aug 2024 11:01:46 UTC
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B73710E3AB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 11:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References; bh=8phpuiSof5rMSznwRec8HdGorNFfCz+rTFjE5R8oajk=; b=Xk
 JFtD1gQDKI9kJuhDiD0QfQ1EG47w+G9KIji92E/YbWWBlsubmgQSRfBD/RQExMJjPvyCAaj3b7FOb
 Q566Mc0t2C2K/PbSenHCZ3rIb5jzR4PgYu/X25CQL33om9S7+ry92G7Ez/ts1/pGi/ZXtaw3VoCYv
 NAhirZ3ksgN/6gFJdA/l8Hx1JBxMMjrSbwYWPs3xiiiknEe41dFlN/JB4S7Ov+itRazGGGUkbrQKZ
 TY1aoVbITxi2X2STpxwxZ1efSPZWGobjSLmuRwnufLxv+bT6RWsCOVNsSI+wC8rzwK5+uy7ye0c99
 tQGSL3Zdo2v9OYIhRtMAx2qq3Cs938lQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1seBNl-0007uf-Fu; Wed, 14 Aug 2024 12:37:33 +0200
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <esben@geanix.com>) id 1seBNk-000Ke4-2h;
 Wed, 14 Aug 2024 12:37:33 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 14 Aug 2024 12:37:26 +0200
Subject: [PATCH] drm/bridge: nwl-dsi: Use vsync/hsync polarity from display
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-nwl-dsi-sync-polarity-v1-1-ee198e369196@geanix.com>
X-B4-Tracking: v=1; b=H4sIAOWIvGYC/x3MSQqAMAxA0atI1gYcUhCvIi5KGzVQqjTigHh3i
 8u3+P8B5SSs0BcPJD5EZY0ZdVmAW2ycGcVnQ1M1VHU1YTwDehXUOzrc1mCT7Dd670xHrbHkCHK
 7JZ7k+r/D+L4fcX8yEGcAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723631852; l=2368;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=/ben4x4Lt7ar33USmuN4cvpXOjmOGf5LZVeZmW7Ul58=;
 b=5lZFs/bcJBod73IHhPaK12LCIwYp19NdB2uj04v5OIa0czZT8x+qy/rqRL5P8u4gs8rxgyL0B
 RgKDLjqJOGqBIRNfMjs2jsBLwEUVcyyw3IO78v84Xg/hlvtHP6Nnj32
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27367/Wed Aug 14 10:36:34 2024)
X-Mailman-Approved-At: Wed, 14 Aug 2024 17:32:02 +0000
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

Using the correct bit helps. The documentation specifies bit 0 in both
registers to be controlling polarity of dpi_vsync_input and
dpi_hsync_input polarity. Bit 1 is reserved, and should therefore not be
set.

Tested with panel that requires active high vsync and hsync.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 8 ++++----
 drivers/gpu/drm/bridge/nwl-dsi.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 8d54091ec66e..5f05647a3bea 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -289,13 +289,13 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 
 	nwl_dsi_write(dsi, NWL_DSI_INTERFACE_COLOR_CODING, NWL_DSI_DPI_24_BIT);
 	nwl_dsi_write(dsi, NWL_DSI_PIXEL_FORMAT, color_format);
-	/*
-	 * Adjusting input polarity based on the video mode results in
-	 * a black screen so always pick active low:
-	 */
 	nwl_dsi_write(dsi, NWL_DSI_VSYNC_POLARITY,
+		      dsi->mode.flags & DRM_MODE_FLAG_PVSYNC ?
+		      NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH :
 		      NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW);
 	nwl_dsi_write(dsi, NWL_DSI_HSYNC_POLARITY,
+		      dsi->mode.flags & DRM_MODE_FLAG_PHSYNC ?
+		      NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH :
 		      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
 
 	burst_mode = (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.h b/drivers/gpu/drm/bridge/nwl-dsi.h
index a247a8a11c7c..61e7d65cb1eb 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.h
+++ b/drivers/gpu/drm/bridge/nwl-dsi.h
@@ -30,11 +30,11 @@
 #define NWL_DSI_PIXEL_FORMAT			0x20c
 #define NWL_DSI_VSYNC_POLARITY			0x210
 #define NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW	0
-#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
+#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
 
 #define NWL_DSI_HSYNC_POLARITY			0x214
 #define NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW	0
-#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
+#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
 
 #define NWL_DSI_VIDEO_MODE			0x218
 #define NWL_DSI_HFP				0x21c

---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240814-nwl-dsi-sync-polarity-ddc58435a4c4

Best regards,
-- 
Esben Haabendal <esben@geanix.com>

