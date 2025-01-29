Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24FA21C8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52A10E428;
	Wed, 29 Jan 2025 11:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dM7tQrHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CA110E428
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NTXcI2/JXi5J0nSE2GsUn3l1ydd00sgNvgVHjRNY4To=;
 b=dM7tQrHZKWpLSelUzJjXt4AU+EJx48PdM+HgIJh9A+Pc3zKZqJ/EOS0ATVpOlP6wX0/s4o
 nDhAlhMVZswN3TbaojbLdIkCh7bcYsz5/egd4h7RM440ypYHDaDpb6ZXjoXVy5wF3yEOrg
 nk8sjs+ZP1TVAT5E6dz1g+rV+zPXGiA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-S64VQQ3nNGCSQiGFiVNl2g-1; Wed, 29 Jan 2025 06:54:16 -0500
X-MC-Unique: S64VQQ3nNGCSQiGFiVNl2g-1
X-Mimecast-MFC-AGG-ID: S64VQQ3nNGCSQiGFiVNl2g
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43631d8d9c7so3355635e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151655; x=1738756455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NTXcI2/JXi5J0nSE2GsUn3l1ydd00sgNvgVHjRNY4To=;
 b=m8gjRKMqLNFaKErfEg5JoMgDx6/JHuE/KbUddFFXjCdKMjGsdamc+/wKPL3XWgabam
 3NaG+yAmja8Lt8CPyCzpgR8u9alAivXh2LYjHAf1TWJPKFCcdGHbUZ0RK0hBo3GSfosd
 cCHn+G9afGu9w0xYBlWgEojZNY6oRRNDwB9D0cbdr24hTqpJyc1sVonZwfDh7SfZz2Ep
 DFeoKcRtRIJXBmYS0Drn3C1c9UCKR84jGG1V8pLH0Wvfq1EhQqeGkeLmkP0ftJ+Tu2td
 TeM6fUYfiD4C4zqXUSo5LP/ZkOqClgowg1pYFtnW2a02ilLBxdXTGW75/ntZC2vjR3oX
 0kJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuctY8HM3NoV955Q8fDS8JlqdDwNkQMT5BKI7Vqoq0DqGOwnWc3R3USyFOOEHWB0iOGrj7xSx6KUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdej7ZumDgIv3LZc7Hdn2cx+Gj+hj2rp5DD6HYMNfoDidSFb4H
 f6fxfNtt9Ru57jxZ++FNSsOTJ5zu1S0i4aG20Z4goEveeg/pc55SvXzDkyv3WqpPosUrOeaJATh
 FYJmE1McyUrS6JPe1sIz9QCmDNJb4dhcfTIDRX29e4KTvz+UXhakWjZ578qXqLYTAXAFVJAsS6H
 Ag
X-Gm-Gg: ASbGncuq7nZOW7I7RepDJC2bzqRCUlUh5y1UT7Zx8gz8sEJ6qxSKOJaCvrMHvtVKc0a
 P6FPYyiVKJ0BAosx2lbR/J90iy1ZdfNi4y/6PXfj/qCSvlF1drt2fiZEax9cVy/BntoK3crGXSt
 tsf5Fexe29SsmiJ/wtCHMMZbwSV04v5JWue72u6eGjzhwK7Mb+3jkCiHJx8xklRkB6XRWABWr9y
 cVjayRIcuGwKbdqqX7Ot3OZLfzT0JxyNkWlPZXT80Vy7InZNaAvR8EI/SXJthGd89xnu8/YlpF7
 0Z1lZ/xEDolLBDLgVKY6DgxHy/L8AsAYFY7ZBTb0Fft9iDnJWbJrLxTJyhqkzuZ2kQ==
X-Received: by 2002:a05:600c:244:b0:436:1b77:b5aa with SMTP id
 5b1f17b1804b1-438d5967dbfmr59308565e9.8.1738151654602; 
 Wed, 29 Jan 2025 03:54:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA1IH33KcDzR5tSVGfetIObwrZb+AzQ8Bt78Bds+XQKoxAw+M++eXXCVeUlojayhqR4Mp0lA==
X-Received: by 2002:a05:600c:244:b0:436:1b77:b5aa with SMTP id
 5b1f17b1804b1-438d5967dbfmr59308045e9.8.1738151654065; 
 Wed, 29 Jan 2025 03:54:14 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcc2f73asm20350435e9.24.2025.01.29.03.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:12 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 00/12] mm: fixes for device-exclusive entries (hmm)
Date: Wed, 29 Jan 2025 12:53:58 +0100
Message-ID: <20250129115411.2077152-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: btFMKY207Ht9P0KxCgZ3YTJWhKfMPVv96HS8Iw0Mamw_1738151655
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

Discussing the PageTail() call in make_device_exclusive_range() with
Willy, I recently discovered [1] that device-exclusive handling does
not properly work with THP, making the hmm-tests selftests fail if THPs
are enabled on the system.

Looking into more details, I found that hugetlb is not properly fenced,
and I realized that something that was bugging me for longer -- how
device-exclusive entries interact with mapcounts -- completely breaks
migration and swapout of these folios while they have device-exclusive
PTEs.

The program below can be used to allocate 1 GiB worth of pages and
making them device-exclusive on a kernel with CONFIG_TEST_HMM.

Once they are device-exclusive, these folios cannot get swapped out
(/proc/$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
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
without a bigger rework/cleanup. I'll send out some additional cleanups
that are not strictly required separately on top.

I wish we could just use some special present PROT_NONE PTEs instead of
these (non-present, non-none) fake-swap entries; but that just results in
the same problem we keep having (lack of spare PTE bits), and staring at
other similar fake-swap entries, that ship has sailed.

With this series, make_device_exclusive() doesn't actually belong into
mm/rmap.c anymore, but I'll leave moving that for another day.

I only tested this series with the hmm-tests selftests due to lack of HW,
so I'd appreciate some testing, especially if the interaction between
two GPUs wanting a device-exclusive entry works as expected.

I was able to trigger the -EBUSY in the hmm-tests a couple of times; but
it doesn't retry yet. We should look into converting the folio_try_lock()
into a folio_lock(), and just retry GUP immediately if the folio_walk
fails in loop.

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
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>

David Hildenbrand (12):
  mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
  mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
  mm/rmap: convert make_device_exclusive_range() to
    make_device_exclusive()
  mm/rmap: implement make_device_exclusive() using folio_walk instead of
    rmap walk
  mm/memory: detect writability in restore_exclusive_pte() through
    can_change_pte_writable()
  mm: use single SWP_DEVICE_EXCLUSIVE entry type
  mm/page_vma_mapped: device-private entries are not migration entries
  mm/rmap: handle device-exclusive entries correctly in
    try_to_unmap_one()
  mm/rmap: handle device-exclusive entries correctly in
    try_to_migrate_one()
  mm/rmap: handle device-exclusive entries correctly in
    folio_referenced_one()
  mm/rmap: handle device-exclusive entries correctly in
    page_vma_mkclean_one()
  mm/rmap: keep mapcount untouched for device-exclusive entries

 Documentation/mm/hmm.rst                    |   2 +-
 Documentation/translations/zh_CN/mm/hmm.rst |   2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c       |   5 +-
 include/linux/mmu_notifier.h                |   2 +-
 include/linux/rmap.h                        |   5 +-
 include/linux/swap.h                        |   7 +-
 include/linux/swapops.h                     |  27 +-
 lib/test_hmm.c                              |  45 +-
 mm/gup.c                                    |   3 +
 mm/memory.c                                 |  28 +-
 mm/mprotect.c                               |   8 -
 mm/page_table_check.c                       |   5 +-
 mm/page_vma_mapped.c                        |   3 +-
 mm/rmap.c                                   | 457 +++++++++-----------
 14 files changed, 246 insertions(+), 353 deletions(-)


base-commit: 4845035bec80db8d716a94b80bb5593bf1d69270
-- 
2.48.1

