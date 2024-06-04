Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265558FB86D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD60010E238;
	Tue,  4 Jun 2024 16:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QT6Y9H4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE82610E025;
 Tue,  4 Jun 2024 16:05:13 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2eaa80cb550so16993111fa.0; 
 Tue, 04 Jun 2024 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717517112; x=1718121912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZPsP0RmXQWgRLeKsh9rUQ07m9IfAwnD8hQVO6AEBOV0=;
 b=QT6Y9H4DmgRNQA+ue2OWZM6qbVcemIvo4Vlw3hBZ9elo3XfobV8AO7MF2+ZCFUWrMA
 zvjEyj6vSQsbKk67/UIyK9kgERO5hMP8Ot4HxTjoZ5nPx6Mfvs+w95+0Dgs5ZJSfuIZ+
 d+BoXVIRa14a7k/GmgzzJhqGItr/AYupQjLOvV4L6Oyn/7eb6ACJKRNt5E5L4EA17b02
 7W9ctX97pF9RiwW2lvcM0dAAi0IxkotXorHkEaPeF7PeAzYzVV6O8uXUOuC8Op/nlsuM
 fQbADCD3IUjjxaTlB0qG0PIciyRQF/dxfx/sflwmf570RaG+PsBnvyBrCHFkZlV/ywCa
 SeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517112; x=1718121912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZPsP0RmXQWgRLeKsh9rUQ07m9IfAwnD8hQVO6AEBOV0=;
 b=tUpR59eU1s2ZG4XGCMRtn7r7W6lFYvJhjbILfYR1KDpuFQcbMhqfCp9JbIskIGBooc
 DDwfaIwapulLbr3N4kxja8y5stTOjFerh7fQSGmEfpUiHnDazwGFefCr5DvT3PfQM5Ps
 HTlyrgqUEZZSL/JJCcyhQ43J0Ba96kpH6XmakQhMWGOVzjtk0gbXWLooPH7s7N1A97ip
 /9hVjG9iM4boSMpvcEye1FjePJaBIpGH+DaZ5NCJPFo+XHcXkoB7lUy7UElwTujFlcKW
 nlKlB4RbfTPhkF6j+wXcHyOWAXC12unh3p3y39o7gAuG7vtN3y8sY63gNXMVCXceSXPI
 +LWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU16LuDspBpAKqfM5qEdy3xwIaEo2lORKZ3fI0yC3XHRRkGnFkHvM6wrsONyF6eIaKAU8Vr52yLRYzXNbrVb+zZAaJdlX+Nx2ohoPG4LQ==
X-Gm-Message-State: AOJu0Yxl63rY7M7rxPz9nFg2iYxYfuJ4bx3wwlopgJQDiGJasPjcryov
 Pb4FdzEdsynbCZAYoeNlEq3OgUjPZ0fuVcWI6u+khlsIJg6/cRSn
X-Google-Smtp-Source: AGHT+IHZaHnMhcp/DQUzaQXIxYFqWKasSEBxmn5u+Hx/QRti7rFuamenhGjtXyoRB4pmhrZ/hKsL7g==
X-Received: by 2002:a2e:a554:0:b0:2ea:c3db:d0ce with SMTP id
 38308e7fff4ca-2eac3dbd2fbmr7950801fa.46.1717517111731; 
 Tue, 04 Jun 2024 09:05:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157b:4500:3a1f:103c:c5a9:7f90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e7e07d7besm2388082f8f.18.2024.06.04.09.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:05:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu: Re-validate evicted buffers v2
Date: Tue,  4 Jun 2024 18:05:03 +0200
Message-Id: <20240604160503.43359-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604160503.43359-1-christian.koenig@amd.com>
References: <20240604160503.43359-1-christian.koenig@amd.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Currently the driver appears to be thinking that it will be attempting to
re-validate the evicted buffers on the next submission if they are not in
their preferred placement.

That however appears not to be true for the very common case of buffers
with allowed placements of VRAM+GTT. Simply because the check can only
detect if the current placement is *none* of the preferred ones, happily
leaving VRAM+GTT buffers in the GTT placement "forever".

Fix it by extending the VRAM+GTT special case to the re-validation logic.

v2: re-work the criteria to consider if something is in it's preferred
placement or not and also disable the handling on APUs.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 4e2391c83d7c..1a470dafa93d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1242,15 +1242,15 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 			return r;
 	}
 
-	/* If the BO is not in its preferred location add it back to
-	 * the evicted list so that it gets validated again on the
-	 * next command submission.
-	 */
 	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
-		uint32_t mem_type = bo->tbo.resource->mem_type;
-
-		if (!(bo->preferred_domains &
-		      amdgpu_mem_type_to_domain(mem_type)))
+		/*
+		 * If the preferred location is VRAM but we placed it into GTT
+		 * add it back to the evicted list so that it gets validated
+		 * again on the next command submission.
+		 */
+		if (!(adev->flags & AMD_IS_APU) &&
+		    bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM &&
+		    bo->tbo.resource->mem_type != TTM_PL_VRAM)
 			amdgpu_vm_bo_evicted(&bo_va->base);
 		else
 			amdgpu_vm_bo_idle(&bo_va->base);
-- 
2.34.1

