Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBAF5EFC95
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5390B10EBBC;
	Thu, 29 Sep 2022 18:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54FC10EBBD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:01:54 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id dv25so4375343ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=LaEimOJ+lgAKHH6s6K+Wo5MzjV2hXKpsGHLUik//E4Q=;
 b=DVmma2ghf0EWkhqeApwGvXZR1uhJeLozlil7vTK+JcqOFFye6T3klz/n2SSy16LrWI
 w0AFDf4ZtjKifkcRt7ZQhnZZeRh4Dle3IONmmIW77q6/aLG/7/fR8ieE+oHHV/dDCbCG
 RAPQfFRnZlyJcFKj/jvRbLiFU1B1+qcFGb8AcZkl7U3ZBq8ByI5ZN3A82Blk7PM3crq0
 2ouowjvnlCc5cYlGy1WOB6480eX7JFQN+6MDtk4PgXswT4kuG93W/4Hi/NfQ4PqWzb1C
 pKbWQ+9NEuNvL/YDGPrUsImEgGO8bns77f/M+WJzqiCrLbsgmIXo2A9/zbv9+PZrd2Zk
 MiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=LaEimOJ+lgAKHH6s6K+Wo5MzjV2hXKpsGHLUik//E4Q=;
 b=xp2p3ats84+uI4KW723lq3qj3bcYhZEtXszp6f334M3JyV95yqXiYyWPokjSSFz8o/
 hi5P4zG3WnW0kbOLSilYHOxMGSfBW+eI1v0ZyU+F/gwm7xD2CpHmwWnyORGK0xw5Cval
 TKYdum5iyG0MeKwEECGQnTtoECXBrsz7BfJ1Htv6TTbgGbi0Zna1jWleUlnQ4X1E1OiM
 1I0kARXP3KTTYwnbi2a64qH+Pz8eGddZb+rYXFgjeBw/K7PvJ9lnFormVzwv+8b8lbD1
 cTWkSfuEYRoclLFYlZg+y+h1pOStueb8Pvjp2+I6VwMXg/6yIRKgYK40ZraWiDu8M9SF
 0sdQ==
X-Gm-Message-State: ACrzQf3JHVKZCMgLL/hJ2wztQzdW7CeMH6r6A+SbOe4OZcfCUCTKTshT
 vvmOdidWgNO4uyWt3WzyBFQMp5zyVpI=
X-Google-Smtp-Source: AMsMyM4hJLCLg+xey5xdCI6B4b/1qshoeMfP320v4CKZMWYaKnb66om+iXgEnhx9zz6pp9LZ6MPbqg==
X-Received: by 2002:a17:907:3f8b:b0:782:3668:3d26 with SMTP id
 hr11-20020a1709073f8b00b0078236683d26mr3652100ejc.85.1664474513416; 
 Thu, 29 Sep 2022 11:01:53 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b0078194737761sm4255257ejh.124.2022.09.29.11.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 11:01:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: steven.price@arm.com, andrey.grodzovsky@amd.com,
 Arunpravin.PaneerSelvam@amd.com, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/scheduler: fix fence ref counting
Date: Thu, 29 Sep 2022 20:01:50 +0200
Message-Id: <20220929180151.139751-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We leaked dependency fences when processes were beeing killed.

Additional to that grab a reference to the last scheduled fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6b25b2f4f5a3..7ef1a086a6fb 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -207,6 +207,7 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
 
+	dma_fence_put(f);
 	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
 	schedule_work(&job->work);
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

