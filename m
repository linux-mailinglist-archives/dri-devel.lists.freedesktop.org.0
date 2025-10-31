Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE9C25535
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386410EBA0;
	Fri, 31 Oct 2025 13:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MAEwbRJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A364D10EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47721743fd0so12424445e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918311; x=1762523111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Is8QZraj0UZR9B5lS7sUfkvx3WgTUsZAN2+odc02EU=;
 b=MAEwbRJg6EaavF492+fWvTm5DrJPUQIMoD7XbwuxQXX9Ki1jbpUbf18u0SUv8GY+/5
 Mf7pwCoUfugSG33HVDUdpHVG++4mGPkku6wa6Kvr1OJJerBI+nRDIcQfFPuPbtGZufCH
 u260n9/B8KYgHTH0MJCgQplyH0iKoHnT44/P/Aa/33IKiofNTt1LcApxCrdrTRYJ+d/h
 oUTlWkbsJi4JY9m+hIiOxXUwwldQSNgeuZcjzLP1EXE0kiNcNY+fMNZtq+d4LdIHTx5M
 3yzERZ5PaHVIjelwnEDSWOzw3DeTuMhm1OsGeh4HKol0Ip6zbegvg4DYdGQhb25KidLI
 Tqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918311; x=1762523111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Is8QZraj0UZR9B5lS7sUfkvx3WgTUsZAN2+odc02EU=;
 b=JY+aFMLnyXzIKfUFO4s9jmVVcdQHRY5Dt/n+DCOOvZXs+7E8xEvyoOdTtpz5a7S3MZ
 ZZ3T1MbkBaSd629vFkqSFtaAekXIqF1bLUGLDxHkBOf0ktWMpo3s2TV5XgJU4Fs3GWmS
 hA+3OWJDU2FZWCF9xor5+2qRS0KcQ3p25/tBoJaclzpHoTH0XRarEME7/lpc79ZY9tTf
 4XSOw6cHoscayIEXUv0iY2Fz34AeH86dnYWmZqfoGErxCysHWVjgLXQFZncm+U7zm8EX
 0d/mW7aLG5oNh6vIgkQbPS9+6WvRBeOHI2CPc4465uc1z+2MMlZzO6uhr0HFcILpNHCG
 p38w==
X-Gm-Message-State: AOJu0Ywu1DeSZ8SjZwXVQLmTzZ4Vzjnv4xKhEbjuf0+fH1RS5qvuvtNI
 WySQN/HW/NJrUJcdP0nKjN2pEXDE33XCtu8rTMvGh1pWk429EyNwXmbV
X-Gm-Gg: ASbGncuNd9SEbcniBcco6sV+VqnN3PC/QkSmEowjJZ6hhN4Wq/UYzDYTN93NlJDwQ0s
 2t1OyhGu6qkmNPzXbC/qfoYOoZDHLxuzrouY3oNpNXyhXb/yjUHF5YFHnVhrjvFkgXmN7t56NiY
 NArrXL8JUSfv55Tds9VrWWU45keIDqO7LzoQojzEe+3xENRe6zZ63JDRvkUO3VYsHNHbTZ0UbEc
 SjUaGc0YHqBRZ67SYiog3Uv12PrPGxkYZlNYZdPA1pGboVd4Mdb6KGK1+UqvLtjuc0DSpXO/t0e
 14/FWue4d1btu6WLcCpR+CmYaegJSmMj+Xd4XlDgP5XhccGmidK4VVwZK8EhOww7118TwNBjHNb
 XU5RcRIN8zSt0kVAD//oHX090OU8wt9NcfeK8ed7Amo1YvQwmYqWPSA+N25yBHZ5838bCNzPYA+
 wYIsqd+hUiFRCqOLOR7uC+sSEU
X-Google-Smtp-Source: AGHT+IH8UgoD+vHobMF5u6+WO4Mm01IMnQX3xovxS5J6ZPw3YsiZ27ptFzDepNRTKHhfXqw9BZFp8Q==
X-Received: by 2002:a05:600c:450e:b0:477:19ad:61f4 with SMTP id
 5b1f17b1804b1-477307e2292mr31676895e9.12.1761918311034; 
 Fri, 31 Oct 2025 06:45:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:45:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/20] drm/amdgpu: independence for the amdgpu_vm_tlb_fence!
Date: Fri, 31 Oct 2025 14:16:48 +0100
Message-ID: <20251031134442.113648-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

