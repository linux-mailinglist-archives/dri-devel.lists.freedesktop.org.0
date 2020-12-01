Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652682CA272
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50DA6E530;
	Tue,  1 Dec 2020 12:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687E76E530
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:19:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CItdf082260;
 Tue, 1 Dec 2020 06:18:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606825135;
 bh=aW8v81jenOHRJxdha7mqd8fB4EURAg3Z2Q0eTgpF2k4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=v9IVpuszzdYLvU3LRQmETM9dK+yecG/Ukzh5mWq4U6hq6kYSQokkbcx1gz9STQyo9
 7B1C3K7W85Ae+JzkEv9kPs36Sat6Ixii7+1KcoQksQjrcXHUI0yHdfdGQkWUQ6LS/Z
 8XgA3p6Z+qwbpDaC4NqbRWGp1dNvUSXKI7jR0lk8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1CItXO001218
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 06:18:55 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 06:18:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 06:18:55 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIn3M118162; 
 Tue, 1 Dec 2020 06:18:53 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: [PATCH v4 1/7] drm/bridge: tfp410: Support format negotiation hooks
Date: Tue, 1 Dec 2020 17:48:24 +0530
Message-ID: <20201201121830.29704-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201121830.29704-1-nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With new connector model, tfp410 will not create the connector and
SoC driver will rely on format negotiation to setup the encoder format.

Support format negotiations hooks in the drm_bridge_funcs.
Use helper functions for state management.

Output format is expected to be MEDIA_BUS_FMT_FIXED
Input format is the one selected by the bridge from DT properties.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Notes:
    changes from v1:
    * Use only MEDIA_BUS_FMT_FIXED for output

 drivers/gpu/drm/bridge/ti-tfp410.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index ba3fa2a9b8a4..3def9acba86b 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -204,12 +204,45 @@ static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
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
+	/*
+	 * Output of tfp410 is DVI, which is TMDS.
+	 * There is no media format defined for this.
+	 * Using MEDIA_BUS_FMT_FIXED for now.
+	 */
+	if (output_fmt != MEDIA_BUS_FMT_FIXED)
+		return NULL;
+
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	*num_input_fmts = 1;
+	input_fmts[0] = dvi->bus_format;
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
