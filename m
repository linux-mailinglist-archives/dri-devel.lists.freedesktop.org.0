Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C3812B09
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 10:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0FC10E903;
	Thu, 14 Dec 2023 09:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C363210E937;
 Thu, 14 Dec 2023 09:04:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso10624770e87.0; 
 Thu, 14 Dec 2023 01:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702544648; x=1703149448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cTvFHAMXeQGxCRdh6OTGkWelc6AXy45UFFjHQGyz1GI=;
 b=EBBXKLgi5exoBxR6eEu4REKv8qFrsoz+IzFJrdE/C/uZlEHGy6V5WeQU//hIAEbWTs
 RGU30ZhvTfPuI3kXaYk+ga4NWWKOVFFJcuHhT6urVA8o9rwZ+xpYc6N1Ev+5++dbb3lA
 TFcz+OwFtGvFD83NjuGYpIGZfFf9V8R22Qw72ciqQj7aA7rB6iFcrMao1ta2h2wSp87N
 EqQeqGfDhnKdQxFMaANp0JRgSExOoNZnJ6hBVOawdnlt2TcRhW3X9cWXAzb1T5V96o5I
 y7HxqsDNja36hXivxfglRp9dz8wYGa/jsV7xMDPM6any4/P4Z6+O98QvgrpUuWPk9t/v
 jFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702544648; x=1703149448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cTvFHAMXeQGxCRdh6OTGkWelc6AXy45UFFjHQGyz1GI=;
 b=w05T3S2TfOydKdsfV4pjMhY6ZSuSJZsMVUi7I9RtbiIP71f8e2F/7HVbOVd6AgrOWk
 xQQvk6PkUzw+11BfS52JYg6BvxL/BP7YQOnQVLfOLuGv7yvfFIXuXoCEMEVi7SZFGxTy
 cVQ37Ur8SaHO1qFJOMu9f9b6ELIjjAhzx+r+W3bzEe0inRV+AWpMiBrPl96mlpK+371X
 nt/HvO2j9/zi8ddH/tiAkooow50VqEqKDhDInEDXis/3RKy03noCrEt6Moz3NmZRO4ur
 HNbFfcGZGC6wvpafBoBPQIjfVqWZCk5WB/SpICtqr0mU3DMcNHSxRRsUTxuDmEh4NS27
 cu7Q==
X-Gm-Message-State: AOJu0Ywf9Px86Pf3IuBQoopIk2ZwWzOS0b/wBJ3zW+swNicduCQvr2QJ
 IEny2ijMO0OcC9SP10XEFm8=
X-Google-Smtp-Source: AGHT+IGSi0gVopc2whZcyu6ZJQjxvWITahwwKg9EWNncmutR/e9990NTWTAZuaPKMNSD9DOe+AIM5Q==
X-Received: by 2002:a19:3810:0:b0:50d:1f13:2fc6 with SMTP id
 f16-20020a193810000000b0050d1f132fc6mr3799206lfa.37.1702544647500; 
 Thu, 14 Dec 2023 01:04:07 -0800 (PST)
Received: from odroid.prahal.homelinux.net (91-175-163-178.subs.proxad.net.
 [91.175.163.178]) by smtp.gmail.com with ESMTPSA id
 vu8-20020a170907a64800b00a1d5c52d628sm9007847ejc.3.2023.12.14.01.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:04:06 -0800 (PST)
From: Alban Browaeys <alban.browaeys@gmail.com>
To: 
Subject: [PATCH] RFC: drm/lima: fix calling drm_mm_init with an empty range
Date: Thu, 14 Dec 2023 10:12:11 +0100
Message-Id: <20231214091215.2435-1-alban.browaeys@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the empty_vm initialization the range is empty which is not supported
by drm_mm_init.

With CONFIG_DRM_DEBUG_MM set, I get:
------------[ cut here ]------------
 kernel BUG at drivers/gpu/drm/drm_mm.c:965!
 Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
 Modules linked in: lima(+) drm_shmem_helper gpu_sched s5p_jpeg s5p_g2d
 videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2
 videobuf2_common s5p_cec tun fuse configfs auth_rpcgss sunrpc ip_tables
 x_tables autofs4 btrfs lzo_compress zlib_deflate raid10 raid456
 async_raid6_recov async_memcpy async_pq async_xor async_tx xor xor_neon
 raid6_pq libcrc32c raid1 raid0 linear md_mod dm_mirror dm_region_hash
 dm_log hid_logitech_hidpp hid_logitech_dj
 CPU: 0 PID: 1033 Comm: systemd-udevd Not tainted 6.4.0-rc1-debug+ #230
 Hardware name: Samsung Exynos (Flattened Device Tree)
 PC is at drm_mm_init+0x94/0x98
 LR is at 0x0
 Flags: nZCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
  drm_mm_init from lima_vm_create+0xcc/0x108 [lima]
  lima_vm_create [lima] from lima_device_init+0xd8/0x4a0 [lima]
  lima_device_init [lima] from lima_pdev_probe.part.0+0x6c/0x158 [lima]
  lima_pdev_probe.part.0 [lima] from platform_probe+0x64/0xc0
  platform_probe from call_driver_probe+0x2c/0x110

The drm_mm.c line 965 is:
drivers/gpu/drm/drm_mm.c
void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
{
        DRM_MM_BUG_ON(start + size <= start);

lima_vm_create is called with va_start and va_end both unset
in lima_device_init line 371:
ldev->empty_vm = lima_vm_create(ldev);

Signed-off-by: Alban Browaeys <alban.browaeys@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.c |  2 +-
 drivers/gpu/drm/lima/lima_drv.c    |  2 +-
 drivers/gpu/drm/lima/lima_vm.c     | 10 +++++++---
 drivers/gpu/drm/lima/lima_vm.h     |  3 ++-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 02cef0cea657..bd3afff0f44a 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -368,7 +368,7 @@ int lima_device_init(struct lima_device *ldev)
 	if (err)
 		goto err_out0;
 
-	ldev->empty_vm = lima_vm_create(ldev);
+	ldev->empty_vm = lima_vm_create(ldev, false);
 	if (!ldev->empty_vm) {
 		err = -ENOMEM;
 		goto err_out1;
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 10fd9154cc46..ca09142e0ac1 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -219,7 +219,7 @@ static int lima_drm_driver_open(struct drm_device *dev, struct drm_file *file)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->vm = lima_vm_create(ldev);
+	priv->vm = lima_vm_create(ldev, true);
 	if (!priv->vm) {
 		err = -ENOMEM;
 		goto err_out0;
diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
index 2b2739adc7f5..7f9775eefd78 100644
--- a/drivers/gpu/drm/lima/lima_vm.c
+++ b/drivers/gpu/drm/lima/lima_vm.c
@@ -197,7 +197,7 @@ u32 lima_vm_get_va(struct lima_vm *vm, struct lima_bo *bo)
 	return ret;
 }
 
-struct lima_vm *lima_vm_create(struct lima_device *dev)
+struct lima_vm *lima_vm_create(struct lima_device *dev, bool has_drm_mm)
 {
 	struct lima_vm *vm;
 
@@ -221,7 +221,10 @@ struct lima_vm *lima_vm_create(struct lima_device *dev)
 			goto err_out1;
 	}
 
-	drm_mm_init(&vm->mm, dev->va_start, dev->va_end - dev->va_start);
+	if (has_drm_mm) {
+		vm->has_drm_mm = true;
+		drm_mm_init(&vm->mm, dev->va_start, dev->va_end - dev->va_start);
+	}
 
 	return vm;
 
@@ -237,7 +240,8 @@ void lima_vm_release(struct kref *kref)
 	struct lima_vm *vm = container_of(kref, struct lima_vm, refcount);
 	int i;
 
-	drm_mm_takedown(&vm->mm);
+	if (vm->has_drm_mm)
+		drm_mm_takedown(&vm->mm);
 
 	for (i = 0; i < LIMA_VM_NUM_BT; i++) {
 		if (vm->bts[i].cpu)
diff --git a/drivers/gpu/drm/lima/lima_vm.h b/drivers/gpu/drm/lima/lima_vm.h
index 3a7c74822d8b..e7443f410d6d 100644
--- a/drivers/gpu/drm/lima/lima_vm.h
+++ b/drivers/gpu/drm/lima/lima_vm.h
@@ -30,6 +30,7 @@ struct lima_vm {
 	struct mutex lock;
 	struct kref refcount;
 
+	bool has_drm_mm;
 	struct drm_mm mm;
 
 	struct lima_device *dev;
@@ -43,7 +44,7 @@ void lima_vm_bo_del(struct lima_vm *vm, struct lima_bo *bo);
 
 u32 lima_vm_get_va(struct lima_vm *vm, struct lima_bo *bo);
 
-struct lima_vm *lima_vm_create(struct lima_device *dev);
+struct lima_vm *lima_vm_create(struct lima_device *dev, bool has_drm_mm);
 void lima_vm_release(struct kref *kref);
 
 static inline struct lima_vm *lima_vm_get(struct lima_vm *vm)
-- 
2.39.2

