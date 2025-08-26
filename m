Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB7AB37B83
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE1C10E71F;
	Wed, 27 Aug 2025 07:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 308DD10E2FE;
 Tue, 26 Aug 2025 13:11:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C1B82BF2;
 Tue, 26 Aug 2025 06:11:36 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B7A13F63F;
 Tue, 26 Aug 2025 06:11:36 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:11:34 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 21/35] mm/cma: refuse handing out non-contiguous page
 ranges
Message-ID: <aK2yhtQ0M_0hqQHh@raptor>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-22-david@redhat.com>
 <aK2QZnzS1ErHK5tP@raptor>
 <ad521f4f-47aa-4728-916f-3704bf01f770@redhat.com>
 <aK2wlGYvCaFQXzBm@raptor>
 <ecc599ee-4175-4356-ab66-1d76a75f44f7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecc599ee-4175-4356-ab66-1d76a75f44f7@redhat.com>
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

Hi David,

On Tue, Aug 26, 2025 at 03:08:08PM +0200, David Hildenbrand wrote:
> On 26.08.25 15:03, Alexandru Elisei wrote:
> > Hi David,
> > 
> > On Tue, Aug 26, 2025 at 01:04:33PM +0200, David Hildenbrand wrote:
> > ..
> > > > Just so I can better understand the problem being fixed, I guess you can have
> > > > two consecutive pfns with non-consecutive associated struct page if you have two
> > > > adjacent memory sections spanning the same physical memory region, is that
> > > > correct?
> > > 
> > > Exactly. Essentially on SPARSEMEM without SPARSEMEM_VMEMMAP it is not
> > > guaranteed that
> > > 
> > > 	pfn_to_page(pfn + 1) == pfn_to_page(pfn) + 1
> > > 
> > > when we cross memory section boundaries.
> > > 
> > > It can be the case for early boot memory if we allocated consecutive areas
> > > from memblock when allocating the memmap (struct pages) per memory section,
> > > but it's not guaranteed.
> > 
> > Thank you for the explanation, but I'm a bit confused by the last paragraph. I
> > think what you're saying is that we can also have the reverse problem, where
> > consecutive struct page * represent non-consecutive pfns, because memmap
> > allocations happened to return consecutive virtual addresses, is that right?
> 
> Exactly, that's something we have to deal with elsewhere [1]. For this code,
> it's not a problem because we always allocate a contiguous PFN range.
> 
> > 
> > If that's correct, I don't think that's the case for CMA, which deals out
> > contiguous physical memory. Or were you just trying to explain the other side of
> > the problem, and I'm just overthinking it?
> 
> The latter :)

Ok, sorry for the noise then, and thank you for educating me.

Alex
