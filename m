Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A00351CCBB
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 01:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772BB10E008;
	Thu,  5 May 2022 23:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 23:28:24 UTC
Received: from out199-11.us.a.mail.aliyun.com (out199-11.us.a.mail.aliyun.com
 [47.90.199.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F5F10FC2F;
 Thu,  5 May 2022 23:28:24 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R301e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0VCP5hnC_1651792994; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VCP5hnC_1651792994) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 06 May 2022 07:23:14 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 2/2] drm/amdkfd: Return true/false (not 1/0) from bool
 functions
Date: Fri,  6 May 2022 07:23:11 +0800
Message-Id: <20220505232312.129997-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return boolean values ("true" or "false") instead of 1 or 0 from bool
functions. This fixes the following warnings from coccicheck:

./drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c:244:9-10: WARNING:
return of 0/1 in function 'event_interrupt_isr_v11' with return type
bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
index c3919aaa76e6..1431f0961769 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
@@ -241,14 +241,14 @@ static bool event_interrupt_isr_v11(struct kfd_dev *dev,
 	if (/*!KFD_IRQ_IS_FENCE(client_id, source_id) &&*/
 	    (vmid < dev->vm_info.first_vmid_kfd ||
 	    vmid > dev->vm_info.last_vmid_kfd))
-		return 0;
+		return false;
 
 	pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
 	context_id0 = SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
 
 	if ((source_id == SOC15_INTSRC_CP_END_OF_PIPE) &&
 	    (context_id0 & AMDGPU_FENCE_MES_QUEUE_FLAG))
-		return 0;
+		return false;
 
 	pr_debug("client id 0x%x, source id %d, vmid %d, pasid 0x%x. raw data:\n",
 		 client_id, source_id, vmid, pasid);
@@ -258,7 +258,7 @@ static bool event_interrupt_isr_v11(struct kfd_dev *dev,
 
 	/* If there is no valid PASID, it's likely a bug */
 	if (WARN_ONCE(pasid == 0, "Bug: No PASID in KFD interrupt"))
-		return 0;
+		return false;
 
 	/* Interrupt types we care about: various signals and faults.
 	 * They will be forwarded to a work queue (see below).
-- 
2.20.1.7.g153144c

