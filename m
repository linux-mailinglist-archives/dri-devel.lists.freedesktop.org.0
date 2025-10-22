Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52004BFB85D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C87B10E74E;
	Wed, 22 Oct 2025 11:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t7F0onkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC3E10E751
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:03:29 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so8680031f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761131008; x=1761735808; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NXsoFSKSD+Jxnxd3GCdpg7hzwIK45uE+7Oq4mebbZTI=;
 b=t7F0onkJcM00pWfyJdh1a8Ijxm6qwYd+uQJBqCv6rlQPOhrWZ3ngNGEQDWH2GVeiRj
 3htd7yzrLpD5WbgzLIjQq9jISsjxmyP4mCq7V6XvYm2eBP+dSVDpg6/pQcHeyxgSgFD9
 xEEr5bLdg8xwFwb2/3B7V8tvzISsrS2KNfb6GHQ+/FUNIV9vQAKKt/GnY+gsSdlLAAfo
 YTsdOYq/zngalwhEt6Zi5hKtXp9u6hC37ZeYuxrJFkl2y3M/WpRPeTyI4iR48rvIFeY6
 I32mgo4JDFqIKerVDZgM3z1I3I8rXqJL1Um6Rky3tmwr/J3izr1QV+b7xjziAQAUsWYb
 M1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761131008; x=1761735808;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NXsoFSKSD+Jxnxd3GCdpg7hzwIK45uE+7Oq4mebbZTI=;
 b=r86a5io9vlnFVmFx61U9eW+4y8zqpkVekRmwPbMrXo1aHOxulDV8GJfE1Ophg04Wbp
 6l3RYDH7mIBWlmmgprKgoibGPT7wrG43+dGxQgFVDtiCtxU7npAZ5fGD65L3WVa09R6F
 tii+kmSP6OZm06R5vPkoP0jm/jk0LS2Ye1FvVwMw6bipyvA/6AvwvkrbEz9Yvm2jd9pR
 fr8EyLoBNqNqfURQFskUuE1JI1h+2WbgeLEOCaYJsGsSGt+r7VqmoMqNKVD63UM6wMfc
 5n5je0FPlUh+NCUoHzI+FkOTuldcM/ppSyWOb55wjGjMatT12W+K+NNUCjZKWH67GugV
 stUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFT3DckftbWGB8h8989Aum2iV21/5NtTI9PGUsd2tfMMyTx77arRTLZ7QUEEvaXzrOLqtVNF9KlQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzrs7n0d4SdsikBgcdcoFEZ+BeWLJOnI7WyrskNzhzxT4Ua33h3
 4mhwMoQ08q3Y1WWQj3CTx8z5kETt4QNAZMqXcXLh5ygCYK3i/tM62C4iwYF04utz3R8JoCbkRsJ
 SWWrG
X-Gm-Gg: ASbGncun8cdR8A/teC6jj2mFxq6Tqtd4xIre5kg9nS1vpdijcNOzz1ozfzyIIQFTAX9
 7M44vTecmLwex/YMSiKP51PtlA5dFAuIqLc+2AiOyPolgaYHxuFtGLndGXAXJOGSzTm5RqfUae/
 3BS05yybyiOIaIne00g2+e1uJjcOTGLTw+d9DLhDacWQinNqKE8Z3fq8GkFhs/7lLYo98X2EQMZ
 Bre+cCJcetgoJrOtS0Fsfm1Ac+UnZ/l6eLI7RVQtOuHocese1elPiDZXTpd9+bcv64tzSKbURzk
 DIrWAD8Biz6gbaXAIfPPhzfRGV0RoA5Di3/nz482BpLYH0igKwBR3w9LDTr7amTZ31ZNJ4teq80
 2Ko/k76MRZT8NZZkRK7ZUTG02GTIf6RdcHzfCkxQ+xwONAi+ZCeCncZ2eQE9stn6NkVGXwnM4Jl
 RPcZKXpjOeoB20teT3
X-Google-Smtp-Source: AGHT+IGqGsmmm51ejlY0k7sOzKGZrFx3JPVXLYQMM7eHv3uJuXOnG04Xu33Xnd/PMxPWMzgUajg6yQ==
X-Received: by 2002:a05:6000:470a:b0:427:491:e77d with SMTP id
 ffacd0b85a97d-42704da9e16mr13267011f8f.36.1761131007920; 
 Wed, 22 Oct 2025 04:03:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-427ea5b3c65sm24546043f8f.15.2025.10.22.04.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 04:03:27 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:03:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prike Liang <Prike.Liang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu/userqueue: Fix use after free in
 amdgpu_userq_buffer_vas_list_cleanup()
Message-ID: <aPi5_CILMKn3ZrVd@stanley.mountain>
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

The amdgpu_userq_buffer_va_list_del() function frees "va_cursor" but it
is dereferenced on the next line when we print the debug message.  Print
the debug message first and then free it.

Fixes: 2a28f9665dca ("drm/amdgpu: track the userq bo va for its obj management")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 9d4751a39c20..2200e0bbf040 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -159,9 +159,9 @@ static int amdgpu_userq_buffer_vas_list_cleanup(struct amdgpu_device *adev,
 			r = -EINVAL;
 			goto err;
 		}
-		amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
 		dev_dbg(adev->dev, "delete the userq:%p va:%llx\n",
 			queue, va_cursor->gpu_addr);
+		amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
 	}
 err:
 	amdgpu_bo_unreserve(queue->vm->root.bo);
-- 
2.51.0

