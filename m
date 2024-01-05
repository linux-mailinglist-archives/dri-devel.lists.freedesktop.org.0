Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E83C825A84
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378E210E68C;
	Fri,  5 Jan 2024 18:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5261310E68E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480446;
 bh=Xy26gJL0rfEIAQ3GTzMQ9EaB0QSmN8Rrgbq8+tRhsXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=koD1jTYASaaq0lH30DCRGwRlLF4icZe6o4RtGhMtxdBXY6SQHCj+AAoMWGtCV5jal
 3o38uo19aKWom4br+OTJmNgxqtAXnvCQUYJjZ8hDcNButj0PQLLHni40YT501PCe6q
 ErF+M+MYMwDfZlVE+2dFDViPRVojFs1vXPkPZ8WiG92SaZ7MSFVtT17Scs7uYMdJsy
 HZalfvQSfjP9e4W+qiuVHBQZioyrxkCXK6FpqhTSHYXKdRKIxj01ioqjERVM7ygUfQ
 hQGNr+u92vLMktYspBAr0AJKm4va1ejnViBWlDzvwRtDU+HLnQGiP3yS7a15I0yQuP
 J7987sqBJRbVw==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E4CC2378206D;
 Fri,  5 Jan 2024 18:47:24 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v19 26/30] drm/shmem-helper: Turn warnings about imported GEM
 into errors
Date: Fri,  5 Jan 2024 21:46:20 +0300
Message-ID: <20240105184624.508603-27-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turn sanity warnings about DRM-SHMEM API misuse into a error conditions
for cases where imported GEM is used when it shouldn't be used.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0d95d723b90d..7d2fe12bd793 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -409,7 +409,8 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	if (drm_WARN_ON(obj->dev, obj->import_attach))
+		return -EINVAL;
 
 	if (refcount_inc_not_zero(&shmem->pages_pin_count))
 		return 0;
@@ -872,7 +873,8 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	if (drm_WARN_ON(obj->dev, obj->import_attach))
+		return ERR_PTR(-EINVAL);
 
 	if (drm_WARN_ON(obj->dev, !shmem->pages))
 		return ERR_PTR(-ENOMEM);
@@ -909,7 +911,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object
 	if (shmem->sgt)
 		return shmem->sgt;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	if (drm_WARN_ON(obj->dev, obj->import_attach))
+		return ERR_PTR(-EINVAL);
 
 	sgt = drm_gem_shmem_get_sg_table(shmem);
 	if (IS_ERR(sgt))
-- 
2.43.0

