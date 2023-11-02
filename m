Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F507DF353
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A4F10E88E;
	Thu,  2 Nov 2023 13:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E1210E8A0;
 Thu,  2 Nov 2023 13:11:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 20051219C7;
 Thu,  2 Nov 2023 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698930659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmHrIoOoEO0T1i1lKCOVDbPlje/2KJ8LEQRB7wxQ+3A=;
 b=RPdjMKpbnQbAuk816/1uJpuEY+AGeDDgmxzXjs+NsdDzeWGiqROO4vJoolcY9gm55qTL8E
 IOO1ikHmzEjWahWKOYIPAF6oRb4CmNqxUgQIw1LpLXdIVPKIJlpUBOGUjzjbF13Zy3IKzS
 ilgsRcYTA/h1edt7Ymhp8kc4ZDFcbjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698930659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmHrIoOoEO0T1i1lKCOVDbPlje/2KJ8LEQRB7wxQ+3A=;
 b=bXhH/XQovMvteDV8fHe2CmsE5D01nd0HW5LXN0fbaqRX0o5peqDfkr0ftmBHUnn42MzSe9
 NQ8KWPgupQd7hOAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D40B213A8C;
 Thu,  2 Nov 2023 13:10:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QJryMuKfQ2VRXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Nov 2023 13:10:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v6 1/7] drm/client: Do not acquire module reference
Date: Thu,  2 Nov 2023 14:08:06 +0100
Message-ID: <20231102131056.7256-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102131056.7256-1-tzimmermann@suse.de>
References: <20231102131056.7256-1-tzimmermann@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not acquire a reference on the module that provides a client's
callback functions in drm_client_init(). The additional reference
prevents the user from unloading the callback functions' module and
thus creating dangling pointers.

This is only necessary if there is no direct dependency between the
caller of drm_client_init() and the provider of the callbacks in
struct drm_client_funcs. If this case ever existed, it has been
removed from the DRM code. Callers of drm_client_init() also provide
the callback implementation. The lifetime of the clients is tied to
the dependency chain's outer-most module, which is the hardware's
DRM driver. Before client helpers could be unloaded, the driver module
would have to be unloaded, which also unregisters all clients.

Driver modules that set up DRM clients can now be unloaded.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_client.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index c3027115d0552..9403b3f576f7b 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -5,7 +5,6 @@
 
 #include <linux/iosys-map.h>
 #include <linux/list.h>
-#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -84,16 +83,13 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET) || !dev->driver->dumb_create)
 		return -EOPNOTSUPP;
 
-	if (funcs && !try_module_get(funcs->owner))
-		return -ENODEV;
-
 	client->dev = dev;
 	client->name = name;
 	client->funcs = funcs;
 
 	ret = drm_client_modeset_create(client);
 	if (ret)
-		goto err_put_module;
+		return ret;
 
 	ret = drm_client_open(client);
 	if (ret)
@@ -105,10 +101,6 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 
 err_free:
 	drm_client_modeset_free(client);
-err_put_module:
-	if (funcs)
-		module_put(funcs->owner);
-
 	return ret;
 }
 EXPORT_SYMBOL(drm_client_init);
@@ -177,8 +169,6 @@ void drm_client_release(struct drm_client_dev *client)
 	drm_client_modeset_free(client);
 	drm_client_close(client);
 	drm_dev_put(dev);
-	if (client->funcs)
-		module_put(client->funcs->owner);
 }
 EXPORT_SYMBOL(drm_client_release);
 
-- 
2.42.0

