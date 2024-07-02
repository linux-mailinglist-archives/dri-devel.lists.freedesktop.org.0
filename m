Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C99924074
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4227310E227;
	Tue,  2 Jul 2024 14:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oEBBIKK3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Az5Mk+zK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SZoJTd60";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P/aHVHQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC5C10E227;
 Tue,  2 Jul 2024 14:20:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C18D51FBAB;
 Tue,  2 Jul 2024 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719930039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3arCfMnSLD6TmGayHJHudTbjvKxANzAoXW5QPbJX0u8=;
 b=oEBBIKK3ZlLz9bpQWUKx05VN+e9UkfZquEBUWmDsQTyDCcjlMXMxljocbh7yy88iz/c4rx
 bltSqZAOHh0qaao6+B2qpznvtzd6q98tpGlQ6GtuKKlkTNj9iFsfOMqSaSPCNOEeY5CRJv
 xEVYNlYmVWTGy63arnAic+3iGJfeaO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719930039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3arCfMnSLD6TmGayHJHudTbjvKxANzAoXW5QPbJX0u8=;
 b=Az5Mk+zKxbfLFQhms8ElUy7WMV+lwyn+UTn8Po1BkY2q49iQ/gujzTZooATGvwb9IU01Vo
 amdCuabJN2rJo3AA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SZoJTd60;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="P/aHVHQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719930038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3arCfMnSLD6TmGayHJHudTbjvKxANzAoXW5QPbJX0u8=;
 b=SZoJTd60p4my1o+2OPJKzY0rLo+8lZ6rTav0YzEV0azo/4TL+qshuOmhrihKibswQszr1w
 M5kW7kRiVFXya5euOwiII8jG5h3bWLW4a0TI+uSCIiChmf791CUVn/9z5PxEGZ3u/9rYAm
 dhUeC4XJ4eMbCcTUIbA5rFgVnbFTDfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719930038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3arCfMnSLD6TmGayHJHudTbjvKxANzAoXW5QPbJX0u8=;
 b=P/aHVHQqsIydYpS3snIaAamUOdhrxxiX4kRVvbve4t2Mkult3fjcKDpOvmaXTWswf4wgcd
 2vXfLKKoH62aTrBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6620A13A9A;
 Tue,  2 Jul 2024 14:20:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id g4S1F7YMhGZcEQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Jul 2024 14:20:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: regressions@leemhuis.info, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Kaplan <david.kaplan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/qxl: Pin buffer objects for internal mappings
Date: Tue,  2 Jul 2024 16:20:07 +0200
Message-ID: <20240702142034.32615-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[15];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[redhat.com,collabora.com,broadcom.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C18D51FBAB
X-Spam-Flag: NO
X-Spam-Score: -3.51
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

Add qxl_bo_pin_and_vmap() that pins and vmaps a buffer object in one
step. Update callers of the regular qxl_bo_vmap(). Fixes a bug where
qxl accesses an unpinned buffer object while it is being moved; such
as with the monitor-description BO. An typical error is shown below.

[    4.303586] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65376256x16777216+0+0
[    4.586883] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65376256x16777216+0+0
[    4.904036] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65335296x16777216+0+0
[    5.374347] [drm:qxl_release_from_id_locked] *ERROR* failed to find id in release_idr

Commit b33651a5c98d ("drm/qxl: Do not pin buffer objects for vmap")
removed the implicit pin operation from qxl's vmap code. This is the
correct behavior for GEM and PRIME interfaces, but the pin is still
needed for qxl internal operation.

Also add a corresponding function qxl_bo_vunmap_and_unpin() and remove
the old qxl_bo_vmap() helpers.

Future directions: BOs should not be pinned or vmapped unnecessarily.
The pin-and-vmap operation should be removed from the driver and a
temporary mapping should be established with a vmap_local-like helper.
See the client helper drm_client_buffer_vmap_local() for semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b33651a5c98d ("drm/qxl: Do not pin buffer objects for vmap")
Reported-by: David Kaplan <david.kaplan@amd.com>
Closes: https://lore.kernel.org/dri-devel/ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de/
Tested-by: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux.dev
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_display.c | 14 +++++++-------
 drivers/gpu/drm/qxl/qxl_object.c  | 11 +++++++++--
 drivers/gpu/drm/qxl/qxl_object.h  |  4 ++--
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 86a5dea710c0..bc24af08dfcd 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -584,11 +584,11 @@ static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
 	if (ret)
 		goto err;
 
-	ret = qxl_bo_vmap(cursor_bo, &cursor_map);
+	ret = qxl_bo_pin_and_vmap(cursor_bo, &cursor_map);
 	if (ret)
 		goto err_unref;
 
-	ret = qxl_bo_vmap(user_bo, &user_map);
+	ret = qxl_bo_pin_and_vmap(user_bo, &user_map);
 	if (ret)
 		goto err_unmap;
 
@@ -614,12 +614,12 @@ static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
 		       user_map.vaddr, size);
 	}
 
-	qxl_bo_vunmap(user_bo);
-	qxl_bo_vunmap(cursor_bo);
+	qxl_bo_vunmap_and_unpin(user_bo);
+	qxl_bo_vunmap_and_unpin(cursor_bo);
 	return cursor_bo;
 
 err_unmap:
-	qxl_bo_vunmap(cursor_bo);
+	qxl_bo_vunmap_and_unpin(cursor_bo);
 err_unref:
 	qxl_bo_unpin(cursor_bo);
 	qxl_bo_unref(&cursor_bo);
@@ -1205,7 +1205,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
 	}
 	qdev->monitors_config_bo = gem_to_qxl_bo(gobj);
 
-	ret = qxl_bo_vmap(qdev->monitors_config_bo, &map);
+	ret = qxl_bo_pin_and_vmap(qdev->monitors_config_bo, &map);
 	if (ret)
 		return ret;
 
@@ -1236,7 +1236,7 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev)
 	qdev->monitors_config = NULL;
 	qdev->ram_header->monitors_config = 0;
 
-	ret = qxl_bo_vunmap(qdev->monitors_config_bo);
+	ret = qxl_bo_vunmap_and_unpin(qdev->monitors_config_bo);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 5893e27a7ae5..cb1b7c2580ae 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -182,7 +182,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 	return 0;
 }
 
-int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
+int qxl_bo_pin_and_vmap(struct qxl_bo *bo, struct iosys_map *map)
 {
 	int r;
 
@@ -190,7 +190,13 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
 	if (r)
 		return r;
 
+	r = qxl_bo_pin_locked(bo);
+	if (r)
+		return r;
+
 	r = qxl_bo_vmap_locked(bo, map);
+	if (r)
+		qxl_bo_unpin_locked(bo);
 	qxl_bo_unreserve(bo);
 	return r;
 }
@@ -241,7 +247,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
 }
 
-int qxl_bo_vunmap(struct qxl_bo *bo)
+int qxl_bo_vunmap_and_unpin(struct qxl_bo *bo)
 {
 	int r;
 
@@ -250,6 +256,7 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
 		return r;
 
 	qxl_bo_vunmap_locked(bo);
+	qxl_bo_unpin_locked(bo);
 	qxl_bo_unreserve(bo);
 	return 0;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 1cf5bc759101..875f63221074 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -59,9 +59,9 @@ extern int qxl_bo_create(struct qxl_device *qdev,
 			 u32 priority,
 			 struct qxl_surface *surf,
 			 struct qxl_bo **bo_ptr);
-int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map);
+int qxl_bo_pin_and_vmap(struct qxl_bo *bo, struct iosys_map *map);
 int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map);
-int qxl_bo_vunmap(struct qxl_bo *bo);
+int qxl_bo_vunmap_and_unpin(struct qxl_bo *bo);
 void qxl_bo_vunmap_locked(struct qxl_bo *bo);
 void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
-- 
2.45.2

