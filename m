Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756DAB83E31
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 11:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B4910E11A;
	Thu, 18 Sep 2025 09:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UkEILYcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A21310E11A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 09:46:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45f2fa8a1adso14911085e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758188806; x=1758793606; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IJAzy7TZLPpiK0Xxbzu1n/iJ3JX7fhsQtzUstUQDi6k=;
 b=UkEILYcLJDfYD/wyeyhz9413hMw5eM44VefXoikph9tVlJLNEQuyiqPC+IwKIN7Y9n
 /X7ceRLI8S/fEsX1AuLz2g+XWrOs26xPer06TLqjU93KgkcIC+GSfZ0bEyWGY5J4YqFm
 miANuGe9hqHQgePYK6y5rlN4XQlBvl9/o4Sc4fhR7o9PG2NztPhfmsf05B7yniwfBai7
 guE+AuB1H/NMj7vau0KIEwNG+EvoIbXB4HX3sMwY02bfDKJnVwJkA5jUcanC66PO+8sy
 89VsWZhlO9hgyX+0mJgHCStgvvrOl/1EYxYhXx9zfzMrnfuaaZIrzzy+hWtYYrNaMyj5
 rgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758188806; x=1758793606;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJAzy7TZLPpiK0Xxbzu1n/iJ3JX7fhsQtzUstUQDi6k=;
 b=oY5b3yXuXvtSdqBYhBd7UFfAGPVDbWcZYr5ZN1n/gag0ejGPHyg49F6zeGUNR/5Otk
 X7U4TfL3eL86s9WdKc15vNbpvnSqIsuvwc4jQtG4fh4y9r29kksTHglt9za7Hc/pHSYf
 7lFQ2ZEQsUBf1gPLWkdj+Lh3FUx13EpmtzKvCQ41AVpZ0+MWeOX1iAgIbMb0luhy9ZXE
 L9sbZp3yYWh8lfXFmmEBDoyg9dg7xjI+60j9ymHwh3s7BiL6Q9/QeBa7SS+yDGVGhvTY
 yVlz64C9MH+ZAIxvFdhF+gW7iQnlEAIcudfJyCcP30Kfa/b0xNDSYga/j7gwIwjmLueD
 9x/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvfJmJaMG+2Qop72jSZP54J8VA+Y1iQO8ZP7dWCbSjWaJqDJ1undBbjVo59RvpOUnWjEpVZLuEBIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxr0vK6CelHLZrqiAc4vkgT2O/6+y6xs6SHiBiM7zSAtD4SKv3
 mvB8K597eGGWAXIn/OzwU11tp9FhJoy3eO/WELS/PIzjzvaNL2NhcveqewxjvT4y8Uw=
X-Gm-Gg: ASbGncuHhT7zZUdS/NR/7rZxaWXon+UBFrTmNikqOF8pGtNOOWdX+6zaG+50nS1Y+Uw
 EG7ysdPLmSKGTKxsm/3PeGMNrQeoEJ91xCAfdIMBhgHQSV139ZEA38uu1SYkQ2xUM38NCaA8rrI
 oa2ZuDzQQ7f+PPGXUm+02QNEdTQMM7rN/Qw8+bGLADEbyTwJ31wQWRneuCr6dv6ziP39i/z12qm
 q8MFCZLfFKFZvP+rvJGkuUbWgUgv9Ahh6gvz6aKIeddQH1RQxcMsAKmeeTXAALpbvXWJ7ipA2lk
 DH3FeWycOWS/qzc6XbrRZM4I3ETM4rs1gOuHhP19wMEke1Ok4fdiRYKimgztOCiP2fce6PADJky
 HqvnBiiDhmQlH+MRQJV7YO5IYj6ublMEyeeUTX4KdvaJ86A==
X-Google-Smtp-Source: AGHT+IH1uv0RIxQ38Bm26GanPvGmDL+dRiH2jf2osh70wH0uYOlhbcgFH9gpcU5WdxVF0lInLAkHNQ==
X-Received: by 2002:a05:600c:8905:b0:459:d577:bd24 with SMTP id
 5b1f17b1804b1-464f79bed6cmr20555095e9.7.1758188805990; 
 Thu, 18 Sep 2025 02:46:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46138694957sm84698395e9.4.2025.09.18.02.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 02:46:45 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:46:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prike Liang <Prike.Liang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu/userq: Fix error codes in
 mes_userq_mqd_create()
Message-ID: <aMvVAsrczM9W2S7P@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Return the error code if amdgpu_userq_input_va_validate() fails.  Don't
return success.

Fixes: 9e46b8bb0539 ("drm/amdgpu: validate userq buffer virtual address and size")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index 2db9b2c63693..775b0bd5d6c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -298,8 +298,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
 			goto free_mqd;
 		}
 
-		if (amdgpu_userq_input_va_validate(queue->vm, compute_mqd->eop_va,
-		    max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE)))
+		r = amdgpu_userq_input_va_validate(queue->vm, compute_mqd->eop_va,
+		    max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE));
+		if (r)
 			goto free_mqd;
 
 		userq_props->eop_gpu_addr = compute_mqd->eop_va;
@@ -330,8 +331,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
 		userq_props->tmz_queue =
 			mqd_user->flags & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
 
-		if (amdgpu_userq_input_va_validate(queue->vm, mqd_gfx_v11->shadow_va,
-		    shadow_info.shadow_size))
+		r = amdgpu_userq_input_va_validate(queue->vm, mqd_gfx_v11->shadow_va,
+		    shadow_info.shadow_size);
+		if (r)
 			goto free_mqd;
 
 		kfree(mqd_gfx_v11);
@@ -351,8 +353,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
 			goto free_mqd;
 		}
 
-		if (amdgpu_userq_input_va_validate(queue->vm, mqd_sdma_v11->csa_va,
-		    shadow_info.csa_size))
+		r = amdgpu_userq_input_va_validate(queue->vm, mqd_sdma_v11->csa_va,
+		    shadow_info.csa_size);
+		if (r)
 			goto free_mqd;
 
 		userq_props->csa_addr = mqd_sdma_v11->csa_va;
-- 
2.51.0

