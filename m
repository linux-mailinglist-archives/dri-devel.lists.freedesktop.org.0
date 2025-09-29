Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942C4BAA8F2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 22:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F16F10E49C;
	Mon, 29 Sep 2025 20:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FaSddbAa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA6B10E498;
 Mon, 29 Sep 2025 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759176287;
 bh=8a0+2vCJjyXNTtdJZlFvg8lNK8djtqhRGCpzH9ay818=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FaSddbAanvCPQ3ohMTVyKMYG4OP06ihGPZDgza9EwKFh7wuuRinArtJpx2ua/06cr
 brl58VRNx3tPr4j7uDQg6pRbbmVPjtgVfrGXpg9vMNtA9loeitCpQAqSYcsILQzGUn
 UHVdX77Slebrdm3ybibqtfEbGGz+PZrLrSJVKABMIwtoE1WBRmf+mBEqP4YnJJAdU9
 /6gV5hEADEX3xkIYZ/IV2mXJzjvdaYxs3OtC2wabBY/PRjIPPUZaR9ae4QU3URLwlz
 L6nZTLMlQVxby2Ft49+qz4n1ZdN1pVGMASTObXiEINLy+beXm2Zhl8cqjH3Psys3Ob
 EsPLr8wt/Gpcg==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 100FE17E02B0;
 Mon, 29 Sep 2025 22:04:47 +0200 (CEST)
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
Subject: [PATCH 5/8] drm/v3d: Use huge tmpfs mount point helpers
Date: Mon, 29 Sep 2025 22:03:13 +0200
Message-ID: <20250929200316.18417-6-loic.molinari@collabora.com>
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

drm_gem_shmem_huge_mnt_free() handles NULL pointers.

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/v3d/v3d_gemfs.c | 31 +++----------------------------
 1 file changed, 3 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
index 8ec6ed82b3d9..f54705dba217 100644
--- a/drivers/gpu/drm/v3d/v3d_gemfs.c
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -1,23 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
 /* Copyright (C) 2024 Raspberry Pi */
 
-#include <linux/fs.h>
-#include <linux/mount.h>
-#include <linux/fs_context.h>
-
 #include "v3d_drv.h"
 
-static int add_param(struct fs_context *fc, const char *key, const char *val)
-{
-	return vfs_parse_fs_string(fc, key, val, strlen(val));
-}
-
 void v3d_gemfs_init(struct v3d_dev *v3d)
 {
-	struct file_system_type *type;
-	struct fs_context *fc;
 	struct vfsmount *gemfs;
-	int ret;
 
 	/*
 	 * By creating our own shmemfs mountpoint, we can pass in
@@ -31,20 +19,8 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
 	if (!super_pages)
 		goto err;
 
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
 
 	v3d->gemfs = gemfs;
@@ -60,6 +36,5 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
 
 void v3d_gemfs_fini(struct v3d_dev *v3d)
 {
-	if (v3d->gemfs)
-		kern_unmount(v3d->gemfs);
+	drm_gem_shmem_huge_mnt_free(v3d->gemfs);
 }
-- 
2.47.3

