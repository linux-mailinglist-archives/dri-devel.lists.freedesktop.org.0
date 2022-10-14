Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4375FEA43
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36E910EA96;
	Fri, 14 Oct 2022 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C13E10EA96;
 Fri, 14 Oct 2022 08:15:57 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a13so5889968edj.0;
 Fri, 14 Oct 2022 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tiq+iZ8WHyngN/AauVz6Bi2y5WOuCWMci27ME2OuFVA=;
 b=OtYtw4lO/czie0rpjgh2BgsFgqTFYYwqfo0FTaehi609mTI3Rnt0+LOFYG2VtTqw1+
 TDzmq4HfG79ceq1+iNYGzsoP/GLcLUzICZHPsJq7wJA7TFEE8u2NhvSBqz7DtkXDk8vn
 MHOYU1rZgTUcibC5qC6dHXmEVIJrXWlaiCBMs2ikv9IC0SSd+t85MvElW6rwVtCybnuc
 sOQIqd9SxZA6ibWmtNjUYeYtEdtj/I0UNnkD2Amqbr2Max1jSnkFMhb2hI/tKpTKUTkU
 uhFB2Dnwv4nkb4iQWR5/TZTwkE44yHs4TXqCQNdEqQj1q6z3eh5ugwdSReBbSl/xoLQO
 AWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tiq+iZ8WHyngN/AauVz6Bi2y5WOuCWMci27ME2OuFVA=;
 b=vSENLGuU5T8AqotPBQJu2k9AixOkLv6jT5T3WeqWXGC4S1f+H7lxyfKgzc0y1A5KZx
 UdbJZC+nA8fLBqYGIHDiZzh/Yz+NwGcskMMCdmljVJGCzZycuGMmjRP8xHs+w6EFEy1m
 sj6NY3Aj0PwwBr1SMsWSNWYObypNie8yl/0JMpLuatPpgTun6E52L9mAI9VAFuoc9EL5
 MOetS3Mn6IEarHeyHG/j+AfplR5lTg6KWC9WQ3PWz4goD/Mz/BRLoYUU08XfWncgU7z9
 qlycQAIzkMzZb8JrwE33o+crQ18a6b+5q0yXXL62akZ+3WxYZ+HV3yuLJscm2Lb2O27K
 QUOQ==
X-Gm-Message-State: ACrzQf1PkgCF/FE9tBsX67eu5368UR33EmiYLnKkleYxdtJFmoFdk78F
 urUBSioha8/d+unJuNwPG8c=
X-Google-Smtp-Source: AMsMyM5kEC1M52w1Fj9TW33rmzmDwveDjjNBlmEPlubyz6eZ4p25Fi5F4stmsUPB7IcSdgvEBYeH8w==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr3245709edz.301.1665735355961; 
 Fri, 14 Oct 2022 01:15:55 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 lb17-20020a170907785100b0078d886c871bsm1146188ejc.70.2022.10.14.01.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:15:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag
Date: Fri, 14 Oct 2022 10:15:52 +0200
Message-Id: <20221014081553.114899-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setting this flag on a scheduler fence prevents pipelining of jobs
depending on this fence. In other words we always insert a full CPU
round trip before dependen jobs are pushed to the pipeline.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org # 5.19+
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
 include/drm/gpu_scheduler.h              | 9 +++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 191c56064f19..43d337d8b153 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -385,7 +385,8 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 	}
 
 	s_fence = to_drm_sched_fence(fence);
-	if (s_fence && s_fence->sched == sched) {
+	if (s_fence && s_fence->sched == sched &&
+	    !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
 
 		/*
 		 * Fence is from the same scheduler, only need to wait for
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 0fca8f38bee4..f01d14b231ed 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -32,6 +32,15 @@
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
+/**
+ * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
+ *
+ * Setting this flag on a scheduler fence prevents pipelining of jobs depending
+ * on this fence. In other words we always insert a full CPU round trip before
+ * dependen jobs are pushed to the hw queue.
+ */
+#define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
+
 struct drm_gem_object;
 
 struct drm_gpu_scheduler;
-- 
2.25.1

