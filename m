Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C0ECB0AE6
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 18:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EA110E508;
	Tue,  9 Dec 2025 17:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DqCQwdj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA5510E508
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765300344;
 bh=oFRqlR0fP3Bh4VG3KqAWQu/jhWwhnYWao6OCqWA6exE=;
 h=From:To:Cc:Subject:Date:From;
 b=DqCQwdj9VyrbGQcQJ0gIrd9vJaGgqXh6dQkb0S5FhB9DOaJqZ2VkFBaEowhRybEvZ
 ZWokkh56W9G/B7sKWL3rdlCwquhKDI0d9zxqOq7JrAtPyqFwP7XWPHvtZkmDJW9QoP
 689U1o/1D+hp5mk/1PKRkbvDnW5LV+sDP01VETXqhyk9lUMHKgo+R8oEHk2Nsm4ZY+
 GdE6NwMCaKKaC4KXg6qaix6G/XzxIXWBZj3pfaOHMl3gode2EgbmEN680xgV7nS5ko
 HvRLik0WIAnpqHppK/7NrW4Tz2OFjd9rZONFOzkeuuIMTSZzKRcz72Nggvw81uutsk
 Al2ifqEzA6kjw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C6B917E1155;
 Tue,  9 Dec 2025 18:12:24 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
Subject: [PATCH] drm/gem: Fix builds with CONFIG_MMU=n
Date: Tue,  9 Dec 2025 18:11:51 +0100
Message-ID: <20251209171151.2449120-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

drm_gem_get_unmapped_area() relies on mm_get_unmapped_area() which is
only available if CONFIG_MMU=y.

Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
Cc: Loïc Molinari <loic.molinari@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 2 ++
 include/drm/drm_gem.h     | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6021c4087a08..ca1956608261 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1267,6 +1267,7 @@ drm_gem_object_lookup_at_offset(struct file *filp, unsigned long start,
 	return obj;
 }
 
+#ifdef CONFIG_MMU
 /**
  * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
  * @filp: DRM file pointer
@@ -1309,6 +1310,7 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_gem_get_unmapped_area);
+#endif
 
 /**
  * drm_gem_mmap - memory map routine for GEM objects
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index cca815dc87f3..f4da8ed0d630 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -537,9 +537,14 @@ void drm_gem_vm_close(struct vm_area_struct *vma);
 int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 		     struct vm_area_struct *vma);
 int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+
+#ifdef CONFIG_MMU
 unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
 					unsigned long len, unsigned long pgoff,
 					unsigned long flags);
+#else
+#define drm_gem_get_unmapped_area NULL
+#endif
 
 /**
  * drm_gem_object_get - acquire a GEM buffer object reference
-- 
2.52.0

