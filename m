Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDNmDx6Ph2kzZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:14:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E150106F13
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76FA10E2B0;
	Sat,  7 Feb 2026 19:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="KaBmOFSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B05B10E2B0
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 19:14:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 3D0B82640E;
 Sat,  7 Feb 2026 20:14:32 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiqnB6U-bqwI; Sat,  7 Feb 2026 20:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1770491671; bh=Pw14T46YMvFwxGmDTs4+fN6NLezp7je2HTGomFtgE/k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=KaBmOFSS3pohHwo8NL9SvAs+l3g3N/2sJoFru1ZQIi/JZ0pgRyG/djTPHn8+OcpPE
 FW2ErdYn9YWSPEi38AnbBm2YuB5Cgo4vOaFCKo3HBhNIBTSPhwbgFzYpLDB9ZTZofK
 lJyoscYGXeo+sYyiUSrVTw1rTTaP2OwxKl4Xh1gQxajZS/yG+ebs0ifbcm2r59s0yy
 XSdisrZt/X65FOTBwRacNQBlsLCdDzd3J/FevSzIS29LTB2giyEb9WGmSWCo5j7mKu
 ISV/xhm5pjyIRHOrdNbXIyFtlLRS3OXZlZrw1LztEHdVE48LdzFNdiNJQAOe6+0kmA
 SgoGIISuOerTQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 08 Feb 2026 00:43:59 +0530
Subject: [PATCH v2 2/2] drm/bridge: samsung-dsim: use DSIM interrupt to
 wait for PLL stability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-exynos-dsim-fixes-v2-2-a857e8130a2a@disroot.org>
References: <20260208-exynos-dsim-fixes-v2-0-a857e8130a2a@disroot.org>
In-Reply-To: <20260208-exynos-dsim-fixes-v2-0-a857e8130a2a@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
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
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:kauschluss@disroot.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[kauschluss@disroot.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.935];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,samsung.com:email,disroot.org:email,disroot.org:dkim,disroot.org:mid]
X-Rspamd-Queue-Id: 9E150106F13
X-Rspamd-Action: no action

Stabilizing PLL needs to be waited for. This is done using a loop,
checking the PLL_STABLE bit in the status register.

DSIM fires an interrupt when the PLL is stabilized. Rely on this
functionality for stabilization wait, getting rid of the implicit loop.

This has been tested on a Galaxy J6 (Exynos 7870). Unfortunately, since
testing on all supported devices is less feasible, introduce a stop-gap
measure where the timeout has a gracious lower bound of 100
microseconds. This will (hopefully) prevent regressions due to timeout
on other devices.

Suggested-by: Inki Dae <inki.dae@samsung.com>
Link: https://lore.kernel.org/r/CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 41 +++++++++++++++++++++++------------
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 70f8946ad3b24..0ca6c6484c9a6 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -17,6 +17,7 @@
 #include <linux/export.h>
 #include <linux/irq.h>
 #include <linux/media-bus-format.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -788,7 +789,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	unsigned long fin, fout;
-	int timeout;
+	unsigned int timeout;
 	u8 p, s;
 	u16 m;
 	u32 reg;
@@ -849,19 +850,26 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	if (dsi->swap_dn_dp_data)
 		reg |= DSIM_PLL_DPDNSWAP_DAT;
 
+	/*
+	 * The PLL_TIMER value is the product of the timeout delay and the APB
+	 * bus clock rate. Calcutate the timeout delay on-the-fly here.
+	 * It is assumed that the bus clock is the first clock in the provided
+	 * bulk clock data.
+	 */
+	timeout = 100;
+	fin = clk_get_rate(dsi->driver_data->clk_data[0].clk) / HZ_PER_MHZ;
+	if (fin)
+		timeout = max(dsi->driver_data->reg_values[PLL_TIMER] / fin,
+			      timeout);
+
+	reinit_completion(&dsi->pll_stabilized);
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 3000;
-	do {
-		if (timeout-- == 0) {
-			dev_err(dsi->dev, "PLL failed to stabilize\n");
-			return 0;
-		}
-		if (driver_data->has_legacy_status_reg)
-			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
-		else
-			reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
-	} while ((reg & BIT(driver_data->pll_stable_bit)) == 0);
+	if (wait_for_completion_timeout(&dsi->pll_stabilized,
+					usecs_to_jiffies(timeout))) {
+		dev_err(dsi->dev, "PLL failed to stabilize\n");
+		return 0;
+	}
 
 	dsi->hs_clock = fout;
 
@@ -1596,8 +1604,12 @@ static irqreturn_t samsung_dsim_irq(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
-			DSIM_INT_PLL_STABLE)))
+	if (status & DSIM_INT_PLL_STABLE) {
+		complete(&dsi->pll_stabilized);
+		return IRQ_HANDLED;
+	}
+
+	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
 		return IRQ_HANDLED;
 
 	if (samsung_dsim_transfer_finish(dsi))
@@ -2146,6 +2158,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi);
 
 	init_completion(&dsi->completed);
+	init_completion(&dsi->pll_stabilized);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 03005e474704b..e3433da21ad08 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -123,6 +123,7 @@ struct samsung_dsim {
 	int state;
 	struct drm_property *brightness;
 	struct completion completed;
+	struct completion pll_stabilized;
 
 	spinlock_t transfer_lock; /* protects transfer_list */
 	struct list_head transfer_list;

-- 
2.52.0

