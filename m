Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458066300BD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 23:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D625F10E80C;
	Fri, 18 Nov 2022 22:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5E710E7F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 22:46:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA7m-0007fQ-7F; Fri, 18 Nov 2022 23:46:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA7j-0058A9-6h; Fri, 18 Nov 2022 23:46:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA7h-00Hawb-65; Fri, 18 Nov 2022 23:46:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 026/606] drm/bridge: megachips: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:36:00 +0100
Message-Id: <20221118224540.619276-27-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 97359f807bfc..4ee4a825a936 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -336,8 +336,7 @@ static int ge_b850v3_register(void)
 			"ge-b850v3-lvds-dp", ge_b850v3_lvds_ptr);
 }
 
-static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
-				       const struct i2c_device_id *id)
+static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c)
 {
 	struct device *dev = &stdp4028_i2c->dev;
 	int ret;
@@ -376,7 +375,7 @@ MODULE_DEVICE_TABLE(of, stdp4028_ge_b850v3_fw_match);
 
 static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
 	.id_table	= stdp4028_ge_b850v3_fw_i2c_table,
-	.probe		= stdp4028_ge_b850v3_fw_probe,
+	.probe_new	= stdp4028_ge_b850v3_fw_probe,
 	.remove		= stdp4028_ge_b850v3_fw_remove,
 	.driver		= {
 		.name		= "stdp4028-ge-b850v3-fw",
@@ -384,8 +383,7 @@ static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
 	},
 };
 
-static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c,
-				       const struct i2c_device_id *id)
+static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c)
 {
 	struct device *dev = &stdp2690_i2c->dev;
 	int ret;
@@ -424,7 +422,7 @@ MODULE_DEVICE_TABLE(of, stdp2690_ge_b850v3_fw_match);
 
 static struct i2c_driver stdp2690_ge_b850v3_fw_driver = {
 	.id_table	= stdp2690_ge_b850v3_fw_i2c_table,
-	.probe		= stdp2690_ge_b850v3_fw_probe,
+	.probe_new	= stdp2690_ge_b850v3_fw_probe,
 	.remove		= stdp2690_ge_b850v3_fw_remove,
 	.driver		= {
 		.name		= "stdp2690-ge-b850v3-fw",
-- 
2.38.1

