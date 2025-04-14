Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34EA88326
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26CC10E5E7;
	Mon, 14 Apr 2025 13:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FXHl6uuJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+2fJ3B9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FXHl6uuJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+2fJ3B9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E3010E5E6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:51:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D96FF21222;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WPUXHBObQLzJ79czd8kBzrnSwZA9lR+FHCXlGSSmctw=;
 b=FXHl6uuJ1K0TXSyvWVtQHtHQeb8q28awLLb2kD7Fpr4fN3hvVmShQ6lMJtzvNVAyUoLYrv
 bMWKmtY0qHKItnC0X6zEzZtlPb7mgRen9xdWoVf0kjko+FFLR4QSZjHcU2nsThPXj2HQZ6
 0QMcI3LXK1+e3ypZ+atg3WJJ8UCKSH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WPUXHBObQLzJ79czd8kBzrnSwZA9lR+FHCXlGSSmctw=;
 b=8+2fJ3B9ZNVbiExkGNAlW0782Da1AoSJmUjYCWAuUmgselh1bCU8PFhytgdz7SCQQFK5GE
 qGNISg4Q5QHhgICg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WPUXHBObQLzJ79czd8kBzrnSwZA9lR+FHCXlGSSmctw=;
 b=FXHl6uuJ1K0TXSyvWVtQHtHQeb8q28awLLb2kD7Fpr4fN3hvVmShQ6lMJtzvNVAyUoLYrv
 bMWKmtY0qHKItnC0X6zEzZtlPb7mgRen9xdWoVf0kjko+FFLR4QSZjHcU2nsThPXj2HQZ6
 0QMcI3LXK1+e3ypZ+atg3WJJ8UCKSH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WPUXHBObQLzJ79czd8kBzrnSwZA9lR+FHCXlGSSmctw=;
 b=8+2fJ3B9ZNVbiExkGNAlW0782Da1AoSJmUjYCWAuUmgselh1bCU8PFhytgdz7SCQQFK5GE
 qGNISg4Q5QHhgICg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AEAF136A7;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +K2eJOAS/We6BQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:51:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/radeon: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 14 Apr 2025 15:48:16 +0200
Message-ID: <20250414134821.568225-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid, amd.com:email]
X-Spam-Score: -3.30
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/radeon_display.c | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 8f5f8abcb1b4..d8224fb027ba 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1328,7 +1328,7 @@ radeon_user_framebuffer_create(struct drm_device *dev,
 	}
 
 	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		DRM_DEBUG_KMS("Cannot create framebuffer from imported dma_buf\n");
 		drm_gem_object_put(obj);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index a0fc0801abb0..2d958272d810 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -60,7 +60,7 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 	mutex_unlock(&bo->rdev->gem.mutex);
 	radeon_bo_clear_surface_reg(bo);
 	WARN_ON_ONCE(!list_empty(&bo->va));
-	if (bo->tbo.base.import_attach)
+	if (drm_gem_is_imported(&bo->tbo.base))
 		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
 	drm_gem_object_release(&bo->tbo.base);
 	kfree(bo);
-- 
2.49.0

