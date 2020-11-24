Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3852C3AA7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A466E85A;
	Wed, 25 Nov 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from softboy.mntmn.com (softboy.mntmn.com [91.250.115.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B5506E423
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 17:22:26 +0000 (UTC)
From: "Lukas F. Hartmann" <lukas@mntre.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 softboy.mntmn.com E7CF4720718
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mntre.com;
 s=mntremail; t=1606238545;
 bh=zWxM/wxXWXl9FNzLuVjGFhUbHvK5lFkGbM6Pl961KgU=;
 h=From:To:Cc:Subject:Date:From;
 b=ThUchsg5n4mz41zZSdrdKILEWwpBeTFFZRTMU2wxLJJ6yg0mVZaE/ShjsOGRXa7Id
 xJAg4vICce5tROWr+djCh2n8zQUi1kv7gZXDCNMlXhZkK77tTPVXaVLYyzCLnr0dNB
 rh50WYbwhnoDS6jKR2mm/NbnGG9xelzvCiKNxtmrryCXPURU895JJCD+UT0oIqJD3y
 WS/5jfAd49DTRmY6LL5Ynrdaj+Ws1XTmlwXO+HKoMWY8herjaTVMbOJWW3x+UFZuPe
 lsBZ/BYJKMxESiVeSp9QcQK4t9FrCntv0SqmVpybji4EIYHWv5K+UTeTDOrdJCnJyO
 +a77IkpJn4DGA==
To: lukas@mntre.com
Subject: [RFC] dcss: fix attaching to sn56dsi86 bridge
Date: Tue, 24 Nov 2020 18:19:57 +0100
Message-Id: <20201124171956.981307-1-lukas@mntre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 agx@sigxcpu.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, laurentiu.palcu@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sn56dsi86 DSI to eDP bridge driver does not support attaching
without a drm connector. This patch makes the attachment work. Required
for the display chain in MNT Reform 2.0 (DCSS->NWL DSI->SN56DSI86->EDP).

Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 135a62366..4967f828b 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -82,6 +82,7 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 	struct drm_crtc *crtc = (struct drm_crtc *)&kms->crtc;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	struct drm_connector_list_iter iter;
 	int ret;

 	ret = drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
@@ -104,19 +105,19 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 		return ret;
 	}

-	ret = drm_bridge_attach(encoder, bridge, NULL,
-				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret < 0) {
 		dev_err(ddev->dev, "Unable to attach bridge %pOF\n",
 			bridge->of_node);
 		return ret;
 	}

-	kms->connector = drm_bridge_connector_init(ddev, encoder);
-	if (IS_ERR(kms->connector)) {
-		dev_err(ddev->dev, "Unable to create bridge connector.\n");
-		return PTR_ERR(kms->connector);
-	}
+	/*
+	 * This hack to look up the connector is copied from mxsfb.
+	 */
+	drm_connector_list_iter_begin(ddev, &iter);
+	kms->connector = drm_connector_list_iter_next(&iter);
+	drm_connector_list_iter_end(&iter);

 	drm_connector_attach_encoder(kms->connector, encoder);

--
2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
