Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A559C8B7C49
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA8F11246B;
	Tue, 30 Apr 2024 15:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbEiE9OT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6D711246B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 15:55:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41bab13ca81so41197155e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714492523; x=1715097323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z3Prg7PPypweK+0GwB4ZsBylllYwLp+cj9IhfDLYvNs=;
 b=bbEiE9OT4sJwQbbd52CjrS6fFoKaQBob4WoFeEZlvLyrF6bmmjX4hG0Y0KaDaTMma2
 GwqbnMDkyFA/FwSTa8v4gh3FqvOw2XGh+D06ed11jch04fQ1aLLW4YKYN/AzR7Wz3GI+
 FwZoDh0IK+6GRXBEaqLpROK04wP1v3Qk92kCZQ1nmIsGdAR85xBtUhWmBRNMg+rchDwR
 ZcZMk1t5sKIV13jrBR6LLryepejtWfbJ0+3H/1lJYBYJlyVwQ7XplBdw8nBDjjaytnQS
 UcFgyFsGaUAwqY9Dv2ULas5oHZq0yYAowFGYVKM1XUNZ7xPQNaGvUxNjHW6UWO73v+iw
 h7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714492523; x=1715097323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3Prg7PPypweK+0GwB4ZsBylllYwLp+cj9IhfDLYvNs=;
 b=nFvMV4IfUUDEj68gmFxGMxzG5U5677fyFjsVXr+9/+CdhUCEr2UUbv7waqMr9BPCiq
 HxMXRyUhBT/RmzGpsrrMOzJN3bkgQVat00e7NQOLUSlOMzUMW/4/qYKmfiM07RbpUZqe
 pbfERqL6ubEBtTPknm522FRTEpRcaVYWZYwCgNWwIX+UA1Mbj7CfqkL/9dYGqxWTPNTs
 xohfxulh8zc2sRT5hn88PykGASfcVw89o9zzmHcROTTjAkHxZ/QICvyLRLund74QOah3
 6CZgsi14wqBwi1IlPVr82NscjcbQE4rJZ6D+k1SVy8TmGz7pfwc1OXjYkf817i3mmejy
 /mbw==
X-Gm-Message-State: AOJu0YxqGo94hYzSxF2LYcxjAvsqJ8MhDietXGHoblFj6w3YF6koJt5G
 QT3fuQfMfMrqFkxlICUzuu+1I/mJeH468riMJsm+dYdC1noMxE0kC0Q0SA==
X-Google-Smtp-Source: AGHT+IE8L+dyeC4oIHxEl21jeQGJhMJ5gp7BE/ZMaA7xw888faBIXgFsBpyo9RJpr+Ymh9I6rPTnvA==
X-Received: by 2002:a05:600c:4f8e:b0:41a:fa9a:d863 with SMTP id
 n14-20020a05600c4f8e00b0041afa9ad863mr14010526wmq.9.1714492522797; 
 Tue, 30 Apr 2024 08:55:22 -0700 (PDT)
Received: from fedora.domain.name ([156.208.164.28])
 by smtp.gmail.com with ESMTPSA id
 g4-20020adff3c4000000b00343c1cd5aedsm32270994wrp.52.2024.04.30.08.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 08:55:22 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com,
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH RFC v2] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
Date: Tue, 30 Apr 2024 18:53:22 +0300
Message-ID: <20240430155453.21132-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.44.0
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

Allows PTE kind and tile mode on BO create with VM_BIND, as well as adds a GETPARAM to indicate this change. This is needed to support modifiers in NVK and ensure correctness when dealing with the nouveau GL driver.
---

v2 of the VMA PTE kind and tile mode patch. This one adds the kind and tile mode handling code in the common path and also adds a GETPARAM to indicate the change. The userspace implementation is still a WIP but should be ready within the next week.

Thanks in advance,
Mohamed

 drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 45 +++++++++++--------------
 include/uapi/drm/nouveau_drm.h          |  7 ++++
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 80f74ee0f..47e53e17b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
 		break;
 	}
+	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
+		getparam->value = 1;
+		break;
 	default:
 		NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index db8cbf615..583c962ef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -241,28 +241,29 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	}
 
 	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
-	if (!nouveau_cli_uvmm(cli) || internal) {
-		/* for BO noVM allocs, don't assign kinds */
-		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
-			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
-			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
-				kfree(nvbo);
-				return ERR_PTR(-EINVAL);
-			}
 
-			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
-		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
-			nvbo->comp = (tile_flags & 0x00030000) >> 16;
-			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
-				kfree(nvbo);
-				return ERR_PTR(-EINVAL);
-			}
-		} else {
-			nvbo->zeta = (tile_flags & 0x00000007);
+	/* for BO allocs, don't assign kinds */
+	if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
+		nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
+		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+			kfree(nvbo);
+			return ERR_PTR(-EINVAL);
+		}
+
+		nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
+	} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		nvbo->kind = (tile_flags & 0x00007f00) >> 8;
+		nvbo->comp = (tile_flags & 0x00030000) >> 16;
+		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+			kfree(nvbo);
+			return ERR_PTR(-EINVAL);
 		}
-		nvbo->mode = tile_mode;
+	} else {
+		nvbo->zeta = (tile_flags & 0x00000007);
+	}
+	nvbo->mode = tile_mode;
 
+	if (!nouveau_cli_uvmm(cli) || internal) {
 		/* Determine the desirable target GPU page size for the buffer. */
 		for (i = 0; i < vmm->page_nr; i++) {
 			/* Because we cannot currently allow VMM maps to fail
@@ -304,12 +305,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 		}
 		nvbo->page = vmm->page[pi].shift;
 	} else {
-		/* reject other tile flags when in VM mode. */
-		if (tile_mode)
-			return ERR_PTR(-EINVAL);
-		if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
-			return ERR_PTR(-EINVAL);
-
 		/* Determine the desirable target GPU page size for the buffer. */
 		for (i = 0; i < vmm->page_nr; i++) {
 			/* Because we cannot currently allow VMM maps to fail
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index cd84227f1..5402f77ee 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -68,6 +68,13 @@ extern "C" {
  */
 #define NOUVEAU_GETPARAM_VRAM_USED 19
 
+/*
+ * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
+ *
+ * Query whether tile mode and PTE kind are accepted with VM allocs or not.
+ */
+#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20
+
 struct drm_nouveau_getparam {
 	__u64 param;
 	__u64 value;
-- 
2.44.0

