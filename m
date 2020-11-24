Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA972C2646
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461086E427;
	Tue, 24 Nov 2020 12:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228856E420
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:48:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmU5l123878;
 Tue, 24 Nov 2020 06:48:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222110;
 bh=Tu73si6Rn61aSIZMNLbrDV73nhKDiA3zzoX99G39TS8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=aiWIApQWMw3XoyVyMa+WC/gdHb+riG38EV0pmWFmJ27g6KeyNbiGxcNtFNlTE8H/k
 GgXFQ8piDITUYrTvUf4FIQmvUHFw+20IanWrwpfUpUz6VU3rpl7XG3XG730hCDFsJD
 nifxEqTin2oT6L+lTKQTu63cOHLQ2aXKT0lb+zz8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmUbm109305
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:48:30 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:29 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmps040922;
 Tue, 24 Nov 2020 06:48:27 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 65/80] drm/omap: dsi: skip dsi_vc_enable_hs when already in
 correct mode
Date: Tue, 24 Nov 2020 14:45:23 +0200
Message-ID: <20201124124538.660710-66-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify and optimize dsi_vc_enable_hs() so that it can be called
without checking the current HS/LP mode. Make dsi_vc_enable_hs() return
if the VC is already in the correct mode.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 4ac82166edc3..c3f13226ac26 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -341,7 +341,6 @@ struct dsi_data {
 	int irq;
 
 	bool is_enabled;
-	bool in_lp_mode;
 
 	struct clk *dss_clk;
 	struct regmap *syscon;
@@ -2441,6 +2440,9 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
 
 	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", vc, enable);
 
+	if (REG_GET(dsi, DSI_VC_CTRL(vc), 9, 9) == enable)
+		return;
+
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	dsi_vc_enable(dsi, vc, 0);
@@ -2456,8 +2458,6 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
 	/* start the DDR clock by sending a NULL packet */
 	if (dsi->vm_timings.ddr_clk_always_on && enable)
 		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
-
-	dsi->in_lp_mode = !enable;
 }
 
 static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
@@ -4886,9 +4886,7 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
 	struct omap_dss_device *dssdev = &dsi->output;
 	int r;
 
-	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode)
-		dsi_vc_enable_hs(dssdev, vc,
-				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
+	dsi_vc_enable_hs(dssdev, vc, !(msg->flags & MIPI_DSI_MSG_USE_LPM));
 
 	switch (msg->type) {
 	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
