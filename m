Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033575EF646
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3019510E61C;
	Thu, 29 Sep 2022 13:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DF110E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:39 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hy2so2741887ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ltkovj+/loEOckwZa/4aGpUBDfAHhHGNM2nYn963icw=;
 b=pDbZXw/mtvVrTXm+yj9tLYMMm/rai3KKy9jF3iD08HgpsOqt8+eVGtTn2l2H2O/zY2
 rED/7UzwcA/hEbIx739MPWqvYP2QOJDf3+AOnBm5j2nwYwKeZ3x+AFMsup7noo9N6Krg
 CnqhlqxsDcMjUY/bn9CKhVw8XV/cnSK6fWJ5Jbt4b9EkKCOzh36IOEtSC9XUSQ1zZtGU
 ZYGcAjy+mDXaAI0QjEj1qcsIlFVexplPdg5W/BzCzZBs6RfDIoc2vMYhHezActYEQwJi
 EpchR5jhka2krrcfRZBfuByO9oAcgNViVysH6lNBKUXxdPX/gjm6/BrXeJSth74oF9gb
 POZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ltkovj+/loEOckwZa/4aGpUBDfAHhHGNM2nYn963icw=;
 b=ID7MPKsZTHlc0vMbgbgzhJRe0Tv+fJVMGDZXRmtse/hCeX+plktBXqij97Wljle093
 U0nkBnBOS6w3FakmyIfs1FodkGsDnCZlswUHWjw7unEMjkOEX6cyxp5NZQjp9CpPlWHz
 xrOc2pEg3Pl7ufRq0pmp86LXr+GS/QyjxgYiI2T+lF5GoMR/fHkE7XNg/R6YXFNbloWl
 qHVsQmeFKq0TOxQV8gEV1OgJ224yKKjlV49V3k2pVoOsM2uslsT3AjPBP+BiWNis9vww
 A1vRqQTdI55N5HAnhF51RqANEcq+BXnDWwPYlUnG4MFeXHGRtp7RJz1QiHJ1h3O46FXS
 UP6g==
X-Gm-Message-State: ACrzQf07jNyIACc4wgU56D+5lyPN2xXkXCvCMIL8qIQ/sSkOZYD9qipF
 hISOs7LUneAdffo7VGKyQQEZDHwlG+E=
X-Google-Smtp-Source: AMsMyM5iRtfiS0rO28B/s8OsB0Q4BaQ3dG7i5PX/G8knJjI4IoHiD+JOLeVJZ8JMUPVOGmr87Lk/gA==
X-Received: by 2002:a17:907:72c3:b0:783:a9ea:4ad7 with SMTP id
 du3-20020a17090772c300b00783a9ea4ad7mr2633108ejc.533.1664457698199; 
 Thu, 29 Sep 2022 06:21:38 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/13] drm/scheduler: fix fence ref counting
Date: Thu, 29 Sep 2022 15:21:24 +0200
Message-Id: <20220929132136.1715-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: shansheng.wang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We leaked dependency fences when processes were beeing killed.

Additional to that grab a reference to the last scheduled fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 191c56064f19..1bb1437a8fed 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -207,6 +207,7 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
 
+	dma_fence_put(f);
 	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
 	irq_work_queue(&job->work);
 }
@@ -234,8 +235,10 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		/* Wait for all dependencies to avoid data corruptions */
-		while ((f = drm_sched_job_dependency(job, entity)))
+		while ((f = drm_sched_job_dependency(job, entity))) {
 			dma_fence_wait(f, false);
+			dma_fence_put(f);
+		}
 
 		drm_sched_fence_scheduled(s_fence);
 		dma_fence_set_error(&s_fence->finished, -ESRCH);
@@ -250,6 +253,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 			continue;
 		}
 
+		dma_fence_get(entity->last_scheduled);
 		r = dma_fence_add_callback(entity->last_scheduled,
 					   &job->finish_cb,
 					   drm_sched_entity_kill_jobs_cb);
-- 
2.25.1

