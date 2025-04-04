Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D1A7BDCE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530DE10EBBE;
	Fri,  4 Apr 2025 13:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Up+JsUZh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1M588qDZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Up+JsUZh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1M588qDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C4310EBBC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:30:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 00BC72119E;
 Fri,  4 Apr 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV8tipcC5RVoiFxeHQV/hIT0VdmY8N40eUK5VecsP0g=;
 b=Up+JsUZhVyAQuc3ldiu2YOR/wcWMEYSgsbH87AJBMMpZnp6M9ngZPpAfNVgPdQpm7yUbiz
 MvxI8UzoDAgTb2soOMGyfpdx2BA2Gc1JOMur60XiTWmQkDOorMHP0/ic53sYvBS6eL+LAw
 wkY3KhQljAV9g7A/IofQjTHcd1EVZbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV8tipcC5RVoiFxeHQV/hIT0VdmY8N40eUK5VecsP0g=;
 b=1M588qDZN0Dd/LOkIc6mFj+vBlFzusUI6FvUWzqrcPmMPpDB1JDJEdg04ZqK9GLoVG+ZhM
 2OlbHSXY1pcmy6CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV8tipcC5RVoiFxeHQV/hIT0VdmY8N40eUK5VecsP0g=;
 b=Up+JsUZhVyAQuc3ldiu2YOR/wcWMEYSgsbH87AJBMMpZnp6M9ngZPpAfNVgPdQpm7yUbiz
 MvxI8UzoDAgTb2soOMGyfpdx2BA2Gc1JOMur60XiTWmQkDOorMHP0/ic53sYvBS6eL+LAw
 wkY3KhQljAV9g7A/IofQjTHcd1EVZbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV8tipcC5RVoiFxeHQV/hIT0VdmY8N40eUK5VecsP0g=;
 b=1M588qDZN0Dd/LOkIc6mFj+vBlFzusUI6FvUWzqrcPmMPpDB1JDJEdg04ZqK9GLoVG+ZhM
 2OlbHSXY1pcmy6CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B984213A82;
 Fri,  4 Apr 2025 13:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KNQTLNre72eYXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Apr 2025 13:30:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/gem-vram: Un-export pin helpers
Date: Fri,  4 Apr 2025 15:23:33 +0200
Message-ID: <20250404132907.225803-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404132907.225803-1-tzimmermann@suse.de>
References: <20250404132907.225803-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLwtd9qf4a971hssh5godp6qbx)];
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

There are no external callers of the gem-vram pin helpers. Hence
unexport them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 42 ++-------------------------
 include/drm/drm_gem_vram_helper.h     |  2 --
 2 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index c73480d318362..ead50fef5e7d4 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -88,11 +88,6 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * drmm_vram_helper_init() is a managed interface that installs a
  * clean-up handler to run during the DRM device's release.
  *
- * For drawing or scanout operations, rsp. buffer objects have to be pinned
- * in video RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
- * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM or system
- * memory. Call drm_gem_vram_unpin() to release the pinned object afterwards.
- *
  * A buffer object that is pinned in video RAM has a fixed address within that
  * memory region. Call drm_gem_vram_offset() to retrieve this value. Typically
  * it's used to program the hardware's scanout engine for framebuffers, set
@@ -299,30 +294,7 @@ static int drm_gem_vram_pin_locked(struct drm_gem_vram_object *gbo,
 	return 0;
 }
 
-/**
- * drm_gem_vram_pin() - Pins a GEM VRAM object in a region.
- * @gbo:	the GEM VRAM object
- * @pl_flag:	a bitmask of possible memory regions
- *
- * Pinning a buffer object ensures that it is not evicted from
- * a memory region. A pinned buffer object has to be unpinned before
- * it can be pinned to another region. If the pl_flag argument is 0,
- * the buffer is pinned at its current location (video RAM or system
- * memory).
- *
- * Small buffer objects, such as cursor images, can lead to memory
- * fragmentation if they are pinned in the middle of video RAM. This
- * is especially a problem on devices with only a small amount of
- * video RAM. Fragmentation can prevent the primary framebuffer from
- * fitting in, even though there's enough memory overall. The modifier
- * DRM_GEM_VRAM_PL_FLAG_TOPDOWN marks the buffer object to be pinned
- * at the high end of the memory region to avoid fragmentation.
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
+static int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
 {
 	int ret;
 
@@ -334,7 +306,6 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_vram_pin);
 
 static void drm_gem_vram_unpin_locked(struct drm_gem_vram_object *gbo)
 {
@@ -343,15 +314,7 @@ static void drm_gem_vram_unpin_locked(struct drm_gem_vram_object *gbo)
 	ttm_bo_unpin(&gbo->bo);
 }
 
-/**
- * drm_gem_vram_unpin() - Unpins a GEM VRAM object
- * @gbo:	the GEM VRAM object
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
+static int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 {
 	int ret;
 
@@ -364,7 +327,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_gem_vram_unpin);
 
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 00830b49a3ffc..2dd42bed679d1 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -94,8 +94,6 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						unsigned long pg_align);
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
-int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
-int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 			 struct iosys_map *map);
-- 
2.49.0

