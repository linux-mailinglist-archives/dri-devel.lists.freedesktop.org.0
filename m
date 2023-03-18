Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE86BFC50
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A3F10E49E;
	Sat, 18 Mar 2023 19:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB59410E297
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbuf-0001nq-UW; Sat, 18 Mar 2023 20:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-0054Db-Rz; Sat, 18 Mar 2023 20:08:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-005wYm-7z; Sat, 18 Mar 2023 20:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH 01/19] drm/bridge: cdns-mhdp8546: Improve error reporting in
 remove callback
Date: Sat, 18 Mar 2023 20:07:46 +0100
Message-Id: <20230318190804.234610-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=NgYJnqRajH2b3t1heVHmtGdw2zwf35yZ8beIFE2Tfuw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFgv6wx4BY2Bxan4DeNr5HJ+MhcwFkzfx+T4Je
 BTZDbLdWx2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBYL+gAKCRCPgPtYfRL+
 TjNkB/4uPAK4CwgJSYTICibObxCFqxgem5mgQESfaMHzE0xfhdB0lvis1MNYv9QtVt5/hC8g6fe
 MmKwAu6Dx4ra2W0SmK6wXiepRnucoC8SFqJi6SSPPVoHUB8sXnVLpuBK0lSnmp10pQB8F8DPNUs
 viSmusDkhL9oW00qbTsKQYmbK3AXUOqBK8PLJuO8u1S1Ybxls+ZKd2vE7mJ8TQCYE7j3V1P+8HR
 O4kNe9/XctceHHwg8TtBa9eCkgsbyLWntf01kuM0Fp61CBksyGWOpQ8/wf06nINHoCDwZvCRcAb
 ltXBPH2Pa1eJjxhPQpJLH/F+ElVJWqOPf7nukRMWgzOQ8lK6
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
index f6822dfa3805..d74c6fa30ccc 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2574,7 +2574,6 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 {
 	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
 	unsigned long timeout = msecs_to_jiffies(100);
-	bool stop_fw = false;
 	int ret;
 
 	drm_bridge_remove(&mhdp->bridge);
@@ -2582,18 +2581,19 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
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
 
@@ -2609,7 +2609,7 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(mhdp->clk);
 
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id mhdp_ids[] = {
-- 
2.39.2

