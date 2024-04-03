Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668E896AA2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39BA11293C;
	Wed,  3 Apr 2024 09:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rda3HCwb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lnbh+LVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7711292D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8476A5CAA0;
 Wed,  3 Apr 2024 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PCFYwNgrjTbtaNg0MtVFWzZj30a9uGnViuDAYdqgnY=;
 b=rda3HCwbAf4UzpzxMe9NdAuiR9kWMvegs/NddK0ifSnWzhesSuPv915ykzHwo1EsQlm1mW
 jg18g+7bzDYo9LG4B6pMhBW11ZwX8mciLHhFnHHaviUIJJd9KNMfuiqKuqJP48+Yd/5MLM
 cx/oCc/yRyyJofsOy0Xbb5Y5Tm1UAgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PCFYwNgrjTbtaNg0MtVFWzZj30a9uGnViuDAYdqgnY=;
 b=lnbh+LVEdAXZgZ9vnr+negzYEMhQ2mWwBlxEw2TGcQr2Ir8079VQpkcJ5BPBCeqvRlRwoZ
 de/w0v5RbIw7gfBw==
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 44F6713A8B;
 Wed,  3 Apr 2024 09:31:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 8KOTD+YhDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/11] drm/mgag200: Store pointer to struct mga_device in
 struct mga_i2c_chan
Date: Wed,  3 Apr 2024 11:24:40 +0200
Message-ID: <20240403093114.22163-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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

Avoid upcasting to struct mga_device in i2c code by storing the
pointer directly. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h |  2 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 765e49fd89111..f419dae9c4325 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -191,7 +191,7 @@ static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_s
 
 struct mga_i2c_chan {
 	struct i2c_adapter adapter;
-	struct drm_device *dev;
+	struct mga_device *mdev;
 	struct i2c_algo_bit_data bit;
 	int data, clock;
 };
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 4caeb68f3010c..effd7c057fce0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -63,29 +63,29 @@ static inline void mga_i2c_set(struct mga_device *mdev, int mask, int state)
 static void mga_gpio_setsda(void *data, int state)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = to_mga_device(i2c->dev);
-	mga_i2c_set(mdev, i2c->data, state);
+
+	mga_i2c_set(i2c->mdev, i2c->data, state);
 }
 
 static void mga_gpio_setscl(void *data, int state)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = to_mga_device(i2c->dev);
-	mga_i2c_set(mdev, i2c->clock, state);
+
+	mga_i2c_set(i2c->mdev, i2c->clock, state);
 }
 
 static int mga_gpio_getsda(void *data)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = to_mga_device(i2c->dev);
-	return (mga_i2c_read_gpio(mdev) & i2c->data) ? 1 : 0;
+
+	return (mga_i2c_read_gpio(i2c->mdev) & i2c->data) ? 1 : 0;
 }
 
 static int mga_gpio_getscl(void *data)
 {
 	struct mga_i2c_chan *i2c = data;
-	struct mga_device *mdev = to_mga_device(i2c->dev);
-	return (mga_i2c_read_gpio(mdev) & i2c->clock) ? 1 : 0;
+
+	return (mga_i2c_read_gpio(i2c->mdev) & i2c->clock) ? 1 : 0;
 }
 
 static void mgag200_i2c_release(struct drm_device *dev, void *res)
@@ -109,7 +109,7 @@ int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 	i2c->clock = BIT(info->i2c.clock_bit);
 	i2c->adapter.owner = THIS_MODULE;
 	i2c->adapter.dev.parent = dev->dev;
-	i2c->dev = dev;
+	i2c->mdev = mdev;
 	i2c_set_adapdata(&i2c->adapter, i2c);
 	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name), "mga i2c");
 
-- 
2.44.0

