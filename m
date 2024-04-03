Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E6896A9D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3F611292D;
	Wed,  3 Apr 2024 09:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="A9uFTu76";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+I2oAS4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEC7112927
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2028D35191;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dkZG95GflJiZs31a0rISQ0n+Wy8zn8UYA3nANxtLd4=;
 b=A9uFTu76mo945zxKyFJv6d3xJdTYiCcsgMH9yYH+908BrT7E1bRoRSUGwE75gpbHBRn/sM
 MBDTOF5jUHkRvXYGZ2FPB7vJDGa2t+OkKkplw6MEfflP8MqTiFRi/Yu1OfthacghtfqhU7
 WUuNGZve2+NB0JK6vN7cki8zkCwZSz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dkZG95GflJiZs31a0rISQ0n+Wy8zn8UYA3nANxtLd4=;
 b=+I2oAS4KWVmhu5lQ435oaz3hiWb+TXyyij0YV8MmcCnFKCynsTgzQsgrjEEfX+ukg93wGa
 aSzZGyy+dfpCnlDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D412D13A8B;
 Wed,  3 Apr 2024 09:31:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 2LZ6MuYhDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/11] drm/mgag200: Inline mgag200_i2c_init()
Date: Wed,  3 Apr 2024 11:24:42 +0200
Message-ID: <20240403093114.22163-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.16 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.995];
 MIME_GOOD(-0.10)[text/plain]; BAYES_HAM(-0.03)[56.86%];
 MX_GOOD(-0.01)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 R_DKIM_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:98:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spamd-Bar: +
X-Spam-Score: 1.16
X-Spam-Level: *
X-Rspamd-Queue-Id: 2028D35191
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

The function mgag200_i2c_init() is an internal helper that sets
up the i2c data structure. Inline its code into the only caller.
Rearrange the individual steps to separate among i2c algorithm,
adapter and fields in struct mga_i2c_chan.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_i2c.c | 62 +++++++++++++--------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 46fa9f1b4e469..ba7aeca55fb40 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -96,54 +96,50 @@ static void mgag200_i2c_release(struct drm_device *dev, void *res)
 	i2c_del_adapter(&i2c->adapter);
 }
 
-static int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
+struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	const struct mgag200_device_info *info = mdev->info;
+	struct mga_i2c_chan *i2c;
+	struct i2c_algo_bit_data *bit;
+	struct i2c_adapter *adapter;
 	int ret;
 
+	i2c = drmm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return ERR_PTR(-ENOMEM);
+
 	WREG_DAC(MGA1064_GEN_IO_CTL2, 1);
 	WREG_DAC(MGA1064_GEN_IO_DATA, 0xff);
 	WREG_DAC(MGA1064_GEN_IO_CTL, 0);
 
+	i2c->mdev = mdev;
 	i2c->data = BIT(info->i2c.data_bit);
 	i2c->clock = BIT(info->i2c.clock_bit);
-	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.dev.parent = dev->dev;
-	i2c->mdev = mdev;
-	i2c_set_adapdata(&i2c->adapter, i2c);
-	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name), "mga i2c");
-
-	i2c->adapter.algo_data = &i2c->bit;
 
-	i2c->bit.udelay = 10;
-	i2c->bit.timeout = usecs_to_jiffies(2200);
-	i2c->bit.data = i2c;
-	i2c->bit.setsda		= mga_gpio_setsda;
-	i2c->bit.setscl		= mga_gpio_setscl;
-	i2c->bit.getsda		= mga_gpio_getsda;
-	i2c->bit.getscl		= mga_gpio_getscl;
-
-	ret = i2c_bit_add_bus(&i2c->adapter);
+	bit = &i2c->bit;
+	bit->data = i2c;
+	bit->setsda = mga_gpio_setsda;
+	bit->setscl = mga_gpio_setscl;
+	bit->getsda = mga_gpio_getsda;
+	bit->getscl = mga_gpio_getscl;
+	bit->udelay = 10;
+	bit->timeout = usecs_to_jiffies(2200);
+
+	adapter = &i2c->adapter;
+	adapter->owner = THIS_MODULE;
+	adapter->algo_data = bit;
+	adapter->dev.parent = dev->dev;
+	snprintf(adapter->name, sizeof(adapter->name), "mga i2c");
+	i2c_set_adapdata(adapter, i2c);
+
+	ret = i2c_bit_add_bus(adapter);
 	if (ret)
-		return ret;
-
-	return drmm_add_action_or_reset(dev, mgag200_i2c_release, i2c);
-}
-
-struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev)
-{
-	struct mga_i2c_chan *i2c;
-	struct drm_device *dev = &mdev->base;
-	int ret;
-
-	i2c = drmm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
-	if (!i2c)
-		return ERR_PTR(-ENOMEM);
+		return ERR_PTR(ret);
 
-	ret = mgag200_i2c_init(mdev, i2c);
+	ret = drmm_add_action_or_reset(dev, mgag200_i2c_release, i2c);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return &i2c->adapter;
+	return adapter;
 }
-- 
2.44.0

