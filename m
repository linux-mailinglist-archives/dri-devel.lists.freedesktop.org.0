Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC133124A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 16:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136BB6E05A;
	Mon,  8 Mar 2021 15:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E02689DCF;
 Mon,  8 Mar 2021 15:34:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 480D265208;
 Mon,  8 Mar 2021 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615217644;
 bh=6ZFTD883CvBSmMqN/Qn0YcbtxAfTIp2pR0HqlUwwxUk=;
 h=From:To:Cc:Subject:Date:From;
 b=qcjdMkkOzYpyZlVyeCTa4QwDG22pfrIIAUHqaDOST/To4vn2qSsht+isxl6/P1Rbw
 ZUuwUFXOwb3aknq5pmSWo0M3uqK7Bzl+XzmI9E1Fn1px9xB90Jf4zoWOfLcGDoRAjq
 zviCOGwGSfY/CnNEtANwWZf8dh+L7I3e2VwWW3D3hjcHjT3pOltzNSi7QBXf4+zkv4
 3YCjFFNFqq21AUCf5U7U3srByanSbiZSXUHrpp3NJt4SnJE2gDGPkdg9shd83khhti
 UGzHU0OaYx03XjAAeTZrlGDXSvGnn3vGuFjx21cp4Z5lSVA1ThpKbUykvN1J9uXkgi
 bxFSO9367lE2g==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Oded Gabbay <oded.gabbay@gmail.com>
Subject: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
Date: Mon,  8 Mar 2021 16:33:50 +0100
Message-Id: <20210308153359.2513446-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Philip Yang <philip.yang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Using 'imply AMD_IOMMU_V2' does not guarantee that the driver can link
against the exported functions. If the GPU driver is built-in but the
IOMMU driver is a loadable module, the kfd_iommu.c file is indeed
built but does not work:

x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_bind_process_to_device':
kfd_iommu.c:(.text+0x516): undefined reference to `amd_iommu_bind_pasid'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_unbind_process':
kfd_iommu.c:(.text+0x691): undefined reference to `amd_iommu_unbind_pasid'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_suspend':
kfd_iommu.c:(.text+0x966): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0x97f): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0x9a4): undefined reference to `amd_iommu_free_device'
x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `kfd_iommu_resume':
kfd_iommu.c:(.text+0xa9a): undefined reference to `amd_iommu_init_device'
x86_64-linux-ld: kfd_iommu.c:(.text+0xadc): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xaff): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xc72): undefined reference to `amd_iommu_bind_pasid'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe08): undefined reference to `amd_iommu_set_invalidate_ctx_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe26): undefined reference to `amd_iommu_set_invalid_ppr_cb'
x86_64-linux-ld: kfd_iommu.c:(.text+0xe42): undefined reference to `amd_iommu_free_device'

Use a stronger 'select' instead.

Fixes: 64d1c3a43a6f ("drm/amdkfd: Centralize IOMMUv2 code and make it conditional")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index f02c938f75da..91f85dfb7ba6 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,8 +5,9 @@
 
 config HSA_AMD
 	bool "HSA kernel driver for AMD GPU devices"
-	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
-	imply AMD_IOMMU_V2 if X86_64
+	depends on DRM_AMDGPU && ((X86_64 && IOMMU_SUPPORT && ACPI) || ARM64 || PPC64)
+	select AMD_IOMMU if X86_64
+	select AMD_IOMMU_V2 if X86_64
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
