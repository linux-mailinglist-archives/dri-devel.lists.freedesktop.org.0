Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F446F0B8C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8929F10EBAA;
	Thu, 27 Apr 2023 17:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE8610E0E0;
 Thu, 27 Apr 2023 17:54:03 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115eef620so6796613b3a.1; 
 Thu, 27 Apr 2023 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618043; x=1685210043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTwA5Igpbrlnqx2MFioiqClnnk3fWCd7F6gKiXvsizg=;
 b=F02JosDYSh6gH8BbBVyLQpfSS+7jFCWgel+AjYaRMDX6D8xc/HdFGNUw/LP4VfuhKO
 FBGI+ypyvSemxnMhgbXmZhIj0XAsFs578Ow2DPZX6tr0p6k0r7tRA0tkDLWNgoI66t14
 ChadQMBb4p5jszCF567xmG+p0QDKicYptfWnC10WXOjeNrcro5Kl4r0qSGiZ7igOJ9yw
 ur+tS0pDFIXAvtNgVWdz84HVxOS7GQZpK/ZRRCoMAELIQdgaEAUBJ8h113jxpNcWYFbz
 1Qb9YqiCSLdpHjJTq8V4AyQXpEjLA0vl/xdhw7dWvJ6JZymB4bWO37FZtlgp47OJClNi
 NuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618043; x=1685210043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTwA5Igpbrlnqx2MFioiqClnnk3fWCd7F6gKiXvsizg=;
 b=f1fP1LBhsUWSgT5qeaWHrBfS8VxNER7I+Ii8pN0sN4HORSsWlJarX3d34jkIVt5alP
 L/CqPozrCAxRaNqg0XIuAntA3ipQO8WDgXQyeYHSvikYqM9BNnCfG6KuIZeApfOBO0qx
 1uXNOeMJKvoh4L7uuNEsKvewyPuJEIQKy1mCs65T6d7KRQ+JX+knsv0Er67t33Qc/RUe
 k0mIZKEP83viXRutm8VaBF0i+MYxIIfS/hihf/5gbVsXvCIXrA1LyIO0vckmUEWeQlUb
 d1v4dYFukn4gViBynI6nYcrB7O6vDJr2yg6+0hBuGhIyw8UuVJv8HqT5TV0bwiie4a2K
 T+6A==
X-Gm-Message-State: AC+VfDxAPYWzYlk+B2Gxqd8GQ4gB/8vU2L+9Ykctk1ZpzLmcBFE6PBnY
 zdFryToI+7q26SlsGJBvOlkmPIy6iLY=
X-Google-Smtp-Source: ACHHUZ6LNNj8gqJAFOABkk08xjTsf/iTgKG8pNsMVfNLhyxs19frA15VFo4R4M5e8URgVw6J5vEgMw==
X-Received: by 2002:a17:90a:cb81:b0:249:7ad3:e843 with SMTP id
 a1-20020a17090acb8100b002497ad3e843mr3282208pju.16.1682618043189; 
 Thu, 27 Apr 2023 10:54:03 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 ls17-20020a17090b351100b0023a9564763bsm13396089pjb.29.2023.04.27.10.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:54:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/amdgpu: Switch to fdinfo helper
Date: Thu, 27 Apr 2023 10:53:28 -0700
Message-Id: <20230427175340.1280952-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427175340.1280952-1-robdclark@gmail.com>
References: <20230427175340.1280952-1-robdclark@gmail.com>
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 16 ++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |  2 +-
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f5ffca24def4..6c0e0c614b94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2752,7 +2752,7 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 	.compat_ioctl = amdgpu_kms_compat_ioctl,
 #endif
 #ifdef CONFIG_PROC_FS
-	.show_fdinfo = amdgpu_show_fdinfo
+	.show_fdinfo = drm_show_fdinfo,
 #endif
 };
 
@@ -2807,6 +2807,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
+	.show_fdinfo = amdgpu_show_fdinfo,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 99a7855ab1bc..c2fdd5e448d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -53,9 +53,8 @@ static const char *amdgpu_ip_name[AMDGPU_HW_IP_NUM] = {
 	[AMDGPU_HW_IP_VCN_JPEG]	=	"jpeg",
 };
 
-void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
+void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_file *file = f->private_data;
 	struct amdgpu_device *adev = drm_to_adev(file->minor->dev);
 	struct amdgpu_fpriv *fpriv = file->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
@@ -86,18 +85,15 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
 	 * ******************************************************************
 	 */
 
-	seq_printf(m, "pasid:\t%u\n", fpriv->vm.pasid);
-	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
-	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n", domain, bus, dev, fn);
-	seq_printf(m, "drm-client-id:\t%Lu\n", vm->immediate.fence_context);
-	seq_printf(m, "drm-memory-vram:\t%llu KiB\n", vram_mem/1024UL);
-	seq_printf(m, "drm-memory-gtt: \t%llu KiB\n", gtt_mem/1024UL);
-	seq_printf(m, "drm-memory-cpu: \t%llu KiB\n", cpu_mem/1024UL);
+	drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
+	drm_printf(p, "drm-memory-vram:\t%llu KiB\n", vram_mem/1024UL);
+	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n", gtt_mem/1024UL);
+	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n", cpu_mem/1024UL);
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
@@ -37,6 +37,6 @@
 #include "amdgpu_ids.h"
 
 uint32_t amdgpu_get_ip_count(struct amdgpu_device *adev, int id);
-void amdgpu_show_fdinfo(struct seq_file *m, struct file *f);
+void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file);
 
 #endif
-- 
2.39.2

