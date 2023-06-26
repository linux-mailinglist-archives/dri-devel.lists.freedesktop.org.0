Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A573DE66
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C948910E1EE;
	Mon, 26 Jun 2023 12:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C7A10E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:02:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E5076607150;
 Mon, 26 Jun 2023 13:02:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687780974;
 bh=LQiDihajyS4lpLnWl0hRNS1aTYOBaC2aOlpCoubhNJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l0RA8Y2qJ/jjzI580eEQshqNwApQGSAxZQnh8m8aZeinkwOyGCLTZmFzrCcqrcN30
 apy2wNNyuBt/GQYpNFqQuEnBBh6uWVLbX+RGyfEdiFVwO67owySBhegkh9yBwFm4I9
 lxXuky6t/tynsot3rZAoVit6Xd4vCF+U50Um4iKXkzYnBNKJaQAxR/We6ZTis37NzI
 1gqixAdcaNc4YVIGBTKWmtDScIl98h7Xw20g9p4y9ci6bq2Tp5cXRC4A8rh9nqpWr4
 9P/0djIcVpQCWldYgAG/5Xa7NSmJrPE4p6LxXEgNH4PTfb6GL+NslQgHcLMdHWnu3O
 TDQPHQ/VD9iaQ==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/shmem-helper: Stop exposing drm_gem_shmem_put_pages()
Date: Mon, 26 Jun 2023 14:02:44 +0200
Message-ID: <20230626120247.1337962-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626120247.1337962-1-boris.brezillon@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The last user (panfrost) moved to drm_gem_shmem_unpin(), so it's now
safe to make this function private.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 5 +++--
 include/drm/drm_gem_shmem_helper.h     | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a783d2245599..d6fc034164c0 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -128,6 +128,8 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
+
 /**
  * drm_gem_shmem_free - Free resources associated with a shmem GEM object
  * @shmem: shmem GEM object to free
@@ -204,7 +206,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
  *
  * This function decreases the use count and puts the backing pages when use drops to zero.
  */
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -226,7 +228,6 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
-EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
 static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 2867d2aba88b..f55f8739acc0 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -99,7 +99,6 @@ struct drm_gem_shmem_object {
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
-- 
2.41.0

