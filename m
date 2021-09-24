Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB7A4177C5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E1B6EE50;
	Fri, 24 Sep 2021 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF82889231;
 Fri, 24 Sep 2021 15:31:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t7so28541757wrw.13;
 Fri, 24 Sep 2021 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=mmuXhFJ0qEV7A7UrLuynDivz0cZ/r085e6pCA784a2FVamGKuvtee2dOg0nHjMroS6
 UvOnoxzVqqVkOICBgHNknXEw/IrvfRGckdzbkBHVl/OUt87YsWH3vdebSEqmyRjailVa
 xisluGWdaUHNgleuVangMayhSmZsvQRQ0Y0AugyZR7fZVlGYF/hYJYwnv7WksLtZRPeW
 M9hnKztRktOObOPxp3fuur/JzOrEL8xoaHUYmyJMxKmwMTq2BZbRuI91zmIHt8nC7M/Q
 ncaMrUuYf7OxZifqVeoegdRXg2ILxqiwdC9Ar9zMogPUxvecDK1FuBUWunchdryuz3La
 JtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=KrfekLV5GFJGTKrBTyEBtk7yS8L+NX5w0/bBt2zfSyt41DDJiZUrlkV8l+xwQkL87+
 QkdtA3HWXaaZVgr7Yzneeipl6aW8bCi0nh6Q9wm29dvaWQKiu5QCU+EoCn06V2npEa37
 hUsUCHVXF4LteVhyxy9la9GBch/6k0gCzqgvPBSvy58Vjd+hLnEaCQdcBVryubORBuvt
 RLQtwK+Y9ZN0LgVY1b+Be0C5yB0ZesPZ/DMjA6VqK7s8O9AqXFGhvu0sLZExvkI34Ntb
 kBxjZBAQ+jSvLd+UvFDD+/NNv5BXN4ZrJ7DL++JAnWkqmWAl42zfNiYzKy2s1VQ0bOw4
 bXtg==
X-Gm-Message-State: AOAM53221c80tRG2oOJ5fZo5ngZwhJFjwac8iXQ2Skcmw44tHfGfD1an
 wYgyIpG3OoTCVnXGdZRdwFY=
X-Google-Smtp-Source: ABdhPJwijaRgtkvA1rTTTYnmmkrv5+ub1+0ElId0x1Nfo9cuEK8BbS8nqDasRqB7IOjx9Y4kXNMbaA==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr12539577wrw.327.1632497492228; 
 Fri, 24 Sep 2021 08:31:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/27] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
Date: Fri, 24 Sep 2021 17:31:01 +0200
Message-Id: <20210924153113.2159-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifying the code a bit.

v2: use dma_resv_for_each_fence

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 042c16b5d54a..5bc5f775abe1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write)
 {
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_sched_job_add_dependency(job, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
 
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_sched_job_add_dependency(job, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
-			break;
+			return ret;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
-- 
2.25.1

