Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BB244389
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066BC6EB07;
	Fri, 14 Aug 2020 02:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B12C6EAE3;
 Fri, 14 Aug 2020 02:42:21 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d19so3810200pgl.10;
 Thu, 13 Aug 2020 19:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FvoB/QZ4hH7jO2LobIZsox+NVJPMDXlJlM4677kKgLg=;
 b=a7oYXh+gB7wzD2sGKJdQwETvOjphf21jMJWEBa6suIVbpaEmBDQPjp8pQqE7PaKOvf
 yVv+eNa2TIZqokgxHGqUuFDYk2+EOjPTAEOTjoHQzpf4I+DqkhxMjyED1pT6Y3K+hPi/
 U+ga1p/HKlYS3iQZdjjIzklEjl2+MUz0W1gxp6251RuWuAPC9lYvwgBRseRaQ9Y7pmi9
 q2veITkGjxSkyEFgIfspGGrn8RUuuAgMLN44lBJu0bAK+5qJfrSbpNX/JUlDwY7o0osI
 R/uhVO8OvVHkuDNEy7cqvP1uRvPAVe7nU4jE4aNNL08sjKpUnxzIkRDUr1MuotEKS9iP
 Vk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FvoB/QZ4hH7jO2LobIZsox+NVJPMDXlJlM4677kKgLg=;
 b=iwOuEnErjpg53q4tB//wfaICa8VKMHD3O05I1IG/RraxR7/XLl1i1Gpbi8fZXcXZnw
 vXFLIaMYgM3GvmVK6JOd+zVdPExWbmNiI8QFdjq4EcBbAS/vUTHqB3sdwqeuCX7qL6uQ
 W/09XJAyEm2d3d3gVprBWC/e3mK8DR7AoU4FPuDcITwFA6LI94I6XBSktE8HEzB0CbdC
 erlAXqGxbIpyFFAYkiTovqTtBl8qlrQs63U76HeF/Di0Bd9gzNtkdMb/V4kXZ2Zp2+J3
 iokgJXbkt32NM1hgPpozj1WSHAIpu6Xmm2KG5XTkV40wHkcfjWsKOWgk6oRiT4tPPJf/
 HNeg==
X-Gm-Message-State: AOAM531Gs2V3vJvvFYq83P2Ny39PwclW3jW20BLFbVPLXdBlkXBK5ddm
 FfiZ8t1kB8F7eEHDh/zLYNBiw/Vv9gxCpQ==
X-Google-Smtp-Source: ABdhPJz7zs3EYsHz6zTyJWmSmcnJ89HgA+GRCOgZyF5+aS2jdsaHqSElpXE/ljsfNzpiCQZ7QzGXZg==
X-Received: by 2002:aa7:96b0:: with SMTP id g16mr283185pfk.19.1597372940752;
 Thu, 13 Aug 2020 19:42:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id 7sm7203244pff.78.2020.08.13.19.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:42:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 19/19] drm/msm: show process names in gem_describe
Date: Thu, 13 Aug 2020 19:41:14 -0700
Message-Id: <20200814024114.1177553-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In $debugfs/gem we already show any vma(s) associated with an object.
Also show process names if the vma's address space is a per-process
address space.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c     |  2 +-
 drivers/gpu/drm/msm/msm_gem.c     | 25 +++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gem.h     |  5 +++++
 drivers/gpu/drm/msm/msm_gem_vma.c |  1 +
 drivers/gpu/drm/msm/msm_gpu.c     |  8 +++++---
 drivers/gpu/drm/msm/msm_gpu.h     |  2 +-
 6 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8e70d220bba8..8d5c4f98c332 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
+	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3cb7aeb93fd3..76a6c5271e57 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -842,11 +842,28 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 
 		seq_puts(m, "      vmas:");
 
-		list_for_each_entry(vma, &msm_obj->vmas, list)
-			seq_printf(m, " [%s: %08llx,%s,inuse=%d]",
-				vma->aspace != NULL ? vma->aspace->name : NULL,
-				vma->iova, vma->mapped ? "mapped" : "unmapped",
+		list_for_each_entry(vma, &msm_obj->vmas, list) {
+			const char *name, *comm;
+			if (vma->aspace) {
+				struct msm_gem_address_space *aspace = vma->aspace;
+				struct task_struct *task =
+					get_pid_task(aspace->pid, PIDTYPE_PID);
+				if (task) {
+					comm = kstrdup(task->comm, GFP_KERNEL);
+				} else {
+					comm = NULL;
+				}
+				name = aspace->name;
+			} else {
+				name = comm = NULL;
+			}
+			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s,inuse=%d]",
+				name, comm ? ":" : "", comm ? comm : "",
+				vma->aspace, vma->iova,
+				vma->mapped ? "mapped" : "unmapped",
 				vma->inuse);
+			kfree(comm);
+		}
 
 		seq_puts(m, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9c573c4269cb..7b1c7a5f8eef 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -24,6 +24,11 @@ struct msm_gem_address_space {
 	spinlock_t lock; /* Protects drm_mm node allocation/removal */
 	struct msm_mmu *mmu;
 	struct kref kref;
+
+	/* For address spaces associated with a specific process, this
+	 * will be non-NULL:
+	 */
+	struct pid *pid;
 };
 
 struct msm_gem_vma {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 29cc1305cf37..80a8a266d68f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -17,6 +17,7 @@ msm_gem_address_space_destroy(struct kref *kref)
 	drm_mm_takedown(&aspace->mm);
 	if (aspace->mmu)
 		aspace->mmu->funcs->destroy(aspace->mmu);
+	put_pid(aspace->pid);
 	kfree(aspace);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 951850804d77..ac8961187a73 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -825,10 +825,9 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 
 /* Return a new address space for a msm_drm_private instance */
 struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu)
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
 {
 	struct msm_gem_address_space *aspace = NULL;
-
 	if (!gpu)
 		return NULL;
 
@@ -836,8 +835,11 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu)
 	 * If the target doesn't support private address spaces then return
 	 * the global one
 	 */
-	if (gpu->funcs->create_private_address_space)
+	if (gpu->funcs->create_private_address_space) {
 		aspace = gpu->funcs->create_private_address_space(gpu);
+		if (!IS_ERR(aspace))
+			aspace->pid = get_pid(task_pid(task));
+	}
 
 	if (IS_ERR_OR_NULL(aspace))
 		aspace = msm_gem_address_space_get(gpu->aspace);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4052a18e18c2..59f26bd0fe42 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -298,7 +298,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config);
 
 struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu);
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
