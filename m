Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C584187F93F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7309C10F60F;
	Tue, 19 Mar 2024 08:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NfQdwxmd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gzo0UITu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A9IrBJf3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fWvNrAK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB3410F592
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F072337507;
 Tue, 19 Mar 2024 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=NfQdwxmdcyCBfMD50NdZG7IwnIYqkJFcIniqQmc2o1OgA/yplLlbmVz/oR8AHczkBARhe/
 C+QEF4f8kW7x72guHski0Z1Hg/2XjrD8Ai698oGtuqj3WG6uOxMn/zr/XjBXorC8YxbrmH
 9vbstccNeYhCkJul25cUG2pSouqr118=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=Gzo0UITukquCNS7LQNyTwz3mqUMWKccGDBiFrl+mksk7EYf+RfSgx9qSL1byZwGLlvVbGf
 0zgexo60JFa7+tDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=A9IrBJf3P5ZY5GkVpFWYrR1UPKPd1AkmgN0EiMZPrjacldIiB7TliXTYe88QNt27ebBHp9
 I/rwUM9NT5hrtjQdrpALRPLz+Gfo86YamQx5caDJ69a8LXd+yCiVI/PTFT26gCJmNy1MbG
 MvYkrbUhljmd8nqRDDklZC5AYD8N3pY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=fWvNrAK4AAXJxnNvYfEA28bM9lW/juIGk3NcsTZUbTzMJMHewRLVpU93e+vp0mb4JtIf6M
 19IZR50z5kQbuNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2672136D6;
 Tue, 19 Mar 2024 08:14:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SOwoKmpJ+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 04/12] drm/ast: Allocate instance of struct ast_i2c_chan
 with managed helpers
Date: Tue, 19 Mar 2024 09:00:24 +0100
Message-ID: <20240319081430.10165-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[24.84%]
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

Replace kzalloc() with drmm_kzalloc() and thereby put the release of
the I2C instance into a separate action. Avoids explicit error roll-
back in ast_i2c_chan_create(). No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
index c3046223a4919..dc28a5cbb1c2a 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -107,7 +107,6 @@ static void ast_i2c_release(struct drm_device *dev, void *res)
 	struct ast_i2c_chan *i2c = res;
 
 	i2c_del_adapter(&i2c->adapter);
-	kfree(i2c);
 }
 
 struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
@@ -115,7 +114,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	struct ast_i2c_chan *i2c;
 	int ret;
 
-	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
+	i2c = drmm_kzalloc(dev->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return ERR_PTR(-ENOMEM);
 
@@ -137,7 +136,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	ret = i2c_bit_add_bus(&i2c->adapter);
 	if (ret) {
 		drm_err(dev, "Failed to register bit i2c\n");
-		goto out_kfree;
+		return ERR_PTR(ret);
 	}
 
 	ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
@@ -145,8 +144,4 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 		return ERR_PTR(ret);
 
 	return i2c;
-
-out_kfree:
-	kfree(i2c);
-	return ERR_PTR(ret);
 }
-- 
2.44.0

