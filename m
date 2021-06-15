Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1013A887B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 20:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4D6E438;
	Tue, 15 Jun 2021 18:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99056E3D0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 18:23:41 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 15 Jun 2021 11:23:39 -0700
Received: from vertex.localdomain (unknown [10.21.244.102])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id BA3D1202A6;
 Tue, 15 Jun 2021 11:23:40 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/vmwgfx: Fix build issues in mksGuestStats discovered
 by the kernel test robot
Date: Tue, 15 Jun 2021 14:23:36 -0400
Message-ID: <20210615182336.995192-5-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615182336.995192-1-zackr@vmware.com>
References: <20210615182336.995192-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: krastevm@vmware.com, sroland@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>

Fixes for ARCH
i386
	* printk format specifier warnings
	* inconsistent operand constraints in an ‘asm’ errors
arm64
	* not targeted by the commit being fixed

Reviewed-by: Zack Rusin <zackr@vmware.com>
Fixes: 7a7a933edd6c ("drm/vmwgfx: Introduce VMware mks-guest-stats")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/Kconfig      | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index a9052fae0bbc..c9ce47c448e0 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -25,6 +25,7 @@ config DRM_VMWGFX_FBCON
 config DRM_VMWGFX_MKSSTATS
 	bool "Enable mksGuestStats instrumentation of vmwgfx by default"
 	depends on DRM_VMWGFX
+	depends on X86
 	default n
 	help
 	   Choose this option to instrument the kernel driver for mksGuestStats.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 74a3f09ad664..ed9c7b3a1e08 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -665,7 +665,7 @@ static inline void hypervisor_ppn_add(PPN64 pfn)
 	unsigned long eax, ebx, ecx, edx, si = 0, di = 0;
 
 	VMW_PORT(VMW_PORT_CMD_MKSGS_ADD_PPN,
-		pfn, si, di,
+		(unsigned long)pfn, si, di,
 		0,
 		VMW_HYPERVISOR_MAGIC,
 		eax, ebx, ecx, edx, si, di);
@@ -682,7 +682,7 @@ static inline void hypervisor_ppn_remove(PPN64 pfn)
 	unsigned long eax, ebx, ecx, edx, si = 0, di = 0;
 
 	VMW_PORT(VMW_PORT_CMD_MKSGS_REMOVE_PPN,
-		pfn, si, di,
+		(unsigned long)pfn, si, di,
 		0,
 		VMW_HYPERVISOR_MAGIC,
 		eax, ebx, ecx, edx, si, di);
@@ -1115,7 +1115,7 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	arg->id = slot;
 
-	DRM_DEV_INFO(dev->dev, "pid=%d arg.description='%.*s' id=%lu\n", current->pid, (int)desc_len, pdesc->description, slot);
+	DRM_DEV_INFO(dev->dev, "pid=%d arg.description='%.*s' id=%zu\n", current->pid, (int)desc_len, pdesc->description, slot);
 
 	return 0;
 
@@ -1163,7 +1163,7 @@ int vmw_mksstat_remove_ioctl(struct drm_device *dev, void *data,
 	if (slot >= ARRAY_SIZE(dev_priv->mksstat_user_pids))
 		return -EINVAL;
 
-	DRM_DEV_INFO(dev->dev, "pid=%d arg.id=%lu\n", current->pid, slot);
+	DRM_DEV_INFO(dev->dev, "pid=%d arg.id=%zu\n", current->pid, slot);
 
 	pgid = task_pgrp_vnr(current);
 	pid = atomic_cmpxchg(&dev_priv->mksstat_user_pids[slot], pgid, MKSSTAT_PID_RESERVED);
-- 
2.30.2

