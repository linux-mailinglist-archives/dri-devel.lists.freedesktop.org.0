Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC798758CA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA9410F56D;
	Thu,  7 Mar 2024 20:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F410F568;
 Thu,  7 Mar 2024 20:51:02 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 427KoviT3904698; Fri, 8 Mar 2024 02:20:57 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 427KovQR3904697;
 Fri, 8 Mar 2024 02:20:57 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 1/2] drm/amdgpu: add recent pagefault info in vm_manager
Date: Fri,  8 Mar 2024 02:20:53 +0530
Message-Id: <20240307205054.3904657-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307205054.3904657-1-sunil.khatri@amd.com>
References: <20240307205054.3904657-1-sunil.khatri@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently page fault information is stored per
vm and which could be freed or stale during
reset. Add it pagefault information in the
vm_manager which is a global space for vm's
and remains valid across.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 8 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 4299ce386322..81fb3465e197 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2924,6 +2924,14 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
 	if (vm && status) {
 		vm->fault_info.addr = addr;
 		vm->fault_info.status = status;
+		/*
+		 * Update the fault information globally for later usage
+		 * when vm could be stale or freed.
+		 */
+		adev->vm_manager.fault_info.addr = addr;
+		adev->vm_manager.fault_info.vmhub = vmhub;
+		adev->vm_manager.fault_info.status = status;
+
 		if (AMDGPU_IS_GFXHUB(vmhub)) {
 			vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
 			vm->fault_info.vmhub |=
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 047ec1930d12..8efa8422f4f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -422,6 +422,8 @@ struct amdgpu_vm_manager {
 	 * look up VM of a page fault
 	 */
 	struct xarray				pasids;
+	/* Global registration of recent page fault information */
+	struct amdgpu_vm_fault_info	fault_info;
 };
 
 struct amdgpu_bo_va_mapping;
-- 
2.34.1

