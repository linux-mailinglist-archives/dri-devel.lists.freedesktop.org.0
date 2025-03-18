Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18DDA67365
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96C989CC4;
	Tue, 18 Mar 2025 12:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S/48nwbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE4510E468;
 Tue, 18 Mar 2025 12:03:20 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5e60cfef9cfso7761323a12.2; 
 Tue, 18 Mar 2025 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742299399; x=1742904199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hc6Iq+A3Wm/qdjNtJQPgjP4bsi9ps5tYeIoCkR4cUfI=;
 b=S/48nwbOJs+2iQVj7zDzTs6Xew2hnUDvTJVSwV2q7tXOZavaTGXcQ4mq8rJg+Kzec6
 R/TFbIOUulqTCebF0cNEujptLF8+u/w8jGuYidg9J01hM0FSlpf9L94WYciBhJDmveuo
 bKMHk7J9bhnbCooziCNfViH0xZ7NIf5XLS2SdYGEBbd5QlfE8tGz2liOZVtC4JbMkkdh
 noAlOrRNT4emAqYR/k1Y6J+r1R2jPXcdPjSMgIg6utIIqREFBoccajRGeACop52LqYTW
 wpvjWkBSKg0yA/ruauPBqIBHF2w7Q69J6FXlXSBXtAQDEMVrLhhDzqrXt//vuZ+W3Wpi
 mO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742299399; x=1742904199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hc6Iq+A3Wm/qdjNtJQPgjP4bsi9ps5tYeIoCkR4cUfI=;
 b=UpvSggsLH+KQ5BMe9w9lixiPYWXSZ9b9pc8n55jjaepu5I7GSxmDnJMBr5sxRglMIT
 D8gv11RWYPc+31fOSx8d0oicYVSw5Z5o+NG+GXEJH2ePWGJ63O+jNv+NjA2tUOIwwrdM
 vAmqk5T/iOupPqCROmKs55exsnaonRlCyYu0yPTxwFNdRv1K860zKLu5y3YnoRO+8hxk
 G00QJAp7hATHos0WTDmM9sA6MjjRY8wPRfusos7gk7y8H8migtU5yxyOe2bRzZ3UCsBq
 X57uVHpH4TvM1BeXRTIcM4TSKGO84sdEBVyqLl1w8bUdblbtB0UU30g+rw1OrK0FPskW
 fHrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBXRG6wZu6w+oSH0CfjaTQ/7BblBm365QwvzZEAM1OcLfOp6Eup1Gr7QQgffYKKTZRWn54AaVGjPf1@lists.freedesktop.org,
 AJvYcCXLiPfLPDUDmFmJZgJmMlvCRIREuaoyAYngKsaoC0+v2UAokb1wsgkeFMt89p9bhcSwYlAFn21P@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4C8Pjo++6y8u/Pi1dvpLL08OpBrqqhqVcitlrjJ8Ps63N+Wjn
 N9k8ptOjMeWI5Ho0JDpCy5vMibQUi29TWmpu0rFSJWfzLbaxsuc+JaPlLdgw
X-Gm-Gg: ASbGncvURh+xykBArJvtRETMwlLK2jGRSYd3mCho5bES6JWWxf+FJMV7Szv0NJW7UVd
 CMHJkVCcIzKlvXdO+J1+V9+/DpSBmQo2aDxnxZPir2dXjQrJ0qDQC5nsv2V/0mxl6A8/cVmostu
 geSqL51l9+65MCWlmLVcbfN2EvQfSuxHsM/FaxIpQ3tRyIn5QtB1HrlYcWEJmF5VyWTK+L2/Gob
 3WUUIRLxf21walS4ov18Kr7AMvmRki6z4Umrdf+qEdIwsrq4gcBQ2O2goFWujxKNdSyEFsU4Nkl
 RzTTodQDodxisDwr+Irn9vKO2T3Xv5vGYyBHTXmA5BXPo9lD4ed+IY2WjeHIlwk/VAAJ
X-Google-Smtp-Source: AGHT+IEIyWYMTQovp2TdFZHhWtw0nYoLsZEJbf0BmwzLkSl/Eao1ypdRZ1TjvXYMbjCIc6to1fdLhw==
X-Received: by 2002:a05:6402:51ca:b0:5e5:4807:5441 with SMTP id
 4fb4d7f45d1cf-5eb1df7efe2mr3060887a12.30.1742299398257; 
 Tue, 18 Mar 2025 05:03:18 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1527:7100:c898:4de8:4301:2cfa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816afe1f6sm7433380a12.77.2025.03.18.05.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:03:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tvrtko.ursulin@igalia.com,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: fix gang submission error handling
Date: Tue, 18 Mar 2025 13:03:13 +0100
Message-Id: <20250318120313.19099-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318120313.19099-1-christian.koenig@amd.com>
References: <20250318120313.19099-1-christian.koenig@amd.com>
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
code.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 58 +++++++++++++++-----------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 5cc5f59e3018..770005c8e41f 100644
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
@@ -1329,6 +1314,31 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
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
+		fence = &p->jobs[i]->base.s_fence->scheduled;
+		dma_fence_get(fence);
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

