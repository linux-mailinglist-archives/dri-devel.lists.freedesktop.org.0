Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A681C70FB25
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB54110E583;
	Wed, 24 May 2023 16:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC34D10E677;
 Wed, 24 May 2023 16:00:31 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d2da69fdfso1229046b3a.0; 
 Wed, 24 May 2023 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684944030; x=1687536030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgPqvCuDomCcpddhPDuK2cRaX+7yovp8gvIn/0ROM8o=;
 b=RWgC+TkHkjKHT+CRTZboyOkJAe0MhVmLlogkcVtrAP5M9V4/3hVzOnHCwy30ZsQ6qW
 3F/kk34xKaTJllzDMw/89vq7P3ud/ugGD6xq93Kqnr4s6to/vbTGBQ4SbW3YfYjJ0lgC
 trdADqdmQWIX58ByAYBJ8gbJUsd+t44HUS1ljf0WXyreJcdN37oNiCdSz2fkw+KjzA/B
 JMAetRMqJQdmfbNH98iEwu8FCnaoy4EABiyzkc6e0oglk4KbVQWXRlPubMJyeg7XaVhA
 tcSMxJhtse24tUVk2ITvFpXRciAb7zsVg1H/sKCmg4edZhFIF+yMFNVpUF78+9HniOoQ
 9AHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944030; x=1687536030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgPqvCuDomCcpddhPDuK2cRaX+7yovp8gvIn/0ROM8o=;
 b=eBgIHuPo3UTq/u1cuEJQVW/MtJdg/r3oRnHpn93iqp05tTHqwqc3ogvDW6MAiu/Wgm
 QSEnM6cTBbobKT4cw85b1hfCGiWwuUMlnDK/vBtkv7yCOkbn8TbCPS4EZmDwTGMdCSov
 5b59Phc2jY+2HHNI5wiEoJvtguMwY1/a4YnIm//fiRgZiIs2z+47ucFnXQ8ZKZLCBssM
 xRiV0CUkMvdnGN/K0wT+5+HWxqO0TT4RMuGp5+P+1zuUtKvq+0XWtnIdNsmvMOG5X9VK
 WjqRFHdYMtXfipOaSWC+rCdPCL3pda4nc1y2JsR8U7mIyqTesCknKmILVi/W0UJ2fhm2
 vhfQ==
X-Gm-Message-State: AC+VfDzRYvGveA/3L7F6h/9Qu1b6da5OUXv1FVllJuiftJu6Il6+kJTy
 HkltJYT9HE7HGkr900fWWyRMpBw7FRs=
X-Google-Smtp-Source: ACHHUZ7nmLnzIpMDtOUnPkTfQof/nxgZRpx7CECCrwNmb2fR4ergpfoLMNL7O5fM+bih4y3CQJTGAw==
X-Received: by 2002:a05:6a00:14c2:b0:643:59cd:6cad with SMTP id
 w2-20020a056a0014c200b0064359cd6cadmr4023754pfu.24.1684944030032; 
 Wed, 24 May 2023 09:00:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 b1-20020aa78101000000b0063b85893633sm7542046pfi.197.2023.05.24.09.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:00:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/7] drm/amdgpu: Switch to fdinfo helper
Date: Wed, 24 May 2023 08:59:34 -0700
Message-Id: <20230524155956.382440-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155956.382440-1-robdclark@gmail.com>
References: <20230524155956.382440-1-robdclark@gmail.com>
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
Cc: open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

v2: Rebase on drm-misc-next

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 32 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |  2 +-
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b1ca1ab6d6ad..1b46e7ac7cb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2740,21 +2740,21 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 	.flush = amdgpu_flush,
 	.release = drm_release,
 	.unlocked_ioctl = amdgpu_drm_ioctl,
 	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl = amdgpu_kms_compat_ioctl,
 #endif
 #ifdef CONFIG_PROC_FS
-	.show_fdinfo = amdgpu_show_fdinfo
+	.show_fdinfo = drm_show_fdinfo,
 #endif
 };
 
 int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 {
 	struct drm_file *file;
 
 	if (!filp)
 		return -EINVAL;
 
@@ -2795,20 +2795,21 @@ static const struct drm_driver amdgpu_kms_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
+	.show_fdinfo = amdgpu_show_fdinfo,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = amdgpu_gem_prime_import,
 	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
 	.major = KMS_DRIVER_MAJOR,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index c57252f004e8..13d7413d4ca3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -46,23 +46,22 @@ static const char *amdgpu_ip_name[AMDGPU_HW_IP_NUM] = {
 	[AMDGPU_HW_IP_COMPUTE]	=	"compute",
 	[AMDGPU_HW_IP_DMA]	=	"dma",
 	[AMDGPU_HW_IP_UVD]	=	"dec",
 	[AMDGPU_HW_IP_VCE]	=	"enc",
 	[AMDGPU_HW_IP_UVD_ENC]	=	"enc_1",
 	[AMDGPU_HW_IP_VCN_DEC]	=	"dec",
 	[AMDGPU_HW_IP_VCN_ENC]	=	"enc",
 	[AMDGPU_HW_IP_VCN_JPEG]	=	"jpeg",
 };
 
-void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
+void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_file *file = f->private_data;
 	struct amdgpu_device *adev = drm_to_adev(file->minor->dev);
 	struct amdgpu_fpriv *fpriv = file->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 
 	struct amdgpu_mem_stats stats;
 	ktime_t usage[AMDGPU_HW_IP_NUM];
 	uint32_t bus, dev, fn, domain;
 	unsigned int hw_ip;
 	int ret;
 
@@ -80,38 +79,37 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
 	amdgpu_bo_unreserve(vm->root.bo);
 
 	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
 
 	/*
 	 * ******************************************************************
 	 * For text output format description please see drm-usage-stats.rst!
 	 * ******************************************************************
 	 */
 
-	seq_printf(m, "pasid:\t%u\n", fpriv->vm.pasid);
-	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
-	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n", domain, bus, dev, fn);
-	seq_printf(m, "drm-client-id:\t%Lu\n", vm->immediate.fence_context);
-	seq_printf(m, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL);
-	seq_printf(m, "drm-memory-gtt: \t%llu KiB\n", stats.gtt/1024UL);
-	seq_printf(m, "drm-memory-cpu: \t%llu KiB\n", stats.cpu/1024UL);
-	seq_printf(m, "amd-memory-visible-vram:\t%llu KiB\n",
+	drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
+	drm_printf(p, "drm-driver:\t%s\n", file->minor->dev->driver->name);
+	drm_printf(p, "drm-pdev:\t%04x:%02x:%02x.%d\n", domain, bus, dev, fn);
+	drm_printf(p, "drm-client-id:\t%Lu\n", vm->immediate.fence_context);
+	drm_printf(p, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL);
+	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n", stats.gtt/1024UL);
+	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n", stats.cpu/1024UL);
+	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
 		   stats.visible_vram/1024UL);
-	seq_printf(m, "amd-evicted-vram:\t%llu KiB\n",
+	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
 		   stats.evicted_vram/1024UL);
-	seq_printf(m, "amd-evicted-visible-vram:\t%llu KiB\n",
+	drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
 		   stats.evicted_visible_vram/1024UL);
-	seq_printf(m, "amd-requested-vram:\t%llu KiB\n",
+	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
 		   stats.requested_vram/1024UL);
-	seq_printf(m, "amd-requested-visible-vram:\t%llu KiB\n",
+	drm_printf(p, "amd-requested-visible-vram:\t%llu KiB\n",
 		   stats.requested_visible_vram/1024UL);
-	seq_printf(m, "amd-requested-gtt:\t%llu KiB\n",
+	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
 		   stats.requested_gtt/1024UL);
-
 	for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
 		if (!usage[hw_ip])
 			continue;
 
-		seq_printf(m, "drm-engine-%s:\t%Ld ns\n", amdgpu_ip_name[hw_ip],
+		drm_printf(p, "drm-engine-%s:\t%Ld ns\n", amdgpu_ip_name[hw_ip],
 			   ktime_to_ns(usage[hw_ip]));
 	}
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
index e86834bfea1d..0398f5a159ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
@@ -30,13 +30,13 @@
 #include <linux/rbtree.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/drm_file.h>
 #include <linux/sched/mm.h>
 
 #include "amdgpu_sync.h"
 #include "amdgpu_ring.h"
 #include "amdgpu_ids.h"
 
 uint32_t amdgpu_get_ip_count(struct amdgpu_device *adev, int id);
-void amdgpu_show_fdinfo(struct seq_file *m, struct file *f);
+void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file);
 
 #endif
-- 
2.40.1

