Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C4A9ABA0D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 01:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A3910E32D;
	Tue, 22 Oct 2024 23:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="OUIYYQbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394BD10E707
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 23:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=uJcBaImOo4siGqiQ+8KKjL3HddlpCKbwDdzxJEsT5x8=; b=OUIYYQbgjqSlig6k
 LCDpUXf/3m5d9Sm+jqdQJhaS757yJJcaVu/Yj3W89q1vH8qbib67jvqGNdF00VOTC/JCePt492lKh
 fvFcj3e9k77oRERqxezwxE3p3v3sChxywSnJZTxcr4r0qT2M6y/dvANCESWKIvwI/7uzhVGJUKydC
 MtW2NR3etRXq2NsN7B0qfx+01QTsIwtcIWmXIwxSgiwgU0Lk1f2RBabBWAV12vbFm134zzrbiYPDs
 RZWN3nCXB9pcvNX+IHjITJffJyhzl7UBaP+sksf92Czfx/4vy50tQynQf+t5sUPCRKmjbjW92QFBH
 gNHcigZwVbZ9t1UB1A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t3OJo-00CtGr-0a;
 Tue, 22 Oct 2024 23:29:40 +0000
From: linux@treblig.org
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/5] drm/client: Remove unused drm_client_framebuffer_flush
Date: Wed, 23 Oct 2024 00:29:33 +0100
Message-ID: <20241022232934.238124-5-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022232934.238124-1-linux@treblig.org>
References: <20241022232934.238124-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

drm_client_framebuffer_flush() was explicitly added in 2020
by
commit c9c03e3cf072 ("drm/client: Add drm_client_framebuffer_flush()")
but has never been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/drm_client.c | 33 ---------------------------------
 include/drm/drm_client.h     |  1 -
 2 files changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index bfedcbf516db..5d10ad3c2ca5 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -552,39 +552,6 @@ void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
 }
 EXPORT_SYMBOL(drm_client_framebuffer_delete);
 
-/**
- * drm_client_framebuffer_flush - Manually flush client framebuffer
- * @buffer: DRM client buffer (can be NULL)
- * @rect: Damage rectangle (if NULL flushes all)
- *
- * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
- * for drivers that need it.
- *
- * Returns:
- * Zero on success or negative error code on failure.
- */
-int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
-{
-	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
-		return 0;
-
-	if (rect) {
-		struct drm_clip_rect clip = {
-			.x1 = rect->x1,
-			.y1 = rect->y1,
-			.x2 = rect->x2,
-			.y2 = rect->y2,
-		};
-
-		return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
-						0, 0, &clip, 1);
-	}
-
-	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
-					0, 0, NULL, 0);
-}
-EXPORT_SYMBOL(drm_client_framebuffer_flush);
-
 #ifdef CONFIG_DEBUG_FS
 static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index bc0e66f9c425..560aae47e06d 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -165,7 +165,6 @@ struct drm_client_buffer {
 struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
-int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 				 struct iosys_map *map_copy);
 void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);
-- 
2.47.0

