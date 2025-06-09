Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3FAD2A06
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7D310E43E;
	Mon,  9 Jun 2025 22:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZNtnQrOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985EA10E23B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so1798011f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509809; x=1750114609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3xOeds+e5+RUK0oXx221BrZtaCkjbV0tCtryTi4uI0=;
 b=ZNtnQrOtbEYRXObxAioauJ464GEhFhlE0wNDtB3qBA4lbC+HzpaxDm9wy8RY6bGebE
 HlK/qCjtWENcy1g40voOTlwZWZ3R93pKrlzUhYgqGHXOVf2cXHFFtj6yuBMGYAdxuDZp
 nWjrMvVJ0nOa0i7An9EE0h29Ajpi13C+CqbXXDM63eWCYEr++yFAorxwwRylh9ccCIbH
 0KyYnFQtwmnnyYfTOLRb7dL2VFjhu3OSQRlfEYKXZqAyJLzyV1UvF/034xbhIuB0bg0R
 SDltCISJa249M8twt6wjniUd9bFdBoXHu+MFAd+hFel8FZZGcCOXONBik954W84MmZXS
 4AYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509809; x=1750114609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3xOeds+e5+RUK0oXx221BrZtaCkjbV0tCtryTi4uI0=;
 b=iFp/fB/sDGejBCR5dfV7MYENGTkLwAoM20VqXWPQC42OWy0f7PSXbWx2EC7dE33CSU
 n75Pn8Z1xNFwmMTQAwMBU/9v8FZoeu9u9L88Ht00JX2hSoHAAY0qerpwjEColK2AdQHx
 ILJDBRBeC2zd/Jzjed5z0aJDFfLWEB7eSmQYguuCVBZKStKPsBwMgQiLdenFSDxc+HKm
 87wbltDsrnAexvdR0PvlGN0M97zJ0f8WYYQQE2BtrzFHl4E7VwBAwje6PE53tHusx94g
 MQs2QPWWcdVBTO9rnnENwY+d/bZ74yv0C2aQYEWUb5KPRctef+v6eDvBA2gJbaMMycrb
 vhXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsDcV2vWI42F4nmIy4D85EV7d+o2i9D42w/tKrfyHFL6yQxMvlyoUAWS7RMym4V0Ly+VUIycH+eJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc2fSloL7pDy67pOWP3h3P7/j2rTgapyxtpe47nZGr29EaAK8q
 Rgs9OQ0EDY3aKzF7JO+rhjjMuXWscTqxWn3tw3CBMn7TTd7fFeMFBIC/
X-Gm-Gg: ASbGncsxWdXoJ9tc8+s8hNLip2NLTDOg0aiDYBVEoNY2poMHh4eVHgt0KP4eVZiK7EV
 QBZ+7T5/28dAdxFWSy32N7HfaY0rL556BAOczsOr9fZ8MMaxZKQs5njhaX1tHy+Ua0TS65zVTI0
 6mKwwbNFxMopdEqfYG74mEs7r3PaFhtw7hW0WSCoiiXMPGJ75F2Y9bxdWlq/PTjRNujq5stnTdW
 U2rm0Q0dvN9ARZ5RJcmrJnwgzMnrv6qOU7f7dVjcU9IReM2uMWZXu2CGDlNjw4oQMzxZDxka7lX
 tLLjcccPDRNlmSz7dNkxq6r2byxwe0Q+8PR93aGwPxdy7AF4ga8lpHAzunQSnUNVGdoi31tRPWv
 pANkjoMFNVGTSfpM5W/Q=
X-Google-Smtp-Source: AGHT+IF5mSTH57XsvDyXNsjHm2N3BWjfBcPLa8JEprNT7tBtnARyEqIaWzrSanPnpXoM54jQUty70Q==
X-Received: by 2002:a05:6000:4284:b0:3a4:f510:fa77 with SMTP id
 ffacd0b85a97d-3a531cb7e8cmr11188076f8f.29.1749509809051; 
 Mon, 09 Jun 2025 15:56:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 3/9] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ
 calculation
Date: Mon,  9 Jun 2025 23:56:24 +0100
Message-ID: <20250609225630.502888-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
VCLK rate instead of the mode clock. The relationship between HSCLK and
VCLK is:

    vclk * bpp <= hsclk * 8 * lanes

Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
HSFREQ accurately reflects the clock rate set in hardware, leading to
better precision in data transmission.

Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
when computing `hsfreq`. Also, update unit conversions to use correct
scaling factors for better clarity and correctness.

Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
threshold comparisons to use Hz instead of kHz to ensure correct behavior.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- Stored frequency in Hz
- Added Reviewed-by from Laurent

v5->v6:
- Dropped parentheses around the calculation of `hsfreq_max`.
- Changed dev_info() to dev_dbg

v4->v5:
- Added dev_info() to print the VCLK rate if it doesn't match the
  requested rate.
- Added Reviewed-by tag from Biju

v3->v4:
- Used MILLI instead of KILO

v2->v3:
- No changes

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 40 +++++++++++--------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 7fa5bb2a62b6..b08274e5dfcf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -11,6 +11,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -18,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -85,7 +87,7 @@ struct rzg2l_mipi_dsi_timings {
 
 static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	{
-		.hsfreq_max = 80000,
+		.hsfreq_max = 80000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 13,
@@ -99,7 +101,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 125000,
+		.hsfreq_max = 125000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 12,
@@ -113,7 +115,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 250000,
+		.hsfreq_max = 250000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 12,
@@ -127,7 +129,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 360000,
+		.hsfreq_max = 360000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 10,
@@ -141,7 +143,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 720000,
+		.hsfreq_max = 720000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 9,
@@ -155,7 +157,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 1500000,
+		.hsfreq_max = 1500000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 9,
@@ -268,7 +270,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq;
+	unsigned long hsfreq, vclk_rate;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -280,6 +282,16 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 dsisetr;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	clk_set_rate(dsi->vclk, mode->clock * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	if (vclk_rate != mode->clock * KILO)
+		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			mode->clock * KILO, vclk_rate);
+
 	/*
 	 * Relationship between hsclk and vclk must follow
 	 * vclk * bpp = hsclk * 8 * lanes
@@ -291,13 +303,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = mode->clock * bpp / dsi->lanes;
-
-	ret = pm_runtime_resume_and_get(dsi->dev);
-	if (ret < 0)
-		return ret;
-
-	clk_set_rate(dsi->vclk, mode->clock * 1000);
+	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
 	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
 	if (ret < 0)
@@ -315,12 +321,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * - data lanes: maximum 4 lanes
 	 * Therefore maximum hsclk will be 891 Mbps.
 	 */
-	if (hsfreq > 445500) {
+	if (hsfreq > 445500000) {
 		clkkpt = 12;
 		clkbfht = 15;
 		clkstpt = 48;
 		golpbkt = 75;
-	} else if (hsfreq > 250000) {
+	} else if (hsfreq > 250000000) {
 		clkkpt = 7;
 		clkbfht = 8;
 		clkstpt = 27;
@@ -942,7 +948,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

