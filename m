Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D19A51C3CF
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0154110E2B0;
	Thu,  5 May 2022 15:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1EC10E2B0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:22:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B0051F38A;
 Thu,  5 May 2022 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651764167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=irUdpZG63qnS+5Df2aky2MAWJFPcHFFVfKliVS27Z+k=;
 b=bPaC9FO34pklww4Zh1gDY/CK/l1DrKkNkKy4TDIga0zqXwmQJhWFnhrnlMD+Go/emmovGv
 MTIehOrEf2YdFFJ3oekrCDnAg/cKcas/1p5gxwd8+59FBxTFTBv+a8q3X0uvsNqo+/Q7QX
 EADn78RgQhMYHczdHi0rOuViBxNs9yQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651764167;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=irUdpZG63qnS+5Df2aky2MAWJFPcHFFVfKliVS27Z+k=;
 b=RxCzB1MfJ1a65ZWDlpqwOAyacBN4CARRz3E+fnl9P+ddKUSw44H57FibcVoN8jJoy8XGUj
 Iw/SftudWC+rM2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B2A513B11;
 Thu,  5 May 2022 15:22:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TklhFcfrc2LxTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 15:22:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/mgag200: Fail on I2C initialization errors
Date: Thu,  5 May 2022 17:22:44 +0200
Message-Id: <20220505152244.413-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialization of the I2C adapter was allowed to fail. The mgag200
driver would have continued without DDC support. Had this happened in
practice, it would have led to segmentation faults in the connector
code. Resolve this problem by failing driver initialization on I2C-
related errors.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_i2c.c  | 13 ++++++++-----
 drivers/gpu/drm/mgag200/mgag200_mode.c |  6 ++++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index ac8e34eef5138..31e2c641a7814 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -120,7 +120,7 @@ struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
 
 	i2c = kzalloc(sizeof(struct mga_i2c_chan), GFP_KERNEL);
 	if (!i2c)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	i2c->data = data;
 	i2c->clock = clock;
@@ -142,11 +142,14 @@ struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
 	i2c->bit.getscl		= mga_gpio_getscl;
 
 	ret = i2c_bit_add_bus(&i2c->adapter);
-	if (ret) {
-		kfree(i2c);
-		i2c = NULL;
-	}
+	if (ret)
+		goto err_kfree;
+
 	return i2c;
+
+err_kfree:
+	kfree(i2c);
+	return ERR_PTR(ret);
 }
 
 void mgag200_i2c_destroy(struct mga_i2c_chan *i2c)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index abde7655477db..79557ca056f08 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -815,8 +815,10 @@ static int mgag200_vga_connector_init(struct mga_device *mdev)
 	int ret;
 
 	i2c = mgag200_i2c_create(dev);
-	if (!i2c)
-		drm_warn(dev, "failed to add DDC bus\n");
+	if (IS_ERR(i2c)) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return PTR_ERR(i2c);
+	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mga_vga_connector_funcs,
-- 
2.36.0

