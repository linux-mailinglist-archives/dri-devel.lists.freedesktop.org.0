Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E6CB5D03
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028B910E7E7;
	Thu, 11 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iv2PW/vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A7510E7F7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso350655e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455861; x=1766060661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K08D5Oiixjr6rV1a2EG5xZ5xfdLqzMUTZynycpvlcWc=;
 b=iv2PW/vxe6fQphasT4bSAXbyemMHGPk7wA6JIdJDfezOL3FEBBYNRTwSYPVFSJQhwg
 z08K+unNzyM0r0IZ4Bo5XLYxBhOg9CgzYrH0zmO56JpJSetIjXSiAitFl/HIfRFGW0+f
 oRuk7pjDyde50Jyghf+io3dAGi/ISJM1jp3Upq1/vvxrUNKwNnVFDYAhCopiBeg2A5gW
 mLRt09mLFdWsqnTbernTDs5HKIs/an551WrQTTOjU+kIxnF3eTkn8hzlm9wsAhnAKriY
 vTp2pOExQKcL7R8jZC5sBB1PsIJR2QfNwWiKCEvTfHhDmf0ipaNbX1JaKrv9SxfUwHwR
 nKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455861; x=1766060661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K08D5Oiixjr6rV1a2EG5xZ5xfdLqzMUTZynycpvlcWc=;
 b=ruA6XlHDBbdFDC0sJmHtlyiYRejSLwyMbijew9yQy8TNw99gd2QEyPM66yJNVLz6bW
 Yk2oRAzX4AhAttARS2LTYbDCWmiUYW9sODoSx3IdifwD5OJRbKRAUKHEhm4an1m/b89p
 WftLplSPMZy96kA1aEiKKo5jxkeWv19tCeEyI6SDEjarpIGts6tBqz45aN7I1q1InyWO
 J+fn7ZBEbUySePt+yeTYp86KXOMnWLcaqLV0EcMpYvRMDeXeKZZ903mDDXNbPmdUsHI+
 EY5/sGz52dLbFZHJpbv9NKOxnGK86VA2soa0PkCSNJ/PtPL+ijRJ3c2ReShPmgELa39i
 e+6A==
X-Gm-Message-State: AOJu0YzV1G+J7DE6LQcR+txYXZ5BImoZVZBAXnoSQlNCgmHT3mmt2jLr
 UA+DBumHpDcgug/UXDLBYDxdy6FM2k9hs6IGM2gY7CABWg0O2xs9fer6
X-Gm-Gg: AY/fxX7UaOk1HS2cFD9pApwE1/4/F3galYn45AvqrcAOmtnGSmK2SJcX5O1cAhmdbgF
 3EnNyEQBIJCho0XNP4d45ZcDkjhFmlRz6S5RLauww9ztNExLBVLMtcevCKr99s7uecTta0AaCoR
 lZWkjzih4SzJNW5OxMvWp+wprNrbeZqVusxKdOjqz8OD2GpCj/KgW2HAwYJ3W6aZaAxcu+oujLN
 DWdrrGy3Z1bsnEiqv5vNDQ8Qg902NqkDUf24wrxhLc0VTywY/TvkrfIVzos97Jc2SqR5Wk5GtZi
 /0atTKoS86dNb6LsKhaqzvplRvHQmhxF15bdkEDzLb+q/yEg7FX/lMWNde+9GvtTWwq6LBoYXN8
 pHQmPwVcGHJlo1D2hfYoXOI1ynb3708dbtsNZSOSK493jJaqymE9GMjRoYiRQv2FNEA1rCMmkvo
 ONry8ujMyUzoj6EOatnCjYugJw
X-Google-Smtp-Source: AGHT+IEgQQONtMz4eZ7i2QUf3kaQMxBMGycmBqRH50HCOUKjZNviAGzuroerJ5+kekpKf6L2cRXRfw==
X-Received: by 2002:a05:600c:2218:b0:471:793:e795 with SMTP id
 5b1f17b1804b1-47a89d2c84bmr12792255e9.0.1765455860893; 
 Thu, 11 Dec 2025 04:24:20 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:20 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 13/19] drm/amdgpu: independence for the amdgpu_vm_tlb_fence!
Date: Thu, 11 Dec 2025 13:16:44 +0100
Message-ID: <20251211122407.1709-14-christian.koenig@amd.com>
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

This allows amdgpu_vm_tlb_fences to outlive the amdgpu module.

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

