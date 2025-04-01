Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572EA77803
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB6110E53A;
	Tue,  1 Apr 2025 09:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cafh56IY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RprIhznk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cafh56IY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RprIhznk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0F410E535
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:44:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36E49211A3;
 Tue,  1 Apr 2025 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743500669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRe2kdB4TVjVjG74iO9nH/BQxJGCGgobSHwgVVUq3ec=;
 b=cafh56IYsnHqTjg3tl4leauA5v60O/pc+/2ajNr1WtQWg6DlXIETuJfRug3XuAwoHMRjDo
 eC6AEOz3J/PUDHaNugiBpUq/eEqr6skZRcn5y+Gir02AMGxAxEWO2qrycOpQKJQT/XKbpC
 +oWelqeknIiAno+J8rEYeM2yO2m2XqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743500669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRe2kdB4TVjVjG74iO9nH/BQxJGCGgobSHwgVVUq3ec=;
 b=RprIhznkYbd/sI7x8Db+B0gGcg4aYtCUWIBQ0qpTYHl7IkaEr3OcnLGFBEBZyV+sw/UGM9
 5l82eIIUbnEMcqAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743500669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRe2kdB4TVjVjG74iO9nH/BQxJGCGgobSHwgVVUq3ec=;
 b=cafh56IYsnHqTjg3tl4leauA5v60O/pc+/2ajNr1WtQWg6DlXIETuJfRug3XuAwoHMRjDo
 eC6AEOz3J/PUDHaNugiBpUq/eEqr6skZRcn5y+Gir02AMGxAxEWO2qrycOpQKJQT/XKbpC
 +oWelqeknIiAno+J8rEYeM2yO2m2XqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743500669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRe2kdB4TVjVjG74iO9nH/BQxJGCGgobSHwgVVUq3ec=;
 b=RprIhznkYbd/sI7x8Db+B0gGcg4aYtCUWIBQ0qpTYHl7IkaEr3OcnLGFBEBZyV+sw/UGM9
 5l82eIIUbnEMcqAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F389C138A5;
 Tue,  1 Apr 2025 09:44:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2KYjOny162dSBgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 09:44:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/18] drm/sysfb: Merge connector functions
Date: Tue,  1 Apr 2025 11:37:11 +0200
Message-ID: <20250401094056.32904-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401094056.32904-1-tzimmermann@suse.de>
References: <20250401094056.32904-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

Merge the connector functions of ofdrm and simpledrm. Replace the
code in each driver with the shared helpers. Set up callbacks with
initializer macros.

No effective code changes. The sysfb connector only returns the
preconfigured display mode.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 14 ++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h | 15 +++++++++++++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 14 ++------------
 drivers/gpu/drm/sysfb/simpledrm.c        | 14 ++------------
 4 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index 6deeac81a41de..355e025c7c625 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -2,6 +2,8 @@
 
 #include <linux/module.h>
 
+#include <drm/drm_probe_helper.h>
+
 #include "drm_sysfb_helper.h"
 
 MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
@@ -30,3 +32,15 @@ struct drm_display_mode drm_sysfb_mode(unsigned int width,
 	}
 }
 EXPORT_SYMBOL(drm_sysfb_mode);
+
+/*
+ * Connector
+ */
+
+int drm_sysfb_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
+
+	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
+}
+EXPORT_SYMBOL(drm_sysfb_connector_helper_get_modes);
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index cf80b291014a0..7e3fe9fa5cff9 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -37,6 +37,21 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
 	return container_of(dev, struct drm_sysfb_device, dev);
 }
 
+/*
+ * Connector
+ */
+
+int drm_sysfb_connector_helper_get_modes(struct drm_connector *connector);
+
+#define DRM_SYSFB_CONNECTOR_HELPER_FUNCS \
+	.get_modes = drm_sysfb_connector_helper_get_modes
+
+#define DRM_SYSFB_CONNECTOR_FUNCS \
+	.reset = drm_atomic_helper_connector_reset, \
+	.fill_modes = drm_helper_probe_single_connector_modes, \
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state, \
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state
+
 /*
  * Mode config
  */
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 470b93f0f791a..85db7441d1bf4 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -998,23 +998,13 @@ static const struct drm_encoder_funcs ofdrm_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
-
-	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
-}
-
 static const struct drm_connector_helper_funcs ofdrm_connector_helper_funcs = {
-	.get_modes = ofdrm_connector_helper_get_modes,
+	DRM_SYSFB_CONNECTOR_HELPER_FUNCS,
 };
 
 static const struct drm_connector_funcs ofdrm_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
+	DRM_SYSFB_CONNECTOR_FUNCS,
 	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 0cee8e1b21084..6d76d125d126a 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -727,23 +727,13 @@ static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
-
-	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
-}
-
 static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
-	.get_modes = simpledrm_connector_helper_get_modes,
+	DRM_SYSFB_CONNECTOR_HELPER_FUNCS,
 };
 
 static const struct drm_connector_funcs simpledrm_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
+	DRM_SYSFB_CONNECTOR_FUNCS,
 	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
-- 
2.49.0

