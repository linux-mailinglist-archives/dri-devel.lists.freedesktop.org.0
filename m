Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4A896A9A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13786112931;
	Wed,  3 Apr 2024 09:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Php/YvFg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l3/ZVfDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A530B112928
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63D2C35192;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEGmBRj5g47+oCVk83Axq7A5PMcO/EcJ81uNm6vJJGE=;
 b=Php/YvFgRUbRHBCUqBmh3RX/iiLcvWGRmbtt+hfhQ3qbefVMfncdhkX5rS8wUnIbysXzHP
 LeNgZceslsnQ4/aq0qqUl2rXoXY/9DBc5oXY8KYeGNYaeYk8BiWGj/fm+i64A6YtDzztcS
 yr+TYZXc5/gwTkDgfV8ekBsu3CHrcMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEGmBRj5g47+oCVk83Axq7A5PMcO/EcJ81uNm6vJJGE=;
 b=l3/ZVfDdnxqIcXnZnqhp9KS0byWpChocALtSG6ue2/GJDjOi4WHWBZL6PUh6Cex3x68Me6
 xKT63S+QzJc2LjCA==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 26C481331E;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id AAE4COchDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/11] drm/mgag200: Replace struct mga_i2c_chan with struct
 mgag200_ddc
Date: Wed,  3 Apr 2024 11:24:43 +0200
Message-ID: <20240403093114.22163-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO
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

Rename struct mga_i2c_chan to struct mgag200_ddc, define it in the
source file mgag200_i2c.c, and reorder its fields. Rename all related
variables from i2c to ddc. Also rename the i2c adapter accordingly.

Using the term 'ddc' documents the purpose of the code clearly. The
old term 'i2c' could refer to any functionality on an i2c bus. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h | 10 -----
 drivers/gpu/drm/mgag200/mgag200_i2c.c | 56 ++++++++++++++++-----------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 663a740034447..7bd8790d4eb03 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -10,9 +10,6 @@
 #ifndef __MGAG200_DRV_H__
 #define __MGAG200_DRV_H__
 
-#include <linux/i2c-algo-bit.h>
-#include <linux/i2c.h>
-
 #include <video/vga.h>
 
 #include <drm/drm_connector.h>
@@ -189,13 +186,6 @@ static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_s
 	return container_of(base, struct mgag200_crtc_state, base);
 }
 
-struct mga_i2c_chan {
-	struct i2c_adapter adapter;
-	struct mga_device *mdev;
-	struct i2c_algo_bit_data bit;
-	int data, clock;
-};
-
 enum mga_type {
 	G200_PCI,
 	G200_AGP,
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index ba7aeca55fb40..73ff94c91ca36 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -36,6 +36,16 @@
 #include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
+struct mgag200_ddc {
+	struct mga_device *mdev;
+
+	int data;
+	int clock;
+
+	struct i2c_algo_bit_data bit;
+	struct i2c_adapter adapter;
+};
+
 static int mga_i2c_read_gpio(struct mga_device *mdev)
 {
 	WREG8(DAC_INDEX, MGA1064_GEN_IO_DATA);
@@ -63,62 +73,62 @@ static inline void mga_i2c_set(struct mga_device *mdev, int mask, int state)
 
 static void mga_gpio_setsda(void *data, int state)
 {
-	struct mga_i2c_chan *i2c = data;
+	struct mgag200_ddc *ddc = data;
 
-	mga_i2c_set(i2c->mdev, i2c->data, state);
+	mga_i2c_set(ddc->mdev, ddc->data, state);
 }
 
 static void mga_gpio_setscl(void *data, int state)
 {
-	struct mga_i2c_chan *i2c = data;
+	struct mgag200_ddc *ddc = data;
 
-	mga_i2c_set(i2c->mdev, i2c->clock, state);
+	mga_i2c_set(ddc->mdev, ddc->clock, state);
 }
 
 static int mga_gpio_getsda(void *data)
 {
-	struct mga_i2c_chan *i2c = data;
+	struct mgag200_ddc *ddc = data;
 
-	return (mga_i2c_read_gpio(i2c->mdev) & i2c->data) ? 1 : 0;
+	return (mga_i2c_read_gpio(ddc->mdev) & ddc->data) ? 1 : 0;
 }
 
 static int mga_gpio_getscl(void *data)
 {
-	struct mga_i2c_chan *i2c = data;
+	struct mgag200_ddc *ddc = data;
 
-	return (mga_i2c_read_gpio(i2c->mdev) & i2c->clock) ? 1 : 0;
+	return (mga_i2c_read_gpio(ddc->mdev) & ddc->clock) ? 1 : 0;
 }
 
-static void mgag200_i2c_release(struct drm_device *dev, void *res)
+static void mgag200_ddc_release(struct drm_device *dev, void *res)
 {
-	struct mga_i2c_chan *i2c = res;
+	struct mgag200_ddc *ddc = res;
 
-	i2c_del_adapter(&i2c->adapter);
+	i2c_del_adapter(&ddc->adapter);
 }
 
 struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	const struct mgag200_device_info *info = mdev->info;
-	struct mga_i2c_chan *i2c;
+	struct mgag200_ddc *ddc;
 	struct i2c_algo_bit_data *bit;
 	struct i2c_adapter *adapter;
 	int ret;
 
-	i2c = drmm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
-	if (!i2c)
+	ddc = drmm_kzalloc(dev, sizeof(*ddc), GFP_KERNEL);
+	if (!ddc)
 		return ERR_PTR(-ENOMEM);
 
 	WREG_DAC(MGA1064_GEN_IO_CTL2, 1);
 	WREG_DAC(MGA1064_GEN_IO_DATA, 0xff);
 	WREG_DAC(MGA1064_GEN_IO_CTL, 0);
 
-	i2c->mdev = mdev;
-	i2c->data = BIT(info->i2c.data_bit);
-	i2c->clock = BIT(info->i2c.clock_bit);
+	ddc->mdev = mdev;
+	ddc->data = BIT(info->i2c.data_bit);
+	ddc->clock = BIT(info->i2c.clock_bit);
 
-	bit = &i2c->bit;
-	bit->data = i2c;
+	bit = &ddc->bit;
+	bit->data = ddc;
 	bit->setsda = mga_gpio_setsda;
 	bit->setscl = mga_gpio_setscl;
 	bit->getsda = mga_gpio_getsda;
@@ -126,18 +136,18 @@ struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev)
 	bit->udelay = 10;
 	bit->timeout = usecs_to_jiffies(2200);
 
-	adapter = &i2c->adapter;
+	adapter = &ddc->adapter;
 	adapter->owner = THIS_MODULE;
 	adapter->algo_data = bit;
 	adapter->dev.parent = dev->dev;
-	snprintf(adapter->name, sizeof(adapter->name), "mga i2c");
-	i2c_set_adapdata(adapter, i2c);
+	snprintf(adapter->name, sizeof(adapter->name), "Matrox DDC bus");
+	i2c_set_adapdata(adapter, ddc);
 
 	ret = i2c_bit_add_bus(adapter);
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = drmm_add_action_or_reset(dev, mgag200_i2c_release, i2c);
+	ret = drmm_add_action_or_reset(dev, mgag200_ddc_release, ddc);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.44.0

