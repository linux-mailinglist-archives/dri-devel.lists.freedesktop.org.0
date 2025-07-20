Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91FB0B2DC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAB210E44A;
	Sun, 20 Jul 2025 00:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WHE8FrZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EF810E378
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:20 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-23dc5bcf49eso39886485ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969740; x=1753574540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=84kX2XXjEmF3ERut/9hhHijiazxXV8Nw4X0UoQzs5OY=;
 b=WHE8FrZHXQf/NRTVVuya4btQ4wKNqk/7nRJbdoCvScD5qm8j/QzlTCo3gNdc/T32Nw
 pnonaLDK8Ct7E70zpeStHa5PJePATEYdoSL0WHQzCf/ZwHDM+AnJQt+062scsPSZLKQm
 /OygWc3v/ZZqE6XR5tBIDhzaX0lOvv29QG8safVuCC9axSyVspjHKEVsiuHCDx3ufhgK
 M8z7yqkWyRU15GclMbPK4ze7mdL9/q30ppXMvVhe0UrMRMuH95Iiu8WfQaVPC8aoDdaR
 zzQ74g0hGBNg4MjlWHEJkY7e/v6CXxXHkgWinwz5A8oMF8pD/ImdpOd/IVRtjnSn6gR6
 175A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969740; x=1753574540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=84kX2XXjEmF3ERut/9hhHijiazxXV8Nw4X0UoQzs5OY=;
 b=wXewrhyE3CggaxCIdpCJ9Rtd8w/plZ2WWfCQBPBLOX4GjNl3TSakxWOk34C3FvjNGo
 rqg9rMk+tPjdcHriGHx6KRHkF7+HYfs1KdNp6n/FtIE5siLX51H9CDyMovknbkI7A9yo
 5hL7KLodGVa5qSqgxALoEWLeGP4Lh4BcteWtPJRRMVlzAIKD7LTgtUZZ84sQgmChmQRs
 XpfwGuiZUqaIPU9soi4EMGTtdgYT5eXeFqWwE5ijZ2EOnbReNs0AQY4lusdRthoNt9V/
 ZD7cePzoZaNp7mBag8zaf8KxbTUzbHuGj1cMmyyb/LkApVTKSBflpLKKlB2ojd3NAUav
 tFvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUutFkEpuy0gEp+zkNwXAyBBesGPDnZLPThJd7ZPcQPavtkSwMfBd7+Jl0FjVrTg6QPriwr334nAvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEx9l2Exnkkit+lGnCdK1ZM44HtXo6RgbTq4tISuZuHZoIiaF7
 /LdLEd5hJJcRGdDeQ8FUWW8a9I3/lPJx4OqbPOAlHH6+i+FxR5ktDCtg
X-Gm-Gg: ASbGncs9J4vrfxsTLjzuZmgxe8tugj7zrxtc2pRNBSDF7LMhny/RF5daGksNv18IF0r
 MgO/QofvLOtSwpGcFm4lG8TyfEOi2KpJGYOMADpQQ3SOPqiBS9jNK52J5BeUQtV2d1QlwYJvzCr
 m7LmeF9zIwp/6jWY4K1c5JDtJYKAV/BvRJkM/91Hka7tt1FMJ/Ji3zjz2tyVEHVJhd099/bP5bQ
 nawkIjSUqgebQU/fpvXFh/k5RsrXU9tfHhMuONquxbCOI9NkZeqzEvhs+Ef51sN46A4q1V8LmHI
 OZE/szBoazTCWzdTv2Imhm++fIymQX2wJw8AM9pkZsy0yZMnqg5UpayTShW/Q0J62nW6bVNRW68
 yfacAFsKfvTKfah7HAWVouHZROOyt3T6ZCniJ2CJmEswg5hmP+Vpu
X-Google-Smtp-Source: AGHT+IGrdnG0OWJunucDj7yzg7E2yLnTs0LAdIZYU4n36wPhEob7h9C1DqLDA0cQ6ZgUGwr9uA3FPQ==
X-Received: by 2002:a17:903:8c5:b0:23d:da20:1685 with SMTP id
 d9443c01a7336-23e302821f4mr152125815ad.4.1752969740108; 
 Sat, 19 Jul 2025 17:02:20 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23e3b708763sm33826375ad.230.2025.07.19.17.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:19 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/panthor: add DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE
Date: Sat, 19 Jul 2025 17:01:46 -0700
Message-ID: <20250720000146.1405060-10-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250720000146.1405060-1-olvaffe@gmail.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
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

When the flag is set, bo data is captured for devcoredump.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_coredump.c | 36 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c      |  3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c      |  7 +++--
 include/uapi/drm/panthor_drm.h             |  7 +++++
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
index 5502452a5baa..db5695b38c2d 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.c
+++ b/drivers/gpu/drm/panthor/panthor_coredump.c
@@ -5,6 +5,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_managed.h>
 #include <generated/utsrelease.h>
+#include <linux/ascii85.h>
 #include <linux/devcoredump.h>
 #include <linux/err.h>
 #include <linux/pm_runtime.h>
@@ -99,6 +100,26 @@ static const char *reason_str(enum panthor_coredump_reason reason)
 	}
 }
 
+static void print_bo(struct drm_printer *p, struct panthor_gem_object *bo,
+		     u64 offset, u64 size)
+{
+	struct iosys_map map;
+	const u32 *vals;
+	u64 count;
+	char buf[ASCII85_BUFSZ];
+
+	if (drm_gem_vmap(&bo->base.base, &map))
+		return;
+
+	/* offset and size are aligned to panthor_vm_page_size, which is SZ_4K */
+	vals = map.vaddr + offset;
+	count = size / sizeof(u32);
+	for (u64 i = 0; i < count; i++)
+		drm_puts(p, ascii85_encode(vals[i], buf));
+
+	drm_gem_vunmap(&bo->base.base, &map);
+}
+
 static void print_vma(struct drm_printer *p,
 		      const struct panthor_coredump_vma_state *vma, u32 vma_id,
 		      size_t *max_dyn_size)
@@ -129,6 +150,21 @@ static void print_vma(struct drm_printer *p,
 			}
 		}
 	}
+
+	if (vma->flags & DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE) {
+		drm_puts(p, "    data: |\n");
+		drm_puts(p, "      ");
+
+		/* bo data is dynamic */
+		if (max_dyn_size) {
+			*max_dyn_size +=
+				vma->size / sizeof(u32) * (ASCII85_BUFSZ - 1);
+		} else {
+			print_bo(p, bo, vma->bo_offset, vma->size);
+		}
+
+		drm_puts(p, "\n");
+	}
 }
 
 static void print_as(struct drm_printer *p,
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1116f2d2826e..6c4de1e73cd1 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1608,6 +1608,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
+ * - 1.6 - adds DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE flag
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1621,7 +1622,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 5,
+	.minor = 6,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 7862c99984b6..72b1b2799b65 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2045,10 +2045,11 @@ static void panthor_vma_init(struct panthor_vma *vma, u32 flags)
 	vma->flags = flags;
 }
 
-#define PANTHOR_VM_MAP_FLAGS \
+#define PANTHOR_VM_MAP_FLAGS                   \
 	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
-	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \
-	 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED)
+	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |   \
+	 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED | \
+	 DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE)
 
 static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 {
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..c4c5e38365e9 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -496,6 +496,13 @@ enum drm_panthor_vm_bind_op_flags {
 	 */
 	DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED = 1 << 2,
 
+	/**
+	 * @DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE: Dump the VMA for devcoredump.
+	 *
+	 * Only valid with DRM_PANTHOR_VM_BIND_OP_TYPE_MAP.
+	 */
+	DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE = 1 << 3,
+
 	/**
 	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the type of operation.
 	 */
-- 
2.50.0.727.gbf7dc18ff4-goog

