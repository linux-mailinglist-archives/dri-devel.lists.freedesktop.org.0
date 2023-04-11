Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155C6DE7AA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F4A10E6B5;
	Tue, 11 Apr 2023 22:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654A210E69B;
 Tue, 11 Apr 2023 22:57:50 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so9670992pjb.1; 
 Tue, 11 Apr 2023 15:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681253869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IA16a8P3ifQnuFE2cU6SZqzeMpec7rd2aaRk7CHbWjo=;
 b=N1wV9W1CkfJg8ZW8nbO/XbncdQcQ5WGUtAM39mq0MG54NQ569pUJsbxo8xSPP82eit
 Aw1VXkHGLydvIe2j7Xskuta625jMiaCqT3wkVDU9Nklhk1E50eh93rQ4W+epDDOw1hCC
 TDYs1dg+HW2pUlvEQSCcjOSegMnOP82/h46z/2i5x8r+Ia8Gv2Obf5QLbH/v8KXbW3xM
 btyYK0XK+zdVkAi+aleiIramImekj7X87ikeburFiU/L2qvhqMWTQU+KqydDKsnJ3vlv
 kGG+jOK8ZET2J3IVZPTATZNhsfpgnWv0E4G9FBmaV3Gx7ZtDKixAi7Acr5hArBjCpqRQ
 QzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681253869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IA16a8P3ifQnuFE2cU6SZqzeMpec7rd2aaRk7CHbWjo=;
 b=vXXKWQ2+RFxeHIBdzwYjUYsa89cnj+DrnLnQkU3+qGVIeRCbmLdx64rXda773Mh38R
 RUFAO1DJ+whpNfBUgi6Lf8gsjvyjnUspkj1W5PQOfHL9KGe4PfHMkfL+gHq4oJ/cZD6P
 8iVCvzCL39z37Sds6Sv7Ia+A6dbQM8qRkUbbAE5QcHsjI+H0D89rwzKSwWcsGdt+HBhg
 FPfpa0iOrC9U4L71tjsTfHJkYL4pXudn7Y76Gqm7IDUO7PGLzEjred0g6cxx9JSclPkN
 mnglTck/z5/0S6SPUZoReHJeitU70tcXqWrR6DAJ0vr/i0v007Rg86fFHTc3gbYBSN8u
 1SAA==
X-Gm-Message-State: AAQBX9e3gG5Av1u1G26LOKZd398xzdX0rKXEQ9CGf/ZT1jtRfNIB0m2t
 R012igTHs6Qmj924GEFgXL1NvuC3lDQ=
X-Google-Smtp-Source: AKy350bEeqU5DiwN669zYMn8njQUVxYmCFUZdbZaRVA3pKtDRjjEcnb2lSJmj4IgzOT1GoTtagoJXQ==
X-Received: by 2002:a17:90b:3892:b0:246:c223:14ba with SMTP id
 mu18-20020a17090b389200b00246c22314bamr8589895pjb.28.1681253869342; 
 Tue, 11 Apr 2023 15:57:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 jw8-20020a170903278800b001a649347f59sm3626131plb.12.2023.04.11.15.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 15:57:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/amdgpu: Switch to fdinfo helper
Date: Tue, 11 Apr 2023 15:56:08 -0700
Message-Id: <20230411225725.2032862-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411225725.2032862-1-robdclark@gmail.com>
References: <20230411225725.2032862-1-robdclark@gmail.com>
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
Cc: open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, Evan Quan <evan.quan@amd.com>,
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 16 ++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |  2 +-
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f5ffca24def4..3611cfd5f076 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2752,7 +2752,7 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 	.compat_ioctl = amdgpu_kms_compat_ioctl,
 #endif
 #ifdef CONFIG_PROC_FS
-	.show_fdinfo = amdgpu_show_fdinfo
+	.show_fdinfo = drm_fop_show_fdinfo,
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

