Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5C76635C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1DE10E63D;
	Fri, 28 Jul 2023 04:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F4610E63C;
 Fri, 28 Jul 2023 04:48:31 +0000 (UTC)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RBw6T19T8zNm4t;
 Fri, 28 Jul 2023 12:45:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 12:48:27 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 4/4] perf/core: use vma_is_initial_stack() and
 vma_is_initial_heap()
Date: Fri, 28 Jul 2023 13:00:43 +0800
Message-ID: <20230728050043.59880-5-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
References: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100001.china.huawei.com (7.185.36.93)
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
Cc: stephen.smalley.work@gmail.com, Kefeng Wang <wangkefeng.wang@huawei.com>,
 paul@paul-moore.com, David Hildenbrand <david@redhat.com>,
 selinux@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, peterz@infradead.org, amd-gfx@lists.freedesktop.org,
 eparis@parisplace.org, linux-fsdevel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, acme@kernel.org,
 christian.koenig@amd.com,
 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the helpers to simplify code, also kill unneeded goto cpy_name.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 kernel/events/core.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f84e2640ea2f..b36d0823ff33 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8631,7 +8631,7 @@ static void perf_event_mmap_event(struct perf_mmap_event *mmap_event)
 	unsigned int size;
 	char tmp[16];
 	char *buf = NULL;
-	char *name;
+	char *name = NULL;
 
 	if (vma->vm_flags & VM_READ)
 		prot |= PROT_READ;
@@ -8678,29 +8678,18 @@ static void perf_event_mmap_event(struct perf_mmap_event *mmap_event)
 
 		goto got_name;
 	} else {
-		if (vma->vm_ops && vma->vm_ops->name) {
+		if (vma->vm_ops && vma->vm_ops->name)
 			name = (char *) vma->vm_ops->name(vma);
-			if (name)
-				goto cpy_name;
+		if (!name)
+			name = (char *)arch_vma_name(vma);
+		if (!name) {
+			if (vma_is_initial_heap(vma))
+				name = "[heap]";
+			else if (vma_is_initial_stack(vma))
+				name = "[stack]";
+			else
+				name = "//anon";
 		}
-
-		name = (char *)arch_vma_name(vma);
-		if (name)
-			goto cpy_name;
-
-		if (vma->vm_start <= vma->vm_mm->start_brk &&
-				vma->vm_end >= vma->vm_mm->brk) {
-			name = "[heap]";
-			goto cpy_name;
-		}
-		if (vma->vm_start <= vma->vm_mm->start_stack &&
-				vma->vm_end >= vma->vm_mm->start_stack) {
-			name = "[stack]";
-			goto cpy_name;
-		}
-
-		name = "//anon";
-		goto cpy_name;
 	}
 
 cpy_name:
-- 
2.41.0

