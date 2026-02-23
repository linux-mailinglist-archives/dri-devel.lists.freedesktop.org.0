Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LarFecpnGl1AAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A950174BBE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF65910E2DC;
	Mon, 23 Feb 2026 10:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="YlkMoh8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B9510E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1771842019; x=1803378019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SlO0Q8vJ+yci4yGpTaLDlVlevoqk4pzFvMHvGyAYDTE=;
 b=YlkMoh8hjzH6zBINYhcuEmjAoa5Op7a9ZjqO3CBea8CuQ+mPE3e6p2IP
 4a2Te37ahHd3JFFsXzm7uHCHn5fghX7F7JU4OVWJnnDyk1ZAG1HvGmgVj
 HJcewuEgi6HcPTmuAJNAKoShS3zOrSVl++KDEdYFDq/Ty3xCG6130XNLV
 7zZqeIduJE1N4cr35kVX3WaTzfp8U2V3VyLI/RIUtX4J1uw0IsAJiMsv8
 9CLpyLc11Jdoyttb2mRHZgXMcq+yXd8cunNkiyZxWkndGWLNWLF8lvGKv
 EEA18X3pW+jc38vH5ZaPktciFUc0rMVuuqVgZPdKZpSxcPvoBH/Hfw6Bi A==;
X-CSE-ConnectionGUID: dKUGnVN8SY6a+wGmQv7obw==
X-CSE-MsgGUID: By9YC4OeSqy+Ol2Ny+ULhg==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; d="scan'208";a="220994662"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2026 03:20:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Feb 2026 03:20:04 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:20:00 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 3/4] drm: atmel-hlcdc: bypass clock divider for LVDS
 displays
Date: Mon, 23 Feb 2026 15:49:19 +0530
Message-ID: <20260223101920.284697-4-manikandan.m@microchip.com>
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
	FORGED_SENDER(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,microchip.com,bootlin.com,tuxon.dev,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:lee@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:manikandan.m@microchip.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0A950174BBE
X-Rspamd-Action: no action

For LVDS displays with pre-configured PLL clock, bypass the clock
divider calculation by setting ATMEL_XLCDC_CLKBYP flag.
For non-LVDS displays, retain existing clock divider calculation logic
to determine appropriate clock scaling based on display requirements.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v3:
- Introduce ATMEL_XLCDC_CLKBYP to this series
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 65 ++++++++++---------
 include/linux/mfd/atmel-hlcdc.h               |  1 +
 2 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 26c9fbdfd871..73ac5ebbe121 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -127,39 +127,44 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		     (adj->crtc_hdisplay - 1) |
 		     ((adj->crtc_vdisplay - 1) << 16));
 
-	prate = clk_get_rate(crtc->dc->hlcdc->sys_clk);
-	mode_rate = adj->crtc_clock * 1000;
-	if (!crtc->dc->desc->fixed_clksrc) {
-		prate *= 2;
-		cfg |= ATMEL_HLCDC_CLKSEL;
-		mask |= ATMEL_HLCDC_CLKSEL;
-	}
+	if (crtc->dc->hlcdc->lvds_pll_clk) {
+		cfg |= ATMEL_XLCDC_CLKBYP;
+		mask |= ATMEL_XLCDC_CLKBYP;
+	} else {
+		prate = clk_get_rate(crtc->dc->hlcdc->sys_clk);
+		mode_rate = adj->crtc_clock * 1000;
+		if (!crtc->dc->desc->fixed_clksrc) {
+			prate *= 2;
+			cfg |= ATMEL_HLCDC_CLKSEL;
+			mask |= ATMEL_HLCDC_CLKSEL;
+		}
 
-	div = DIV_ROUND_UP(prate, mode_rate);
-	if (div < 2) {
-		div = 2;
-	} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
-		/* The divider ended up too big, try a lower base rate. */
-		cfg &= ~ATMEL_HLCDC_CLKSEL;
-		prate /= 2;
 		div = DIV_ROUND_UP(prate, mode_rate);
-		if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
-			div = ATMEL_HLCDC_CLKDIV_MASK;
-	} else {
-		int div_low = prate / mode_rate;
-
-		if (div_low >= 2 &&
-		    (10 * (prate / div_low - mode_rate) <
-		     (mode_rate - prate / div)))
-			/*
-			 * At least 10 times better when using a higher
-			 * frequency than requested, instead of a lower.
-			 * So, go with that.
-			 */
-			div = div_low;
-	}
+		if (div < 2) {
+			div = 2;
+		} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
+			/* The divider ended up too big, try a lower base rate. */
+			cfg &= ~ATMEL_HLCDC_CLKSEL;
+			prate /= 2;
+			div = DIV_ROUND_UP(prate, mode_rate);
+			if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
+				div = ATMEL_HLCDC_CLKDIV_MASK;
+		} else {
+			int div_low = prate / mode_rate;
+
+			if (div_low >= 2 &&
+			    (10 * (prate / div_low - mode_rate) <
+			     (mode_rate - prate / div)))
+				/*
+				 * At least 10 times better when using a higher
+				 * frequency than requested, instead of a lower.
+				 * So, go with that.
+				 */
+				div = div_low;
+		}
 
-	cfg |= ATMEL_HLCDC_CLKDIV(div);
+		cfg |= ATMEL_HLCDC_CLKDIV(div);
+	}
 
 	if (connector &&
 	    connector->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index 07c2081867fd..19504d3ea12c 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -44,6 +44,7 @@
 #define ATMEL_XLCDC_HEO_UPDATE		BIT(3)
 
 #define ATMEL_HLCDC_CLKPOL		BIT(0)
+#define ATMEL_XLCDC_CLKBYP		BIT(1)
 #define ATMEL_HLCDC_CLKSEL		BIT(2)
 #define ATMEL_HLCDC_CLKPWMSEL		BIT(3)
 #define ATMEL_HLCDC_CGDIS(i)		BIT(8 + (i))
-- 
2.25.1

