Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266505EF65D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF8510EA64;
	Thu, 29 Sep 2022 13:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDB110E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id a26so2761011ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uDJcc1TYjnBNJAdCm3pslpfCFzDUbOBCm/4U5tbxtRU=;
 b=ZEwmbqyvHGd90do7V6Hg18cGiupCh12CaW+hndQciIOq0NnVnBePYd8htAhAhjUC2s
 TTrgIDtDVX04wgMZvkFIUaBtmn2IA3rK6gW5qfQd+YXqw2rbLuYSOJ3tCCBnPKoJpMB5
 YQl8ndUtwZccyWHiGKjMaYzjWerfij3WI6c8bID7kYCLDDRZq7gtgLyhJIEPtG7ljgF1
 DBpwXG267hjbSMb2/pDxkyfIAWeX9KKtMExZrFXxNzMJtDfjhmZBd1cMWv1y2XdHrSC1
 tPhMUWx0CLXpi+Cf4TjvMIORhykclJ1U8fjrOZ9HS30u+qd9gubPDWG8p4S8yMpW0A3J
 DpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uDJcc1TYjnBNJAdCm3pslpfCFzDUbOBCm/4U5tbxtRU=;
 b=n3H8DnSLGd7ATG2lhD/bRICw6aBsGXoKgonP7T9+/yElWkcTCzsMC3ws4GTiU/Pqja
 Z2QihYuzmt4gUmDAFGPRP9zdIHB3mdz5nDbS6IDwiJZ9YOvPIAX7FTuMz26Zb/H2388M
 y3QQSGXHUDnTdgb6wIhke6YojGcciOf0oRRs1KyrHD5KzZpdTPYwggzHq9ymsV+Kt69R
 H1cln7T+Mw08i8LLq0sgk3SZqVkRv1jtLhHgyyYEkki7r9C+O4vkmXMPnB3oKE+uFLJM
 JnUtKhVA1WSz0MGWlC1qmLvwY8X0v/NzI3aK64Ppvo3dVZuRVzORnNVSpPR8UBDeIZlE
 4Nkw==
X-Gm-Message-State: ACrzQf0VRSMejFRmsu/vH38ek1u4OBr7MYoDYpWqcE1mBgyLyrTV+lvY
 0P+4/3+YV8TTKrOvec6OP3CoDuLK4I4=
X-Google-Smtp-Source: AMsMyM7I2HZNZNXt928kLsz2BPZqVVcvmaQTFo9xZINd2macPvRS7ZwEZggy0fDmtoL3TDcLK8rcxA==
X-Received: by 2002:a17:906:4fcc:b0:782:e248:c8a8 with SMTP id
 i12-20020a1709064fcc00b00782e248c8a8mr2698199ejw.717.1664457708914; 
 Thu, 29 Sep 2022 06:21:48 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/13] drm/scheduler: remove drm_sched_dependency_optimized
Date: Thu, 29 Sep 2022 15:21:34 +0200
Message-Id: <20220929132136.1715-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
References: <20220929132136.1715-1-christian.koenig@amd.com>
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

Not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 --------------------------
 include/drm/gpu_scheduler.h            |  2 --
 2 files changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6e2cd0f906b2..ae4aac6eb26e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -197,32 +197,6 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 	drm_sched_job_done(s_job);
 }
 
-/**
- * drm_sched_dependency_optimized
- *
- * @fence: the dependency fence
- * @entity: the entity which depends on the above fence
- *
- * Returns true if the dependency can be optimized and false otherwise
- */
-bool drm_sched_dependency_optimized(struct dma_fence* fence,
-				    struct drm_sched_entity *entity)
-{
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
-	struct drm_sched_fence *s_fence;
-
-	if (!fence || dma_fence_is_signaled(fence))
-		return false;
-	if (fence->context == entity->fence_context)
-		return true;
-	s_fence = to_drm_sched_fence(fence);
-	if (s_fence && s_fence->sched == sched)
-		return true;
-
-	return false;
-}
-EXPORT_SYMBOL(drm_sched_dependency_optimized);
-
 /**
  * drm_sched_start_timeout - start timeout for reset worker
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3315e5be7791..5f51eef2a835 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -497,8 +497,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
 void drm_sched_reset_karma(struct drm_sched_job *bad);
 void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
-bool drm_sched_dependency_optimized(struct dma_fence* fence,
-				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
 void drm_sched_job_kickout(struct drm_sched_job *s_job);
 
-- 
2.25.1

