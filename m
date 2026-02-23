Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKSnEPMpnGl1AAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D9174BF3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CF610E2E1;
	Mon, 23 Feb 2026 10:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="uSM6qThO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF28010E2E0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1771842029; x=1803378029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XGUvf+KenQzk8k4vozQBvoxGs/tTB8x65xysSNH3uRc=;
 b=uSM6qThOtu8f6za+GXZW4gfDMCqwWTrsbepnS13RT3vvk2v6zFf7bWIr
 VVAg1wQryb+b5FFLNu/i9XDSdHXK4VfsfP5L67dKHKUO2IdK8eIidc4fO
 ElsCHqNYfw6WvuZdzywjqNPPWp36hfEINF/c4mVt/Nhshim1OOGGQHQQ0
 iABb5aXR/TH3hI7QfJ8GIU9HDdlKpUPlCVoO90ZAus09c7eVyO05aEL/d
 //yYrz8KL9Yqbhc2KsBF8FkZuqupwS3RGzDN/6AoTLU+SbboTWsqSGkHy
 j/APUh4jGyGTMw1D68kcjR74bxVyAWz2cryvAdM1PQBX5Opy2bSdMknfR w==;
X-CSE-ConnectionGUID: xLxJrVz4SA+TZ2kb8t2UqQ==
X-CSE-MsgGUID: d6Eg9STLReWgxqckjEf6tw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; d="scan'208";a="220994672"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:20:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 03:20:00 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:19:54 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>
Subject: [PATCH v3 2/4] drm: atmel-hlcdc: configure LVDS PLL clock rate for
 LVDS Displays
Date: Mon, 23 Feb 2026 15:49:18 +0530
Message-ID: <20260223101920.284697-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223101920.284697-1-manikandan.m@microchip.com>
References: <20260223101920.284697-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:lee@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:manikandan.m@microchip.com,m:dharma.b@microchip.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,microchip.com,bootlin.com,tuxon.dev,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AC4D9174BF3
X-Rspamd-Action: no action

From: Dharma Balasubiramani <dharma.b@microchip.com>

As per datasheet, The LVDS PLL clock runs at 7 times the
panel pixel clock.
Set the LVDS PLL clock to eliminate the need of assiging
them in the DT and fallback to sys_clk for non-LVDS displays
with proper error handling.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Rephrase commit message and comment block

Changes in v2:
- Rephrase commit message and comment block
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 36 ++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index b075f291847f..26c9fbdfd871 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -100,7 +100,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		drm_connector_list_iter_end(&iter);
 	}
 
-	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		ret = clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
 	if (ret)
 		return;
 
@@ -187,7 +190,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
 			   cfg);
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
 }
 
 static enum drm_mode_status
@@ -243,7 +249,11 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 				    10, 1000))
 		drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+
 	pinctrl_pm_select_sleep_state(dev->dev);
 
 	pm_runtime_allow(dev->dev);
@@ -256,15 +266,33 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 {
 	struct drm_device *dev = c->dev;
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
+	struct drm_display_mode *adj = &c->state->adjusted_mode;
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	unsigned int status;
+	int ret;
 
 	pm_runtime_get_sync(dev->dev);
 
 	pm_runtime_forbid(dev->dev);
 
 	pinctrl_pm_select_default_state(dev->dev);
-	clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+
+	/*
+	 * Set LVDS PLL clock rate (7x pixel clock) if available
+	 */
+	if (crtc->dc->hlcdc->lvds_pll_clk) {
+		ret = clk_set_rate(crtc->dc->hlcdc->lvds_pll_clk,
+				   (adj->clock * 7000));
+		if (ret) {
+			drm_err(dev, "Failed to set LVDS PLL clk rate: %d\n", ret);
+			return;
+		}
+		ret = clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+	} else {
+		ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+	}
+	if (ret)
+		return;
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_PIXEL_CLK);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
-- 
2.25.1

