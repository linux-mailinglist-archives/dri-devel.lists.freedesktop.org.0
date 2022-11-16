Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C462B81C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 11:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681910E45F;
	Wed, 16 Nov 2022 10:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3FC10E464
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668594451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/1/81f1bc3wgoHEbP5M1Zz0wSDu9jba91U8WGSjmQ70=;
 b=e1M9s4gqkBjWjhaHdv5dZVntGSCNW6DHidB7l28EZ8NCHGBc83qVS+1VeuJ0pURCNrOgD7
 51/MCn2DFACcrQx3b1heh5mPkwNJ5lJ6dIzxjJq7l5AGDujHsNQhTnr79V6tdDB+O4qgt/
 RAWlDzxGVJlorIFAZz1I6paLFiX4AU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-_PUeKXqLO9GD6bVT-vux3w-1; Wed, 16 Nov 2022 05:27:26 -0500
X-MC-Unique: _PUeKXqLO9GD6bVT-vux3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71F03101A528;
 Wed, 16 Nov 2022 10:27:23 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6687D2024CCA;
 Wed, 16 Nov 2022 10:27:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 00/20] mm/gup: remove FOLL_FORCE usage from
 drivers (reliable R/O long-term pinning)
Date: Wed, 16 Nov 2022 11:26:39 +0100
Message-Id: <20221116102659.70287-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Leon Romanovsky <leonro@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christoph Hellwig <hch@infradead.org>, Matt Turner <mattst88@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Walls <awalls@md.metrocast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Benvenuti <benve@cisco.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nadav Amit <namit@vmware.com>,
 Shuah Khan <shuah@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 Hugh Dickins <hughd@google.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-media@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 linux-arm-kernel@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Eric Biederman <ebiederm@xmission.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, linux-kselftest@vger.kernel.org,
 Will Deacon <will@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Bernard Metzler <bmt@zurich.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Tomasz Figa <tfiga@chromium.org>,
 linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Nelson Escobar <neescoba@cisco.com>, Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, linux-security-module@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <ogabbay@kernel.org>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For now, we did not support reliable R/O long-term pinning in COW mappings.
That means, if we would trigger R/O long-term pinning in MAP_PRIVATE
mapping, we could end up pinning the (R/O-mapped) shared zeropage or a
pagecache page.

The next write access would trigger a write fault and replace the pinned
page by an exclusive anonymous page in the process page table; whatever the
process would write to that private page copy would not be visible by the
owner of the previous page pin: for example, RDMA could read stale data.
The end result is essentially an unexpected and hard-to-debug memory
corruption.

Some drivers tried working around that limitation by using
"FOLL_FORCE|FOLL_WRITE|FOLL_LONGTERM" for R/O long-term pinning for now.
FOLL_WRITE would trigger a write fault, if required, and break COW before
pinning the page. FOLL_FORCE is required because the VMA might lack write
permissions, and drivers wanted to make that working as well, just like
one would expect (no write access, but still triggering a write access to
break COW).

However, that is not a practical solution, because
(1) Drivers that don't stick to that undocumented and debatable pattern
    would still run into that issue. For example, VFIO only uses
    FOLL_LONGTERM for R/O long-term pinning.
(2) Using FOLL_WRITE just to work around a COW mapping + page pinning
    limitation is unintuitive. FOLL_WRITE would, for example, mark the
    page softdirty or trigger uffd-wp, even though, there actually isn't
    going to be any write access.
(3) The purpose of FOLL_FORCE is debug access, not access without lack of
    VMA permissions by arbitrarty drivers.

So instead, make R/O long-term pinning work as expected, by breaking COW
in a COW mapping early, such that we can remove any FOLL_FORCE usage from
drivers and make FOLL_FORCE ptrace-specific (renaming it to FOLL_PTRACE).
More details in patch #8.

Patches #1--#3 add COW tests for non-anonymous pages.
Patches #4--#7 prepare core MM for extended FAULT_FLAG_UNSHARE support in
COW mappings.
Patch #8 implements reliable R/O long-term pinning in COW mappings
Patches #9--#19 remove any FOLL_FORCE usage from drivers.
Patch #20 renames FOLL_FORCE to FOLL_PTRACE.

I'm refraining from CCing all driver/arch maintainers on the whole patch
set, but only CC them on the cover letter and the applicable patch
(I know, I know, someone is always unhappy ... sorry).

RFC -> v1:
* Use term "ptrace" instead of "debuggers" in patch descriptions
* Added ACK/Tested-by
* "mm/frame-vector: remove FOLL_FORCE usage"
 -> Adjust description
* "mm: rename FOLL_FORCE to FOLL_PTRACE"
 -> Added

David Hildenbrand (20):
  selftests/vm: anon_cow: prepare for non-anonymous COW tests
  selftests/vm: cow: basic COW tests for non-anonymous pages
  selftests/vm: cow: R/O long-term pinning reliability tests for
    non-anon pages
  mm: add early FAULT_FLAG_UNSHARE consistency checks
  mm: add early FAULT_FLAG_WRITE consistency checks
  mm: rework handling in do_wp_page() based on private vs. shared
    mappings
  mm: don't call vm_ops->huge_fault() in wp_huge_pmd()/wp_huge_pud() for
    private mappings
  mm: extend FAULT_FLAG_UNSHARE support to anything in a COW mapping
  mm/gup: reliable R/O long-term pinning in COW mappings
  RDMA/umem: remove FOLL_FORCE usage
  RDMA/usnic: remove FOLL_FORCE usage
  RDMA/siw: remove FOLL_FORCE usage
  media: videobuf-dma-sg: remove FOLL_FORCE usage
  drm/etnaviv: remove FOLL_FORCE usage
  media: pci/ivtv: remove FOLL_FORCE usage
  mm/frame-vector: remove FOLL_FORCE usage
  drm/exynos: remove FOLL_FORCE usage
  RDMA/hw/qib/qib_user_pages: remove FOLL_FORCE usage
  habanalabs: remove FOLL_FORCE usage
  mm: rename FOLL_FORCE to FOLL_PTRACE

 arch/alpha/kernel/ptrace.c                    |   6 +-
 arch/arm64/kernel/mte.c                       |   2 +-
 arch/ia64/kernel/ptrace.c                     |  10 +-
 arch/mips/kernel/ptrace32.c                   |   4 +-
 arch/mips/math-emu/dsemul.c                   |   2 +-
 arch/powerpc/kernel/ptrace/ptrace32.c         |   4 +-
 arch/sparc/kernel/ptrace_32.c                 |   4 +-
 arch/sparc/kernel/ptrace_64.c                 |   8 +-
 arch/x86/kernel/step.c                        |   2 +-
 arch/x86/um/ptrace_32.c                       |   2 +-
 arch/x86/um/ptrace_64.c                       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |   2 +-
 drivers/infiniband/core/umem.c                |   8 +-
 drivers/infiniband/hw/qib/qib_user_pages.c    |   2 +-
 drivers/infiniband/hw/usnic/usnic_uiom.c      |   9 +-
 drivers/infiniband/sw/siw/siw_mem.c           |   9 +-
 drivers/media/common/videobuf2/frame_vector.c |   2 +-
 drivers/media/pci/ivtv/ivtv-udma.c            |   2 +-
 drivers/media/pci/ivtv/ivtv-yuv.c             |   5 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  14 +-
 drivers/misc/habanalabs/common/memory.c       |   3 +-
 fs/exec.c                                     |   2 +-
 fs/proc/base.c                                |   2 +-
 include/linux/mm.h                            |  35 +-
 include/linux/mm_types.h                      |   8 +-
 kernel/events/uprobes.c                       |   4 +-
 kernel/ptrace.c                               |  12 +-
 mm/gup.c                                      |  38 +-
 mm/huge_memory.c                              |  13 +-
 mm/hugetlb.c                                  |  14 +-
 mm/memory.c                                   |  97 +++--
 mm/util.c                                     |   4 +-
 security/tomoyo/domain.c                      |   2 +-
 tools/testing/selftests/vm/.gitignore         |   2 +-
 tools/testing/selftests/vm/Makefile           |  10 +-
 tools/testing/selftests/vm/check_config.sh    |   4 +-
 .../selftests/vm/{anon_cow.c => cow.c}        | 387 +++++++++++++++++-
 tools/testing/selftests/vm/run_vmtests.sh     |   8 +-
 39 files changed, 575 insertions(+), 177 deletions(-)
 rename tools/testing/selftests/vm/{anon_cow.c => cow.c} (75%)

-- 
2.38.1

