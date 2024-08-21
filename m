Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC2959DB3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5B710E9E9;
	Wed, 21 Aug 2024 13:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DbBX0ZZ9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6nNFdAXD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DbBX0ZZ9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6nNFdAXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A7F10E9C4;
 Wed, 21 Aug 2024 13:04:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4067A22312;
 Wed, 21 Aug 2024 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCEdS0DuOPTM5gjZn7OCMgJCtbBK5m+j8G3bP0ouqvI=;
 b=DbBX0ZZ9KC9bMQdfF8J3+IPz2NhkS9edxvM+s8qKpowYs365E6rbcSXk3WxZf2S5Wnvr4i
 VlhGSHCNr2HyoTeoDpZS9oUUES2hAy85R7vaO1cNFejlfx9ALwa3O40H6taFECNm1MychC
 rE5V5lT3FKO/DWeNM6SyT75dtxSQZwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCEdS0DuOPTM5gjZn7OCMgJCtbBK5m+j8G3bP0ouqvI=;
 b=6nNFdAXDLxGtN9GPz0uqmWOwA9DSFts7J5bHXTLxXfO4SS75rH4vAoMpTz2a4k3I/6VHLN
 81Inz1LVYnQ2u+AA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DbBX0ZZ9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6nNFdAXD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCEdS0DuOPTM5gjZn7OCMgJCtbBK5m+j8G3bP0ouqvI=;
 b=DbBX0ZZ9KC9bMQdfF8J3+IPz2NhkS9edxvM+s8qKpowYs365E6rbcSXk3WxZf2S5Wnvr4i
 VlhGSHCNr2HyoTeoDpZS9oUUES2hAy85R7vaO1cNFejlfx9ALwa3O40H6taFECNm1MychC
 rE5V5lT3FKO/DWeNM6SyT75dtxSQZwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCEdS0DuOPTM5gjZn7OCMgJCtbBK5m+j8G3bP0ouqvI=;
 b=6nNFdAXDLxGtN9GPz0uqmWOwA9DSFts7J5bHXTLxXfO4SS75rH4vAoMpTz2a4k3I/6VHLN
 81Inz1LVYnQ2u+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FBA013770;
 Wed, 21 Aug 2024 13:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GLhpDM3lxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v2 61/86] drm/virtgpu: Run DRM default client setup
Date: Wed, 21 Aug 2024 14:59:58 +0200
Message-ID: <20240821130348.73038-62-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4067A22312
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[14]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,redhat.com,chromium.org,gmail.com];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The virtgpu driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index e5a2665e50ea..1e08d91a4d17 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -34,6 +34,7 @@
 #include <drm/drm.h>
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
@@ -103,7 +104,8 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	if (ret)
 		goto err_deinit;
 
-	drm_fbdev_shmem_setup(vdev->priv, 32);
+	drm_client_setup(vdev->priv, NULL);
+
 	return 0;
 
 err_deinit:
@@ -184,6 +186,8 @@ static const struct drm_driver driver = {
 	.dumb_create = virtio_gpu_mode_dumb_create,
 	.dumb_map_offset = virtio_gpu_mode_dumb_mmap,
 
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = virtio_gpu_debugfs_init,
 #endif
-- 
2.46.0

