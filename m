Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F87DF822
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26AC10E94C;
	Thu,  2 Nov 2023 16:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D0110E948
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:57:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0I-00035B-Ub; Thu, 02 Nov 2023 17:57:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0G-0067F0-45; Thu, 02 Nov 2023 17:57:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb0F-00Bjc1-Qj; Thu, 02 Nov 2023 17:57:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Zhu Wang <wangzhu9@huawei.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 04/16] drm/bridge: cdns-mhdp8546: Improve error reporting
 in remove callback
Date: Thu,  2 Nov 2023 17:56:45 +0100
Message-ID: <20231102165640.3307820-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=QvLe+gnRrjzxo5XVV8erJ3tdTm6zX1TiKp2167JPAXo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TNRHhSKAhpn97Qb6r0G4nqAXjReaahKHm8q
 i910Uip07OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPUzQAKCRCPgPtYfRL+
 TmPAB/9P4XyDGyUbFglRq/896x1wDa3RI91LefPjFylgTBu0jdeYzicZl3ULMMDG4tHC0fEY5e3
 JLaktJDGRmnkCyIr/a8AWNcALEwIxvc7KjUq/CZwQZV4gTKIp27xXQ2orl7wEZqrAgS50CjGn98
 7O9R+blDBX+jtCi0++kzPBV0PycPWbEYCm33jmrmxcDcLKu4Zk27L4xcNQZvmDVA3co/XrSELNo
 LGdPO5Dnf7dVdGxvzw9o49zeNhuZia3sQGTuMXu0QP5tQ0+zf4qTUTy57y5RTrlvia7tl4BL6S+
 8T78CIjrhxfbMc7eDIc9YCaVs4pmBG1ygYjnaEU1Gm85L8+x
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the generic error message issued by the driver core when the remove
callback returns non-zero ("remove callback returned a non-zero value. This
will be ignored.") by a message that tells the actual problem.

Also simplify a bit by checking the return value of wait_event_timeout a
bit later.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 6af565ac307a..66c87d36ce51 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2600,7 +2600,6 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 {
 	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
 	unsigned long timeout = msecs_to_jiffies(100);
-	bool stop_fw = false;
 	int ret;
 
 	drm_bridge_remove(&mhdp->bridge);
@@ -2608,18 +2607,19 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 	ret = wait_event_timeout(mhdp->fw_load_wq,
 				 mhdp->hw_state == MHDP_HW_READY,
 				 timeout);
-	if (ret == 0)
-		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
-			__func__);
-	else
-		stop_fw = true;
-
 	spin_lock(&mhdp->start_lock);
 	mhdp->hw_state = MHDP_HW_STOPPED;
 	spin_unlock(&mhdp->start_lock);
 
-	if (stop_fw)
+	if (ret == 0) {
+		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
+			__func__);
+	} else {
 		ret = cdns_mhdp_set_firmware_active(mhdp, false);
+		if (ret)
+			dev_err(mhdp->dev, "Failed to stop firmware (%pe)\n",
+				ERR_PTR(ret));
+	}
 
 	phy_exit(mhdp->phy);
 
@@ -2635,7 +2635,7 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(mhdp->clk);
 
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id mhdp_ids[] = {
-- 
2.42.0

