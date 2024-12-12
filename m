Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA69EF497
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843EE10EE56;
	Thu, 12 Dec 2024 17:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ONpjBxIX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tiAEOjYy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ONpjBxIX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tiAEOjYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742B910E48A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 339DB1F37C;
 Thu, 12 Dec 2024 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo53fa9Izu9Q8AodKefDict3SQ10Abm56aKsmbt4FWM=;
 b=ONpjBxIXRCRxoM0BFzOVx8T+W6NvRMylxcApgneLo9DPRVb7Yfew6ngeGQoD4TB8eLZs02
 ao2tJwIHCfOZ6kAlmfNFj0OJqL0z/tZEgyNIBkYJjJofhVY5JfS+F8rhU3EIKm5aBZ90Wq
 yu14l2m31PO7AGG7Rk3wnAOpwK1ZZY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo53fa9Izu9Q8AodKefDict3SQ10Abm56aKsmbt4FWM=;
 b=tiAEOjYy0JticF5SVKhBWvpSzoBza0iH+NLdHnFuzK6S+q4r92sY5+p1YloczvbtsGuiSz
 8Ov681TOu6o+SlAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ONpjBxIX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tiAEOjYy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo53fa9Izu9Q8AodKefDict3SQ10Abm56aKsmbt4FWM=;
 b=ONpjBxIXRCRxoM0BFzOVx8T+W6NvRMylxcApgneLo9DPRVb7Yfew6ngeGQoD4TB8eLZs02
 ao2tJwIHCfOZ6kAlmfNFj0OJqL0z/tZEgyNIBkYJjJofhVY5JfS+F8rhU3EIKm5aBZ90Wq
 yu14l2m31PO7AGG7Rk3wnAOpwK1ZZY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo53fa9Izu9Q8AodKefDict3SQ10Abm56aKsmbt4FWM=;
 b=tiAEOjYy0JticF5SVKhBWvpSzoBza0iH+NLdHnFuzK6S+q4r92sY5+p1YloczvbtsGuiSz
 8Ov681TOu6o+SlAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C672613508;
 Thu, 12 Dec 2024 17:09:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UHdAL8AYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/12] drm/client: Add client-hotplug helper
Date: Thu, 12 Dec 2024 18:08:43 +0100
Message-ID: <20241212170913.185939-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 339DB1F37C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Move client hotplug calls to drm_client_hotplug(). We'll need this
helper to send hotplug events after resuming.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client_event.c | 32 ++++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index e303de564485..8514df4a2e65 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -49,6 +49,23 @@ void drm_client_dev_unregister(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_client_dev_unregister);
 
+static void drm_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (!client->funcs || !client->funcs->hotplug)
+		return;
+
+	if (client->hotplug_failed)
+		return;
+
+	ret = client->funcs->hotplug(client);
+	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+	if (ret)
+		client->hotplug_failed = true;
+}
+
 /**
  * drm_client_dev_hotplug - Send hotplug event to clients
  * @dev: DRM device
@@ -61,7 +78,6 @@ EXPORT_SYMBOL(drm_client_dev_unregister);
 void drm_client_dev_hotplug(struct drm_device *dev)
 {
 	struct drm_client_dev *client;
-	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return;
@@ -72,18 +88,8 @@ void drm_client_dev_hotplug(struct drm_device *dev)
 	}
 
 	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry(client, &dev->clientlist, list) {
-		if (!client->funcs || !client->funcs->hotplug)
-			continue;
-
-		if (client->hotplug_failed)
-			continue;
-
-		ret = client->funcs->hotplug(client);
-		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
-		if (ret)
-			client->hotplug_failed = true;
-	}
+	list_for_each_entry(client, &dev->clientlist, list)
+		drm_client_hotplug(client);
 	mutex_unlock(&dev->clientlist_mutex);
 }
 EXPORT_SYMBOL(drm_client_dev_hotplug);
-- 
2.47.1

