Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86084758F4E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D50710E40A;
	Wed, 19 Jul 2023 07:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1931910E3F5;
 Wed, 19 Jul 2023 07:40:08 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R5SPj0lfRz18LYp;
 Wed, 19 Jul 2023 15:39:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 15:40:04 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 3/4] selinux: use vma_is_initial_stack() and
 vma_is_initial_heap()
Date: Wed, 19 Jul 2023 15:51:13 +0800
Message-ID: <20230719075127.47736-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Paul Moore <paul@paul-moore.com>,
 selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the helpers to simplify code.

Cc: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Eric Paris <eparis@parisplace.org>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 security/selinux/hooks.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index d06e350fedee..ee8575540a8e 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3762,13 +3762,10 @@ static int selinux_file_mprotect(struct vm_area_struct *vma,
 	if (default_noexec &&
 	    (prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC)) {
 		int rc = 0;
-		if (vma->vm_start >= vma->vm_mm->start_brk &&
-		    vma->vm_end <= vma->vm_mm->brk) {
+		if (vma_is_initial_heap(vma)) {
 			rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
 					  PROCESS__EXECHEAP, NULL);
-		} else if (!vma->vm_file &&
-			   ((vma->vm_start <= vma->vm_mm->start_stack &&
-			     vma->vm_end >= vma->vm_mm->start_stack) ||
+		} else if (!vma->vm_file && (vma_is_initial_stack(vma) ||
 			    vma_is_stack_for_current(vma))) {
 			rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
 					  PROCESS__EXECSTACK, NULL);
-- 
2.27.0

