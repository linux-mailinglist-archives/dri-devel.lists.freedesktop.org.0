Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516AF6FC2EB
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A56710E380;
	Tue,  9 May 2023 09:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A4410E371
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:36:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3499UdFx071916;
 Tue, 9 May 2023 04:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1683624639;
 bh=MUAqpjxDeFf+pV2Ertpwdw1zhAaxf1hBkl86Kqxd1SI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wnONW0nJOEUbw28vRdlSmmt+iWGGBeYWMUZn9mTM1XqdJskApo9cMf3qK7JFnxHT6
 kPUWEtElEO3Qf1j/Q0+cj50K2WhcySNfA57GIS5UgQGn+/J6eexVtBrPeRxx/SD/NL
 3MLxyU2/EOhM35AVku1ewVFW48PRVbXSvuRYOt48=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3499UdZ9032337
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 May 2023 04:30:39 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 04:30:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 04:30:38 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3499Ucwg084916;
 Tue, 9 May 2023 04:30:38 -0500
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
Subject: [PATCH v6 1/8] drm/bridge: tfp410: Support format negotiation hooks
Date: Tue, 9 May 2023 15:00:29 +0530
Message-ID: <20230509093036.3303-2-a-bhatia1@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

With new connector model, tfp410 will not create the connector and
SoC driver will rely on format negotiation to setup the encoder format.

Support format negotiations hooks in the drm_bridge_funcs.
Use helper functions for state management.

Input format is the one selected by the bridge from DT properties.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[a-bhatia1: Removed output fmt condition check]
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---

Notes:
    changes from v1:
    * Use only MEDIA_BUS_FMT_FIXED for output

    changes from V5:
    * Dropped the output format check condition because the output
      format for HDMI bridges should be RGB888_1X24 and not FIXED.
      Hence, also dropped Tomi Valkeinen's and Laurent Pinchart's
      R-b tags.

 drivers/gpu/drm/bridge/ti-tfp410.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index ab63225cd635..7dacc7e03eee 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -206,12 +206,38 @@ static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static u32 *tfp410_get_input_bus_fmts(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state,
+				      u32 output_fmt,
+				      unsigned int *num_input_fmts)
+{
+	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	*num_input_fmts = 1;
+	input_fmts[0] = dvi->bus_format;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 	.attach		= tfp410_attach,
 	.detach		= tfp410_detach,
 	.enable		= tfp410_enable,
 	.disable	= tfp410_disable,
 	.mode_valid	= tfp410_mode_valid,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = tfp410_get_input_bus_fmts,
 };
 
 static const struct drm_bridge_timings tfp410_default_timings = {
-- 
2.40.1

