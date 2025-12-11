Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C384ACB5CE0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F8F10E7F0;
	Thu, 11 Dec 2025 12:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IDq+Il4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EDD10E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4779a637712so225175e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455859; x=1766060659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=IDq+Il4npYUuYq5hXKckh/a4ddb6FllFcSGcTSw97WjB1RigZ81Nv/+G83vOGulGTo
 GE2YLYnfha0rlPra0+zlCGU67qmMqMyY+0VwJ9gUN69JMZW0uopM4csEhnPsdd9YXAuZ
 XS+429kYSX3NPhByMyL70XPytN96OXhxYIpac4J8wW6uekqA6gGfAfwdK9PzF1tOptAB
 qtwrG47fM8gUFmPw3iPw9CV/fiLM5Ki8rFa5k6XtFJEfpdQrv74etFndk6zZeNfQQ+b2
 rNasJ0fHY6SyroWsXCz2Md+p5xFFbwKTWFiIwoY9uvQjD81SZwxzcWgjs9mvHr+Cc7QI
 fNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455859; x=1766060659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=ljHUBHXIv6GYf/Rh6q9+ZvlIlhKTubiitknPI3rRd9YnWSDJ4LVsVZ0UJHFdJ9JbD3
 3CoGVvTJnLzTdYpk20cEVCTaYtVZHZFmhz+/SfwxRu3NivSue1+5iZZ1SaxtukvcG/zq
 6sPUEl4FhbtaaMzYzMMXlH/dvctpsbGz6b0AKNZgVooOxUu+SaqjLUblbr9oGAPIr4an
 6qq7VNBB7B7HFmbVOa6QG/FedulxXB4cLeDvjpeuYn+UYpNTeTYLBSUv19Vb+VjzzHW6
 p7oHyk5qmw3HyE6Mqj5YELHD7CVlvCSgppeg9g/Ul3JbYug1fcsCx7oP20sCgrx9qtnk
 tGyw==
X-Gm-Message-State: AOJu0Yz2SsYxLZ4cEYjETgqNlRqxNWF5bPv7w9Y+2TQVFqfTenmeSQT6
 lse2aGw0liJKJCZwgdra6PFF2WN2Xjb4x9G9qaj6UN/8+V8LIGZOAloi
X-Gm-Gg: AY/fxX5tIIpwyMUrfr9qaZUUlW8Xl4n7VKHNf5A3pwmVBp7zYhbzR6zBh+Ro9OA4Ozq
 EPQMBaTnszMME/+LjxlA7Zkxw6YuZ6Lgr/m/M/FUOYEtTvbHzfmHVEDaGor4gXgV4GdCOUqphRg
 jxUXU70EAu8GFzoqWihlkBNH2ISnQ0795YdO0s8dNUYvWid936oOrZtqNRaUtVKqM4YEHbz8Ny6
 atLlixpA88aIiTwBu3t6M9wFN4t89HcV3fbJgEH3vjtv67uRdbf8MLLSBRIOnQ7I4JiH39Q8gYu
 V4n8iqWl5EUVWU9O3B+w26ZXWdAN6KKGtf5XgahMNhD4LQ0QmTcJNJLeZwpTAtL0XKwgJwol7qs
 DzWI7lLeS8xQ+S7R0s+q6R8FFmQlizovmxh0IKw521aMNbEbwrvDMNrpjFS98peQOIcQw4tCZL8
 pHF1gNKDdJMUSzUoMApZ7Vwb+qx4DS7qTE/qE=
X-Google-Smtp-Source: AGHT+IGO+P+I3tkxD1V8l6WQS7ItiN0qcbbKeByVqYkK7OTOlOAIc/kyFtCG2w2B1bp0MUlsgtHjTQ==
X-Received: by 2002:a05:600c:1d0b:b0:475:da1a:53f9 with SMTP id
 5b1f17b1804b1-47a83759f18mr54732855e9.14.1765455858704; 
 Thu, 11 Dec 2025 04:24:18 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:18 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/19] drm/amdgpu: fix KFD eviction fence enable_signaling path
Date: Thu, 11 Dec 2025 13:16:41 +0100
Message-ID: <20251211122407.1709-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

Calling dma_fence_is_signaled() here is illegal!

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 1ef758ac5076..09c919f72b6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
 	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
 
-	if (!fence)
-		return false;
-
-	if (dma_fence_is_signaled(f))
-		return true;
-
 	if (!fence->svm_bo) {
 		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
 			return true;
-- 
2.43.0

