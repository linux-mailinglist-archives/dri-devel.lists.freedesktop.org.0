Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C976635B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138010E63B;
	Fri, 28 Jul 2023 04:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C0110E63B;
 Fri, 28 Jul 2023 04:48:28 +0000 (UTC)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RBw7J1clyzLnwj;
 Fri, 28 Jul 2023 12:45:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 12:48:24 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 0/4] mm: convert to vma_is_initial_heap/stack()
Date: Fri, 28 Jul 2023 13:00:39 +0800
Message-ID: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Add vma_is_initial_stack() and vma_is_initial_heap() helper and use
them to simplify code.

v2:
- add comment for heap helper and remove one more goto cpy_name,
  per David Hildenbrand
- add RB
v2:
- address comments per David Hildenbrand and Christian Göttsche
- fix selinux build

Kefeng Wang (4):
  mm: factor out VMA stack and heap checks
  drm/amdkfd: use vma_is_initial_stack() and vma_is_initial_heap()
  selinux: use vma_is_initial_stack() and vma_is_initial_heap()
  perf/core: use vma_is_initial_stack() and vma_is_initial_heap()

 drivers/gpu/drm/amd/amdkfd/kfd_svm.c |  5 +----
 fs/proc/task_mmu.c                   | 24 ++++----------------
 fs/proc/task_nommu.c                 | 15 +------------
 include/linux/mm.h                   | 25 +++++++++++++++++++++
 kernel/events/core.c                 | 33 ++++++++++------------------
 security/selinux/hooks.c             |  7 ++----
 6 files changed, 44 insertions(+), 65 deletions(-)

-- 
2.41.0

