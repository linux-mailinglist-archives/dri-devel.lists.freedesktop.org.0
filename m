Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7C3FE568
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 00:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BD66E3CE;
	Wed,  1 Sep 2021 22:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1136 seconds by postgrey-1.36 at gabe;
 Wed, 01 Sep 2021 22:22:11 UTC
Received: from mail110.syd.optusnet.com.au (mail110.syd.optusnet.com.au
 [211.29.132.97])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BA6D6E3CE;
 Wed,  1 Sep 2021 22:22:11 +0000 (UTC)
Received: from dread.disaster.area (pa49-195-182-146.pa.nsw.optusnet.com.au
 [49.195.182.146])
 by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id 19347110DA0;
 Thu,  2 Sep 2021 08:03:09 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1mLYK4-007bho-FA; Thu, 02 Sep 2021 08:03:08 +1000
Date: Thu, 2 Sep 2021 08:03:08 +1000
From: Dave Chinner <david@fromorbit.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Christoph Hellwig <hch@lst.de>,
 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
Message-ID: <20210901220308.GL2566745@dread.disaster.area>
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com>
 <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
 <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com>
 <20210830082800.GA6836@lst.de>
 <e40b3b79-f548-b87b-7a85-f654f25ed8dd@amd.com>
 <20210901082925.GA21961@lst.de>
 <11d64457-9d61-f82d-6c98-d68762dce85d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11d64457-9d61-f82d-6c98-d68762dce85d@amd.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0
 a=QpfB3wCSrn/dqEBSktpwZQ==:117 a=QpfB3wCSrn/dqEBSktpwZQ==:17
 a=kj9zAlcOel0A:10 a=7QKq2e-ADPsA:10 a=7-415B0cAAAA:8
 a=f3XvwggIp9kaoS7fsTAA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
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

On Wed, Sep 01, 2021 at 11:40:43AM -0400, Felix Kuehling wrote:
> 
> Am 2021-09-01 um 4:29 a.m. schrieb Christoph Hellwig:
> > On Mon, Aug 30, 2021 at 01:04:43PM -0400, Felix Kuehling wrote:
> >>>> driver code is not really involved in updating the CPU mappings. Maybe
> >>>> it's something we need to do in the migration helpers.
> >>> It looks like I'm totally misunderstanding what you are adding here
> >>> then.  Why do we need any special treatment at all for memory that
> >>> has normal struct pages and is part of the direct kernel map?
> >> The pages are like normal memory for purposes of mapping them in CPU
> >> page tables and for coherent access from the CPU.
> > That's the user page tables.  What about the kernel direct map?
> > If there is a normal kernel struct page backing there really should
> > be no need for the pgmap.
> 
> I'm not sure. The physical address ranges are in the UEFI system address
> map as special-purpose memory. Does Linux create the struct pages and
> kernel direct map for that without a pgmap call? I didn't see that last
> time I went digging through that code.
> 
> 
> >
> >> From an application
> >> perspective, we want file-backed and anonymous mappings to be able to
> >> use DEVICE_PUBLIC pages with coherent CPU access. The goal is to
> >> optimize performance for GPU heavy workloads while minimizing the need
> >> to migrate data back-and-forth between system memory and device memory.
> > I don't really understand that part.  file backed pages are always
> > allocated by the file system using the pagecache helpers, that is
> > using the page allocator.  Anonymouns memory also always comes from
> > the page allocator.
> 
> I'm coming at this from my experience with DEVICE_PRIVATE. Both
> anonymous and file-backed pages should be migrateable to DEVICE_PRIVATE
> memory by the migrate_vma_* helpers for more efficient access by our
> GPU. (*) It's part of the basic premise of HMM as I understand it. I
> would expect the same thing to work for DEVICE_PUBLIC memory.
> 
> (*) I believe migrating file-backed pages to DEVICE_PRIVATE doesn't
> currently work, but that's something I'm hoping to fix at some point.

FWIW, I'd love to see the architecture documents that define how
filesystems are supposed to interact with this device private
memory. This whole "hand filesystem controlled memory to other
devices" is a minefield that is trivial to get wrong iand very
difficult to fix - just look at the historical mess that RDMA
to/from file backed and/or DAX pages has been.

So, really, from my perspective as a filesystem engineer, I want to
see an actual specification for how this new memory type is going to
interact with filesystem and the page cache so everyone has some
idea of how this is going to work and can point out how it doesn't
work before code that simply doesn't work is pushed out into
production systems and then merged....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
