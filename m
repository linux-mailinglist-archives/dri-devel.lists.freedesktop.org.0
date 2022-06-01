Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA142539A6B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 02:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373810FC7A;
	Wed,  1 Jun 2022 00:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AEA10FC7C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 00:39:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id fd25so106930edb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 17:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZx4MdfCZa1xcjLAJvmIzOeIcmyKMtty3ejvz8WmV6c=;
 b=DMve/lb99Qf1k0Nep9s/+JBgfsRXXja/S8X2eCJSBEjfO55Gcyi/IMM3EHOOfJJTId
 LMQX2oPt3kNNUZnbTVzje7gi+JDLn9Y2Lv+QuDv/g2ClNNa5Xne17SiTCZ7aHURXCZPP
 0kT/+yf6h8PgX4KaDvT8r8AIpRflyYafGzW4XLISwUYiGu8FMBOGqn48GdQmU5X3o4gr
 N1rAtN2mGSON8meGQjvkNEpYjoztj3EGLztEJ/PLITukMwJnOTRr+94V5wwVIlLh6tEx
 7m1L5ELnI8PLzjzHRbN6+3ry1zf4IHEwRMUZB5P46C9Eh5mX7rBMWnozhKTx/cGZJSAt
 iLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZx4MdfCZa1xcjLAJvmIzOeIcmyKMtty3ejvz8WmV6c=;
 b=VOPTTXn//QpfpO+ClA6DARLuo1jt83ZVYEzl2eJx2iGoiOPVPyaks7xiyYCVfU8/Et
 dVZq7SSaVU6AbBA1xsnBRxUMXRkJZ5RMZRd0ezxaFcKZc4fU9MbCB1Qh+B2Gp6p4CLtb
 zmT4B5rkt3oXBES5tda+saM7lVGhtLvMAIcMGWYPD4MrE7rQ2M7yATzW52cK89kRrBgy
 VI1Hv0bHC74EYNWdyQdm+TDvVx5NDlHBBDagqUclazoBwy0BkzlqS4K6PxtOcXVySHRs
 XfcvaNmXyGUwGJIkw6EU8cv97vbvTlt8gthn6qGQGn1in0md5Jtj4Uf+RKwfhfcpx3sj
 mizQ==
X-Gm-Message-State: AOAM5300eoVPSwxNGOWUO7GYsFHDOyQFS/hmxxD8V296CT8f9wN5xvfP
 4RSqvEgduMYZH0d+PzOg6094ZXogPt+Atw==
X-Google-Smtp-Source: ABdhPJxSIBq4ERRaIKhSZl2f3yVMwV3Ewfj5iy93a2j7sgsFUryp93hl8WugHHBLaUreWrjtrpVCuQ==
X-Received: by 2002:aa7:d295:0:b0:42d:e371:ded2 with SMTP id
 w21-20020aa7d295000000b0042de371ded2mr6411807edq.336.1654043994592; 
 Tue, 31 May 2022 17:39:54 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056402001500b0042aa23fa93bsm106182edu.20.2022.05.31.17.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 17:39:54 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Date: Wed,  1 Jun 2022 02:40:12 +0200
Message-Id: <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should be okay because moves themselves use KERNEL usage and
hence still sync with BOOKKEEP usage. Then any later submits still
wait on any pending VM operations.

(i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
 way around)

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index f10332e1c6c0..31bc73fd1fae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
+	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 63b484dc76c5..c8d5898bea11 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, sync_mode, p->vm);
+	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm);
 }
 
 /**
-- 
2.36.1

