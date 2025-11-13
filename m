Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99820C580D5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919110E834;
	Thu, 13 Nov 2025 14:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SBjR81W0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8524610E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:43 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b73301e6ab5so117987066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045622; x=1763650422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=SBjR81W0Ba0J1OLbBHCBwkHko+hcFBaYL1IoUh6UlvcUBM1+fNl8bIk1BaSU/+hU7s
 ho1uj2lgnRabICPVX8L6LF8+5A5Py4sOdnEFtPWuvuZduiiBA0MkxRej5cLrfhffCM+o
 jRWqbM/eXIF6XJsPdJbvk4gwIKuMd0+w7TojYXO/PYmcI01/eIiCr1N2T7EWvNATHdaH
 wH9AYN0QnqmARozuW8rL4eGkDdayoeFfeGdHf1oXgUVVcLh+VNO9bQ6PsDchO5d57zkL
 YVqkTUfTKNicETeMC7s8YignHt8r3ZsX0lEHc7U+lYopRS2bM2LnZ1XINWdBqrzhRIJj
 JB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045622; x=1763650422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=onBEJrRDJzH+e0z+86V54EJalXfHWs6pSN13V+NG4lezahJSX/VTDQAcINpogrtZDZ
 mIpA5nTi5k5kdN5YNEejr48BhTbpSeZYIOhgKnAXW9EqSaWgMtdXpj91FpyqT8V9wDIS
 Bps7Za9IdPDkoFeQjSVq1OqX7mLdxPii64ER7Hx83tq52mVkWYHYcTg69QJRFBL/Cwv0
 +jMRLbbhP6qgb3ceNGXlcztxio5TCgAVhuGGP9+yKVx5dPKB7MczS9MROcNF6K0XCUJT
 uaSSgRn1205hKfJqgXNw3PFdyyEvit7JH4qGYzM4/LhJLq3LlH7Cw7Gf3+XTcu4UfQU6
 fHdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+BlNzRhu9SHB+Hlo9MbUymhajYaKbi2DYJDpDiijpIuU4hyCPDVkFkwxWFBtoZYidVZ3jPlD6hEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiXeP3d4CjxsoDKD44aeFz9f5RDKBkMPLvbnBfizq2ja69c+41
 VBABuoH9fAFxksspvCj/fU39qAyJN6lf7ZmF/xZHu48LdEIDT9ggB1GQ
X-Gm-Gg: ASbGncuhdwcjtb6Hxd0arq6kBG++O6zpPWR4sfOIbzgSIaTZYF8il+dWR2xxU+oea8Q
 d//e9e0aIccajOl0YrZcVJ94+0KRPNNh7yyrHo/ByewuKaUEKUQxuB04ZzDbYZ55yHcZNBc95t7
 YqrgjdKJ6lSwE3EUmQrvseswxnw7t4SkE9opb8yWZ6phe9RYt6p8F39X3pdTGNyH0jJdPFsdNXw
 5F+AlCZVx1gKGUwlYQMLCdbxb1OgVqpDTvyqITBWugyYd8IuvLBLoljAmPQ2znPwXNurYWUEzOo
 YMZdrriPlloouTMfdlLy3r/2gXEO4JJaJWlEyRiAQrUKZ1Xxo5hCxbOC8C7zzo27RZR/IeUAURU
 varRqh7mF2AfhFPpluF1XBOS8dUkbxfAz0aC8kdKF2LFmSa6kPwtysvwrAkgb1uAPsHJKsVOtIY
 VMkKOV31DBs0M=
X-Google-Smtp-Source: AGHT+IGYQ0sKPnZptZ94g0b4Qw3M0eMfY5NZER2npxVtf37GPZpeeMZ5KtmaqoxHfAiQ/F3so5ZQuQ==
X-Received: by 2002:a17:907:1c1b:b0:b37:4f78:55b2 with SMTP id
 a640c23a62f3a-b7331b5f2b8mr710287666b.34.1763045621980; 
 Thu, 13 Nov 2025 06:53:41 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 09/18] drm/amdgpu: fix KFD eviction fence enable_signaling path
Date: Thu, 13 Nov 2025 15:51:46 +0100
Message-ID: <20251113145332.16805-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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

