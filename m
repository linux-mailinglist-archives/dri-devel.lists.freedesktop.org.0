Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D6A650B9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C43C10E403;
	Mon, 17 Mar 2025 13:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fJkGlJwK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R8ylreoQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fJkGlJwK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R8ylreoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6965510E403
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:23:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3596E21BD0;
 Mon, 17 Mar 2025 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9GY+bMqBMcy0IiCvV/hq7iM/O0+edNNwpZBaTpydMY=;
 b=fJkGlJwKQQEzmV65yT0UnVaMHyv8LeQDDSX37mVe32HksaYPCVUYsCuv0DDc1tqY1NZHif
 QqimueQ1kAzZgU3AmM9nSRvC2McsFE7iXSOhY7l+uFtNtqYJPkZxkj8SmLWrru9r763jwK
 Q3UVgeKrPVwQEaH9eKrPL+qE+DCdXYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9GY+bMqBMcy0IiCvV/hq7iM/O0+edNNwpZBaTpydMY=;
 b=R8ylreoQUkDKDHuFhhPdIj79sItoD0nGKwwspRnNPk+9aG8dRzwK3+qAfMF40cyuhxz6y9
 yOeCeOEL9HteQLCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fJkGlJwK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R8ylreoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9GY+bMqBMcy0IiCvV/hq7iM/O0+edNNwpZBaTpydMY=;
 b=fJkGlJwKQQEzmV65yT0UnVaMHyv8LeQDDSX37mVe32HksaYPCVUYsCuv0DDc1tqY1NZHif
 QqimueQ1kAzZgU3AmM9nSRvC2McsFE7iXSOhY7l+uFtNtqYJPkZxkj8SmLWrru9r763jwK
 Q3UVgeKrPVwQEaH9eKrPL+qE+DCdXYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9GY+bMqBMcy0IiCvV/hq7iM/O0+edNNwpZBaTpydMY=;
 b=R8ylreoQUkDKDHuFhhPdIj79sItoD0nGKwwspRnNPk+9aG8dRzwK3+qAfMF40cyuhxz6y9
 yOeCeOEL9HteQLCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF12C139D2;
 Mon, 17 Mar 2025 13:22:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uPk7NSEi2GdFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, virtualization@lists.linux.dev
Subject: [PATCH 12/15] drm/virtio: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 17 Mar 2025 14:06:50 +0100
Message-ID: <20250317131923.238374-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3596E21BD0
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,redhat.com,chromium.org,gmail.com,lists.linux.dev];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: virtualization@lists.linux.dev
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a6f5a78f436a..e1dd38e7efe8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -366,13 +366,13 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 		return 0;
 
 	obj = new_state->fb->obj[0];
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		ret = virtio_gpu_prepare_imported_obj(plane, new_state, obj);
 		if (ret)
 			return ret;
 	}
 
-	if (bo->dumb || obj->import_attach) {
+	if (bo->dumb || drm_gem_is_imported(obj)) {
 		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
 						     vgdev->fence_drv.context,
 						     0);
@@ -409,7 +409,7 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 	}
 
 	obj = state->fb->obj[0];
-	if (obj->import_attach)
+	if (drm_gem_is_imported(obj))
 		virtio_gpu_cleanup_imported_obj(obj);
 }
 
@@ -501,7 +501,7 @@ static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 
 	/* Only support mapped shmem bo */
-	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo->base.vaddr)
+	if (virtio_gpu_is_vram(bo) || drm_gem_is_imported(&bo->base.base) || !bo->base.vaddr)
 		return -ENODEV;
 
 	iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
-- 
2.48.1

