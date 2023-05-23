Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043B70E94D
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A1210E54F;
	Tue, 23 May 2023 22:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB0110E54D;
 Tue, 23 May 2023 22:53:49 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64d722dac08so69372b3a.1; 
 Tue, 23 May 2023 15:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684882428; x=1687474428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dzyaEdd/JqPFdlbr4P5lD8SJNFEFOGGYtrKk5EhfcwE=;
 b=cJ9/TcBhxIj9lFFCTweyLaXwUwkDLt4FKgqqFc6IOluWlbYQkLefOCulf0oAMe6LnY
 nIE/jFemSdWsEOihT8TAkYFRcDAA5Z0vjIW0OrZ/lL/YUraMlprdLjoyVFDyxUHA3VmJ
 zFiMFbIOQoiHxy1zrNa5npE/6/2z0vAAHZ5TY4D1qEKrJwOTXswOhZMaOiPDgWOmamG2
 9iZHbcjLwWPtb/2/XR9otOys1/M3+rBhO/wGSpl6mFFY2h7eo5aHJk1hNdh8eOW2j67D
 5uxpKnicGNoLOGqgC32O0oYVBs+Kzn7EeT1Np51YR/liWQKN2nQDUoYD+iUQ42OIFZTT
 /DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684882428; x=1687474428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzyaEdd/JqPFdlbr4P5lD8SJNFEFOGGYtrKk5EhfcwE=;
 b=WxgN7M4/vsfpR92BLSRRWysEQ0vGX8F0s9nm0wweADBTp3H545P4IegGD7s9Q2eCC4
 V7AMXvu77FZpjRgH1k2smqhaZX8qPwkyHQZ/3HoUBer9VebPu/SO0usR113xxVNobI1K
 d4XOmyfoqQXYorOzr1AcRw4oT+77qSsx///IVMBvktF80l6tDHKSarDGKNlcSUw0psZK
 EpepJzcj4nlY4DdZRH719QkQ33mEKAGNckcz6kRhxdG4lVU1n34ehmiGn2jdI8UbUD5X
 l95swrdzqkZ1Tko5QxkLFrbx6hLnioXpiT5iiJ9Zxe1k0uGkM97RoyGEfCcGd2+IeaO2
 QCzA==
X-Gm-Message-State: AC+VfDwBCQxH+X6LwzgUxQ6igFaSXp8btVb/A3B/bzJSKUx0lQWugLNN
 p+SP4GBnevGkY2c+XN65yGxBU3yMM6EuxA==
X-Google-Smtp-Source: ACHHUZ728+Nnl4PPO5tB1/wctSVh7SxxOLII12WRy5EBIrkEoseUDiTO3WoKmZyv4E/fCCAY5BBz1Q==
X-Received: by 2002:a05:6a20:3d95:b0:105:66d3:854d with SMTP id
 s21-20020a056a203d9500b0010566d3854dmr13269686pzi.6.1684882427464; 
 Tue, 23 May 2023 15:53:47 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79157000000b0064d681c753csm1670525pfi.40.2023.05.23.15.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 15:53:47 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] amdgpu: validate drm_amdgpu_gem_va addrs
Date: Tue, 23 May 2023 15:53:23 -0700
Message-ID: <20230523225336.2642008-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
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
Cc: Philip Yang <Philip.Yang@amd.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Danijel Slivka <danijel.slivka@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Validate drm_amdgpu_gem_va addrs in amdgpu_gem_va_ioctl.
amdgpu_vm_bo_replace_map no longer needs to validate (and its
validations were insufficient either).  amdgpu_vm_bo_map has internal
users and its validations are kept.

This is motivated by OOB access in amdgpu_vm_update_range when
offset_in_bo+map_size overflows.

Userspace (radeonsi and radv) seems fine as well.

v2: keep the validations in amdgpu_vm_bo_map

Fixes: 9f7eb5367d00 ("drm/amdgpu: actually use the VM map parameters")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |  8 +-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index d8e683688daab..36d5adfdf0f69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -681,6 +681,21 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	uint64_t vm_size;
 	int r = 0;
 
+	if (args->va_address & ~PAGE_MASK || args->offset_in_bo & ~PAGE_MASK ||
+	    args->map_size & ~PAGE_MASK) {
+		dev_dbg(dev->dev, "unaligned va_address 0x%LX, offset_in_bo 0x%LX, or map_size 0x%LX\n",
+			args->va_address, args->offset_in_bo, args->map_size);
+		return -EINVAL;
+	}
+
+	if (args->map_size == 0 ||
+	    args->va_address + args->map_size < args->va_address ||
+	    args->offset_in_bo + args->map_size < args->offset_in_bo) {
+		dev_dbg(dev->dev, "invalid map_size 0x%LX (va_address 0x%LX, offset_in_bo 0x%LX)\n",
+			args->map_size, args->va_address, args->offset_in_bo);
+		return -EINVAL;
+	}
+
 	if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
 		dev_dbg(dev->dev,
 			"va_address 0x%LX is in reserved area 0x%LX\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index b9441ab457ea7..6307baaa136cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1501,15 +1501,9 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
 	uint64_t eaddr;
 	int r;
 
-	/* validate the parameters */
-	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
-	    size == 0 || size & ~PAGE_MASK)
-		return -EINVAL;
-
 	/* make sure object fit at this offset */
 	eaddr = saddr + size - 1;
-	if (saddr >= eaddr ||
-	    (bo && offset + size > amdgpu_bo_size(bo)) ||
+	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
 	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
 		return -EINVAL;
 
-- 
2.40.1.698.g37aff9b760-goog

