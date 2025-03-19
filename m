Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA136A686E6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9E810E2EC;
	Wed, 19 Mar 2025 08:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TMuBk+31";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CDffV7Wz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TMuBk+31";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CDffV7Wz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8A10E2EB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:34:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7CE7121A5D;
 Wed, 19 Mar 2025 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAO+JsJMxWZgTnRVhxwjpgZeQwuEsPtNDoKpcxHqNVI=;
 b=TMuBk+318+IS1lDe3S9sTLCNEVdg/qg4pRWDKX1hrzy1R7mS+czNeMeJOfoivnH7UClali
 y6hjQ9YIMiUXZhQCztBpgVo/ILM/TXKTV5+LweVdzYT2NNxv7yN7EdvRPOdUBDR3hK5LZf
 zPhAzmzca/5OHbZmcPUJYSn/siVj2Ts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAO+JsJMxWZgTnRVhxwjpgZeQwuEsPtNDoKpcxHqNVI=;
 b=CDffV7Wzay8WPelc9c5y7hNmNRBsZ88V31pBSHeWcsVbqBkbYTK+3t9lk+HTCpRB3F5WQn
 Xt3Rp8AWcfgnUaBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAO+JsJMxWZgTnRVhxwjpgZeQwuEsPtNDoKpcxHqNVI=;
 b=TMuBk+318+IS1lDe3S9sTLCNEVdg/qg4pRWDKX1hrzy1R7mS+czNeMeJOfoivnH7UClali
 y6hjQ9YIMiUXZhQCztBpgVo/ILM/TXKTV5+LweVdzYT2NNxv7yN7EdvRPOdUBDR3hK5LZf
 zPhAzmzca/5OHbZmcPUJYSn/siVj2Ts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAO+JsJMxWZgTnRVhxwjpgZeQwuEsPtNDoKpcxHqNVI=;
 b=CDffV7Wzay8WPelc9c5y7hNmNRBsZ88V31pBSHeWcsVbqBkbYTK+3t9lk+HTCpRB3F5WQn
 Xt3Rp8AWcfgnUaBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18FC913A38;
 Wed, 19 Mar 2025 08:33:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8LrmBHKB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/18] drm/sysfb: Merge mode-config functions
Date: Wed, 19 Mar 2025 08:45:06 +0100
Message-ID: <20250319083021.6472-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319083021.6472-1-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_COUNT_TWO(0.00)[2];
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

Provide initializer to set struct drm_mode_config_funcs. Convert
ofdrm and simpledrm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h | 9 +++++++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 4 +---
 drivers/gpu/drm/sysfb/simpledrm.c        | 4 +---
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 8b4cc4af702b..cf80b291014a 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -37,4 +37,13 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
 	return container_of(dev, struct drm_sysfb_device, dev);
 }
 
+/*
+ * Mode config
+ */
+
+#define DRM_SYSFB_MODE_CONFIG_FUNCS \
+	.fb_create = drm_gem_fb_create_with_dirty, \
+	.atomic_check = drm_atomic_helper_check, \
+	.atomic_commit = drm_atomic_helper_commit
+
 #endif
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 7df6901157fb..470b93f0f791 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -1018,9 +1018,7 @@ static const struct drm_connector_funcs ofdrm_connector_funcs = {
 };
 
 static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
+	DRM_SYSFB_MODE_CONFIG_FUNCS,
 };
 
 /*
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 149df6941b6c..0cee8e1b2108 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -747,9 +747,7 @@ static const struct drm_connector_funcs simpledrm_connector_funcs = {
 };
 
 static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
+	DRM_SYSFB_MODE_CONFIG_FUNCS,
 };
 
 /*
-- 
2.48.1

