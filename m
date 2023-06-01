Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E3D71F633
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 00:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F87910E5FB;
	Thu,  1 Jun 2023 22:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC5210E5F9;
 Thu,  1 Jun 2023 22:44:27 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-25655c1fcf7so62564a91.0; 
 Thu, 01 Jun 2023 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685659465; x=1688251465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UxHkwiqKdxLfYQYbwK7RXIfy2i2RSaxPzUwPry0EypI=;
 b=DhuuK1awpWZ+E3TBfFc1XXnS0izUJlS5HCoilkUp8uhyNdrIUsUNnSi5PXFLKLyOQ5
 PBw9sJYYI/79wtGUvklbPmJZdVJai3uH8yxxL7+A4lkSyycuGhXBpnCwUUkt1Gx5vvfn
 EVBzg27fkC5VvfPgzFWqOitlwLyTeuN5YHWqt4eGo2hMIT4kNGnGaeY/hYoj5FKkmUfc
 bXJzmlaBlJ2gpj48botGTNd3HcC9BkPNjYfZPHr6w1+Bd5Wd75YRiWGxlx03+VBtSyj9
 TVYhi5kFi+XO49sR/CmfgTk9QhIMbJovpaBWCJnT8drBA/UTpCSIUxxKt03epkaqIwKK
 oBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685659465; x=1688251465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UxHkwiqKdxLfYQYbwK7RXIfy2i2RSaxPzUwPry0EypI=;
 b=T3qQdXXJtMJbtWLoXz9/hdEkkQv8UFXt71gKQnDZoVbW8MfanR38bUuK3rP+DJy7LX
 dqjlGsnSNTQp+8cuGtQMW20gIQgrGAVbR/ume8VxWeClyRLMCNQjYvJXuguVz3v/KlFv
 Ws+kMuQWTI2SigBEM1IJr/2G5XvrIRZ+Du32tyEdSYUl5Fp9IUeHFcLu/dRrNZxKJBxA
 DvHU5jx4E4Gzp18Q+8nedFLkEPs22AEyf3jKS3rdUYV1yqqekCA2Qx/c5ZdGr0c5XG4I
 itC/yRRrNu538xCa98WJLJloGASPFTpBaqoXF0hILAqQ9KN1bA6FXJxAvZ9dWHbnSiAi
 3Inw==
X-Gm-Message-State: AC+VfDxeCNxTSuH6t1IpBMqrgmx3bUH9ifnJh2GtOFR6khWFKOmlOSvJ
 HrJenjAkO0hgNEAv0IuuKKwHPWLBuy6F6A==
X-Google-Smtp-Source: ACHHUZ4rd6kVpQK8pfQmSVfOt8wBFkHWquxBu5ssRKjUzszOFtIfV6X/57VGphUe48U8aNQg5aEIuw==
X-Received: by 2002:a17:902:e852:b0:1b0:3cda:6351 with SMTP id
 t18-20020a170902e85200b001b03cda6351mr10628056plg.0.1685659464812; 
 Thu, 01 Jun 2023 15:44:24 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 6-20020a170902c24600b001ac84f5559csm4024979plg.126.2023.06.01.15.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 15:44:24 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
Date: Thu,  1 Jun 2023 15:44:12 -0700
Message-ID: <20230601224419.2392422-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
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
Cc: Philip Yang <Philip.Yang@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is motivated by OOB access in amdgpu_vm_update_range when
offset_in_bo+map_size overflows.

v2: keep the validations in amdgpu_vm_bo_map
v3: add the validations to amdgpu_vm_bo_map/amdgpu_vm_bo_replace_map
    rather than to amdgpu_gem_va_ioctl

Fixes: 9f7eb5367d00 ("drm/amdgpu: actually use the VM map parameters")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 22f9a65ca0fc7..76d57bc7ac620 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1434,14 +1434,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
 	uint64_t eaddr;
 
 	/* validate the parameters */
-	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
-	    size == 0 || size & ~PAGE_MASK)
+	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK || size & ~PAGE_MASK)
+		return -EINVAL;
+	if (saddr + size <= saddr || offset + size <= offset)
 		return -EINVAL;
 
 	/* make sure object fit at this offset */
 	eaddr = saddr + size - 1;
-	if (saddr >= eaddr ||
-	    (bo && offset + size > amdgpu_bo_size(bo)) ||
+	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
 	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
 		return -EINVAL;
 
@@ -1500,14 +1500,14 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
 	int r;
 
 	/* validate the parameters */
-	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
-	    size == 0 || size & ~PAGE_MASK)
+	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK || size & ~PAGE_MASK)
+		return -EINVAL;
+	if (saddr + size <= saddr || offset + size <= offset)
 		return -EINVAL;
 
 	/* make sure object fit at this offset */
 	eaddr = saddr + size - 1;
-	if (saddr >= eaddr ||
-	    (bo && offset + size > amdgpu_bo_size(bo)) ||
+	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
 	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
 		return -EINVAL;
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

