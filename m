Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDEAB0EF48
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527EF10E799;
	Wed, 23 Jul 2025 10:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aF8oG2GF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDA310E78C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:51 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A78C5F06;
 Wed, 23 Jul 2025 12:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1753265112;
 bh=Xc+qT2XQjEkYeWWEXGGWk/XOfjaEnBSg823/HrVp0v4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aF8oG2GF200u4HlLCmle9UZm93z+3lNEG/3gOBDfpS+leSKjEwnMdEyGr/Grqe2RS
 WtJp4F7QAxiDTBoMAhwaypxAeLEmg3mspLt73tsSwaIgDqMjOJcD4j3gLaWuWljAqe
 TJRBHGNSVQbJ4ofECPReQAdrCwEHbRIjMyKOtqcM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 23 Jul 2025 13:05:17 +0300
Subject: [PATCH v5 11/15] drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-cdns-dsi-impro-v5-11-e61cc06074c2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Xc+qT2XQjEkYeWWEXGGWk/XOfjaEnBSg823/HrVp0v4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBogLPtNazPSbQ5KpE3M+6zEt/M6XZbg5m3Yefhq
 qf4Qd41bDCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaICz7QAKCRD6PaqMvJYe
 9U35EACXI0Z3p/DF0JFrEZbdyogW0eK8s1n4cQdf4cM9+c3Es3LV+L0muS/5NKMC5O3eLh2xxjk
 vameoiILDZGFDMRD5QILgdQs1dUzl6jIYptjTe22j9sDPXmz33WEBYi0n0z/2lHMnkJwPTe+Tpi
 tn34Rf4xcFGahLdpjwWQ5AxSHHkhnkMenuQY2VVSOts0Uhm5MZoQtupQXdPQxlBxjyqMzsc2sTR
 PYI6QmB0ba8BPa4Mv5otq0NG9CrpiWKU4CUvdE9HAQMDsPsQlL7u2upPhdmU7gU51w+vK36yBLe
 mQPrTxvormuvNeJl/uxubHLJ0l27DXTFWq/WySFIuKxE7WUBKe6xcUGeiLcxSZZd1Joj4IpPkOo
 6/lphWtI1xrkKFnNouFOSsce7OuDyd2Bq4O8zpixDfd8jowVG/lTXiFq0l8v3EswXBFuIlPGYV2
 dg+BY4yIAREtJT1JsRHo+soUey4i/038geEOgCEUH54PuISCfV09dCBYkGvrhItky9gTTWM9pgO
 clhPqLLINeXXBKFmHkDhXwrYQHHp3Dk7Fhto7AKtRsMJW2Mvd19H2AjTPs38NTm+5cyFlFSOMsp
 8lJC+XDg49oizu6q5ym+AkFzbqRzIznt8FJ8T2YDDP1Va+lwFywL4qIGASQ5h0oDLXxIRrZdJdG
 Rhy5bOCQUUW6x3Q==
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

The driver tries to calculate the value for REG_WAKEUP_TIME. However,
the calculation itself is not correct, and to add on it, the resulting
value is almost always larger than the field's size, so the actual
result is more or less random.

According to the docs, figuring out the value for REG_WAKEUP_TIME
requires HW characterization and there's no way to have a generic
algorithm to come up with the value. That doesn't help at all...

However, we know that the value must be smaller than the line time, and,
at least in my understanding, the proper value for it is quite small.
Testing shows that setting it to 1/10 of the line time seems to work
well. All video modes from my HDMI monitor work with this algorithm.

Hopefully we'll get more information on how to calculate the value, and
we can then update this.

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index d49b4789a074..6bc0a0d00d69 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -793,7 +793,13 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
 					    phy_cfg->hs_clk_rate);
-	reg_wakeup = (phy_cfg->hs_prepare + phy_cfg->hs_zero) / tx_byte_period;
+
+	/*
+	 * Estimated time [in clock cycles] to perform LP->HS on D-PHY.
+	 * It is not clear how to calculate this, so for now,
+	 * set it to 1/10 of the total number of clocks in a line.
+	 */
+	reg_wakeup = dsi_cfg.htotal / nlanes / 10;
 	writel(REG_WAKEUP_TIME(reg_wakeup) | REG_LINE_DURATION(tmp),
 	       dsi->regs + VID_DPHY_TIME);
 

-- 
2.43.0

