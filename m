Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A770118871C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764FF6E184;
	Tue, 17 Mar 2020 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05C0989E14
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 16:44:23 +0000 (UTC)
Received: from localhost (p54B334BA.dip0.t-ipconnect.de [84.179.52.186])
 by pokefinder.org (Postfix) with ESMTPSA id 7F4EC2C1F53;
 Mon, 16 Mar 2020 17:39:12 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: encoder_slave: use new I2C API
Date: Mon, 16 Mar 2020 17:39:07 +0100
Message-Id: <20200316163907.13709-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i2c_new_client() is deprecated, use the replacement
i2c_new_client_device(). Also, we have a helper to check if a driver is
bound. Use it to simplify the code. Note that this changes the errno for
a failed device creation from ENOMEM to ENODEV. No callers currently
interpret this errno, though, so we use this condensed error check.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/drm_encoder_slave.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/drm_encoder_slave.c
index d50a7884e69e..e464429d32df 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/drm_encoder_slave.c
@@ -61,13 +61,8 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 
 	request_module("%s%s", I2C_MODULE_PREFIX, info->type);
 
-	client = i2c_new_device(adap, info);
-	if (!client) {
-		err = -ENOMEM;
-		goto fail;
-	}
-
-	if (!client->dev.driver) {
+	client = i2c_new_client_device(adap, info);
+	if (!i2c_client_has_driver(client)) {
 		err = -ENODEV;
 		goto fail_unregister;
 	}
@@ -96,7 +91,6 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 	module_put(module);
 fail_unregister:
 	i2c_unregister_device(client);
-fail:
 	return err;
 }
 EXPORT_SYMBOL(drm_i2c_encoder_init);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
