Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEUdFgSec2lgxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A477831C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4112E10EB2B;
	Fri, 23 Jan 2026 16:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Twb4JfBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DC710EB3B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:12:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 510651A2A47;
 Fri, 23 Jan 2026 16:12:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 249FF60760;
 Fri, 23 Jan 2026 16:12:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AEE8B119A87C6; Fri, 23 Jan 2026 17:12:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RJmCdmjf1cJp6uWKepJHYg4mCo27O3rNk6xDNkv07d0=;
 b=Twb4JfBze6+mFfHizOX3E8cstyYuXpP6snj4cffFXs2VJ5pCKQ6DHODQ+2JJWCBSaVKUpX
 CP0/tFbx9PGLnUjPWTLQ1HdvmhlISygUHNfq8inlrth2ufEhpKpHC/pfQ1DxC+lN7iVEz1
 NElYp+y5z+Slie583kR9zvXLrHrFFGq9kbiQKQWQ8Ei0gwF7cTnfyOzPh3xuGpXzmiE/QR
 AZ3D9EErJWDkz7pMdq4M0RDAJ8U3uA9vzkK+tuurf9GqrWwBokAxYQt0K24WE6DfwLz+MQ
 3gM9PkmBV7oSrgbr56XZrc1Y3ctu0riCPwiBtaq7kI6qkYriWCNcm0jJsLaoBg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:21 +0100
Subject: [PATCH v5 03/25] drm/tilcdc: Remove simulate_vesa_sync flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-3-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: E1A477831C
X-Rspamd-Action: no action

The tilcdc hardware does not generate VESA-compliant sync signals. It
aligns the vertical sync (VS) on the second edge of the horizontal sync
(HS) instead of the first edge. To compensate for this hardware
behavior, the driver applies a timing adjustment in mode_fixup().

Previously, this adjustment was conditional based on the simulate_vesa_sync
flag, which was only set when using external encoders. This appears
problematic because:

1. The timing adjustment seems needed for the hardware behavior regardless
   of whether an external encoder is used
2. The external encoder infrastructure is driver-specific and being
   removed due to design issues
3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
   may not be getting the necessary timing adjustments

Remove the simulate_vesa_sync flag and apply the VESA sync timing
adjustment unconditionally, ensuring consistent behavior across all
configurations. While it's unclear if the previous conditional behavior
was causing actual issues, the unconditional adjustment better reflects
the hardware's characteristics.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Only few board currently use tilcdc not associated to a bridge like the
am335x_evm or the am335x-evmsk.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 16 ----------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |  2 --
 drivers/gpu/drm/tilcdc/tilcdc_external.c |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 52c95131af5af..b06b1453db2dd 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -47,9 +47,6 @@ struct tilcdc_crtc {
 
 	struct drm_framebuffer *next_fb;
 
-	/* Only set if an external encoder is connected */
-	bool simulate_vesa_sync;
-
 	int sync_lost_count;
 	bool frame_intact;
 	struct work_struct recover_work;
@@ -642,11 +639,6 @@ static bool tilcdc_crtc_mode_fixup(struct drm_crtc *crtc,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
 {
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-
-	if (!tilcdc_crtc->simulate_vesa_sync)
-		return true;
-
 	/*
 	 * tilcdc does not generate VESA-compliant sync but aligns
 	 * VS on the second edge of HS instead of first edge.
@@ -866,14 +858,6 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 	tilcdc_crtc->info = info;
 }
 
-void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
-					bool simulate_vesa_sync)
-{
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-
-	tilcdc_crtc->simulate_vesa_sync = simulate_vesa_sync;
-}
-
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 58b276f82a669..3aba3a1155ba0 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -160,8 +160,6 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
 void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 		const struct tilcdc_panel_info *info);
-void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
-					bool simulate_vesa_sync);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
 void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 3b86d002ef62e..da755a411d9ff 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -80,7 +80,6 @@ int tilcdc_add_component_encoder(struct drm_device *ddev)
 		return -ENODEV;
 
 	/* Only tda998x is supported at the moment. */
-	tilcdc_crtc_set_simulate_vesa_sync(priv->crtc, true);
 	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_tda998x);
 
 	return 0;

-- 
2.43.0

