Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF842723B4F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0199310E2D1;
	Tue,  6 Jun 2023 08:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4CF10E2D1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:22:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3568LpmQ013072;
 Tue, 6 Jun 2023 03:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686039711;
 bh=tSOarY1oK5P3WdLn8Hnq0D9v4f4KHxiCVqh5EM0vuxw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=r/Ghi5QnqgTvobF8E7GvNafN5zmANSdORTc/eRZYkzlBF/G+5tIbmQjRK7TTC2bkS
 Z1Ob48mwPLFg2WAz2FtuxyJOBGn1Zlwst5/e4Y4RgxvJMrDEHoWbKCU0hRCn+sKBzB
 XZJt/NMY6HI9t6YUXdHk98CVNi7yduuDB4jMGPJw=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3568Lpvc012358
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jun 2023 03:21:51 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 03:21:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 03:21:50 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3568LolY019592;
 Tue, 6 Jun 2023 03:21:50 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v7 5/8] drm/bridge: sii902x: Support format negotiation hooks
Date: Tue, 6 Jun 2023 13:51:39 +0530
Message-ID: <20230606082142.23760-6-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606082142.23760-1-a-bhatia1@ti.com>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With new connector model, sii902x will not create the connector, when
DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and SoC driver will rely on format
negotiation to setup the encoder format.

Support format negotiations hooks in the drm_bridge_funcs.
Use helper functions for state management.

Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
the case with older model.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

Notes:

    changes from v6:
    * Add Neil Armstrong's R-b tag.

 drivers/gpu/drm/bridge/sii902x.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index ef66461e7f7c..70aeb04b7f77 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -473,6 +473,27 @@ static struct edid *sii902x_bridge_get_edid(struct drm_bridge *bridge,
 	return sii902x_get_edid(sii902x, connector);
 }
 
+static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+						     struct drm_bridge_state *bridge_state,
+						     struct drm_crtc_state *crtc_state,
+						     struct drm_connector_state *conn_state,
+						     u32 output_fmt,
+						     unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.attach = sii902x_bridge_attach,
 	.mode_set = sii902x_bridge_mode_set,
@@ -480,6 +501,10 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.enable = sii902x_bridge_enable,
 	.detect = sii902x_bridge_detect,
 	.get_edid = sii902x_bridge_get_edid,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
 };
 
 static int sii902x_mute(struct sii902x *sii902x, bool mute)
-- 
2.40.1

