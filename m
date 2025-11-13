Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D3C580E7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12BD10E84B;
	Thu, 13 Nov 2025 14:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G9MlpPx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF0710E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:45 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-64165cd689eso3401274a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045624; x=1763650424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xwyu8SCiFn4mAgJ3pD0lgYvgHMUO+OEdoQazcZIs6fA=;
 b=G9MlpPx4OXjFXCOBgEFoASGNE23CR8mLrm1E03GzrnG8+3egiemaKIu1N+NBb7Deqe
 FG+AuoXvmCtNqQENabuLlU3LbbnEEwdfLlU51JJu0fHynvjE+k0R7kl7wzPYqH1iq9f6
 e53rSrCqjT+OjlZZCSSVGmXusvLr6NOfNhd95rEl9Yz44QfCvO59zvFFbgGuTbsfE9Su
 XlKJF1pduHHA0fKE1cTumJ3gHeMBoXQNzULp4hYOTTotP219kEUoEvwyx2iFW4z2+Ofd
 61d27DNB7JRtxdaj/43DzP1N1ABdtFTESIZlL+Ig1+7dkUsIUHThdQz0gauTRLzIWwMF
 0R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045624; x=1763650424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Xwyu8SCiFn4mAgJ3pD0lgYvgHMUO+OEdoQazcZIs6fA=;
 b=DV+jj6FlZuE7nuyn3UQgd1/HhpRhVzSpvQy4asCuT4DmNOSWjqmQ/IP3Ajl6qpk+iQ
 s8/oscFd4k1c2sYQvDF5RPe2/5RtlltG2UD8/WAM+sviyiHZu67THaUi6gLqPHTyQDA+
 4hAsMAavwP/acYmT+beKVaH9rKaghP5yWS7I+5EXS0VecmTPV80Bpy94kYs3iB+GpRd1
 c6njH3R+Bo6CFDDXFUWig3oiFD2vcLaqXg1/LdtZQfmiLKzWjSxdzN1x5Dc1Hi3ApMDQ
 SxV652Uggq8X9Hq9pF3GbJrMAxsR7IP8bi9D0j5hZ/+JZHbKJjwx3+QZ54/3DwjS+Gfq
 O87Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdkRE/p7TeoWPMvdUwwUoUVYaGroGNVpzL4KPoOqDPncOc9OsIrA6OMOcBWTezHUOgOAUIf/Lq6s4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNuExiGdqr2FnEFXCjlfgcSa3XNpjBqxEURL1nZ5xmrwCEgCnU
 ZVS5cmek2IK6XZfjShn+IlQ1EvYZKe63u9TC8cfqaB1oyTDgLpfmZhj0
X-Gm-Gg: ASbGncs3GsjaIS2/vDyCUvwKM7RusLNuUkR0yyzJMYeDNWgeTagbVW1iAZPViHiPniL
 KWCRB/FLx8m9AmBpCwFDvXphdVOHd2AiJKIMRaS9cqDBHzaGAhqIsuc2nXM7NEXa/CK1pj9PHRC
 NyHFGV8QQTz+ExODDqwhO3WYcpOc7HPU44XSm1/VHM/if4BdwnuqE3Gy4ETcaMSeEMbnE1Qs1a1
 rY3hiitKPYwXTi+oxn/2jvvBXi3rfPXiQWdtifZwr88s066FaM1CfLFDbucZUotAPE+qdn9zI9i
 1cKpN854MbelOyckUWcfLzkj5GqVX4GKXIh7JCX6QDN9jQ6awOnNzXOrIa8O4mn/Pj5BkhZezpV
 5gjaINkTaSPDesktA7w5UElDU1oTUgf2TovC2f0n6uXZ/93p5cHiSLe8xpXAKvTtF2RKfEf0D7m
 HeUFypIV68bx4=
X-Google-Smtp-Source: AGHT+IEw4YS4smpt6WicO5Q6hlDrx5fmWS4sNTZNppd+ozXro9T4f2MOiNnNLcV7TyOpypzG5Un2eg==
X-Received: by 2002:a17:907:2d14:b0:b04:48b5:6ea5 with SMTP id
 a640c23a62f3a-b734816d1fcmr419558266b.17.1763045624277; 
 Thu, 13 Nov 2025 06:53:44 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 12/18] drm/amdgpu: independence for the amdgpu_vm_tlb_fence!
Date: Thu, 13 Nov 2025 15:51:49 +0100
Message-ID: <20251113145332.16805-13-christian.koenig@amd.com>
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

This should allow amdgpu_vm_tlb_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
index 5d26797356a3..27bf1f569830 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
@@ -33,7 +33,6 @@ struct amdgpu_tlb_fence {
 	struct amdgpu_device	*adev;
 	struct dma_fence	*dependency;
 	struct work_struct	work;
-	spinlock_t		lock;
 	uint16_t		pasid;
 
 };
@@ -98,9 +97,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
 	f->dependency = *fence;
 	f->pasid = vm->pasid;
 	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
-	spin_lock_init(&f->lock);
 
-	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
+	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, NULL,
 			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
 
 	/* TODO: We probably need a separate wq here */
-- 
2.43.0

