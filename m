Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0DC194AAD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C46D6E94A;
	Thu, 26 Mar 2020 21:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id C38D26E934
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 21:10:07 +0000 (UTC)
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
 by pokefinder.org (Postfix) with ESMTPSA id 140B02C1F96;
 Thu, 26 Mar 2020 22:10:07 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 3/6] drm/i2c/sil164: convert to use i2c_new_client_device()
Date: Thu, 26 Mar 2020 22:10:01 +0100
Message-Id: <20200326211005.13301-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/i2c/sil164_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index a839f78a4c8a..741886b54419 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -393,7 +393,7 @@ sil164_detect_slave(struct i2c_client *client)
 		return NULL;
 	}
 
-	return i2c_new_device(adap, &info);
+	return i2c_new_client_device(adap, &info);
 }
 
 static int
@@ -402,6 +402,7 @@ sil164_encoder_init(struct i2c_client *client,
 		    struct drm_encoder_slave *encoder)
 {
 	struct sil164_priv *priv;
+	struct i2c_client *slave_client;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -410,7 +411,9 @@ sil164_encoder_init(struct i2c_client *client,
 	encoder->slave_priv = priv;
 	encoder->slave_funcs = &sil164_encoder_funcs;
 
-	priv->duallink_slave = sil164_detect_slave(client);
+	slave_client = sil164_detect_slave(client);
+	if (!IS_ERR(slave_client))
+		priv->duallink_slave = slave_client;
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
