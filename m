Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03704BFB854
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345A610E74D;
	Wed, 22 Oct 2025 11:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Eo7pnWJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2472F10E74E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:03:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-474975af41dso14229815e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761130978; x=1761735778; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w9oIpyKZKP65JjkSPCQNgE2Eec7phDpEBv4WlPPRGpA=;
 b=Eo7pnWJI6w9V7dNlBAG0qVONBUH5nWJ9jiKvFsh5qJ2zTA/1HHOBndSDeVv/SjqfPO
 4fqybjOdcRKtHuLduDUbpWzrBye1s5lzdrJZkUnv/8YYImjnkRtSIZCaS/smBCVivXAy
 c5+JCmPB6bzaUFws/C8jKRSA+IgXb+4uZ2NF0Aajd0VjRsH7C1scI/jyP+ssIrt8FZ6q
 LGzmDB9lkYRMKhEu4bQqYB0iP3dD5kAy82tVmZRuOUbCd/FUZ8am0Qv/dwvOdWwbP3Js
 u6Wegc5T5RaF+1fGn47AASniUWRNLMnutgcUWq4Vs0pdTCuTtiCChRrXIoX7BbKt+Rf2
 K3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761130978; x=1761735778;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w9oIpyKZKP65JjkSPCQNgE2Eec7phDpEBv4WlPPRGpA=;
 b=k8Q4pTSSAWcPRD+WpgLcpzRU6xo+puT5y6iVkU459yGMOO/G8zQ+Xa72Ji9BBDdlsQ
 uIF9rdb/GY4abo3dpjtWJhD5hCH+eNhaimZLjvzZHl+1qJcxWejrBivSOVYtzPCPv1iX
 iihTwkMH7z8Aa46zo/ou3sHm50XHAIeyBZQ+c3EAhYaBqsYmu700JNaws3KTxCKu1MM8
 rOClGSNzYw3zu9REINrL6nbhUQJYcnJpWRC8QTRaUCEpm3LHzqPiyEfE78hpzqKXUrL2
 XcyvhG3aHqb9Oqt58RKjnY404RdSlDskvQQj1gS/I8XUooe7JRklLKKZQmLXDsDlFz6o
 1sxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtPOvRCS7iY/0tQ4tAjHIys7+rZJBS3FlTAdnyHFypmA/kSw4X18PhUCR8gJG9/z+tRhqgMukLgWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJYFWjh2LVz4x/ZQ4R4oNy8nlieBWMEXd5rm4ujZPITiHIxdis
 a5AvXu3W5wcSyIht0gNcBwJMjO/XF8PgcMSVHdDGZ5FfRQMOKvBlnjMsMPSQdsCheEzsUNCwUpF
 5rRzx
X-Gm-Gg: ASbGnctcAw+fQS1IJW2aoqagiD8vHHpEH1illmOJes1P4KmpDK50bfgFJ84iB9ybdi+
 1prbvEl50Alvu0scVXJZQHQQhxrOZzIGK6M0Eqe+EfVFJGC2sAdrOenxrhCIaSIrvnkHy1JeWTV
 ymMFC7JjJRBjTjiuuS9FPufwGIAGF+A8vHkrHtXCjZ/yKj12Eo1ZWVXhcI2Rxuo3drOYChRQXKo
 RGLBVpv7Qzx/HigAxvi1uxzBljR+d3zgxP39iSPz94xfPTC3inBbXVxTter38NRlBoxtlCH31jJ
 vZaSjXgnFNW2WhnqnKC7x4NQFSTe5KbmKhecL8sbcb2Kt8UhAfn2MB3Gj8k1/meBbureI48Vkxf
 q02kArXEuwImZvcqiMIPE72WOmdBk3SBe7CUA1GSKXl3Vw6/kFG7zg8mh5JoZ8wrlNQ1vex+FQD
 2MeA4nyWXkxbuvQ0BK
X-Google-Smtp-Source: AGHT+IHuoJkLRfik10AD7NBPZIudPe/zz0dSg5CN+bjMkIVUA3hu11mzQRZgc9RP/6950DlYAOSGLQ==
X-Received: by 2002:a05:600c:5298:b0:46e:432f:32ab with SMTP id
 5b1f17b1804b1-4711791d1e3mr152626135e9.33.1761130978504; 
 Wed, 22 Oct 2025 04:02:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47494ae5510sm35646435e9.3.2025.10.22.04.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 04:02:58 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:02:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Liu01 Tong <Tong.Liu01@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: unlock and cleanup on error in
 amdgpu_cs_parser_bos()
Message-ID: <aPi53iS_z4y4uVef@stanley.mountain>
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

If amdgpu_hmm_range_alloc() fails then free the previous iterations and
call mutex_unlock(&p->bo_list->bo_list_mutex) before returning.

Fixes: e095b55155ef ("drm/amdgpu: use user provided hmm_range buffer in amdgpu_ttm_tt_get_user_pages")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ecdfe6cb36cc..dac0b15823f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -892,8 +892,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		struct amdgpu_bo *bo = e->bo;
 
 		e->range = amdgpu_hmm_range_alloc(NULL);
-		if (unlikely(!e->range))
-			return -ENOMEM;
+		if (unlikely(!e->range)) {
+			r = -ENOMEM;
+			goto out_free_user_pages;
+		}
 
 		r = amdgpu_ttm_tt_get_user_pages(bo, e->range);
 		if (r)
-- 
2.51.0

