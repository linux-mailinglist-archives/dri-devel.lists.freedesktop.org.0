Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2E200249
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678FE6EC17;
	Fri, 19 Jun 2020 06:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8264D6EAE2;
 Thu, 18 Jun 2020 14:58:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so6419408wru.0;
 Thu, 18 Jun 2020 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jD/vaqPgqn/GbyEshdpFayy0rmaV/B8hrtCZ/Jh2OJE=;
 b=MUhjuTRE41q8DNA4MiAfGDVi5SKnOjfYcFcOhQx7Q0shrPeqQgpSkt8vNdagw81CtD
 lWLMX4+/HZFFKq9CRKzRPyqosy7lw1AjTREEIydy8HM7KhD0t5cCYtapY8p+iKvwIrJU
 7Y88sQstzp0ZvxbnwwQ/GnOgH5HrC0o3bQQGhF1y9V/l2jWwfjAyYqDJ0mEp/rMQv6Bv
 4Ijzapji4+JZXd8P9bxQJK/BbyzgGnHZJ85AWAhCegMt6uaB13sZTFWoihMIAObxx9kA
 VnN/1RVFtOzFZJfnVmAtV2Nbbt8eJXjLOLPUk1vH1u2XdGfLw7QjcUBdogC9RiXY3BIR
 g9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jD/vaqPgqn/GbyEshdpFayy0rmaV/B8hrtCZ/Jh2OJE=;
 b=g4DIs3ApKRhr0DATodZ03TENNMrTLepu7/KIf5iUobgkQGaOLlzf/sbaVhRLOyvIsI
 r6YVninFg6SuxeHa3AVrXvycOtFqceOPMnADpoWGvf57aQJD2TYhb3lK2Pb1WDgYjAck
 cdvtpjla1YoJT25LY+kF7G6vQMu0lZxRlGRVHl3km0Wh0Na2lgxAHn7k00LDlHo+sqwo
 TQUaMdaZE7P5UiKR6CGlkq1telwkqvxE8TbNi3AwRzSQxzvZCYTVL8U4BbAmeU9zax/2
 gkTb2ZrWneII8dWUfjujOVm7pFvqweQBomlO3yMxO2uLvVL94/3r3MfNzyOFkInGZbw9
 l6oA==
X-Gm-Message-State: AOAM5306gt852TtHmjidd32aWM5AfqDFTEhDfY5XctcstmR+L9/KvFl8
 FbuI1z8kWY1CHp7o9gX6TUjiFHNB7kpOnw==
X-Google-Smtp-Source: ABdhPJzOZoyx7rjEtPKa6qEeScd/wg3eiCkfIoiDdKF8rKK6pseRXTi7+uxRtJKxdSB6is1mRGCuOw==
X-Received: by 2002:adf:e2c9:: with SMTP id d9mr4969310wrj.227.1592492331224; 
 Thu, 18 Jun 2020 07:58:51 -0700 (PDT)
Received: from kedthinkpad.tpwlan.net ([213.197.144.54])
 by smtp.gmail.com with ESMTPSA id e2sm1941346wrt.76.2020.06.18.07.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 07:58:50 -0700 (PDT)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: Expose job_hang_limit module parameter
Date: Thu, 18 Jun 2020 17:58:38 +0300
Message-Id: <20200618145838.2956591-1-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAKGbVbuV8meZji9PqFUwt4CpFEy6efpX63hJBgMY7fzAnZS4Rg@mail.gmail.com>
References: <CAKGbVbuV8meZji9PqFUwt4CpFEy6efpX63hJBgMY7fzAnZS4Rg@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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
Cc: andrey@lebedev.lt, kernel test robot <lkp@intel.com>
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

Fixes for the embarrassing build error
Reported-by: kernel test robot <lkp@intel.com>

 drivers/gpu/drm/lima/lima_drv.c   | 4 ++++
 drivers/gpu/drm/lima/lima_drv.h   | 1 +
 drivers/gpu/drm/lima/lima_sched.c | 5 +++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index a831565af813..2400b8d52d92 100644
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
+module_param_named(job_hang_limit, lima_job_hang_limit, int, 0444);
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
