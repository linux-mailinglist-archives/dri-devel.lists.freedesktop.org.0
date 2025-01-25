Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A0AA1C38A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 14:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033B10E15A;
	Sat, 25 Jan 2025 13:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NCNLjLRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Sat, 25 Jan 2025 13:00:13 UTC
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62E110E056
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=P9m862YSmX3S8l8jtQOeauNjSlWlKU9EXkQGHv8RUAc=; b=NCNLjL
 Rzwe1KQQX9vu3qDQCfQcmYB5a0F2ZvldcWPZJUg1xzNlReOrZGcxpQZE5zxuTJUM
 /Qy6tLLcX+L6Kts1M7xfQd2Hdbqgt+wfVjh2nY9eK+qf+1qCT+TboF3UscoU624B
 gC3G4k0VSTrVhR73GGYUEcp5TVKfwf/qU9c9IpQZCkJ4OC/9OvrbQojugCPcofNt
 DhLcSVmhSPwTyW8C0OUjcd9uOGt+ixVXLjg1mKnI4iPcn+3ftfcyitpnmrcycWVD
 A2mI+BxyGQ1dJpapS8DYKxZT5j9YMMjuTiVfwFAbWx1aAJKvYFY5YueEZUHsODv3
 orLZQHH7R+i/GnYg==
Received: (qmail 3873966 invoked from network); 25 Jan 2025 13:53:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 25 Jan 2025 13:53:32 +0100
X-UD-Smtp-Session: l3s3148p1@nseaVIcsjMYujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH RFT 1/2] drm/bridge: it6505: Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:53:21 +0100
Message-ID: <20250125125320.37285-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The I2C core now offers a debugfs-directory per client. Use it and
remove the custom handling. This also fixes the problem of a static
debugfs dir name which would break if two of these devices would be on
one system.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6..f32e3691a9ea 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -302,7 +302,6 @@
 #define WORD_LENGTH_18BIT 1
 #define WORD_LENGTH_20BIT 2
 #define WORD_LENGTH_24BIT 3
-#define DEBUGFS_DIR_NAME "it6505-debugfs"
 #define READ_BUFFER_SIZE 400
 
 /* Vendor option */
@@ -478,7 +477,6 @@ struct it6505 {
 	struct device *codec_dev;
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
-	struct dentry *debugfs;
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
@@ -3574,37 +3572,18 @@ static const struct debugfs_entries debugfs_entry[] = {
 	{ NULL, NULL },
 };
 
-static void debugfs_create_files(struct it6505 *it6505)
+static void it6505_debugfs_create_files(struct i2c_client *client, struct it6505 *it6505)
 {
 	int i = 0;
 
 	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
 		debugfs_create_file(debugfs_entry[i].name, 0644,
-				    it6505->debugfs, it6505,
+				    client->debugfs, it6505,
 				    debugfs_entry[i].fops);
 		i++;
 	}
 }
 
-static void debugfs_init(struct it6505 *it6505)
-{
-	struct device *dev = it6505->dev;
-
-	it6505->debugfs = debugfs_create_dir(DEBUGFS_DIR_NAME, NULL);
-
-	if (IS_ERR(it6505->debugfs)) {
-		dev_err(dev, "failed to create debugfs root");
-		return;
-	}
-
-	debugfs_create_files(it6505);
-}
-
-static void it6505_debugfs_remove(struct it6505 *it6505)
-{
-	debugfs_remove_recursive(it6505->debugfs);
-}
-
 static void it6505_shutdown(struct i2c_client *client)
 {
 	struct it6505 *it6505 = dev_get_drvdata(&client->dev);
@@ -3689,7 +3668,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 		it6505_poweron(it6505);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
-	debugfs_init(it6505);
+	it6505_debugfs_create_files(client, it6505);
 	pm_runtime_enable(dev);
 
 	it6505->aux.name = "DP-AUX";
@@ -3712,7 +3691,6 @@ static void it6505_i2c_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&it6505->bridge);
 	drm_dp_aux_unregister(&it6505->aux);
-	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.45.2

