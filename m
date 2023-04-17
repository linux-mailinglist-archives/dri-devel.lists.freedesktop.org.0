Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F96E54D7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 00:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D690010E637;
	Mon, 17 Apr 2023 22:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F1310E632;
 Mon, 17 Apr 2023 22:55:15 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a68ef1d9c6so9558105ad.2; 
 Mon, 17 Apr 2023 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681772114; x=1684364114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m9iYR2Co4JKSAqYdknl1fdrnccybCVbaZOt1uS3IMoI=;
 b=jF1aSbP/z+VAHYr733tjVAKHQskfbcRGT7nHvMxcrpK92pui607eWFCtRtCh2nLSDo
 HlXrbyH/wCcw+k7urF9aALSN6UnsW57iFclyAsowmir0jPXmFIHFa76/6qYCxiwSoTJc
 Sll8+MqlZJhqpoICAHdpFyp3aArZMUFPhu5vr1SVG0E/H7ocGH7+4DFJYSDDAsSFGYRG
 6G/UanZsG6hagEsnypDS/u42ZcD+7GRiNDFyEcoHnK2uYKgPr8WhpK9bW16YMlUTr6Y4
 1mXU25UFA63hPICSQ7T277Hkgl2NeJVkSlNKRNSLCgrj+1Yzrn60y5ZjObUVNVR4RkEL
 z78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681772114; x=1684364114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m9iYR2Co4JKSAqYdknl1fdrnccybCVbaZOt1uS3IMoI=;
 b=bkkyKqLy3e2ZXmfVB3iL2/L4nulgm40DQo48O8DOfh8KJp2ZTWmCFHRkIlRytQHASI
 4CB18HliGsPud3UVf9jePpHoUMgRREM9SABFR+8wVV/bWFr28Tvf7uRh8cLlubnXnErM
 HwYKuKbCIwStl24gssy80kfMXgO660xStuKKj1MHvo7gYZeK83jbZpD6Q6JCHzxVHGW9
 uIRBYFqafi+LF1K4pXTLg4+xciD3cYcwNO2a9BQ3AuKAJMtTASnjNQLUcVjGQRonjgqG
 qQl7ipM10oWggKp/e9NTUuTNvc0eiAmezhciEf1MX963WFBSL5gB5wNhVkQ8wiMifiVf
 F4bg==
X-Gm-Message-State: AAQBX9cNhmP+LKztUukE/uzVCcPmEiZv2Z3sFGqlKWTA6HBgjTwYwNW4
 u8xyVa97Nv5UjoLr2psexPFJBSNyKa0=
X-Google-Smtp-Source: AKy350bDp91wqZ9o16qSqyOTp5/kQfreQ5CbUQ03iZ80C8Ymc/TVcSCdZHcYiomfdA9z85lKA89oDA==
X-Received: by 2002:a17:902:7290:b0:1a6:8ed5:428a with SMTP id
 d16-20020a170902729000b001a68ed5428amr109735pll.22.1681772114120; 
 Mon, 17 Apr 2023 15:55:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 jf1-20020a170903268100b001a1ccb37847sm8209039plb.146.2023.04.17.15.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 15:55:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Move cmdstream dumping out of sched kthread
Date: Mon, 17 Apr 2023 15:55:10 -0700
Message-Id: <20230417225510.494951-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is something that can block for arbitrary amounts of time as
userspace consumes from the FIFO.  So we don't really want this to
be in the fence signaling path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c |  2 ++
 drivers/gpu/drm/msm/msm_gpu.c        |  4 ----
 drivers/gpu/drm/msm/msm_rd.c         | 24 ++++++++----------------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 89375c2e422b..6c6aefaa72be 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -952,6 +952,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	/* The scheduler owns a ref now: */
 	msm_gem_submit_get(submit);
 
+	msm_rd_dump_submit(priv->rd, submit, NULL);
+
 	drm_sched_entity_push_job(&submit->base);
 
 	args->fence = submit->fence_id;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 1150dcbf28aa..513e2fccfefc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -759,8 +759,6 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 /* add bo's to gpu's ring, and kick gpu: */
 void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
-	struct drm_device *dev = gpu->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned long flags;
 
@@ -772,8 +770,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	submit->seqno = submit->hw_fence->seqno;
 
-	msm_rd_dump_submit(priv->rd, submit, NULL);
-
 	update_sw_cntrs(gpu);
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index db2f847c8535..8d5687d5ed78 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -83,15 +83,10 @@ struct msm_rd_state {
 
 	bool open;
 
-	/* current submit to read out: */
-	struct msm_gem_submit *submit;
-
 	/* fifo access is synchronized on the producer side by
-	 * gpu->lock held by submit code (otherwise we could
-	 * end up w/ cmds logged in different order than they
-	 * were executed).  And read_lock synchronizes the reads
+	 * write_lock.  And read_lock synchronizes the reads
 	 */
-	struct mutex read_lock;
+	struct mutex read_lock, write_lock;
 
 	wait_queue_head_t fifo_event;
 	struct circ_buf fifo;
@@ -243,6 +238,7 @@ static void rd_cleanup(struct msm_rd_state *rd)
 		return;
 
 	mutex_destroy(&rd->read_lock);
+	mutex_destroy(&rd->write_lock);
 	kfree(rd);
 }
 
@@ -258,6 +254,7 @@ static struct msm_rd_state *rd_init(struct drm_minor *minor, const char *name)
 	rd->fifo.buf = rd->buf;
 
 	mutex_init(&rd->read_lock);
+	mutex_init(&rd->write_lock);
 
 	init_waitqueue_head(&rd->fifo_event);
 
@@ -338,19 +335,15 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
 		return;
 
-	msm_gem_lock(&obj->base);
 	buf = msm_gem_get_vaddr_active(&obj->base);
 	if (IS_ERR(buf))
-		goto out_unlock;
+		return;
 
 	buf += offset;
 
 	rd_write_section(rd, RD_BUFFER_CONTENTS, buf, size);
 
 	msm_gem_put_vaddr_locked(&obj->base);
-
-out_unlock:
-	msm_gem_unlock(&obj->base);
 }
 
 /* called under gpu->lock */
@@ -364,10 +357,7 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 	if (!rd->open)
 		return;
 
-	/* writing into fifo is serialized by caller, and
-	 * rd->read_lock is used to serialize the reads
-	 */
-	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
+	mutex_lock(&rd->write_lock);
 
 	if (fmt) {
 		va_list args;
@@ -424,5 +414,7 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 			break;
 		}
 	}
+
+	mutex_unlock(&rd->write_lock);
 }
 #endif
-- 
2.39.2

