Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E16059B9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3AC10E375;
	Thu, 20 Oct 2022 08:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 186.whitelist.crbl.net (186.whitelist.crbl.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB67010E375;
 Thu, 20 Oct 2022 08:28:20 +0000 (UTC)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id PKP00123;
 Thu, 20 Oct 2022 16:20:23 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.12; Thu, 20 Oct 2022 16:20:24 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
Date: Thu, 20 Oct 2022 04:20:20 -0400
Message-ID: <20221020082020.1589-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 202210201620236694c4ed1177b3ab6d2ed521f42be43e
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: Deming Wang <wangdeming@inspur.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using vma_lookup() verifies the start address is contained in the found
vma.  This results in easier to read the code.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 64fdf63093a0..0100812478b2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1586,8 +1586,8 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		unsigned long npages;
 		bool readonly;
 
-		vma = find_vma(mm, addr);
-		if (!vma || addr < vma->vm_start) {
+		vma = vma_lookup(mm, addr);
+		if (!vma) {
 			r = -EFAULT;
 			goto unreserve_out;
 		}
@@ -2542,8 +2542,8 @@ svm_range_get_range_boundaries(struct kfd_process *p, int64_t addr,
 	struct interval_tree_node *node;
 	unsigned long start_limit, end_limit;
 
-	vma = find_vma(p->mm, addr << PAGE_SHIFT);
-	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
+	vma = vma_lookup(p->mm, addr << PAGE_SHIFT);
+	if (!vma) {
 		pr_debug("VMA does not exist in address [0x%llx]\n", addr);
 		return -EFAULT;
 	}
@@ -2871,8 +2871,8 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	/* __do_munmap removed VMA, return success as we are handling stale
 	 * retry fault.
 	 */
-	vma = find_vma(mm, addr << PAGE_SHIFT);
-	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
+	vma = vma_lookup(mm, addr << PAGE_SHIFT);
+	if (!vma) {
 		pr_debug("address 0x%llx VMA is removed\n", addr);
 		r = 0;
 		goto out_unlock_range;
@@ -3152,9 +3152,8 @@ svm_range_is_valid(struct kfd_process *p, uint64_t start, uint64_t size)
 	start <<= PAGE_SHIFT;
 	end = start + (size << PAGE_SHIFT);
 	do {
-		vma = find_vma(p->mm, start);
-		if (!vma || start < vma->vm_start ||
-		    (vma->vm_flags & device_vma))
+		vma = vma_lookup(p->mm, start);
+		if (!vma || (vma->vm_flags & device_vma))
 			return -EFAULT;
 		start = min(end, vma->vm_end);
 	} while (start < end);
-- 
2.27.0

