Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03D6FC2E7
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7994310E378;
	Tue,  9 May 2023 09:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Tue, 09 May 2023 09:36:56 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200A210E37D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:36:55 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3499UiCs071933;
 Tue, 9 May 2023 04:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1683624644;
 bh=dLF7J3jFLUCNIXG4GKr7cBET1aDmrLyN47iJx0ezMmM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=r/F4WuCH92Kz7fOX6SquKxwQiYcBb8lRAic5l1CzlhG0rRtCICbdW65VpsxQYkDn4
 xco3iGbkxwLcjKrMDg6PdR5/k1UpBAi4eY+RxFCDURcSyG+fVOdpR7NaAiYN52aZIm
 aJ2XSiOTFwYE6xCSK4m8CGCaKzf+I7zTu2zLltnk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3499Uifc107317
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 May 2023 04:30:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 04:30:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 04:30:44 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3499UheI017893;
 Tue, 9 May 2023 04:30:44 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Francesco Dolcini
 <francesco@dolcini.it>
Subject: [PATCH v6 5/8] drm/bridge: sii902x: Support format negotiation hooks
Date: Tue, 9 May 2023 15:00:33 +0530
Message-ID: <20230509093036.3303-6-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509093036.3303-1-a-bhatia1@ti.com>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>
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
---
 drivers/gpu/drm/bridge/sii902x.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index ef66461e7f7c..662b6cb4aa62 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -473,6 +473,28 @@ static struct edid *sii902x_bridge_get_edid(struct drm_bridge *bridge,
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
+	u32 default_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = default_bus_format;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.attach = sii902x_bridge_attach,
 	.mode_set = sii902x_bridge_mode_set,
@@ -480,6 +502,10 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
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

