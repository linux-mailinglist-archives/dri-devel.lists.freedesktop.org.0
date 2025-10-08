Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4802BC7B6A
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980C810E940;
	Thu,  9 Oct 2025 07:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RzLtpaF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FD810E08F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 03:43:55 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2698e4795ebso68188395ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 20:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759895034; x=1760499834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VInhF7vun+ADbuDP4f7RWZ7/1hOQvgwkDekOvwy950Y=;
 b=RzLtpaF/gvGic+vswu1mIWUsdRlliGZ4UyNS/OVTfHMDEBhhjVu8KQVE5ZSBsIpFMQ
 opQq+1nZV3YiH4yRr9I3Wj1+ZUhR9zS2E7+kglWpjKWeUPRs42weFq7cF3ueueDonhLf
 VuK100TLokb6SC4XP3P63zlOgG5vIqdJ23CmXjEjfzHqHcDbN/ATMxC0C0UF7c+L+uyY
 Y/Qe/dNbnLkbPNvJgXLe6M2BbNKGlGOVaAGw15H7FJ0XmfycS3c5vZUyarbMcn6qAxtL
 AWjZqok53aMb6WQgZLPTeyYiojQSGhuWHmkai/yPpuYCBZbzygVrhsvJnrI1FLY2DCS7
 i7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759895034; x=1760499834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VInhF7vun+ADbuDP4f7RWZ7/1hOQvgwkDekOvwy950Y=;
 b=opsto9K2ZGvxxURo+2rx6gINM2b18tuwj4G6vIcq4y3Lr7vXCKNLMFzb0WnOuUAtMp
 gMpH9JMfOIPbxENKVw8qorbtGozWkp9oG0wskrYYQZzUmbVL5uposNakpA9jD4XmCrs3
 22Rxbed9P8J5povnyk0sQLDgm4RqWOUSi7fjT9J9F8DOxqbTJfYHhz2sd0lReCysVY8N
 2S3u5vU7wEXdghUmaDWQeQdor83gCn/Tr5Q9NH22cvmYzXw6AMW3+A8NLgsKh5ZPss6q
 TPUO9H+oKglQBGpmTHBauKz0YkFnIcjvQexLagmJdDm7ihn09tNWeWMTRfHIZpiBKQyG
 2ahQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfOuNhdtvGy9CWOK9fIbyT2+ZQFACLK0v71T+S2gk+27CO6tYb77iqCt3znA3XOYXofO97Oj6BJ7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpOC33n7MYO1LQJExQ6vLvzdpOJFN+RCtQOW/qlw17ngRurmKO
 BmczcWzyFdJh8V5ouxwP2bgtLtQ4ML52w2EMjicni4Vlkuc/OnHtKMEO
X-Gm-Gg: ASbGnctpKvvo4+ciWcCAA8rlxSlJW/ubBy3K3Qoovgd+nUpHeGNYtDME4zZayDpohNf
 xDr0s4I2sJi0ZFl7KK9aH5Kr7xVjdB/ucdsURaueacBekg0HOGFEkNr0oiXuxvvO/NlrMxjI+/M
 SqQdgkDSoNk0s2ST4oyfTpBlI10gUcdSjJyO+JZ4lMF+eu1jO3dDp/1HE4Zr1ayfttFS/MwI8Ep
 b6Wi/dt8tkcodjACRf8Y3N9DmK5Y+NGfm1LpyBHf8mt4aCNZ7urzqsND2cFM+xgy73g7lkfPo1D
 gzvU6l927sg3FCkD7jELQwp7pSjUKOlc9ozmoGPaDJ4voXP1R2fL0O8boIhkvwr1356pVqitiiN
 e4dsP4yxhZeyoMU9BNcfneSG8hw36teY5DKfAP0q7Me9sLd8KihzxL7IM+OnF9XmdnXxzOvtA11
 bOX4Bfdzo3IqxGcvBkuXtHsdtSKN+ZRSC46TZt4g==
X-Google-Smtp-Source: AGHT+IG54xKXiUdy0DJwzKQZzIjcR2wGAtdfxZQRffoyREgsAb1SOl9FlsAzbJO0UqlUtTWKuOGgcw==
X-Received: by 2002:a17:902:ce0d:b0:26b:da03:60db with SMTP id
 d9443c01a7336-29027373dabmr24286355ad.13.1759895034268; 
 Tue, 07 Oct 2025 20:43:54 -0700 (PDT)
Received: from localhost.localdomain ([155.117.84.221])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1280c9sm182813505ad.53.2025.10.07.20.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 20:43:53 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Gui-Dong Han <hanguidong02@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu: use atomic functions with memory barriers for vm
 fault info
Date: Wed,  8 Oct 2025 03:43:27 +0000
Message-Id: <20251008034327.2475547-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Oct 2025 07:29:03 +0000
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

The atomic variable vm_fault_info_updated is used to synchronize access to
adev->gmc.vm_fault_info between the interrupt handler and
get_vm_fault_info().

The default atomic functions like atomic_set() and atomic_read() do not
provide memory barriers. This allows for CPU instruction reordering,
meaning the memory accesses to vm_fault_info and the vm_fault_info_updated
flag are not guaranteed to occur in the intended order. This creates a
race condition that can lead to inconsistent or stale data being used.

The previous implementation, which used an explicit mb(), was incomplete
and inefficient. It failed to account for all potential CPU reorderings,
such as the access of vm_fault_info being reordered before the atomic_read
of the flag. This approach is also more verbose and less performant than
using the proper atomic functions with acquire/release semantics.

Fix this by switching to atomic_set_release() and atomic_read_acquire().
These functions provide the necessary acquire and release semantics,
which act as memory barriers to ensure the correct order of operations.
It is also more efficient and idiomatic than using explicit full memory
barriers.

Fixes: b97dfa27ef3a ("drm/amdgpu: save vm fault information for amdkfd")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 5 ++---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c            | 7 +++----
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            | 7 +++----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index b16cce7c22c3..ac09bbe51634 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2325,10 +2325,9 @@ void amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(struct kgd_mem *mem)
 int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
 					  struct kfd_vm_fault_info *mem)
 {
-	if (atomic_read(&adev->gmc.vm_fault_info_updated) == 1) {
+	if (atomic_read_acquire(&adev->gmc.vm_fault_info_updated) == 1) {
 		*mem = *adev->gmc.vm_fault_info;
-		mb(); /* make sure read happened */
-		atomic_set(&adev->gmc.vm_fault_info_updated, 0);
+		atomic_set_release(&adev->gmc.vm_fault_info_updated, 0);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index a8d5795084fc..cf30d3332050 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1066,7 +1066,7 @@ static int gmc_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 					GFP_KERNEL);
 	if (!adev->gmc.vm_fault_info)
 		return -ENOMEM;
-	atomic_set(&adev->gmc.vm_fault_info_updated, 0);
+	atomic_set_release(&adev->gmc.vm_fault_info_updated, 0);
 
 	return 0;
 }
@@ -1288,7 +1288,7 @@ static int gmc_v7_0_process_interrupt(struct amdgpu_device *adev,
 	vmid = REG_GET_FIELD(status, VM_CONTEXT1_PROTECTION_FAULT_STATUS,
 			     VMID);
 	if (amdgpu_amdkfd_is_kfd_vmid(adev, vmid)
-		&& !atomic_read(&adev->gmc.vm_fault_info_updated)) {
+		&& !atomic_read_acquire(&adev->gmc.vm_fault_info_updated)) {
 		struct kfd_vm_fault_info *info = adev->gmc.vm_fault_info;
 		u32 protections = REG_GET_FIELD(status,
 					VM_CONTEXT1_PROTECTION_FAULT_STATUS,
@@ -1304,8 +1304,7 @@ static int gmc_v7_0_process_interrupt(struct amdgpu_device *adev,
 		info->prot_read = protections & 0x8 ? true : false;
 		info->prot_write = protections & 0x10 ? true : false;
 		info->prot_exec = protections & 0x20 ? true : false;
-		mb();
-		atomic_set(&adev->gmc.vm_fault_info_updated, 1);
+		atomic_set_release(&adev->gmc.vm_fault_info_updated, 1);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index b45fa0cea9d2..0d4c93ff6f74 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1179,7 +1179,7 @@ static int gmc_v8_0_sw_init(struct amdgpu_ip_block *ip_block)
 					GFP_KERNEL);
 	if (!adev->gmc.vm_fault_info)
 		return -ENOMEM;
-	atomic_set(&adev->gmc.vm_fault_info_updated, 0);
+	atomic_set_release(&adev->gmc.vm_fault_info_updated, 0);
 
 	return 0;
 }
@@ -1474,7 +1474,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
 	vmid = REG_GET_FIELD(status, VM_CONTEXT1_PROTECTION_FAULT_STATUS,
 			     VMID);
 	if (amdgpu_amdkfd_is_kfd_vmid(adev, vmid)
-		&& !atomic_read(&adev->gmc.vm_fault_info_updated)) {
+		&& !atomic_read_acquire(&adev->gmc.vm_fault_info_updated)) {
 		struct kfd_vm_fault_info *info = adev->gmc.vm_fault_info;
 		u32 protections = REG_GET_FIELD(status,
 					VM_CONTEXT1_PROTECTION_FAULT_STATUS,
@@ -1490,8 +1490,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
 		info->prot_read = protections & 0x8 ? true : false;
 		info->prot_write = protections & 0x10 ? true : false;
 		info->prot_exec = protections & 0x20 ? true : false;
-		mb();
-		atomic_set(&adev->gmc.vm_fault_info_updated, 1);
+		atomic_set_release(&adev->gmc.vm_fault_info_updated, 1);
 	}
 
 	return 0;
-- 
2.25.1

