Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592922CA277
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C616E526;
	Tue,  1 Dec 2020 12:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8656E546
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:19:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CJ8Vx061907;
 Tue, 1 Dec 2020 06:19:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606825148;
 bh=GTWIrA9E6t1KKjfc/h/3P4uANWOhmfE+rbTrAJlCaqk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=XzMNTJoGbW1r8Ivyr657Od2OCR1nLuKvEFa4sPVYo3EC7XYGV1XLn61aIBFswtWrB
 1XT42qSZgX9JWcoQTa+0n9uKqO03ZkPn5WNUbHt+ssbVIeOk71VopwGikDINBNXlBI
 NRoJMktWHV5HKW7Q5PcJRKUk1s5Yq17bNLLfgh1A=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1CJ8uY016624
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 06:19:08 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 06:19:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 06:19:08 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIn3R118162; 
 Tue, 1 Dec 2020 06:19:06 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: [PATCH v4 6/7] drm/tidss: Move to newer connector model
Date: Tue, 1 Dec 2020 17:48:29 +0530
Message-ID: <20201201121830.29704-7-nikhil.nd@ti.com>
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

To be able to support connector operations across multiple
bridges, it is recommended that the connector should be
created by the SoC driver instead of the bridges.

Modify the tidss modesetting initialization sequence to
create the connector and attach bridges with flag
DRM_BRIDGE_ATTACH_NO_CONNECTOR

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Notes:
    changes from v1:
    * Add error handling

 drivers/gpu/drm/tidss/tidss_drv.h |  3 +++
 drivers/gpu/drm/tidss/tidss_kms.c | 19 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 7de4bba52e6f..cfbf85a4d92b 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -27,6 +27,9 @@ struct tidss_device {
 	unsigned int num_planes;
 	struct drm_plane *planes[TIDSS_MAX_PLANES];
 
+	unsigned int num_connectors;
+	struct drm_connector *connectors[TIDSS_MAX_PORTS];
+
 	spinlock_t wait_lock;	/* protects the irq masks */
 	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
 };
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 09485c7f0d6f..1f5ae153b114 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -192,6 +193,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 	for (i = 0; i < num_pipes; ++i) {
 		struct tidss_plane *tplane;
 		struct tidss_crtc *tcrtc;
+		struct drm_connector *connector;
 		struct drm_encoder *enc;
 		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
 		int ret;
@@ -222,11 +224,26 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 			return PTR_ERR(enc);
 		}
 
-		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
+		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
 			dev_err(tidss->dev, "bridge attach failed: %d\n", ret);
 			return ret;
 		}
+
+		connector = drm_bridge_connector_init(&tidss->ddev, enc);
+		if (IS_ERR(connector)) {
+			dev_err(tidss->dev, "bridge_connector create failed\n");
+			return PTR_ERR(connector);
+		}
+
+		tidss->connectors[tidss->num_connectors++] = connector;
+
+		ret = drm_connector_attach_encoder(connector, enc);
+		if (ret) {
+			dev_err(tidss->dev, "attaching encoder to connector failed\n");
+			return ret;
+		}
 	}
 
 	/* create overlay planes of the leftover planes */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
