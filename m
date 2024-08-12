Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCB194E8A7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8AC10E168;
	Mon, 12 Aug 2024 08:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WIABboRL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nizY7D0h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WIABboRL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nizY7D0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F52110E09E;
 Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2EBDE224D2;
 Mon, 12 Aug 2024 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TW9iU8wi2AeS1LaqvHZX4V6rNCMHkKojDEe0+M9BCdk=;
 b=WIABboRL6fl9XUxhcgBHeGA81ed9+N01JU9jrymk5UGtueSazF8DqydY2rSrNKfOVwQYNs
 gX4zIGk8ZEVHHV7oJeeoU6ICQX+4P0aVvFQAe4FSWx9CKAnlXq6khcHmWIwX+4QUFKgYHq
 Oy5wJgW9G5hv9YqaVHwMWWNHRH6FT/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TW9iU8wi2AeS1LaqvHZX4V6rNCMHkKojDEe0+M9BCdk=;
 b=nizY7D0h4zE8uabX8G3ZwkNt+cKZ/tVn9Ixz3bxoEV+sVhm2cUFVwCyPGIVZBstOHpGZRM
 rKEWqAF91pLEEIBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TW9iU8wi2AeS1LaqvHZX4V6rNCMHkKojDEe0+M9BCdk=;
 b=WIABboRL6fl9XUxhcgBHeGA81ed9+N01JU9jrymk5UGtueSazF8DqydY2rSrNKfOVwQYNs
 gX4zIGk8ZEVHHV7oJeeoU6ICQX+4P0aVvFQAe4FSWx9CKAnlXq6khcHmWIwX+4QUFKgYHq
 Oy5wJgW9G5hv9YqaVHwMWWNHRH6FT/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TW9iU8wi2AeS1LaqvHZX4V6rNCMHkKojDEe0+M9BCdk=;
 b=nizY7D0h4zE8uabX8G3ZwkNt+cKZ/tVn9Ixz3bxoEV+sVhm2cUFVwCyPGIVZBstOHpGZRM
 rKEWqAF91pLEEIBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C988313A23;
 Mon, 12 Aug 2024 08:30:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qAb+Lw7IuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 4/9] drm/nouveau: Do not set struct
 drm_mode_config_funcs.output_poll_changed
Date: Mon, 12 Aug 2024 10:28:25 +0200
Message-ID: <20240812083000.337744-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

The output_poll_changed hook was only necessary before in-kernel
DRM clients existed, but is now obsolete. The client code handles
display hotplugging internally.

v2:
- fix commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 1 -
 drivers/gpu/drm/nouveau/nouveau_display.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e4c8ce6dd40a..eed579a6c858 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2648,7 +2648,6 @@ nv50_disp_atomic_state_alloc(struct drm_device *dev)
 static const struct drm_mode_config_funcs
 nv50_disp_func = {
 	.fb_create = nouveau_user_framebuffer_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = nv50_disp_atomic_check,
 	.atomic_commit = nv50_disp_atomic_commit,
 	.atomic_state_alloc = nv50_disp_atomic_state_alloc,
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 8a87e9697a42..e2fd561cd23f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -391,7 +391,6 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 
 static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
 	.fb_create = nouveau_user_framebuffer_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 };
 
 
-- 
2.46.0

