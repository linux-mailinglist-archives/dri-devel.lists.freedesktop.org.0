Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711820303E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D046E5A3;
	Mon, 22 Jun 2020 07:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D36E0E4;
 Fri, 19 Jun 2020 07:59:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y20so8228983wmi.2;
 Fri, 19 Jun 2020 00:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LeRTvG0uCKHbriogGBEyjyc5UzHZBdJsborWRefc+F8=;
 b=d9iEaej+2YgHJdaSbvT+TEKt/f5Ph9RdVJRhp4BntFFPQM3K8gbIZAgab6+Lm7mFdt
 0lqGhogx0MmOARRhReNaonKMSf9mTA0dVsiqB/SD3TPt6bvSj+VvpDxn33sdzauqsn06
 zWKGNxoZwlou4EPfRpSJqGF0LdGZmjCUZ4830lf2JbNSy+Ttzj6LJTcCj/r2lbJkzmcZ
 vf4oaKANCdg50sR9ILHLm5mSKH6Er7Jlz8icc93abTBkIODKgVeFQxOcqt7Xn4gLZkxp
 VZMRPT6ju3D7H77Vnf4ldp/s/X+puNbm/eDZIrN2JkMPgsCJ66zIf5/v4Ya+Is+JE1VW
 7nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LeRTvG0uCKHbriogGBEyjyc5UzHZBdJsborWRefc+F8=;
 b=Nu1HjKs1ad4QBTdKdsxjuZKQLuIX7VMfpvPFFn5ev/2xkIhDa/2JSkXgxM5krkWFnz
 dD5/NsSQp8z65pn6+2gvW+85blV9FClS7XQM1/A6qRNPFLCrSumgTq+qE4/6dLYLqa3W
 EaLnobEM4PGJq+9UZYu01bE68HW4phTY8gh9i1zv6yujaoCof3rGNVi0adjvdhs1L2Ny
 yi/NMY1VED0KkdeIpdFAuHgPAAah1CpD9q9c/my5Gt6V+dpHLotTfckNFmP4Fqynol+Z
 qYLrrUz5wnRewcgGAqkaNw8rL8F9CDiJ3zwZ2GWeUEX3bQSagscIUyTJ9S14qIHpECec
 MYpQ==
X-Gm-Message-State: AOAM530p1FEHsz0DUI7yCLGe+sWzLeLe/XVXlq8kS5i58SzmDFwBcdrW
 eEngE0Db8fmVdGO44qYNKok=
X-Google-Smtp-Source: ABdhPJxF4cF5V82JZiJN8gB/gu9ctvnFr1pdscpxJVnUgvJkLIB1x0dIrih1Rc7C4WF2ynX9CUnFrg==
X-Received: by 2002:a7b:cb56:: with SMTP id v22mr2462594wmj.180.1592553547251; 
 Fri, 19 Jun 2020 00:59:07 -0700 (PDT)
Received: from kedthinkpad.tpwlan.net ([213.197.144.54])
 by smtp.gmail.com with ESMTPSA id f11sm6381244wrj.2.2020.06.19.00.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 00:59:05 -0700 (PDT)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: Expose job_hang_limit module parameter
Date: Fri, 19 Jun 2020 10:58:59 +0300
Message-Id: <20200619075900.3030696-1-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAKGbVbtYusvURFcUyQtgUycNJPAQyDGDaLXW8qw-x49DqfKmQA@mail.gmail.com>
References: <CAKGbVbtYusvURFcUyQtgUycNJPAQyDGDaLXW8qw-x49DqfKmQA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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

Now all types are correct (uint).

 drivers/gpu/drm/lima/lima_drv.c   | 4 ++++
 drivers/gpu/drm/lima/lima_drv.h   | 1 +
 drivers/gpu/drm/lima/lima_sched.c | 5 +++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index a831565af813..ab460121fd52 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -19,6 +19,7 @@
 int lima_sched_timeout_ms;
 uint lima_heap_init_nr_pages = 8;
 uint lima_max_error_tasks;
+uint lima_job_hang_limit;
 
 MODULE_PARM_DESC(sched_timeout_ms, "task run timeout in ms");
 module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
@@ -29,6 +30,9 @@ module_param_named(heap_init_nr_pages, lima_heap_init_nr_pages, uint, 0444);
 MODULE_PARM_DESC(max_error_tasks, "max number of error tasks to save");
 module_param_named(max_error_tasks, lima_max_error_tasks, uint, 0644);
 
+MODULE_PARM_DESC(job_hang_limit, "number of times to allow a job to hang before dropping it (default 0)");
+module_param_named(job_hang_limit, lima_job_hang_limit, uint, 0444);
+
 static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_lima_get_param *args = data;
diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
index fdbd4077c768..c738d288547b 100644
--- a/drivers/gpu/drm/lima/lima_drv.h
+++ b/drivers/gpu/drm/lima/lima_drv.h
@@ -11,6 +11,7 @@
 extern int lima_sched_timeout_ms;
 extern uint lima_heap_init_nr_pages;
 extern uint lima_max_error_tasks;
+extern uint lima_job_hang_limit;
 
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
