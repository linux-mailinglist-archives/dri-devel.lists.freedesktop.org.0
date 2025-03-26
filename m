Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6EA70ED4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 03:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9AB10E646;
	Wed, 26 Mar 2025 02:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="KkSoxwZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010C10E642
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 02:15:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742955331; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=APqRv5QSeNXNQcwrL/Pvn8A47UhR/9Ptx1Y1pOHuWcMfZfUvn/vsQEKwz3LRJ6YhrlGQew0PB+8RoeR89ca+L8AtUiX5EpH2enM2qB3h2TJZYxGjLeHgqYCIUwsvifROCdQeyzmwI1Luc1oL1BWgURZUoAUFDgmiXySdwuAX10s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742955331;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GGLDXR9qBTP8e0YXcd61U+HKCSx3eRR1MnzILCHIPbo=; 
 b=bPS50hydls3tSOJWzXXi6LKpVaSbUHDbpY/TcEHDdstZz/z6TTp7Z4eK5CUalYCdk9Csr6r7o2A4aNdmnkM7m1F0rru1spUZWnWwFSjmse84F9rWcImq1YkJHvO7HLzroem2TSFVDVbp0COt0dt6Pj5InoSIK8phDFr2+RRd9+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742955331; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=GGLDXR9qBTP8e0YXcd61U+HKCSx3eRR1MnzILCHIPbo=;
 b=KkSoxwZvVTXwxFllLdJ9d57fxsPJZFqq7dw9fFe10P3qF2ZHsiyL5Q8fiPlm8Cmw
 xdq0U7C2f/PyW2ardRTotiU3wxGCOxqmM+x+7OkxNV4tgEWGExXslq8Dhgeaghqs5vD
 KHGTGm4+eD+NkkHCpkGAeflDSNsyYO4OD8y909w0=
Received: by mx.zohomail.com with SMTPS id 1742955330853789.2493136203924;
 Tue, 25 Mar 2025 19:15:30 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 6/6] drm/panfrost/panthor: Take sparse objects into
 account for fdinfo
Date: Wed, 26 Mar 2025 02:14:26 +0000
Message-ID: <20250326021433.772196-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326021433.772196-1-adrian.larumbe@collabora.com>
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
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

Make use of the new shmem helper for deciding whether a GEM object has
backing pages.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 drivers/gpu/drm/panthor/panthor_gem.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 0cda2c4e524f..2c6d73a7b5e5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -200,7 +200,7 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 	enum drm_gem_object_status res = 0;
 
-	if (bo->base.base.import_attach || bo->base.pages)
+	if (drm_gem_shmem_is_populated(&bo->base))
 		res |= DRM_GEM_OBJECT_RESIDENT;
 
 	if (bo->base.madv == PANFROST_MADV_DONTNEED)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..48930fe7b398 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -155,7 +155,7 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	enum drm_gem_object_status res = 0;
 
-	if (bo->base.base.import_attach || bo->base.pages)
+	if (drm_gem_shmem_is_populated(&bo->base))
 		res |= DRM_GEM_OBJECT_RESIDENT;
 
 	return res;
-- 
2.48.1

