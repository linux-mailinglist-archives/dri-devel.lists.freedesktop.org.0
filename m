Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4D5FEAC7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B86310E176;
	Fri, 14 Oct 2022 08:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5EA10E0C7;
 Fri, 14 Oct 2022 08:46:47 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id u21so5893282edi.9;
 Fri, 14 Oct 2022 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPK7B0HJnkrFm2ZUJxiGK/Ez12WaCKi3mCFTZfUGB6U=;
 b=acbE5Tr8YKJhXQMvs5fwojWBWl4WuVxaJ1TlI4j4wbYGwCaW0yndtE9oOednWxRrPb
 nnehWCb4cLLxxzQ0rLvdT75DAOGFE3UbLb+ljVPLngceHogo8+etfSbc0xOWtZ0aH4ap
 fIxAcd1zVnXtA9FoYvrKsCN/i7aI3wxt0LQ9mivCeEfjvw/JL4DCr8ru1xsLdy8p6peK
 /SGZ3WxyhrM69ZxnhKXecFaUwrxC0QAfwKmPX9k/mIGPfWZrODQKal6NFd+Kt9jkXrHp
 ryY0lTrtQNN9u0qF3sYl9fCtWvdooc7qNhEJsovpWO2NcEYLfdGG0mpAywUgfxtDOsQn
 qoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vPK7B0HJnkrFm2ZUJxiGK/Ez12WaCKi3mCFTZfUGB6U=;
 b=hWk+lDzfe/53UhCnRl3o4W+XL8bOMc/Z7pA665MluFM4z3Y2RG4H/IX6W0DKKMko7F
 NQQ6zOd/28JynQWPIg8ER3hSAPlV8WyxV4ueVMa4Is8TsK2UCgDjPleJ28PFajZuphAI
 S1S0eKoZoOKYjtTQfHOiY/bSvE2gVq4Yc4anEVkuGlTugzEoJXyRAg0iP1tkj3oSWqHk
 Efx4mQx9kVw0E/qc6cX9NvEsOIsajTDc+qrePwIKr9XWcMWDRJLGM5MbGsfKIN6P3Fzf
 EP5KaxPzJ3bSVf94VmSPjbgfOB+KjgQWFOvMYNhf0HyBYhT0I1mwrWFeCkjmJlbGi2rL
 GTQA==
X-Gm-Message-State: ACrzQf1DVQOWmLRJhMKxiGq+QCeJHoGAqTrp7qedzeMjNVmgkqT8GxPp
 7J5QiT2smbgiQvNfLJ/o34VG4H0bHl4=
X-Google-Smtp-Source: AMsMyM7hJzVznLWE1il0elbpVyNJ2kTboK0fArXRUBXEfcF5m3P+VYWAdcO4WDbwn0EH1BDY9A0RVA==
X-Received: by 2002:a05:6402:5193:b0:45c:e2c6:6f0e with SMTP id
 q19-20020a056402519300b0045ce2c66f0emr3385371edd.29.1665737206031; 
 Fri, 14 Oct 2022 01:46:46 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/13] drm/scheduler: fix fence ref counting
Date: Fri, 14 Oct 2022 10:46:29 +0200
Message-Id: <20221014084641.128280-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
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
index 43d337d8b153..243ff384cde8 100644
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

