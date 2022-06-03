Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15F53CA16
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 14:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7D511220A;
	Fri,  3 Jun 2022 12:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769410E2CD;
 Fri,  3 Jun 2022 12:37:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c2so9964955edf.5;
 Fri, 03 Jun 2022 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YrBwkRdvXLz7+jm3aOsGJs/0ErMfrv6pPp4W4cTpnsc=;
 b=lU6T2dV5ri5pmTMT6Mbiz1EQgTQhwZGxrRXAYVWfB5NmV8ZqAZj9v9QPOohoodr0b1
 79uyw1nq5zUmUdfya6dlH9RnoKW5316fqsCHXRZO4YgZM0zFDcwgyKdQzdl/fpMQkI9d
 eKjXAUS92LFIE+J0QlN+0m9sz2DLQsgM/tEGCa4Dfx/qwcVBRhtpue7pTyxslSjB/A1w
 o8jvBKpdYsQrusdrRo48AuRFgCFS+SPbyht3s+oOM+tQtiduLwZYb6rFFPEnzOI8Bg5B
 tFcIl99IE0mJ1/e6i1Fc562Zznby3G/gTt4XNAGyJTWbwernPIWzLeNRSi8H8U+1FHoc
 JrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YrBwkRdvXLz7+jm3aOsGJs/0ErMfrv6pPp4W4cTpnsc=;
 b=WOcoml6zwVgAlZzviF6Opd+wjIqXmfRHLeJDmJPcCvVx1RpqWSIPakSHW71WrWAWQz
 SafeV3ysBcvD2yfe8PZF7rspstcRkLX1VOOdIEKQDN+oaavJM0Z4JfGIahcg+faVD/BA
 sMPY4MYcxKvcov/EYTJfqgGOmlqHwMzKFDOAaS0tkzjhDkJPYVMQDDRO9TIhofd2BqqU
 DVdzBis+WhfFusL04kheGOmxPfjDitsucH16G4LPGL+ZFY78LheRQoP46QcunQ0SudQ1
 u9AaXA7B5TbOxRvfbenbq9OwMQrxMkjYRntd3es2V7QIV72GDau0Q8sd/dsM95RwZI88
 f3JQ==
X-Gm-Message-State: AOAM5316JSGF1xO/1BEx8WUOTjv8ClDLDJ/cal2XpzHC2BlzKeRvrOhB
 xPHDv1rDbhHO490NNaHLdrBhx1mSOMg=
X-Google-Smtp-Source: ABdhPJxeCabJNbfYESsSsGF42ubf1R5Slv0JDKE/9PlNrQtqy1GE4Zsa18k3wAnt2ZmtPBrmuSNsjA==
X-Received: by 2002:a05:6402:4410:b0:427:ab6f:a39a with SMTP id
 y16-20020a056402441000b00427ab6fa39amr10621435eda.120.1654259867780; 
 Fri, 03 Jun 2022 05:37:47 -0700 (PDT)
Received: from localhost.localdomain.info
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170906660c00b0070e3f58ed5csm716120ejp.48.2022.06.03.05.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 05:37:47 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: print offender task information on hangcheck
 recovery
Date: Fri,  3 Jun 2022 14:37:05 +0200
Message-Id: <20220603123706.678320-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: David Airlie <airlied@linux.ie>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Track the pid per submit, so we can print the name and cmdline of
the task which submitted the batch that caused the gpu to hang.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  6 ++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 18 +++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  2 +-
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 63688e6e4580..baa81cbf701a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -96,6 +96,7 @@ struct etnaviv_gem_submit {
 	int out_fence_id;
 	struct list_head node; /* GPU active submit list */
 	struct etnaviv_cmdbuf cmdbuf;
+	struct pid *pid;       /* submitting process */
 	bool runtime_resumed;
 	u32 exec_state;
 	u32 flags;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 1ac916b24891..1491159d0d20 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -399,6 +399,9 @@ static void submit_cleanup(struct kref *kref)
 		mutex_unlock(&submit->gpu->fence_lock);
 		dma_fence_put(submit->out_fence);
 	}
+
+	put_pid(submit->pid);
+
 	kfree(submit->pmrs);
 	kfree(submit);
 }
@@ -422,6 +425,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct sync_file *sync_file = NULL;
 	struct ww_acquire_ctx ticket;
 	int out_fence_fd = -1;
+	struct pid *pid = get_pid(task_pid(current));
 	void *stream;
 	int ret;
 
@@ -519,6 +523,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto err_submit_ww_acquire;
 	}
 
+	submit->pid = pid;
+
 	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &submit->cmdbuf,
 				  ALIGN(args->stream_size, 8) + 8);
 	if (ret)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..7d9bf4673e2d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1045,12 +1045,28 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 }
 #endif
 
-void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
+void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
 {
+	struct etnaviv_gpu *gpu = submit->gpu;
+	char *comm = NULL, *cmd = NULL;
+	struct task_struct *task;
 	unsigned int i;
 
 	dev_err(gpu->dev, "recover hung GPU!\n");
 
+	task = get_pid_task(submit->pid, PIDTYPE_PID);
+	if (task) {
+		comm = kstrdup(task->comm, GFP_KERNEL);
+		cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
+		put_task_struct(task);
+	}
+
+	if (comm && cmd)
+		dev_err(gpu->dev, "offending task: %s (%s)\n", comm, cmd);
+
+	kfree(cmd);
+	kfree(comm);
+
 	if (pm_runtime_get_sync(gpu->dev) < 0)
 		goto pm_put;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..b3a0941d56fd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -168,7 +168,7 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m);
 #endif
 
-void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu);
+void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit);
 void etnaviv_gpu_retire(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
 	u32 fence, struct drm_etnaviv_timespec *timeout);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 72e2553fbc98..d29f467eee13 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -67,7 +67,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 
 	/* get the GPU back into the init state */
 	etnaviv_core_dump(submit);
-	etnaviv_gpu_recover_hang(gpu);
+	etnaviv_gpu_recover_hang(submit);
 
 	drm_sched_resubmit_jobs(&gpu->sched);
 
-- 
2.36.1

