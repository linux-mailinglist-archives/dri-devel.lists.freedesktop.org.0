Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C535A750C0F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077D510E56D;
	Wed, 12 Jul 2023 15:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F54110E555;
 Wed, 12 Jul 2023 14:45:39 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R1Kkc0gYvz1JCRg;
 Wed, 12 Jul 2023 22:24:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 22:25:14 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 5/5] perf/core: use vma_is_stack() and vma_is_heap()
Date: Wed, 12 Jul 2023 22:38:31 +0800
Message-ID: <20230712143831.120701-6-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
References: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 12 Jul 2023 15:14:33 +0000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, selinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the helpers to simplify code, also kill unneeded goto cpy_name.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 kernel/events/core.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 78ae7b6f90fd..cb271f449b81 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8685,22 +8685,14 @@ static void perf_event_mmap_event(struct perf_mmap_event *mmap_event)
 		}
 
 		name = (char *)arch_vma_name(vma);
-		if (name)
-			goto cpy_name;
-
-		if (vma->vm_start <= vma->vm_mm->start_brk &&
-				vma->vm_end >= vma->vm_mm->brk) {
-			name = "[heap]";
-			goto cpy_name;
+		if (!name) {
+			if (vma_is_heap(vma))
+				name = "[heap]";
+			else if (vma_is_stack(vma))
+				name = "[stack]";
+			else
+				name = "//anon";
 		}
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

