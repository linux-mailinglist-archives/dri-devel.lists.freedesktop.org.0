Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0385BAA8E3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 22:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F8210E492;
	Mon, 29 Sep 2025 20:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q7z+zCtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C002010E493;
 Mon, 29 Sep 2025 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759176285;
 bh=C8A0EwhcfuuAx55XHopx7Qq6/pw64JlfGfx0Qq2YB1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q7z+zCtlSgOSfIU3O3rBHAbr/TNn4/JCyAo+kwFkcyU4Y3JXDJgNeh+KhSRxppLs3
 hwnh3qKVnUUoBe1CmbidWRp+9v1f6Orh7T7sOH7q7C7E0CydoRKa809oBV70+WvYuN
 Dn/OfwDTGPWn6UMxDf/7iX1OzdD9kjkhSjlXDOqX16JxOsCMQhw7GXkDsWfw/ovy7t
 +QpPvT/eao3Xaq3V6yLgtCzt0uU+A8bjbj6RZg886mqgEwZT0KN6cuh0dzblyHSTRG
 0ExGK0id0KStgofh9LxeEGimxShRT+xc5RXZzvIheDAapQjje/ZVhrikL+ScVikRbd
 nzdC2ccadCCGQ==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BE2A17E1465;
 Mon, 29 Sep 2025 22:04:44 +0200 (CEST)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org, kernel@collabora.com
Subject: [PATCH 4/8] drm/i915: Use huge tmpfs mount point helpers
Date: Mon, 29 Sep 2025 22:03:12 +0200
Message-ID: <20250929200316.18417-5-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929200316.18417-1-loic.molinari@collabora.com>
References: <20250929200316.18417-1-loic.molinari@collabora.com>
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

Make use of the new drm_gem_shmem_huge_mnt_create() and
drm_gem_shmem_huge_mnt_free() helpers to avoid code duplication.

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gemfs.c | 33 +++------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index a09e2eb47175..70563a6a0b81 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -3,25 +3,13 @@
  * Copyright © 2017 Intel Corporation
  */
 
-#include <linux/fs.h>
-#include <linux/mount.h>
-#include <linux/fs_context.h>
-
 #include "i915_drv.h"
 #include "i915_gemfs.h"
 #include "i915_utils.h"
 
-static int add_param(struct fs_context *fc, const char *key, const char *val)
-{
-	return vfs_parse_fs_string(fc, key, val, strlen(val));
-}
-
 void i915_gemfs_init(struct drm_i915_private *i915)
 {
-	struct file_system_type *type;
-	struct fs_context *fc;
 	struct vfsmount *gemfs;
-	int ret;
 
 	/*
 	 * By creating our own shmemfs mountpoint, we can pass in
@@ -38,23 +26,8 @@ void i915_gemfs_init(struct drm_i915_private *i915)
 	if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
 		return;
 
-	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
-		goto err;
-
-	type = get_fs_type("tmpfs");
-	if (!type)
-		goto err;
-
-	fc = fs_context_for_mount(type, SB_KERNMOUNT);
-	if (IS_ERR(fc))
-		goto err;
-	ret = add_param(fc, "source", "tmpfs");
-	if (!ret)
-		ret = add_param(fc, "huge", "within_size");
-	if (!ret)
-		gemfs = fc_mount_longterm(fc);
-	put_fs_context(fc);
-	if (ret)
+	gemfs = drm_gem_shmem_huge_mnt_create("within_size");
+	if (IS_ERR(gemfs))
 		goto err;
 
 	i915->mm.gemfs = gemfs;
@@ -70,5 +43,5 @@ void i915_gemfs_init(struct drm_i915_private *i915)
 
 void i915_gemfs_fini(struct drm_i915_private *i915)
 {
-	kern_unmount(i915->mm.gemfs);
+	drm_gem_shmem_huge_mnt_free(i915->mm.gemfs);
 }
-- 
2.47.3

