Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F85F8A1B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 10:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056D10E1C0;
	Sun,  9 Oct 2022 08:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 186.whitelist.crbl.net (186.whitelist.crbl.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB67110E0CB;
 Sat,  8 Oct 2022 09:46:22 +0000 (UTC)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id DKL00013;
 Sat, 08 Oct 2022 16:54:13 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201611.home.langchao.com (10.100.2.11) with Microsoft SMTP Server id
 15.1.2507.12; Sat, 8 Oct 2022 16:54:14 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
Date: Thu, 6 Oct 2022 22:26:51 -0400
Message-ID: <20221007022651.4816-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 20221008165413ef7043eb8f6eb66da1d33c9230d6f04a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Sun, 09 Oct 2022 08:11:24 +0000
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 2797029bd500..3599cc931b0a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -529,8 +529,8 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	for (addr = start; addr < end;) {
 		unsigned long next;
 
-		vma = find_vma(mm, addr);
-		if (!vma || addr < vma->vm_start)
+		vma = vma_lookup(mm, addr);
+		if (!vma)
 			break;
 
 		next = min(vma->vm_end, end);
@@ -798,8 +798,8 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 	for (addr = start; addr < end;) {
 		unsigned long next;
 
-		vma = find_vma(mm, addr);
-		if (!vma || addr < vma->vm_start) {
+		vma = vma_lookup(mm, addr)
+		if (!vma) {
 			pr_debug("failed to find vma for prange %p\n", prange);
 			r = -EFAULT;
 			break;
-- 
2.27.0

