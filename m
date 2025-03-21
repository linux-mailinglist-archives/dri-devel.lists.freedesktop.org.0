Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD1A6BEED
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 16:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6AF10E175;
	Fri, 21 Mar 2025 15:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Em7qdRRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F380210E167;
 Fri, 21 Mar 2025 15:58:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so15180865e9.1; 
 Fri, 21 Mar 2025 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742572734; x=1743177534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ohjLwz2VtVwW7SgtAsY8+2FRQft/YrmjDOANU4d+HBg=;
 b=Em7qdRRRgBRBGs9A1+SKu1jY8Rc3uAiN+vtmB4QV4msL2v3wuB/B5F4iPyf9IVX5jQ
 8bqYjZVpSQ2s63SNWtBLfDql5aM8bIBsbC2yE/ZXHHZBgQYYv4jpHmm682gWepYlcm92
 KyysPCKStHBqRe6LCefojzZQa0tAMthVvX7F68EdBnbU4HrQRL8xOgQlIeWPslFrDfFz
 fhT1bLkeDT810pYiJRszHz3Y6rz2ABTwUBYtrAz6fHpi5ZCTYzLNBqAQTc39ljv4WE7g
 hQL7H7IDctUwhtaqtMmA1lYGzBclfCDcHan4mK3JBIZ3eBhyKO1SrLaZdr/CyQl1lpiT
 KoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742572734; x=1743177534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohjLwz2VtVwW7SgtAsY8+2FRQft/YrmjDOANU4d+HBg=;
 b=tgLjhBDG1QoKMvz29PAteXPOcUMr54CpE2UQ44x6HQWTB2s9Y6fla+dUI/TjojOqxx
 aMHAtajHMpwA0OEWKVEbT7FIqA6YPjpQEVJeWlbEXHBCRYCdjw/0kVomVTk7N61+5YM2
 1vv96UPWT+gaocw43YGGvZQLZ0xCvWVZHU+2nwkavrxiWs/x7X6vxU8zlPQnobgRse00
 +sgOoUk5ajwmxb0N078CtuOrdN+D0mIxlC476Be//LSCuMZqLTksMA8uq7YckkmJR3or
 NVJ5wxNv0FJcjUGYj08aCZ5uBsck9a1yUgTBrmSbKqEGPMB1erIn+4uWuy/1C1u0prpB
 Hw6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsCPudTd7JJzwhjAvuqS3ADYB6Z1M1i/1Sms/8sMMKpCQysZrDMdu/idhkhL114q0iql3nu5l/MCeh@lists.freedesktop.org,
 AJvYcCXrafLNnQVwFftnNplmAB+WOVXvOCCtDsmhNlQrGw10NqtBupCLpt8t+oTLQCqYsTwMCFwm+3Lu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyS6HzVkyqdTvXm5wNnQpcTi5l2PNthCcSAZrVYgFjy7nwE+dF
 9SZK/b94+QtM5Boru5CPD9+YNcTXzqv7ltWV4OGNgZPE8uHzX8HB
X-Gm-Gg: ASbGncuL58YOWXuX7LzXZLcE17IveQO6PhEGKKxMt8qyEFCxnRZA3aDVIzGQQm7dkyt
 2TrLT+03qYi+tF8v3W6xJK6nzKeVstz71qGKJiXFF2FYpRt3iRVI7aTbCsPSAczaVbdI+WbSl7z
 lzRwx1YtB48LBLJ6xPCcKVr8RGh7k2DGRC1K0oXaOGh/QL1RzXASapia5tr/yMqpfoerIOLZh0U
 jPzuCxCR4+HT+EwhIV4CMF0eySmE6DEF9s7hMCloK+1UcySrMmyzrP9FQt518kRztAXUS9GuwF3
 338bR1pyIAfdZqzKc6Fnwe+DbVoIci6jQBFjolu7lXC4Uomdb6EB/Q0RAQ==
X-Google-Smtp-Source: AGHT+IFJCkDaj4L2xb4v2xWoxrMllnjhC7bgMZO7C3zsf/IienkojuXXZ0t2nCUEoxgAHYw647yktA==
X-Received: by 2002:a05:600c:3c9b:b0:43c:fffc:786c with SMTP id
 5b1f17b1804b1-43d50a319a3mr35862285e9.19.1742572734203; 
 Fri, 21 Mar 2025 08:58:54 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1568:fb00:3bfa:434a:5c33:8520])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d3bb2b2ffsm84053855e9.1.2025.03.21.08.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 08:58:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tvrtko.ursulin@igalia.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: fix gang submission error handling
Date: Fri, 21 Mar 2025 16:58:52 +0100
Message-Id: <20250321155852.15162-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321155852.15162-1-christian.koenig@amd.com>
References: <20250321155852.15162-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 57 +++++++++++++++-----------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 5cc5f59e3018..25e7f7d356d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1285,36 +1285,21 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
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
+						    p->gang_size - 1);
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
@@ -1329,6 +1314,30 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
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
+		/*
+		 * We can't abort here with an error any more, but we should
+		 * also never run into an error since the slots for the
+		 * dependency fences are preallocated.
+		 */
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

