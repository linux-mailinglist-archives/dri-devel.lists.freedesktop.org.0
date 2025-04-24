Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC4A9ABAF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 13:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5C610E7CF;
	Thu, 24 Apr 2025 11:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oeHn4zay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A97410E7CF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 11:26:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5220A434F2;
 Thu, 24 Apr 2025 11:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2734EC4CEE3;
 Thu, 24 Apr 2025 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745494002;
 bh=A+RYlcmQmsEmIG25G70lkCafpndJRI9Esoh9VrB89Vs=;
 h=From:To:Cc:Subject:Date:From;
 b=oeHn4zay9DfEUn5bcf5MU7u9XX60Lw+zmMzqOyUquvijfGKed8fHmWTMDlw21oz7g
 MYzjR6fzhsS6vRzMwti10RZBhbHSi2UUjaX+fe5A+F71ZEesP9UgFs9/1Dj7wXGOMh
 VZifZuCzJ61aovvWuSPisiuvgwZzxo0hWBh6SpcuM/SMQqj1mxbqxCKjwzBqeZw1nZ
 x1gmytDIXhtEPP2/nPpwFAjO5+gtHHCkKCe8tZdVVOrw1Cde5EstmLPDP2n55H/d9m
 Es/YbHg3ZA/UnIPahBVoAkb0b9ce5s9l/SCQyPIa9P+bq7kBXlbpSmTJH2dr5QBQlA
 AUGRyHWec/5fQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Florent Tomasin <florent.tomasin@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: fix building without CONFIG_DEBUG_FS
Date: Thu, 24 Apr 2025 13:25:47 +0200
Message-Id: <20250424112637.3432563-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

When debugfs is disabled, including panthor_gem.h causes warnings
about a non-static global function defined in a header:

In file included from drivers/gpu/drm/panthor/panthor_drv.c:30:
drivers/gpu/drm/panthor/panthor_gem.h:222:6: error: no previous prototype for 'panthor_gem_debugfs_set_usage_flags' [-Werror=missing-prototypes]
  222 | void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};

This could be changed to a static inline function, but as the normal
one is also static inline, just move the #ifdef check in there.
The #ifdef is still needed to avoid accessing a struct member that
does not exist without debugfs.

Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panthor/panthor_gem.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 4641994ddd7f..693842e10dee 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -209,17 +209,14 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
-#ifdef CONFIG_DEBUG_FS
 void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
 				   struct seq_file *m);
 static inline void
 panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
 {
+#ifdef CONFIG_DEBUG_FS
 	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
-}
-
-#else
-void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
 #endif
+}
 
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.39.5

