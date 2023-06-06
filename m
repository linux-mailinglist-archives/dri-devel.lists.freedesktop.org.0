Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68712723B58
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF9510E2D8;
	Tue,  6 Jun 2023 08:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4AC10E2D6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:22:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3568LmD8038638;
 Tue, 6 Jun 2023 03:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686039708;
 bh=rlcycElYspBBCBwIoOXKjxDNDpCcwf8wJnBjzKivxps=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=e6Ba3L3xN8aTgby39c2YceFYEp/JCiiN7ZCgYAnc+lPbjYwgCOqCo5eFiVSSpKEJk
 3JtsJ/fRBgxfKiinqfWqk4Uf2MDIP4lRYqX0PtWhyL0Rl/eEz3OZB90kiZv2LGDijw
 R0IIlx/GMYR8PYeRIu/AH1h9uDUY0VI3EIn2+eGo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3568LmF5012332
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jun 2023 03:21:48 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 03:21:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 03:21:48 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3568LkxE019588;
 Tue, 6 Jun 2023 03:21:47 -0500
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
Subject: [PATCH v7 3/8] drm/bridge: mhdp8546: Add minimal format negotiation
Date: Tue, 6 Jun 2023 13:51:37 +0530
Message-ID: <20230606082142.23760-4-a-bhatia1@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

With new connector model, mhdp bridge will not create the connector and
SoC driver will rely on format negotiation to setup the encoder format.

Support minimal format negotiations hooks in the drm_bridge_funcs.
Complete format negotiation can be added based on EDID data.
This patch adds the minimal required support to avoid failure
after moving to new connector model.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[a-bhatia1: Drop the output_fmt check condition]
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---

Notes:

    changes from v1:
    * cosmetic fixes, commit message update.

    changes from v5:
    * drop the default_bus_format variable and directly assigned
      MEDIA_BUS_FMT_RGB121212_1X36 to input_fmts.

    changes from v6:
    * Drop the output_fmt check condition and hence drop Tomi
      Valkeinen's R-b tag.

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f6822dfa3805..afd4e353f37a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2146,6 +2146,27 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
 	return &cdns_mhdp_state->base;
 }
 
+static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 u32 output_fmt,
+					 unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	*num_input_fmts = 1;
+	input_fmts[0] = MEDIA_BUS_FMT_RGB121212_1X36;
+
+	return input_fmts;
+}
+
 static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state,
 				  struct drm_crtc_state *crtc_state,
@@ -2210,6 +2231,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_duplicate_state = cdns_mhdp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = cdns_mhdp_bridge_atomic_destroy_state,
 	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
+	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
 	.detect = cdns_mhdp_bridge_detect,
 	.get_edid = cdns_mhdp_bridge_get_edid,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
-- 
2.40.1

