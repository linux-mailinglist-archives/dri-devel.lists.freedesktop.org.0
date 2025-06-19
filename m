Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EFCAE05AF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D025310EA13;
	Thu, 19 Jun 2025 12:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h1PsZA+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC7310EA13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:27:46 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B378346;
 Thu, 19 Jun 2025 14:27:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750336047;
 bh=8ADD2Yq9A6k/GyHmSj98rzZgb1fTetvWsVEiXh3yKRk=;
 h=From:Date:Subject:To:Cc:From;
 b=h1PsZA+sgy3SWm6BNrvShv6M55fGt0ESk8StihbTrtaF5xEjFoqTHVbucHBFPMsWy
 yXcc/bIgHDO37EKBvTknp0NMljvvPHXYBHpPJsz1oubsqKyVISyhdR63COIsWtJRDU
 IYuHkn2ZCpW82a6jQefkYkywrfDrb3/gmFLpYCs4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 19 Jun 2025 15:27:18 +0300
Subject: [PATCH] drm/bridge: samsung-dsim: Fix init order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIACUCVGgC/x2MQQqAIBAAvxJ7bkELQ/tKdBDdbA9ZuBRB9Pek4
 wzMPCBUmATG5oFCFwvvuYJuGwirz4mQY2XoVGfUoB2K3+TMCaPwhgvfaGywFKx2PTmo2VGo6n8
 5ze/7AYKYwEZiAAAA
X-Change-ID: 20250619-samsung-dsim-fix-58c8ec8193e9
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hiago De Franco <hiagofranco@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4233;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=8ADD2Yq9A6k/GyHmSj98rzZgb1fTetvWsVEiXh3yKRk=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGhUAjijfeICgyXX1z6oMncQ9XfnYenwgyEn+2KBCFJ7TNKtv
 okCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJoVAI4AAoJEPo9qoy8lh71P70P/2VT
 sZ8iuOPaKUFXvcfz+P11XAvAUWbvedf9y5pRfyNvGhSuenxGAeFIlpGGWX8DznwSaWxEPIZI3kd
 8VVO2EUYiM3cHTLXAX5yhgQ7Ps2RH7GcTTqowFvSAbQMVrSr+jnsphZyQ/n6WyT5Hx/gXCEWDWv
 oH6zrlo/B6hLhCDaOxWSPJKNszWwXYWub4LhCcWEblGHFk7Qk7hhfuGWhmmUIhEP++3CkEA07mk
 YcLoq9COAv4CoA90yhiRLXHXh545eZ7mNTTcItxqHYmicNVcoQG5EVFsdm+HJQ7i3EuJgTVTjJY
 Q3eZqGyeNeqaJOXXlvIDtmmcjdOMycj6Rk0rg4P1byDQJFJc0vvC6U7T2hThffk+6jqG6ETNIwG
 K3gRxo+OygZ1r2jiYn92FJPKMmoiC5UjkGV54qIHyYsEa0u4xiaJ5QUP1AKK6FePAIaCbxNWAQ2
 x9t3QoSnbZrViuiZzV/KRBSf5XixDIUz0gMC3auucd5ENg4VFabs+UBePKsaKTgCTZJsDtFMjL5
 r4mMOvUg54OjcBdpeO/IVOcEd8w7y5q1IqGA6ktJ/SUCHYkE49ezzid6Uy+FkIUwz9bwWZsMeSe
 WKVxt/6uRJbB3q9puT5XzjgolxO+/dblS8gyAJ/N+BGrns8f7osh5mtC3vYa+pMY+FWZVB7ckNt
 73p60
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

The commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
pre-enable and post-disable") changed the order of enable/disable calls.
Previously the calls (on imx8mm) were:

mxsfb_crtc_atomic_enable()
samsung_dsim_atomic_pre_enable()
samsung_dsim_atomic_enable()

now the order is:

samsung_dsim_atomic_pre_enable()
mxsfb_crtc_atomic_enable()
samsung_dsim_atomic_enable()

On imx8mm (possibly on imx8mp, and other platforms too) this causes two
issues:

1. The DSI PLL setup depends on a refclk, but the DSI driver does not
set the rate, just uses it with the rate it has. On imx8mm this refclk
seems to be related to the LCD controller's video clock. So, when the
mxsfb driver sets its video clock, DSI's refclk rate changes.

Earlier this mxsfb_crtc_atomic_enable() set the video clock, so the PLL
refclk rate was set (and didn't change) in the DSI enable calls. Now the
rate changes between DSI's pre_enable() and enable(), but the driver
configures the PLL in the pre_enable().

Thus you get a black screen on a modeset. Doing the modeset again works,
as the video clock rate stays the same.

2. The image on the screen is shifted/wrapped horizontally. I have not
found the exact reason for this, but the documentation seems to hint
that the LCD controller's pixel stream should be enabled first, before
setting up the DSI. This would match the change, as now the pixel stream
starts only after DSI driver's pre_enable().

The main function related to this issue is samsung_dsim_init() which
will do the clock and link configuration. samsung_dsim_init() is
currently called from pre_enable(), but it is also called from
samsung_dsim_host_transfer() to set up the link if the peripheral driver
wants to send a DSI command.

This patch fixes both issues by moving the samsung_dsim_init() call from
pre_enable() to enable().

However, to deal with the case where the samsung_dsim_init() has already
been called from samsung_dsim_host_transfer() and the refclk rate has
changed, we need to make sure we re-initialize the DSI with the new rate
in enable(). This is achieved by clearing the DSIM_STATE_INITIALIZED
flag and uninitializing the clocks and irqs before calling
samsung_dsim_init().

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Reported-by: Hiago De Franco <hiagofranco@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f2f666b27d2d..cec383d8946d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1473,22 +1473,31 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
-
-	/*
-	 * For Exynos-DSIM the downstream bridge, or panel are expecting
-	 * the host initialization during DSI transfer.
-	 */
-	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
-		ret = samsung_dsim_init(dsi);
-		if (ret)
-			return;
-	}
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
 				       struct drm_atomic_state *state)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	int ret;
+
+	/*
+	 * The DSI bridge may have already been initialized in
+	 * samsung_dsim_host_transfer(). It is possible that the refclk rate has
+	 * changed after that due to the display controller configuration, and
+	 * thus we need to reinitialize the DSI bridge to ensure the correct
+	 * clock settings.
+	 */
+
+	if (dsi->state & DSIM_STATE_INITIALIZED) {
+		dsi->state &= ~DSIM_STATE_INITIALIZED;
+		samsung_dsim_disable_clock(dsi);
+		samsung_dsim_disable_irq(dsi);
+	}
+
+	ret = samsung_dsim_init(dsi);
+	if (ret)
+		return;
 
 	samsung_dsim_set_display_mode(dsi);
 	samsung_dsim_set_display_enable(dsi, true);

---
base-commit: 7872997c048e989c7689c2995d230fdca7798000
change-id: 20250619-samsung-dsim-fix-58c8ec8193e9

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

