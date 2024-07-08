Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0D92A482
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 16:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFF110E21A;
	Mon,  8 Jul 2024 14:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vQMjma44";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kfE/Lpqz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MGwheWi8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yqozqJ0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403CC10E21A;
 Mon,  8 Jul 2024 14:22:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D81B61FC26;
 Mon,  8 Jul 2024 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720448531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fFgKoydWdeJWMz+3vG8luz8Q5CRyhQmk+trEz5Y/0tA=;
 b=vQMjma44PZeAuKUHspE9ACYmzyY0LjJbdMba7vMD+2VPISwe/Fexh+p7uAoes1r9VOo8HH
 aiMpje7j69JvFZnDyBANeI+ItM2oBxU98/9beIERHO/AddCGhdKsUOXgbkMHyG2tFf+bdd
 OJS0UJ6wrrCfSl/TvKBei/5ysSQmuuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720448531;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fFgKoydWdeJWMz+3vG8luz8Q5CRyhQmk+trEz5Y/0tA=;
 b=kfE/Lpqz77NCK8JURDuIfmcFEQA5EVcfRpiHZjG5sb88J+9301q/s6tQM1AVGhxb3uN+l8
 7AuhdoJWdyEwGtDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720448530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fFgKoydWdeJWMz+3vG8luz8Q5CRyhQmk+trEz5Y/0tA=;
 b=MGwheWi8rryJmnjjl9IefmfzoSSDq8u8R6i0vjDLOGRLUKESEHpEKPVRLYTkTcwesNBL8e
 deb5yFNdcawTjD9HP6+rqaHtjKGtbTcagliWzk5WgnJiHun14rDJEG26LYmOIaFaj12QIn
 SPU240Ew4kGvSgRl+KLjtBIBPw0asJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720448530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fFgKoydWdeJWMz+3vG8luz8Q5CRyhQmk+trEz5Y/0tA=;
 b=yqozqJ0u+y6PHptIB0/dcvNhA//dcr644HOLyNXAT24gUn+rR/APeI3mjvlw8LtDSDboAO
 OxlOTYQ9m+ielVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B56A13A7F;
 Mon,  8 Jul 2024 14:22:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wm72GBL2i2YEDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Jul 2024 14:22:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 david.kaplan@amd.com, christian.koenig@amd.com
Cc: regressions@leemhuis.info, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2] drm/qxl: Pin buffer objects for internal mappings
Date: Mon,  8 Jul 2024 16:21:37 +0200
Message-ID: <20240708142208.194361-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,collabora.com,broadcom.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,amd.com];
 RCPT_COUNT_TWELVE(0.00)[16]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, linux.dev:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
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

v2:
- unreserve BO on errors in qxl_bo_pin_and_vmap() (Dmitry)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b33651a5c98d ("drm/qxl: Do not pin buffer objects for vmap")
Reported-by: David Kaplan <david.kaplan@amd.com>
Closes: https://lore.kernel.org/dri-devel/ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de/
Tested-by: David Kaplan <david.kaplan@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 drivers/gpu/drm/qxl/qxl_object.c  | 13 +++++++++++--
 drivers/gpu/drm/qxl/qxl_object.h  |  4 ++--
 3 files changed, 20 insertions(+), 11 deletions(-)

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
index 5893e27a7ae5..66635c55cf85 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -182,7 +182,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 	return 0;
 }
 
-int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
+int qxl_bo_pin_and_vmap(struct qxl_bo *bo, struct iosys_map *map)
 {
 	int r;
 
@@ -190,7 +190,15 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
 	if (r)
 		return r;
 
+	r = qxl_bo_pin_locked(bo);
+	if (r) {
+		qxl_bo_unreserve(bo);
+		return r;
+	}
+
 	r = qxl_bo_vmap_locked(bo, map);
+	if (r)
+		qxl_bo_unpin_locked(bo);
 	qxl_bo_unreserve(bo);
 	return r;
 }
@@ -241,7 +249,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
 }
 
-int qxl_bo_vunmap(struct qxl_bo *bo)
+int qxl_bo_vunmap_and_unpin(struct qxl_bo *bo)
 {
 	int r;
 
@@ -250,6 +258,7 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
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

