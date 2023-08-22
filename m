Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5378492C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3C710E3D2;
	Tue, 22 Aug 2023 18:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91EA10E3C4;
 Tue, 22 Aug 2023 18:02:53 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bba48b0bd2so31271515ad.3; 
 Tue, 22 Aug 2023 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727373; x=1693332173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWTFCIAZmBfA/MXBTibsw5+lmGqMuDYbvZM3o5ozilI=;
 b=sIVmrjcxitFg4JJkvgu3n9lZfj+ZSoymmV8gHVUoJnc+FzgpSsasuqzAXhGRBrljDK
 DEIkTj8WkF7AizHnQWUzvOjfQJfbnSs0d/tkzbs2tK73XP+c7L0CvkBD/Y3OKA5EYVdq
 EUwL1J5uSulGu8DxFtG01OFb64dwzI57BkYCDnd1E15xGR/cKqQAxtiF89wZ1RlnkaVy
 3upuoiMg2Tl9TmjGpaPZvByfpvcu5DVWFfIY/ss86Jj0DG77M7K3kXLLUoYBu6auFJmE
 i7dUEUj7qduUDX7ihwu6sKvV9bjU+vUH44d9oAST7+HcJ7MwI0FChfLRYMMNbpDsqtRX
 AhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727373; x=1693332173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWTFCIAZmBfA/MXBTibsw5+lmGqMuDYbvZM3o5ozilI=;
 b=dLmqWUuoclQOy/AyfIhuVK4+ubh39wEs+Xe4ZA1ZrppiQCcZFDS+X27H/wLh+34LYu
 dcdBYEvLBs2UT213Dv+sntuyGN8gE68KGSKDP8CbMPWZTz02zCsHd5WvMRdRLN8numh0
 Nm087QCnx6xi1DWb75QC0syzChKqZgqr7C7zJNuvd+8KWwtte7VD+1HQawPXF5NuyhS0
 Z4KA6gpN1SshWyjEThk8NGakP29niVEV9RTDlJECPvpYBZgYq1HhTPhpZti453rkGRew
 UK4X5+/eXn8fDOvrd7+52rvplwTeFP32js0LXw14mrj/n5cZdKxdf6aTBDNIJKSO28pO
 MJag==
X-Gm-Message-State: AOJu0YzbNV/jJxirmg1rui6jokphtCwnK/GerDt1n6C9APoInu2dH3Ux
 T2ptpoJ0be4oEpM+lOj3suAubRW5BJM=
X-Google-Smtp-Source: AGHT+IHqlGWpSm+itCsmoVu7dzoE8tI7bdalCAnDaQMOyO+v4DHR0mT7LaS+Ix96c8+CTKvupoRMMA==
X-Received: by 2002:a17:902:d345:b0:1bb:1e69:28be with SMTP id
 l5-20020a170902d34500b001bb1e6928bemr7341664plk.42.1692727372807; 
 Tue, 22 Aug 2023 11:02:52 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902748900b001ac7f583f72sm9303844pll.209.2023.08.22.11.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/11] drm/sched: Add (optional) fence signaling annotation
Date: Tue, 22 Aug 2023 11:01:57 -0700
Message-ID: <20230822180208.95556-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Based on
https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
but made to be optional.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++++
 include/drm/gpu_scheduler.h            | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 23afd70e41ea..6dda18639ac9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1018,10 +1018,15 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
 static int drm_sched_main(void *param)
 {
 	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
+	const bool fence_signalling = sched->fence_signalling;
+	bool fence_cookie;
 	int r;
 
 	sched_set_fifo_low(current);
 
+	if (fence_signalling)
+		fence_cookie = dma_fence_begin_signalling();
+
 	while (!kthread_should_stop()) {
 		struct drm_sched_entity *entity = NULL;
 		struct drm_sched_fence *s_fence;
@@ -1077,6 +1082,10 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+	if (fence_signalling)
+		dma_fence_end_signalling(fence_cookie);
+
 	return 0;
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e95b4837e5a3..58d958ad31a1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -493,6 +493,7 @@ struct drm_sched_backend_ops {
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @dev: system &struct device
+ * @fence_signalling: Opt in to fence signalling annotations
  *
  * One scheduler is implemented for each hardware ring.
  */
@@ -517,6 +518,7 @@ struct drm_gpu_scheduler {
 	bool				ready;
 	bool				free_guilty;
 	struct device			*dev;
+	bool 				fence_signalling;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
-- 
2.41.0

