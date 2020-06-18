Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170831FEC38
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932746EAF0;
	Thu, 18 Jun 2020 07:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741B6EA8A;
 Thu, 18 Jun 2020 06:56:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f185so4428334wmf.3;
 Wed, 17 Jun 2020 23:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSrkiGW58xhvGfSrRGedc+QGiK8uOANQBZ1I7RWUHHI=;
 b=HWnTFVpohThf7Fdkvat33YIOcm7zYbrdV95naO4qF84KEu/h4oYSpvvTqhB9AtsatH
 SfUot7MpxgX1G2SOhgRNiMYui6xwcEHO8SzPUineH9eJ/6xOKPJd+Ui/EzHOlkK8DVfZ
 i4pFJnumMJ3sv1W2Hf0OrouBqm2Oz9AN8VHatluMUqFfTb5NSMDze4h3ro+34ze89RfR
 DkBAHciDL+BJNQGPHkrw7fM/PxMyZWSFs1GGLkj1noxnmVHK82anflJI3zdV6Y6ZAf1z
 ST3dlenPkfnFI5tqSoj1yh6xFwyB4imXbhPLRQuaMQGLqoNupDGU3o5Y1v3jczUERPIf
 vSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSrkiGW58xhvGfSrRGedc+QGiK8uOANQBZ1I7RWUHHI=;
 b=GF3zZs+UH4sQFNOXZqVM2iy0n6jorZMijNSlJS5jjhy8qfJhCTSOyYay7V6HpKehnD
 ZOl91CoCRwizfnLyi9KQVkExLC9ZnsgKX9pW4UW9dRxJ0RMOkP7dK0v9WWxA8xHmFCpu
 2HC4cA6EQk6wVroXGxMSBLp4oHj9jpTizy9penNH1iGJDu0WgG+g+fjeiaEh3l/UwVGL
 x/GA+2RdhsriBtbAeJhimoOltXnELZfLP4N4TlmwFhdRlGcxDQVqQQCGEFLnmT91VZhg
 SIyTnKWM+Joi+JbDMUYRV5WrUXYtgFdayGi5fDocO593lFWD0rKFuIT/0XdSF0OBDFnZ
 vyxw==
X-Gm-Message-State: AOAM531AGLKffTyGNoE8z79PnudbCLUfbQq1iaiQmp1yxJbcm55ziQKP
 QBy3CFUYmJsx4b/N8aGYtQs=
X-Google-Smtp-Source: ABdhPJwUfDrxDKg/4SB3Auoc6JYEqU+K1I4XTCLKFkatHGtP1VA4FI4VgiKLrEswGI0NO2iAXkYFzg==
X-Received: by 2002:a1c:7d85:: with SMTP id y127mr2467276wmc.181.1592463397435; 
 Wed, 17 Jun 2020 23:56:37 -0700 (PDT)
Received: from kedthinkpad.tpwlan.net ([213.197.144.54])
 by smtp.gmail.com with ESMTPSA id c143sm9104107wmd.1.2020.06.17.23.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 23:56:36 -0700 (PDT)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: Expose job_hang_limit module parameter
Date: Thu, 18 Jun 2020 09:56:18 +0300
Message-Id: <20200618065619.2804351-1-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAKGbVbuV8meZji9PqFUwt4CpFEy6efpX63hJBgMY7fzAnZS4Rg@mail.gmail.com>
References: <CAKGbVbuV8meZji9PqFUwt4CpFEy6efpX63hJBgMY7fzAnZS4Rg@mail.gmail.com>
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

Changed type of lima_job_hang_limit to unsigned int.

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
