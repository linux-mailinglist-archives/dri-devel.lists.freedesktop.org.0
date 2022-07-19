Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BF5794EA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE86811A1E7;
	Tue, 19 Jul 2022 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B200911A1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:09:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26J88pDS051052;
 Tue, 19 Jul 2022 03:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658218131;
 bh=YCb88AcpzpvVessHArv3TeJJ9EKUR80VGhAnkSZpiNE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=alHDgU3AjKEHFQcAHJLT8IwCSsXwiv0ls2mu0XbGxnKZoYDpoz48g64dGnIfCwmBT
 8cg4gujHay2ZTGWUW21mCVh44Zqy+C5UHQLVYada/J+HawJNym3anpG7GsNo6ANze0
 Pfzxc5QTHG6nWsiJvjVXxCcE0/x5qekRxxZJ9/hQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26J88pWC091745
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jul 2022 03:08:51 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 03:08:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 03:08:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26J88oH4020158;
 Tue, 19 Jul 2022 03:08:50 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/8] drm/tidss: Add support for DSS port properties
Date: Tue, 19 Jul 2022 13:38:40 +0530
Message-ID: <20220719080845.22122-4-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220719080845.22122-1-a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support to enable and read the dss port properties.

The "ti,oldi-mode" property indicates the tidss driver how many OLDI
TXes are enabled as well as which mode do they need to be connected in.

The "ti,rgb565_to_888" is a special property that forces the DSS to
output 16bit RGB565 data to a 24bit RGB888 bridge. This property can be
used when the bridge does not explicity support RGB565.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 55 ++++++++++++++++++++++++++---
 drivers/gpu/drm/tidss/tidss_dispc.h |  8 +++++
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index f084f0688a54..add725fa682b 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -348,6 +348,10 @@ struct dispc_device {
 
 	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
 
+	enum dss_oldi_modes oldi_mode;
+
+	bool rgb565_to_888;
+
 	u32 *fourccs;
 	u32 num_fourccs;
 
@@ -2718,6 +2722,42 @@ static void dispc_softreset(struct dispc_device *dispc)
 		dev_warn(dispc->dev, "failed to reset dispc\n");
 }
 
+static void dispc_get_port_properties(struct dispc_device *dispc)
+{
+	u32 i = 0;
+	struct device_node *dss_ports, *vport;
+
+	dss_ports = of_get_next_child(dispc->dev->of_node, NULL);
+
+	for_each_child_of_node(dss_ports, vport) {
+		if (dispc->feat->vp_bus_type[i] == DISPC_VP_OLDI) {
+			if (of_property_read_u32(vport, "ti,oldi-mode", &dispc->oldi_mode)) {
+				dev_dbg(dispc->dev, "%s: Using OLDI defaults on vp%d.\n",
+					__func__, i);
+				if (dispc->feat->subrev == DISPC_AM65X)
+					dispc->oldi_mode = OLDI_SINGLE_LINK_SINGLE_MODE_0;
+				else
+					dispc->oldi_mode = OLDI_MODE_OFF;
+			}
+
+			/*
+			 * DISPC_AM65X DSS has a singular OLDI TX. It can not work in
+			 * Dual/Duplicate Mode. Forcing defaults.
+			 */
+			if (dispc->feat->subrev == DISPC_AM65X &&
+			    dispc->oldi_mode > OLDI_SINGLE_LINK_SINGLE_MODE_0) {
+				dev_dbg(dispc->dev,
+					"%s: Using default OLDI mode %d. AM65X can not support mode %d.\n",
+					__func__, OLDI_SINGLE_LINK_SINGLE_MODE_0, dispc->oldi_mode);
+				dispc->oldi_mode = OLDI_SINGLE_LINK_SINGLE_MODE_0;
+			}
+		} else if (dispc->feat->vp_bus_type[i] == DISPC_VP_DPI) {
+			dispc->rgb565_to_888 = of_property_read_bool(vport, "ti,rgb565-to-888");
+		}
+		i++;
+	}
+}
+
 int dispc_init(struct tidss_device *tidss)
 {
 	struct device *dev = tidss->dev;
@@ -2812,10 +2852,17 @@ int dispc_init(struct tidss_device *tidss)
 		dispc->vp_data[i].gamma_table = gamma_table;
 	}
 
-	if (feat->subrev == DISPC_AM65X) {
-		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
-		if (r)
-			return r;
+	if (feat->subrev == DISPC_AM65X || feat->subrev == DISPC_AM625) {
+		dispc_get_port_properties(dispc);
+		if (dispc->oldi_mode) {
+			r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
+			if (r)
+				return r;
+		}
+	} else {
+		/* K2G and J721E DSS do not support these properties */
+		dispc->oldi_mode = OLDI_MODE_OFF;
+		dispc->rgb565_to_888 = false;
 	}
 
 	dispc->fclk = devm_clk_get(dev, "fck");
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index a28005dafdc9..de8a95d3e3be 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -64,6 +64,14 @@ enum dispc_dss_subrevision {
 	DISPC_AM625,
 };
 
+enum dss_oldi_modes {
+	OLDI_MODE_OFF,				/* OLDI turned off / tied off in IP. */
+	OLDI_SINGLE_LINK_SINGLE_MODE_0,		/* Single Output over OLDI 0. */
+	OLDI_SINGLE_LINK_SINGLE_MODE_1,		/* Single Output over OLDI 1. */
+	OLDI_SINGLE_LINK_DUPLICATE_MODE,	/* Duplicate Output over OLDI 0 and 1. */
+	OLDI_DUAL_LINK,				/* Combined Output over OLDI 0 and 1. */
+};
+
 struct dispc_features {
 	int min_pclk_khz;
 	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
-- 
2.37.0

