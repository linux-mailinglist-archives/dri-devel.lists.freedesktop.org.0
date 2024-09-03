Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF996A842
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 22:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAA210E402;
	Tue,  3 Sep 2024 20:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Zqr/jTHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4281F10E37D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 20:26:15 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725395164; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PHJigLn3btVtrMZHHeuZViEjw7MJrDS5XPk1DQVzOVE/r99LpyTge5UIkVjAORfo9AhFKq7ElqyPmAB8P7NhYxtmSBDw05xNCY9e1tjdIoDY9B3F40G26rXGk2PFSycNgY3jS8IClRE4y2f2ThKobiDXr0YIpFoAvNieO0nNwKw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725395164;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PrtZYtmwgxZHb8XgHEA0W+MTLGH+E4kIm30ubb9dtB4=; 
 b=H9Ix7wUYZKgiQhxkB2nLq/Ljgr84mC100ku28HyJBtYBd6eBqIDxGptJTz2+JHrlgDNIOYHahcYO5v6D2w6IgK8ghOJjE2vVFZeKpWjr3upLnnZqEdsbC/EbCh9UT9y5F8wELGj0nP6f3GjO+n/lA7u/rUHSIs+6CnQtPTQ0mw4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725395164; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PrtZYtmwgxZHb8XgHEA0W+MTLGH+E4kIm30ubb9dtB4=;
 b=Zqr/jTHbOzr2DkmD1SvqxnEvWJeLmfy5Jiju+NeBACjDUJ4jOJBzXDB+iC9a5JhW
 MupztvuOlbYB+ToE2k4kzyDOwMSSuYWelVHIIMKXe1DyOgNenlkG6ONeZvJ5RwRyVEd
 haXe8eGiFGI9i0okdDXwCOL73B070STyPu38Hfw8=
Received: by mx.zohomail.com with SMTPS id 1725395162731400.01079093347084;
 Tue, 3 Sep 2024 13:26:02 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 3/4] drm/panthor: enable fdinfo for memory stats
Date: Tue,  3 Sep 2024 21:25:37 +0100
Message-ID: <20240903202541.430225-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903202541.430225-1-adrian.larumbe@collabora.com>
References: <20240903202541.430225-1-adrian.larumbe@collabora.com>
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

Implement drm object's status callback.

Also, we consider a PRIME imported BO to be resident if its matching
dma_buf has an open attachment, which means its backing storage had already
been allocated.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 38f560864879..c60b599665d8 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -145,6 +145,17 @@ panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
 	return drm_gem_prime_export(obj, flags);
 }
 
+static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	enum drm_gem_object_status res = 0;
+
+	if (bo->base.base.import_attach || bo->base.pages)
+		res |= DRM_GEM_OBJECT_RESIDENT;
+
+	return res;
+}
+
 static const struct drm_gem_object_funcs panthor_gem_funcs = {
 	.free = panthor_gem_free_object,
 	.print_info = drm_gem_shmem_object_print_info,
@@ -154,6 +165,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = panthor_gem_mmap,
+	.status = panthor_gem_status,
 	.export = panthor_gem_prime_export,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
-- 
2.46.0

