Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F2A6CCAC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424A10E161;
	Sat, 22 Mar 2025 21:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="cJX8QWM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6F010E188
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742678957; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PxmBOtoUQ1rdT24uVCjGSSfEHPsdKqi2aGZFFk1fnQgmup2R5/mxjL6vNn7+k76Jbt8pp8o9FfTIaNnzRYWDQ4I+Wbavqy89VryRuy7Nn9d+yD32ovpQ4rOtBzJO6jf4oYMvH/BfKzUpLVTIwBILrnmdTeOcuJHF7WoivAlgmOE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742678957;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fdyz8/DZzJvpb8TDk4Fb/UsrzBg8Xohwoz871V+3KR4=; 
 b=Kk5f9XbQFmuC3CW3fnM9xE0uUf5+J6hG8u3S7S+8PzLxKvWmxpQQJ5/VUDn2e5orJmz1sLYkSoDDxlg2DBLxbsX+jmVe+drLWSp0F2KocFPPIwdP8hIDzKJvWAx7OC5BsbeedEW/gmC0RJEEaXEzP2/nPOqbwkF/rPZEt85vc9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742678957; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fdyz8/DZzJvpb8TDk4Fb/UsrzBg8Xohwoz871V+3KR4=;
 b=cJX8QWM2khneIW0/ZGr/a4js75Fvi903tqM5LrGDKlxr+MEiVS3y11bGLoBJu6JQ
 O6PsfQnHges5OnWNeuCpoUwoBu2lUyVYFzjzRgxXBRczC8+MPcXUbE9S45nmpnHhL82
 DKN1pIORw7EXgp1hFlYVAqKnsMutSwRUM8gvW558=
Received: by mx.zohomail.com with SMTPS id 1742678957017363.1392509416396;
 Sat, 22 Mar 2025 14:29:17 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v20 03/10] drm/gem: Document locking rule of vmap and evict
 callbacks
Date: Sun, 23 Mar 2025 00:26:01 +0300
Message-ID: <20250322212608.40511-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The vmap/vunmap/evict GEM callbacks are always invoked with a held GEM's
reservation lock. Document this locking rule for clarity.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/drm/drm_gem.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 43cf3c2c7ca0..9b71f7a9f3f8 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -159,7 +159,8 @@ struct drm_gem_object_funcs {
 	 * @vmap:
 	 *
 	 * Returns a virtual address for the buffer. Used by the
-	 * drm_gem_dmabuf_vmap() helper.
+	 * drm_gem_dmabuf_vmap() helper. Called with a held GEM reservation
+	 * lock.
 	 *
 	 * This callback is optional.
 	 */
@@ -169,7 +170,8 @@ struct drm_gem_object_funcs {
 	 * @vunmap:
 	 *
 	 * Releases the address previously returned by @vmap. Used by the
-	 * drm_gem_dmabuf_vunmap() helper.
+	 * drm_gem_dmabuf_vunmap() helper. Called with a held GEM reservation
+	 * lock.
 	 *
 	 * This callback is optional.
 	 */
@@ -192,7 +194,8 @@ struct drm_gem_object_funcs {
 	 * @evict:
 	 *
 	 * Evicts gem object out from memory. Used by the drm_gem_object_evict()
-	 * helper. Returns 0 on success, -errno otherwise.
+	 * helper. Returns 0 on success, -errno otherwise. Called with a held
+	 * GEM reservation lock.
 	 *
 	 * This callback is optional.
 	 */
-- 
2.49.0

