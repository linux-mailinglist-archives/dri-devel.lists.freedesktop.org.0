Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B77AC2330
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3632310E2E1;
	Fri, 23 May 2025 12:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eU7pCjnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C40A10E2D3;
 Fri, 23 May 2025 12:56:50 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d35dso248077a12.0; 
 Fri, 23 May 2025 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748005009; x=1748609809; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jvE9U9E6MeXW5TTRoVzsCHYAU8ZDHBiQxkta48vTfNM=;
 b=eU7pCjnDRuDNGKcALupCGQuy8iEpIsV5SQAoqxgrdA23SMtvoabniLmHb1qe3jkp74
 QHoH6A8qvVijixMRvp+vpuGanLZvbXRknoV2UppshNe2eCWF0zdJMmO9rU+GKzxPsFd3
 MgADVz/Sy7NhuPIi1krHkzuYFFhfdv7fCr2uTmuzg9kIzPaZNGN/EzYlu0wZgDnVALEf
 pZ2HOWHyBNT6FH08AZFaFyCnlp5yas6CSF5Ji3jHln/0l47fk6G1kRgHY0eAHox4FEoV
 djweFGl0o8U1/eLprEBw1E27wkBrW+DlNzn4qMTFSKX1rDr/UUDzkn43hGMwF+6SkfYe
 rECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748005009; x=1748609809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvE9U9E6MeXW5TTRoVzsCHYAU8ZDHBiQxkta48vTfNM=;
 b=lOKMSbWa7/c0OdBSI6cJN5PulqXUoHxVU5a9qhMx+5Tf5c1M44tuUychRtuYBHXvUz
 18d7f0zJ3elHHDfDgTdwEaqsYESACTeyz1U+YNTMzFW+DyMYNJ5uWL1bDuPHVA1AmWlO
 lfuwCDDW6L3S8KlzOOWKHOz95Enj0dVWK+PwwD2Vr8H28dLod4vbIp0XTyqquQFsnS1K
 fM7BESxKVvf7GR8YR0KFHPmgpI7zzEjVKIPtyde95hB9weNgD6lbbKjp4mnLhEvDg8jh
 OSc0Ymrs1WACdg8sF6S6LrXVk0Xvmyoh0FtX6JjzdDnLvFwdJbXlw6E4cbbm9llo0VQX
 cC2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG70GyQJKAQgLoT0NLAzZ2iOQKU30P5Nk8RGZILmIWfdckv30DQCcS44k7eEpTbUST9VSYJADqUXdv@lists.freedesktop.org,
 AJvYcCW8izRGjMT6D3nP4tELC0KZLAC+CQAa+HewpUXnLZQeSvVMSP3gQ2k3yQP3iwmLg/VR07peSFtB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJG5LQeQs9Wk2bf+AcHh5VUMtMcVijlcrsiE5rIxAb3FVhVSwp
 4KDOTsaZh+0C2S2U0WSPW+8D5cYGbd8cxJIXR27TQyxsu4Q3p9t3JkXf
X-Gm-Gg: ASbGnctbKCmYlLRrjiJ2vdpx2dt+6XB/e0yNgcTmtQd5O3mFuODOfDYhW1x311mPMbL
 7pOZB6X3KnDP1J0wgeInBWYVTz5Fqv9vqcSJQjLO+ULYj2PnSLZLz9mRZiuyikgX1pzCTTLyCoR
 G0Fv+m/2WCGYV8z455RGxBdLIbpm7VKsH89pLKkXiw+uayr+CHmVx4G8BHjiwQ/2YDjiQYSWTD7
 eAm8hFv948Anm7ll2ek7oNPdeenwvSCJ0guFy4r1WYdvgGEwYjkoYR1jUdHA9epte62Gs1yM4XG
 DOaGal4ddXM6Ubbof2QYNFGVDHvtdgqGakQKnkDicUDg6qD3KycIbv6JfWXEjXoFX548rPNhLs4
 =
X-Google-Smtp-Source: AGHT+IGsHahkMZ5NB1HJnzQG/lN0z7IpFZywXKnIfh4AXp2hUqoJEghJ/J5tZzqTAsFIlhD+kD1yOQ==
X-Received: by 2002:a05:6402:5193:b0:5ff:ef0e:c6b6 with SMTP id
 4fb4d7f45d1cf-6028d7428b2mr2756348a12.9.1748005008619; 
 Fri, 23 May 2025 05:56:48 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:9c00:c200:979c:6701:1954])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6020e441c84sm5863302a12.38.2025.05.23.05.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 05:56:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: fix gang submission error handling
Date: Fri, 23 May 2025 14:56:43 +0200
Message-Id: <20250523125643.7540-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523125643.7540-1-christian.koenig@amd.com>
References: <20250523125643.7540-1-christian.koenig@amd.com>
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

For the unlikely case that we ran into an ENOMEM while fixing up the gang
submission dependencies we can't clean up any more since the gang
members are already armed.

Fix this by using pre-allocated dependency slots and re-ordering the
code, also fix a double unref since the fence reference is also dropped
on error.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 53 ++++++++++++++------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 82df06a72ee0..4728de07315b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1289,36 +1289,21 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	uint64_t seq;
 	int r;
 
-	for (i = 0; i < p->gang_size; ++i)
-		drm_sched_job_arm(&p->jobs[i]->base);
-
-	for (i = 0; i < p->gang_size; ++i) {
-		struct dma_fence *fence;
-
-		if (p->jobs[i] == leader)
-			continue;
-
-		fence = &p->jobs[i]->base.s_fence->scheduled;
-		dma_fence_get(fence);
-		r = drm_sched_job_add_dependency(&leader->base, fence);
-		if (r) {
-			dma_fence_put(fence);
-			return r;
-		}
-	}
-
-	if (p->gang_size > 1) {
-		for (i = 0; i < p->gang_size; ++i)
-			amdgpu_job_set_gang_leader(p->jobs[i], leader);
-	}
+	/* Preallocate the memory for the gang dependencies */
+	r = drm_sched_job_prealloc_dependency_slots(&leader->base,
+						    p->gang_size -1);
+	if (r)
+		return r;
 
-	/* No memory allocation is allowed while holding the notifier lock.
+	/*
+	 * No memory allocation is allowed while holding the notifier lock.
 	 * The lock is held until amdgpu_cs_submit is finished and fence is
 	 * added to BOs.
 	 */
 	mutex_lock(&p->adev->notifier_lock);
 
-	/* If userptr are invalidated after amdgpu_cs_parser_bos(), return
+	/*
+	 * If userptr are invalidated after amdgpu_cs_parser_bos(), return
 	 * -EAGAIN, drmIoctl in libdrm will restart the amdgpu_cs_ioctl.
 	 */
 	r = 0;
@@ -1333,6 +1318,26 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		return r;
 	}
 
+	for (i = 0; i < p->gang_size; ++i)
+		drm_sched_job_arm(&p->jobs[i]->base);
+
+	for (i = 0; i < p->gang_size; ++i) {
+		struct dma_fence *fence;
+
+		if (p->jobs[i] == leader)
+			continue;
+
+		fence = dma_fence_get(&p->jobs[i]->base.s_fence->scheduled);
+		r = drm_sched_job_add_dependency(&leader->base, fence);
+		/* We have preallocated a slot, so this should never fail */
+		WARN_ON(r);
+	}
+
+	if (p->gang_size > 1) {
+		for (i = 0; i < p->gang_size; ++i)
+			amdgpu_job_set_gang_leader(p->jobs[i], leader);
+	}
+
 	p->fence = dma_fence_get(&leader->base.s_fence->finished);
 	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
 
-- 
2.34.1

