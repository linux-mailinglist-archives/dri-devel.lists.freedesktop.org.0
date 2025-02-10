Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BBA2F8C7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C9310E389;
	Mon, 10 Feb 2025 19:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UtP5y4Yr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64C810E387
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MCWz0QKB/3zA+wyPgSQYXWNTlsWbH4Vu3NwNK9eMowA=;
 b=UtP5y4YrC1pXYufZxEZPPslSmSH/8v3Y3WvMrBxzNAnVt2I3Hx7OSsHo5YcuyHvM0L0BAc
 zoOuc88gNEXhYq1M6XFVuli56bK2U47AaNNOsU/umrrbjMWvatKnnuKF0wQyiH2MO8iCqH
 KIIHoh5XO5x/UNcjue3xUM8hVK+DfJs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-d_CX8gJAMVCt-MYZjvL_WQ-1; Mon, 10 Feb 2025 14:38:07 -0500
X-MC-Unique: d_CX8gJAMVCt-MYZjvL_WQ-1
X-Mimecast-MFC-AGG-ID: d_CX8gJAMVCt-MYZjvL_WQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394c489babso2564445e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216286; x=1739821086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MCWz0QKB/3zA+wyPgSQYXWNTlsWbH4Vu3NwNK9eMowA=;
 b=ryQ8PaMeq1Wqz1j4Ifk8+/i+tNDgqMhRGOdrP8lAqIGdpI10A6zk7/10D5HL8tuEP/
 aze9HNGu39Ndsi3ZK72qBykYsJKk/fSimUJ22vQlq5r+SmY2wWWRCMg+g5Xi8tUk1KBG
 usDsdvg7AGwGp9ZaOfBSVrdbEoMgBJnAFJB8z5Gd/4vJnvQaIX/YBnt+sqnKQPPM1IEA
 3gII0XE1kH1R+7dvzU61xU1TNpv+ixekUI+ZYsib4ywXtT1TbaM/UuN8bWj3T7qeU5oX
 WwHlUfKwxrO2zay2fdOsHjTkrs8NN7tY1k5GJXsYt1sLD8ZWHywO8oL20u6iv2YTEf/B
 KXMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXipvLEjbb5tis2INC7T7TFANKFN0i/AXud4UoD0WTYG5QsuJZwM2HNmDMDtGF4AnjdGuVDq767Vd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrkdC8LURIT/CZgVsuRJgMf3IrsLPPEFIyVJQPWcOqh2T1XVNg
 IaH3v5/3ZldIQGMB7gNxnal1IjhEkXwFMPlK2DieyCgQU5PeH07t4kTG882W4bCWuvQrsP+2I3D
 b29aeFG63LhiSLtJqZU+to3s/PAVtE9io8o//kb9tgNaa6bBlhk5QVu8bm+plamcA+Q==
X-Gm-Gg: ASbGncvk8Gv1L1x1Bzrjd5wWMQHbkWUXF/cagdvvykTbHoDhMTHSbx22PiXYQrGV7EY
 yIbWBK0MKQt+tyWKEf5YBL3TfzaCaDnAt9KxM7dfMMaK2NRUUKQuTT2LUJqNdSYhnNyOtJJ4wGa
 pJ9qVhXVMlDli8H9cs0Tj+dyIfW8ATQ1L8TJ0ejDUP1Tt3YSmlGTi9N3It2Ko1HM0e004kNh4lY
 BGX7g8YbL2IkyXfYlcm1p33Opj9ECWzJ4on2gD058kmjD+slwMlaBP2khKjQ5Ucvw5aZMZBdfWb
 XWXWxcfE1/6arb50vyB2Q/s+uh1ygPgeIznTyXXRH7eB+G4sMNd0iuQkSIE8NJdqXg==
X-Received: by 2002:a05:600c:1e0e:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-439249889a8mr117185015e9.8.1739216286112; 
 Mon, 10 Feb 2025 11:38:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHEaOpDMG7a/03CRbYKSofR+ckzDf4tR3vs9lDmaTs2zKGFHodBnTigVeQlsjTuu7+8Xv9cw==
X-Received: by 2002:a05:600c:1e0e:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-439249889a8mr117184625e9.8.1739216285660; 
 Mon, 10 Feb 2025 11:38:05 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390d94db77sm189019515e9.15.2025.02.10.11.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:04 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 00/17] mm: fixes for device-exclusive entries (hmm)
Date: Mon, 10 Feb 2025 20:37:42 +0100
Message-ID: <20250210193801.781278-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mfAAzl02u02JZCjZY8v7ol2pwAX8HgohPAJmPnnXE2s_1739216286
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

Against mm-hotfixes-stable for now.

Discussing the PageTail() call in make_device_exclusive_range() with
Willy, I recently discovered [1] that device-exclusive handling does
not properly work with THP, making the hmm-tests selftests fail if THPs
are enabled on the system.

Looking into more details, I found that hugetlb is not properly fenced,
and I realized that something that was bugging me for longer -- how
device-exclusive entries interact with mapcounts -- completely breaks
migration/swapout/split/hwpoison handling of these folios while they have
device-exclusive PTEs.

The program below can be used to allocate 1 GiB worth of pages and
making them device-exclusive on a kernel with CONFIG_TEST_HMM.

Once they are device-exclusive, these folios cannot get swapped out
(proc$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
much one forces memory reclaim), and when having a memory block onlined
to ZONE_MOVABLE, trying to offline it will loop forever and complain about
failed migration of a page that should be movable.

# echo offline > /sys/devices/system/memory/memory136/state
# echo online_movable > /sys/devices/system/memory/memory136/state
# ./hmm-swap &
... wait until everything is device-exclusive
# echo offline > /sys/devices/system/memory/memory136/state
[  285.193431][T14882] page: refcount:2 mapcount:0 mapping:0000000000000000
  index:0x7f20671f7 pfn:0x442b6a
[  285.196618][T14882] memcg:ffff888179298000
[  285.198085][T14882] anon flags: 0x5fff0000002091c(referenced|uptodate|
  dirty|active|owner_2|swapbacked|node=1|zone=3|lastcpupid=0x7ff)
[  285.201734][T14882] raw: ...
[  285.204464][T14882] raw: ...
[  285.207196][T14882] page dumped because: migration failure
[  285.209072][T14882] page_owner tracks the page as allocated
[  285.210915][T14882] page last allocated via order 0, migratetype
  Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO),
  id 14926, tgid 14926 (hmm-swap), ts 254506295376, free_ts 227402023774
[  285.216765][T14882]  post_alloc_hook+0x197/0x1b0
[  285.218874][T14882]  get_page_from_freelist+0x76e/0x3280
[  285.220864][T14882]  __alloc_frozen_pages_noprof+0x38e/0x2740
[  285.223302][T14882]  alloc_pages_mpol+0x1fc/0x540
[  285.225130][T14882]  folio_alloc_mpol_noprof+0x36/0x340
[  285.227222][T14882]  vma_alloc_folio_noprof+0xee/0x1a0
[  285.229074][T14882]  __handle_mm_fault+0x2b38/0x56a0
[  285.230822][T14882]  handle_mm_fault+0x368/0x9f0
...

This series fixes all issues I found so far. There is no easy way to fix
without a bigger rework/cleanup. I have a bunch of cleanups on top (some
previous sent, some the result of the discussion in v1) that I will send
out separately once this landed and I get to it.

I wish we could just use some special present PROT_NONE PTEs instead of
these (non-present, non-none) fake-swap entries; but that just results in
the same problem we keep having (lack of spare PTE bits), and staring at
other similar fake-swap entries, that ship has sailed.

With this series, make_device_exclusive() doesn't actually belong into
mm/rmap.c anymore, but I'll leave moving that for another day.

I only tested this series with the hmm-tests selftests due to lack of HW,
so I'd appreciate some testing, especially if the interaction between
two GPUs wanting a device-exclusive entry works as expected.

<program>
#include <stdio.h>
#include <fcntl.h>
#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <linux/types.h>
#include <linux/ioctl.h>

#define HMM_DMIRROR_EXCLUSIVE _IOWR('H', 0x05, struct hmm_dmirror_cmd)

struct hmm_dmirror_cmd {
	__u64 addr;
	__u64 ptr;
	__u64 npages;
	__u64 cpages;
	__u64 faults;
};

const size_t size = 1 * 1024 * 1024 * 1024ul;
const size_t chunk_size = 2 * 1024 * 1024ul;

int main(void)
{
	struct hmm_dmirror_cmd cmd;
	size_t cur_size;
	int fd, ret;
	char *addr, *mirror;

	fd = open("/dev/hmm_dmirror1", O_RDWR, 0);
	if (fd < 0) {
		perror("open failed\n");
		exit(1);
	}

	addr = mmap(NULL, size, PROT_READ | PROT_WRITE,
		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (addr == MAP_FAILED) {
		perror("mmap failed\n");
		exit(1);
	}
	madvise(addr, size, MADV_NOHUGEPAGE);
	memset(addr, 1, size);

	mirror = malloc(chunk_size);

	for (cur_size = 0; cur_size < size; cur_size += chunk_size) {
		cmd.addr = (uintptr_t)addr + cur_size;
		cmd.ptr = (uintptr_t)mirror;
		cmd.npages = chunk_size / getpagesize();
		ret = ioctl(fd, HMM_DMIRROR_EXCLUSIVE, &cmd);
		if (ret) {
			perror("ioctl failed\n");
			exit(1);
		}
	}
	pause();
	return 0;
}
</program>

[1] https://lkml.kernel.org/r/25e02685-4f1d-47fa-be5b-01ff85bb0ce2@redhat.com

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>

v1 -> v2:
 * "mm/rmap: convert make_device_exclusive_range() to make_device_exclusive()"
  -> Fix and simplify return value handling when calling dmirror_atomic_map()
  -> Fix parameter order when calling make_device_exclusive()
  [both things were fixed by the separate cleanups I previously sent, realized
   it when re-testing the fixes here only]
  -> Heavily extend documentation of make_device_exclusive()
 * "mm/rmap: implement make_device_exclusive() using folio_walk instead of
    rmap walk"
  -> Keep MMU_NOTIFY_EXCLUSIVE, and update comments/description
 * "mm/rmap: handle device-exclusive entries correctly in try_to_migrate_one()"
  -> Handle PageHWPoison with device-private pages differently
 * Added a bunch of "handle device-exclusive entries correctly" fixes,
   now handling all page_vma_mapped_walk() callers correctly
 * Added "mm/rmap: avoid -EBUSY from make_device_exclusive()" to fix some
   hmm selftest failures I saw while testing under memory pressure
 * Plenty of comment/description updates and improvements

David Hildenbrand (17):
  mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
  mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
  mm/rmap: convert make_device_exclusive_range() to
    make_device_exclusive()
  mm/rmap: implement make_device_exclusive() using folio_walk instead of
    rmap walk
  mm/memory: detect writability in restore_exclusive_pte() through
    can_change_pte_writable()
  mm: use single SWP_DEVICE_EXCLUSIVE entry type
  mm/page_vma_mapped: device-exclusive entries are not migration entries
  kernel/events/uprobes: handle device-exclusive entries correctly in
    __replace_page()
  mm/ksm: handle device-exclusive entries correctly in
    write_protect_page()
  mm/rmap: handle device-exclusive entries correctly in
    try_to_unmap_one()
  mm/rmap: handle device-exclusive entries correctly in
    try_to_migrate_one()
  mm/rmap: handle device-exclusive entries correctly in
    page_vma_mkclean_one()
  mm/page_idle: handle device-exclusive entries correctly in
    page_idle_clear_pte_refs_one()
  mm/damon: handle device-exclusive entries correctly in
    damon_folio_young_one()
  mm/damon: handle device-exclusive entries correctly in
    damon_folio_mkold_one()
  mm/rmap: keep mapcount untouched for device-exclusive entries
  mm/rmap: avoid -EBUSY from make_device_exclusive()

 Documentation/mm/hmm.rst                    |   2 +-
 Documentation/translations/zh_CN/mm/hmm.rst |   2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c       |   5 +-
 include/linux/mmu_notifier.h                |   2 +-
 include/linux/rmap.h                        |   5 +-
 include/linux/swap.h                        |   7 +-
 include/linux/swapops.h                     |  27 +-
 kernel/events/uprobes.c                     |  13 +-
 lib/test_hmm.c                              |  41 +-
 mm/damon/ops-common.c                       |  23 +-
 mm/damon/paddr.c                            |  10 +-
 mm/gup.c                                    |   3 +
 mm/ksm.c                                    |   9 +-
 mm/memory.c                                 |  28 +-
 mm/mprotect.c                               |   8 -
 mm/page_idle.c                              |   9 +-
 mm/page_table_check.c                       |   5 +-
 mm/page_vma_mapped.c                        |   3 +-
 mm/rmap.c                                   | 469 +++++++++-----------
 19 files changed, 315 insertions(+), 356 deletions(-)


base-commit: e5b2a356dc8a88708d97bd47cca3b8f7ed7af6cb
-- 
2.48.1

