Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D3B32E19
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 10:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4F610E063;
	Sun, 24 Aug 2025 08:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ku9R66BP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD310E063;
 Sun, 24 Aug 2025 08:06:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F27ED5C550B;
 Sun, 24 Aug 2025 08:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F41C4CEF4;
 Sun, 24 Aug 2025 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1756022794;
 bh=ieB6pBlfUgiHuQIxJgpncSnD+SA7wnWh4kXza1Fis0U=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=ku9R66BPMBA4jOuZ1SKQ9uBrW4Zjqsnuli+sT8DWDfC4wi56LtBGh2ihwes3itzcl
 HqH0nBGiIDxr/IVJxuzoKSUmatX3laFvqoBGz2y3fLbFtqEMEPfNF2DqGlQXx31l8v
 AIdUGmzVqBO8BkILaBbsqW6xZWMLs/TEI6L9cyT8=
Subject: Patch "drm/amdgpu: handle the case of pci_channel_io_frozen only in
 amdgpu_pci_resume" has been added to the 5.10-stable tree
To: airlied@gmail.com, ajay.kaher@broadcom.com, alexander.deucher@amd.com,
 alexey.makhalov@broadcom.com, amd-gfx@lists.freedesktop.org,
 andrey.grodzovsky@amd.com, bcm-kernel-feedback-list@broadcom.com,
 cesun102@amd.com, christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, guchun.chen@amd.com, lijo.lazar@amd.com,
 linux@treblig.org, mario.limonciello@amd.com, sashal@kernel.org,
 shivani.agarwal@broadcom.com, simona@ffwll.ch, siqueira@igalia.com,
 srinivasan.shanmugam@amd.com, sunil.khatri@amd.com, tapas.kundu@broadcom.com,
 zhangzekun11@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 24 Aug 2025 10:06:20 +0200
In-Reply-To: <20250812062349.149549-1-shivani.agarwal@broadcom.com>
Message-ID: <2025082420-defiant-guiding-a17a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    drm/amdgpu: handle the case of pci_channel_io_frozen only in amdgpu_pci_resume

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amdgpu-handle-the-case-of-pci_channel_io_frozen-only-in-amdgpu_pci_resume.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-167102-greg=kroah.com@vger.kernel.org Tue Aug 12 08:37:31 2025
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
Date: Mon, 11 Aug 2025 23:23:49 -0700
Subject: drm/amdgpu: handle the case of pci_channel_io_frozen only in amdgpu_pci_resume
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com, tapas.kundu@broadcom.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com, mario.limonciello@amd.com, sunil.khatri@amd.com, srinivasan.shanmugam@amd.com, siqueira@igalia.com, cesun102@amd.com, linux@treblig.org, zhangzekun11@huawei.com, andrey.grodzovsky@amd.com, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Guchun Chen <guchun.chen@amd.com>, Sasha Levin <sashal@kernel.org>, Shivani Agarwal <shivani.agarwal@broadcom.com>
Message-ID: <20250812062349.149549-1-shivani.agarwal@broadcom.com>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit 248b061689a40f4fed05252ee2c89f87cf26d7d8 ]

In current code, when a PCI error state pci_channel_io_normal is detectd,
it will report PCI_ERS_RESULT_CAN_RECOVER status to PCI driver, and PCI
driver will continue the execution of PCI resume callback report_resume by
pci_walk_bridge, and the callback will go into amdgpu_pci_resume
finally, where write lock is releasd unconditionally without acquiring
such lock first. In this case, a deadlock will happen when other threads
start to acquire the read lock.

To fix this, add a member in amdgpu_device strucutre to cache
pci_channel_state, and only continue the execution in amdgpu_pci_resume
when it's pci_channel_io_frozen.

Fixes: c9a6b82f45e2 ("drm/amdgpu: Implement DPC recovery")
Suggested-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on 5.10.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |    6 ++++++
 2 files changed, 7 insertions(+)

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -997,6 +997,7 @@ struct amdgpu_device {
 
 	bool                            in_pci_err_recovery;
 	struct pci_saved_state          *pci_state;
+	pci_channel_state_t		pci_channel_state;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4944,6 +4944,8 @@ pci_ers_result_t amdgpu_pci_error_detect
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
+	adev->pci_channel_state = state;
+
 	switch (state) {
 	case pci_channel_io_normal:
 		return PCI_ERS_RESULT_CAN_RECOVER;
@@ -5079,6 +5081,10 @@ void amdgpu_pci_resume(struct pci_dev *p
 
 	DRM_INFO("PCI error: resume callback!!\n");
 
+	/* Only continue execution for the case of pci_channel_io_frozen */
+	if (adev->pci_channel_state != pci_channel_io_frozen)
+		return;
+
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 


Patches currently in stable-queue which might be from shivani.agarwal@broadcom.com are

queue-5.10/btrfs-fix-deadlock-when-cloning-inline-extents-and-using-qgroups.patch
queue-5.10/ptp-fix-possible-memory-leak-in-ptp_clock_register.patch
queue-5.10/scsi-pm80xx-fix-memory-leak-during-rmmod.patch
queue-5.10/block-don-t-call-rq_qos_ops-done_bio-if-the-bio-isn-t-tracked.patch
queue-5.10/drm-amdgpu-handle-the-case-of-pci_channel_io_frozen-only-in-amdgpu_pci_resume.patch
queue-5.10/scsi-lpfc-fix-link-down-processing-to-address-null-pointer-dereference.patch
queue-5.10/rdma-rxe-return-cqe-error-if-invalid-lkey-was-supplied.patch
