Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C694A336
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0728A10E477;
	Wed,  7 Aug 2024 08:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oGj4IbHH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y714tgA3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oGj4IbHH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y714tgA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928E210E463;
 Wed,  7 Aug 2024 08:45:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2861221D04;
 Wed,  7 Aug 2024 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhSMyHJ4JX9O+w+eoZQstAqo6edtpuWyyubJ5xF/qkY=;
 b=oGj4IbHHC0d10AU0ZisxWoICpSmpEAoBxonUL0/NcM6BUmxpG0oet6xJFGe1QsbGp7hh4v
 pb/iT8WBu6qkOn3Wr0AIj0lWYmdCk6r6+jTQ6zvMNvqQiKTYcHUlSogB4CqokZKZp3CLzc
 34ZVJh73jJ5eKB81cXFshH4VwfEcWUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhSMyHJ4JX9O+w+eoZQstAqo6edtpuWyyubJ5xF/qkY=;
 b=Y714tgA301tj8xFkRVNBgwmJJgc+UrZeJmhr96IAHxBF4cysWWBCN1pzITUWckdGlnTKOe
 sv9Y7HAhd3NAzQBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhSMyHJ4JX9O+w+eoZQstAqo6edtpuWyyubJ5xF/qkY=;
 b=oGj4IbHHC0d10AU0ZisxWoICpSmpEAoBxonUL0/NcM6BUmxpG0oet6xJFGe1QsbGp7hh4v
 pb/iT8WBu6qkOn3Wr0AIj0lWYmdCk6r6+jTQ6zvMNvqQiKTYcHUlSogB4CqokZKZp3CLzc
 34ZVJh73jJ5eKB81cXFshH4VwfEcWUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhSMyHJ4JX9O+w+eoZQstAqo6edtpuWyyubJ5xF/qkY=;
 b=Y714tgA301tj8xFkRVNBgwmJJgc+UrZeJmhr96IAHxBF4cysWWBCN1pzITUWckdGlnTKOe
 sv9Y7HAhd3NAzQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3AAA13297;
 Wed,  7 Aug 2024 08:45:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPuALjc0s2ZmfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Aug 2024 08:45:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/8] drm/nouveau: Do not set struct
 drm_mode_config_funcs.output_poll_changed
Date: Wed,  7 Aug 2024 10:41:36 +0200
Message-ID: <20240807084539.304014-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807084539.304014-1-tzimmermann@suse.de>
References: <20240807084539.304014-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; REPLY(-4.00)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.80
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
display otplugging internally.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

