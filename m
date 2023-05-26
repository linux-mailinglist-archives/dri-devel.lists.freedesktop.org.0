Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5447711F4B
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 07:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C9210E7A3;
	Fri, 26 May 2023 05:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB2610E7A3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 05:41:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q2QCq-0007nK-Dp; Fri, 26 May 2023 07:41:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q2QCf-002swc-Nd; Fri, 26 May 2023 07:41:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q2QCf-0084Br-5M; Fri, 26 May 2023 07:41:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: Switch i2c drivers back to use .probe()
Date: Fri, 26 May 2023 07:41:23 +0200
Message-Id: <20230526054123.1013439-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ddkS4ha6tlwDo++CDumBzIERKE0gVrPVzXIWVfdAV3E=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkcEaBmEnZDFq/XSksfJLnbn98MvV/FGX8tkHCz
 BsW+mrgbjGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHBGgQAKCRCPgPtYfRL+
 TtTDCACsiE/3u+sPDZ+ygi5qJtGRaj9YiFLUXZHmXWDERPyu3loC+W38N8yvtHSUbo5EHOyRdw4
 xR4uvs4rodEhJ81DkTHH09OIVmHnpKPY13yhQF3snuc+6Ihj4t/0iGRxV/v3WEsbFj1kStKwAF3
 Fe03/+5M6RqDzaOMh72GFG/hymfA+Js5WsW3lIHk02ydfFulEjwkbEBzcidsG0K3xPtpmmiaw8L
 hTIW5ah3MYuvES9FR1KUsAE7y8fEKOhW3D+NihEtWJE9sjyiEGs8h5wNNKrQthPtn6ANUndJ+Eo
 A5845DNODftqmsVv8SMtZmc1/EZQkf3+gTHIuxbGn0Gn9h3K
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
Cc: linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>, Ajay Gupta <ajayg@nvidia.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vladimir Oltean <olteanv@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/matrox/matroxfb_maven.c | 2 +-
 drivers/video/fbdev/ssd1307fb.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_maven.c b/drivers/video/fbdev/matrox/matroxfb_maven.c
index 727a10a59811..b15a8ad92ba7 100644
--- a/drivers/video/fbdev/matrox/matroxfb_maven.c
+++ b/drivers/video/fbdev/matrox/matroxfb_maven.c
@@ -1291,7 +1291,7 @@ static struct i2c_driver maven_driver={
 	.driver = {
 		.name	= "maven",
 	},
-	.probe_new	= maven_probe,
+	.probe		= maven_probe,
 	.remove		= maven_remove,
 	.id_table	= maven_id,
 };
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 046b9990d27c..132d1a205011 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -844,7 +844,7 @@ static const struct i2c_device_id ssd1307fb_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, ssd1307fb_i2c_id);
 
 static struct i2c_driver ssd1307fb_driver = {
-	.probe_new = ssd1307fb_probe,
+	.probe = ssd1307fb_probe,
 	.remove = ssd1307fb_remove,
 	.id_table = ssd1307fb_i2c_id,
 	.driver = {

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

