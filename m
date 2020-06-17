Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02EE1FEC40
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBDA6EB18;
	Thu, 18 Jun 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02666EA01;
 Wed, 17 Jun 2020 17:57:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z9so3946402ljh.13;
 Wed, 17 Jun 2020 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KY7fprr0DDACjWieFfe2ChRtojrwX3BZmzgMO+wfVKc=;
 b=hot41bfOqSh2U0gr5jjoD2IPokslzvquFN9OF6L5rUkFdkCMxoVQLZaJDwO2R0Nc8F
 7JKuArzVoS159bDQorZ1MBqJtI6TPJw8KR5HdNU5rRtbv7kKNGP5Re4SNGC2/5SjIw0U
 1Ec7Zzgbtx7FU/8i6+pSCremhMVFGCbzkmm2cZ6wo0B2DJUmTaVwWI4sbS5WqlzQb1iV
 98hnL6i9rZCB+3diIOiJS9G1J0z9okzRJol/RyL7jEXpSMnyOCye2WV30knOUm2EfQN1
 cv2ZjTEM+yaCXB4N5d3VJ0dUX+UlpEK/GbIuC1/ndXEci9/4vk/z49l2X9lfk1k26gM3
 Kr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KY7fprr0DDACjWieFfe2ChRtojrwX3BZmzgMO+wfVKc=;
 b=kOhqQA6d0J2gvdOwfzt28Xgoe3/PJPeXuYXQvhUtD08gI385h8QCTI5I8kQWmc+bAk
 iCT8j3JhsenKAohtXXpNHDDgiq1niCO0NFLYG62iRjRiC4aTzfAWBeqUvgi8q+5zLrBZ
 68JjrzBCAbITPauMcenmoM0GO9+1mfWn6MN3SCIOWagq2uzZ6R/K6pZ9doFJvILT1T1Z
 vX2JG1q+AV95MPdUrR/mf21Hgeuy/jFpYzQJIAW+svnVe3IrD/pK2LegdaeioJ9Iz7XY
 UP+TkUH+y8G4ztCcqrXgQojOHuSmY0+S+j93rHQ5Iw9cY5RRMnRETXKmVdD4pYxrG4o8
 blaw==
X-Gm-Message-State: AOAM530sWT4Qm3DFw7JCtKGf1G7A5/zrbQiAojuyTL0rbk9doM0zeYu+
 1WGrceh8QBTowIFhZA7ZjxI=
X-Google-Smtp-Source: ABdhPJwCUIZGY4uVMQ7lm8qgRAXZLFSjzWtWXUSeWEr056z+tQUUhX2bXp/JXcFF3uHKSPKbTrEGtA==
X-Received: by 2002:a2e:95d6:: with SMTP id y22mr211356ljh.469.1592416639064; 
 Wed, 17 Jun 2020 10:57:19 -0700 (PDT)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id h4sm95471ljg.112.2020.06.17.10.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 10:57:18 -0700 (PDT)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: Expose job_hang_limit module parameter
Date: Wed, 17 Jun 2020 20:54:47 +0300
Message-Id: <20200617175447.2681047-1-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: andrey@lebedev.lt
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Lebedev <andrey@lebedev.lt>

Some pp or gp jobs can be successfully repeated even after they time outs.
Introduce lima module parameter to specify number of times a job can hang
before being dropped.

Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
---

Hello,

This patch allows to work around a freezing problem as discussed in
https://gitlab.freedesktop.org/lima/linux/-/issues/33

 drivers/gpu/drm/lima/lima_drv.c   | 4 ++++
 drivers/gpu/drm/lima/lima_drv.h   | 1 +
 drivers/gpu/drm/lima/lima_sched.c | 5 +++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index a831565af813..2807eba26c55 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -19,6 +19,7 @@
 int lima_sched_timeout_ms;
 uint lima_heap_init_nr_pages = 8;
 uint lima_max_error_tasks;
+int lima_job_hang_limit;
 
 MODULE_PARM_DESC(sched_timeout_ms, "task run timeout in ms");
 module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
@@ -29,6 +30,9 @@ module_param_named(heap_init_nr_pages, lima_heap_init_nr_pages, uint, 0444);
 MODULE_PARM_DESC(max_error_tasks, "max number of error tasks to save");
 module_param_named(max_error_tasks, lima_max_error_tasks, uint, 0644);
 
+MODULE_PARM_DESC(job_hang_limit, "number of times to allow a job to hang before dropping it (default 0)");
+module_param_named(job_hang_limit, lima_job_hang_limit, int, 0444);
+
 static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_lima_get_param *args = data;
diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
index fdbd4077c768..39fd98e3b14d 100644
--- a/drivers/gpu/drm/lima/lima_drv.h
+++ b/drivers/gpu/drm/lima/lima_drv.h
@@ -11,6 +11,7 @@
 extern int lima_sched_timeout_ms;
 extern uint lima_heap_init_nr_pages;
 extern uint lima_max_error_tasks;
+extern int lima_job_hang_limit;
 
 struct lima_vm;
 struct lima_bo;
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index e6cefda00279..1602985dfa04 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -503,8 +503,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
-			      msecs_to_jiffies(timeout), name);
+	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
+			      lima_job_hang_limit, msecs_to_jiffies(timeout),
+			      name);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
