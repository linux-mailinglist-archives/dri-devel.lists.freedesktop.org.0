Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D79A9B699
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 20:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07FB10E052;
	Thu, 24 Apr 2025 18:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZpjD8Hjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525AF10E052
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 18:41:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745520081; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Yhe5Xr9t12zwU+IOcKtiaA3sKod3DXZjlytupzWF+5Fi7DRPzBdz3McMvACkn6bXO3GhxxPPJ5aDyvzUAv0ZZsPRZiqr0598Mzr2Mpmd3y5uisFZDwJcdQ1JVr/5SFlykYcIMk83s+07QNO+03KWqnMWYxNs4AF2sN2JM5PLyzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745520081;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wo4SNOOXx8cgEs1+iLeNUIV7Y12odEqq00gmOP6sgDE=; 
 b=RelQ2wx+nIsAnuS8OA5QzaTKqoZbLfy7ClNk3j4IknRwAJGU3dpW3PI2TDCftM+2q0w9yWl2BgSTbk7233EcUElNGwhiG/mmVjY/lGywVy0FoNRRbA6R6MN+QZgTenD9gx8yEkmuV8qb6zETcMtj5cu7AvpPwIx2wSaV0xKmwOg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745520081; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=wo4SNOOXx8cgEs1+iLeNUIV7Y12odEqq00gmOP6sgDE=;
 b=ZpjD8HjxiH3FB165+xZW9kOvSnZAF+W5DVJluxxC78R/qyKDcmxwLgaOcuITw0I5
 9w5le2ZCSl4K9E9FoMWFZPlF2/Hcy+B2Rdm3eASk+NDST75TbSvlzlZ53vGzZBBbVaK
 pzkrAyixcEBqT2YQB1r+a+4lrk5rmKZpmr5XMAD8=
Received: by mx.zohomail.com with SMTPS id 1745520078498206.35498888534835;
 Thu, 24 Apr 2025 11:41:18 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panthor: Fix build warning when DEBUG_FS is disabled
Date: Thu, 24 Apr 2025 19:40:34 +0100
Message-ID: <20250424184041.356191-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
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

Commit a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM
objects over DebugFS") causes a build warning and linking error when
built without support for DebugFS, because of a non-inline non-static
function declaration in a header file.

On top of that, the function is only being used inside a single
compilation unit, so there is no point in exposing it as a global
symbol.

This is a follow-up from Arnd Bergmann's first fix.
Also move panthor_gem_debugfs_set_usage_flags() into panthor_gem.c and
declare it static.

Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Closes: https://lore.kernel.org/dri-devel/20250424142419.47b9d457@collabora.com/T/#t
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 5 +++++
 drivers/gpu/drm/panthor/panthor_gem.h | 8 --------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 2dcf308094b2..7c00fd77758b 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -42,11 +42,16 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 	mutex_unlock(&ptdev->gems.lock);
 }
 
+static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
+{
+	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+}
 #else
 static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
 				       struct panthor_gem_object *bo)
 {}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
+static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
 #endif
 
 static void panthor_gem_free_object(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 4641994ddd7f..4dd732dcd59f 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -212,14 +212,6 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 #ifdef CONFIG_DEBUG_FS
 void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
 				   struct seq_file *m);
-static inline void
-panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
-{
-	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
-}
-
-#else
-void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
 #endif
 
 #endif /* __PANTHOR_GEM_H__ */

base-commit: 3a2b7389feea9a7afd18d58cda59b7a989445f38
-- 
2.48.1

