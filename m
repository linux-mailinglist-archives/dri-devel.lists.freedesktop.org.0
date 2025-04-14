Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C88A88322
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04A010E5E2;
	Mon, 14 Apr 2025 13:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tDi9xW3k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FqtUpxHB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tDi9xW3k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FqtUpxHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D8F10E5E2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:51:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9610521214;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3nuLCzhYtoatO7jeML8JVOvZLzm7PmKL3a4m7v7pjAU=;
 b=tDi9xW3ksaeiDdfcaR0/09X9I8vwrteSOBR1u5LhQZvNC9H28Gr/Iym7gv5QsIxhtpQd4B
 NnkmKOhTsdI4NA1zo1jS20Zmo5mi9sFKP3qlQLkaU/5rxOw+47WarOQHf6p93H0z94iLJV
 IvJNJDiUW+hX3MaxIjok1sjc0R5DmXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3nuLCzhYtoatO7jeML8JVOvZLzm7PmKL3a4m7v7pjAU=;
 b=FqtUpxHB+LAO7CC+GfKcUAc8leYt4bfs41zJWoj9jnvxoGjo7SARDahywovd6obmNopkxS
 EWxmyQsnrPnT7ZCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3nuLCzhYtoatO7jeML8JVOvZLzm7PmKL3a4m7v7pjAU=;
 b=tDi9xW3ksaeiDdfcaR0/09X9I8vwrteSOBR1u5LhQZvNC9H28Gr/Iym7gv5QsIxhtpQd4B
 NnkmKOhTsdI4NA1zo1jS20Zmo5mi9sFKP3qlQLkaU/5rxOw+47WarOQHf6p93H0z94iLJV
 IvJNJDiUW+hX3MaxIjok1sjc0R5DmXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3nuLCzhYtoatO7jeML8JVOvZLzm7PmKL3a4m7v7pjAU=;
 b=FqtUpxHB+LAO7CC+GfKcUAc8leYt4bfs41zJWoj9jnvxoGjo7SARDahywovd6obmNopkxS
 EWxmyQsnrPnT7ZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4956613A87;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yJC0EOAS/We6BQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:51:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/11] drm/i915: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 14 Apr 2025 15:48:15 +0200
Message-ID: <20250414134821.568225-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 1f38e367c60b..27f5351f046a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -371,12 +371,12 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 	 * and ttm_bo_cleanup_memtype_use() shouldn't be invoked for
 	 * dma-buf, so it's safe to take the lock.
 	 */
-	if (obj->base.import_attach)
+	if (drm_gem_is_imported(&obj->base))
 		i915_gem_object_lock(obj, NULL);
 
 	__i915_gem_object_put_pages(obj);
 
-	if (obj->base.import_attach)
+	if (drm_gem_is_imported(&obj->base))
 		i915_gem_object_unlock(obj);
 
 	GEM_BUG_ON(i915_gem_object_has_pages(obj));
@@ -390,7 +390,7 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
 
 	bitmap_free(obj->bit_17);
 
-	if (obj->base.import_attach)
+	if (drm_gem_is_imported(&obj->base))
 		drm_prime_gem_destroy(&obj->base, NULL);
 
 	drm_gem_free_mmap_offset(&obj->base);
-- 
2.49.0

