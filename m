Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010A80F48B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 18:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A38D10E645;
	Tue, 12 Dec 2023 17:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5727810E152
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 17:27:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6Wx-0001uO-KM; Tue, 12 Dec 2023 18:26:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6Ww-00FOPJ-Ja; Tue, 12 Dec 2023 18:26:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6Ww-001nbc-AC; Tue, 12 Dec 2023 18:26:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 2/5] drm/meson: Simplify usage of clk_rate_exclusive_get()
Date: Tue, 12 Dec 2023 18:26:39 +0100
Message-ID: <c39cc382fcceca0166440367307260c10de7200d.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=lLn3GpEtn8Cldb1t/gKKd7hxYx+CsmdNoorQTl0ii64=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBleJfPh1ko5EuKFkzhis18D1Q6ufxw2cmlRezUb
 e1bX4MJFxWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXiXzwAKCRCPgPtYfRL+
 TuuXCACFYHK5vepI6H1w3vCAtGF3mzbvZvEHD9O6QgdN21YNyyRm5kW1ZmKRVDiiOabTVbvn6i/
 r39UlcJB9fpR9+HopiUwEA+e8cmJF/6TfvG29AVvfxpEVBVhrXHQJo6JB6n9Z7ccemj7jxMIMit
 x/3W3JwISr2aymfEcfTrFnnxdK9bAnqa0w2zs+NcKeIGn4CX8sQzvf2FjdUTFHHvBXjBOns7g+C
 UHEn7VB/4ZkwXr9AbvUSPgxMkgDDm+JDoabKjzRVViZ0D2F0FmFBjDRHKlUgtSXA1J8bZ0fVtGM
 5pVKd7TqH5FT6GXCnpqsgghJkyVfCpitvxCNhlgib/X06l7P
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clk_rate_exclusive_get() returns 0 unconditionally. So remove error
handling. This prepares making clk_rate_exclusive_get() return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

btw, the driver fails to call clk_rate_exclusive_put() in the error
paths of dw_mipi_dsi_phy_init().

Best regards
Uwe

 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index a6bc1bdb3d0d..49571f1ed88a 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -88,15 +88,9 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 	}
 
 	/* Make sure the rate of the bit clock is not modified by someone else */
-	ret = clk_rate_exclusive_get(mipi_dsi->bit_clk);
-	if (ret) {
-		dev_err(mipi_dsi->dev,
-			"Failed to set the exclusivity on the bit clock rate (ret %d)\n", ret);
-		return ret;
-	}
+	clk_rate_exclusive_get(mipi_dsi->bit_clk);
 
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
-
 	if (ret) {
 		dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rate %u (%d)\n",
 			mipi_dsi->mode->clock * 1000, ret);
-- 
2.42.0

