Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A079B3035A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6E710E3B4;
	Thu, 21 Aug 2025 20:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bcV9eXYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE1E10E3B1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LLdMjSHtv+zm1bY5U2c0p8D/d+U3cemLYeHBKaj7voE=;
 b=bcV9eXYUtzqH9TJjEoGbgWflV39yHV5sjxeWlsL1sRxxE21UtI6cY6m1+ary+5T/UflcBu
 tGhCW0wxBfHSx0tOalnL7sDJOshCvkszInHj4Jy8V0H9/tTyOLoaqUR2/54Fqk6bj4WPqG
 i5qaKWXiYKVv1inyOHNo/dpSfU8uSsc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-0o3JvCmfM_WvWiqDj649nQ-1; Thu, 21 Aug 2025 16:07:08 -0400
X-MC-Unique: 0o3JvCmfM_WvWiqDj649nQ-1
X-Mimecast-MFC-AGG-ID: 0o3JvCmfM_WvWiqDj649nQ_1755806827
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b51411839so818825e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806826; x=1756411626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LLdMjSHtv+zm1bY5U2c0p8D/d+U3cemLYeHBKaj7voE=;
 b=vL64I0c54Oa8js1FG23HDmtl3JhkiCFgcc9u80wBwSkpjEyLVfLhUlW0xnIc4FExZP
 8pouOTk5yUAmzlPfr5qlXy8rSQD4F2hglvQH+Ks5X66jollwSP0P/xHH94oyJtwQ24yn
 RJFkk99nDoudo7pCd90S8NJhl9cHOiGQuE/dgm9WyuwmvQVBuJch1Kdngy4TbNGoQnwS
 Wb/yyZhmECJGm/jjKTDXthW7+5+L9MHrvmI+43jfiaha0y5Ii8md3Z+bqM4DHb7sW2uv
 gTpXLeIU+UkxujH2CYgxuH0/ZxRUZ2+Xclexa4kE7QVIYZSB4uuoTztriQIplfbxonpM
 PNzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmIVD/k79S+XgKs3EqjVObgQwZZvKMCHhTuCuuM7pneLA1dGAwZn8Q/cHJSFYV6/w4Wd/0VDN5YU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8DhlIu/gLV1siZkkFG9Y/gvxxCWe5r+2PHXZ/2XCwwL7hhW7x
 dOgy0ixpdVOBIbvibOYc5KcMfq35GBo59vuai8Bq8a5MKl+RBLqVvFbfFEKJPjbP6aDYOS+01Lv
 D7Q2VzvxT8Q8YYLcpjVo0YCQlhplrATTdKLlAlZA+HcunpJ4GBRVV5vavZ/TSU8fcG14jWQ==
X-Gm-Gg: ASbGncuvHPSjCkZeObnzSn/UcqQNSLgTsvi5j4hxZBndcTC99kPGKLFd00F86Rjq4XZ
 mWF9DvURpUU4sEbSZdkaoJrp6nRHB7Y5WOWj6hxpX2JvRHO/IPDh+b5+z5a4BwymnYPg7FfaOi8
 /1GKpT/CUj9F+MTwrObOgbyqyLw4f6bH+2llmBV+R8LvD+X31YAEYsS05fGCNCHuEtGuQiLSoQU
 +eW6A0uQpWBY5RhLSsckEJLilSEA/XZkJdjPLNw1eHEUeAp+hVtYpuDTMoqduddbwiwPtl8hcK5
 TBKdR8PyfokO1s68bDi9vnz2LFnOms/aerMEi5U8jmskC413wtDdindBLvGyTxorikulbqylqRz
 jevyB3dcAyBl6autD7OnuZQ==
X-Received: by 2002:a05:600c:4506:b0:456:1bae:5470 with SMTP id
 5b1f17b1804b1-45b5179b6camr3190995e9.8.1755806826458; 
 Thu, 21 Aug 2025 13:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7XEacdneicK9OezeDu7E6BzvwjamEpx7+RbUEh0t7qSo20kryXdXhBwYQdhu2/m95zw+e6A==
X-Received: by 2002:a05:600c:4506:b0:456:1bae:5470 with SMTP id
 5b1f17b1804b1-45b5179b6camr3190665e9.8.1755806825859; 
 Thu, 21 Aug 2025 13:07:05 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c077788df7sm12764142f8f.48.2025.08.21.13.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:05 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jens Axboe <axboe@kernel.dk>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-scsi@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mm@kvack.org,
 io-uring@vger.kernel.org, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Alex Dubov <oakad@yahoo.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brett Creeley <brett.creeley@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Doug Gilbert <dgilbert@interlog.com>, Heiko Carstens <hca@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Lars Persson <lars.persson@axis.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Shuah Khan <shuah@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>
Subject: [PATCH RFC 00/35] mm: remove nth_page()
Date: Thu, 21 Aug 2025 22:06:26 +0200
Message-ID: <20250821200701.1329277-1-david@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Mx1RvJnWXCVybNP7kXeaFdbfvsXLvi1UgSxkjObaKk_1755806827
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

This is based on mm-unstable and was cross-compiled heavily.

I should probably have already dropped the RFC label but I want to hear
first if I ignored some corner case (SG entries?) and I need to do
at least a bit more testing.

I will only CC non-MM folks on the cover letter and the respective patch
to not flood too many inboxes (the lists receive all patches).

---

As discussed recently with Linus, nth_page() is just nasty and we would
like to remove it.

To recap, the reason we currently need nth_page() within a folio is because
on some kernel configs (SPARSEMEM without SPARSEMEM_VMEMMAP), the
memmap is allocated per memory section.

While buddy allocations cannot cross memory section boundaries, hugetlb
and dax folios can.

So crossing a memory section means that "page++" could do the wrong thing.
Instead, nth_page() on these problematic configs always goes from
page->pfn, to the go from (++pfn)->page, which is rather nasty.

Likely, many people have no idea when nth_page() is required and when
it might be dropped.

We refer to such problematic PFN ranges and "non-contiguous pages".
If we only deal with "contiguous pages", there is not need for nth_page().

Besides that "obvious" folio case, we might end up using nth_page()
within CMA allocations (again, could span memory sections), and in
one corner case (kfence) when processing memblock allocations (again,
could span memory sections).

So let's handle all that, add sanity checks, and remove nth_page().

Patch #1 -> #5   : stop making SPARSEMEM_VMEMMAP user-selectable + cleanups
Patch #6 -> #12  : disallow folios to have non-contiguous pages
Patch #13 -> #20 : remove nth_page() usage within folios
Patch #21        : disallow CMA allocations of non-contiguous pages
Patch #22 -> #31 : sanity+check + remove nth_page() usage within SG entry
Patch #32        : sanity-check + remove nth_page() usage in
                   unpin_user_page_range_dirty_lock()
Patch #33        : remove nth_page() in kfence
Patch #34        : adjust stale comment regarding nth_page
Patch #35        : mm: remove nth_page()

A lot of this is inspired from the discussion at [1] between Linus, Jason
and me, so cudos to them.

[1] https://lore.kernel.org/all/CAHk-=wiCYfNp4AJLBORU-c7ZyRBUp66W2-Et6cdQ4REx-GyQ_A@mail.gmail.com/T/#u

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@axis.com
Cc: linux-scsi@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: virtualization@lists.linux.dev
Cc: linux-mm@kvack.org
Cc: io-uring@vger.kernel.org
Cc: iommu@lists.linux.dev
Cc: kasan-dev@googlegroups.com
Cc: wireguard@lists.zx2c4.com
Cc: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-riscv@lists.infradead.org

David Hildenbrand (35):
  mm: stop making SPARSEMEM_VMEMMAP user-selectable
  arm64: Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
  s390/Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
  x86/Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
  wireguard: selftests: remove CONFIG_SPARSEMEM_VMEMMAP=y from qemu
    kernel config
  mm/page_alloc: reject unreasonable folio/compound page sizes in
    alloc_contig_range_noprof()
  mm/memremap: reject unreasonable folio/compound page sizes in
    memremap_pages()
  mm/hugetlb: check for unreasonable folio sizes when registering hstate
  mm/mm_init: make memmap_init_compound() look more like
    prep_compound_page()
  mm/hugetlb: cleanup hugetlb_folio_init_tail_vmemmap()
  mm: sanity-check maximum folio size in folio_set_order()
  mm: limit folio/compound page sizes in problematic kernel configs
  mm: simplify folio_page() and folio_page_idx()
  mm/mm/percpu-km: drop nth_page() usage within single allocation
  fs: hugetlbfs: remove nth_page() usage within folio in
    adjust_range_hwpoison()
  mm/pagewalk: drop nth_page() usage within folio in folio_walk_start()
  mm/gup: drop nth_page() usage within folio when recording subpages
  io_uring/zcrx: remove "struct io_copy_cache" and one nth_page() usage
  io_uring/zcrx: remove nth_page() usage within folio
  mips: mm: convert __flush_dcache_pages() to
    __flush_dcache_folio_pages()
  mm/cma: refuse handing out non-contiguous page ranges
  dma-remap: drop nth_page() in dma_common_contiguous_remap()
  scatterlist: disallow non-contigous page ranges in a single SG entry
  ata: libata-eh: drop nth_page() usage within SG entry
  drm/i915/gem: drop nth_page() usage within SG entry
  mspro_block: drop nth_page() usage within SG entry
  memstick: drop nth_page() usage within SG entry
  mmc: drop nth_page() usage within SG entry
  scsi: core: drop nth_page() usage within SG entry
  vfio/pci: drop nth_page() usage within SG entry
  crypto: remove nth_page() usage within SG entry
  mm/gup: drop nth_page() usage in unpin_user_page_range_dirty_lock()
  kfence: drop nth_page() usage
  block: update comment of "struct bio_vec" regarding nth_page()
  mm: remove nth_page()

 arch/arm64/Kconfig                            |  1 -
 arch/mips/include/asm/cacheflush.h            | 11 +++--
 arch/mips/mm/cache.c                          |  8 ++--
 arch/s390/Kconfig                             |  1 -
 arch/x86/Kconfig                              |  1 -
 crypto/ahash.c                                |  4 +-
 crypto/scompress.c                            |  8 ++--
 drivers/ata/libata-sff.c                      |  6 +--
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  2 +-
 drivers/memstick/core/mspro_block.c           |  3 +-
 drivers/memstick/host/jmb38x_ms.c             |  3 +-
 drivers/memstick/host/tifm_ms.c               |  3 +-
 drivers/mmc/host/tifm_sd.c                    |  4 +-
 drivers/mmc/host/usdhi6rol0.c                 |  4 +-
 drivers/scsi/scsi_lib.c                       |  3 +-
 drivers/scsi/sg.c                             |  3 +-
 drivers/vfio/pci/pds/lm.c                     |  3 +-
 drivers/vfio/pci/virtio/migrate.c             |  3 +-
 fs/hugetlbfs/inode.c                          | 25 ++++------
 include/crypto/scatterwalk.h                  |  4 +-
 include/linux/bvec.h                          |  7 +--
 include/linux/mm.h                            | 48 +++++++++++++++----
 include/linux/page-flags.h                    |  5 +-
 include/linux/scatterlist.h                   |  4 +-
 io_uring/zcrx.c                               | 34 ++++---------
 kernel/dma/remap.c                            |  2 +-
 mm/Kconfig                                    |  3 +-
 mm/cma.c                                      | 36 +++++++++-----
 mm/gup.c                                      | 13 +++--
 mm/hugetlb.c                                  | 23 ++++-----
 mm/internal.h                                 |  1 +
 mm/kfence/core.c                              | 17 ++++---
 mm/memremap.c                                 |  3 ++
 mm/mm_init.c                                  | 13 ++---
 mm/page_alloc.c                               |  5 +-
 mm/pagewalk.c                                 |  2 +-
 mm/percpu-km.c                                |  2 +-
 mm/util.c                                     | 33 +++++++++++++
 tools/testing/scatterlist/linux/mm.h          |  1 -
 .../selftests/wireguard/qemu/kernel.config    |  1 -
 40 files changed, 203 insertions(+), 150 deletions(-)


base-commit: c0e3b3f33ba7b767368de4afabaf7c1ddfdc3872
-- 
2.50.1

