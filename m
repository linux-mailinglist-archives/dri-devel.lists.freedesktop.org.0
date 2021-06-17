Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348793AC3ED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 08:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC1A6E858;
	Fri, 18 Jun 2021 06:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1298 seconds by postgrey-1.36 at gabe;
 Fri, 18 Jun 2021 00:14:09 UTC
Received: from mail110.syd.optusnet.com.au (mail110.syd.optusnet.com.au
 [211.29.132.97])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5618E6E0BC;
 Fri, 18 Jun 2021 00:14:09 +0000 (UTC)
Received: from dread.disaster.area (pa49-179-138-183.pa.nsw.optusnet.com.au
 [49.179.138.183])
 by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id 2980A105DBE;
 Fri, 18 Jun 2021 09:52:27 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1lu1oA-00DzCu-Kc; Fri, 18 Jun 2021 09:52:26 +1000
Date: Fri, 18 Jun 2021 09:52:26 +1000
From: Dave Chinner <david@fromorbit.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 1/8] ext4/xfs: add page refcount helper
Message-ID: <20210617235226.GI664593@dread.disaster.area>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <20210617151705.15367-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617151705.15367-2-alex.sierra@amd.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0
 a=MnllW2CieawZLw/OcHE/Ng==:117 a=MnllW2CieawZLw/OcHE/Ng==:17
 a=kj9zAlcOel0A:10 a=r6YtysWOX24A:10 a=Ikd4Dj_1AAAA:8 a=zd2uoN0lAAAA:8
 a=7-415B0cAAAA:8 a=_NB1ZJQsyc3AttudJlgA:9 a=CjuIK1q_8ugA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mailman-Approved-At: Fri, 18 Jun 2021 06:32:09 +0000
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 10:16:58AM -0500, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
> 
> There are several places where ZONE_DEVICE struct pages assume a reference
> count == 1 means the page is idle and free. Instead of open coding this,
> add a helper function to hide this detail.
> 
> v2:
> [AS]: rename dax_layout_is_idle_page func to dax_page_unused

Did you even compile test this?

> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  fs/dax.c            |  4 ++--
>  fs/ext4/inode.c     |  5 +----
>  fs/xfs/xfs_file.c   |  4 +---
>  include/linux/dax.h | 10 ++++++++++
>  4 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 26d5dcd2d69e..321f4ddc6643 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
>  	for_each_mapped_pfn(entry, pfn) {
>  		struct page *page = pfn_to_page(pfn);
>  
> -		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
> +		WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));

Because you still use dax_layout_is_idle_page() here, not
dax_page_unused()...

>  		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
>  		page->mapping = NULL;
>  		page->index = 0;
> @@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
>  	for_each_mapped_pfn(entry, pfn) {
>  		struct page *page = pfn_to_page(pfn);
>  
> -		if (page_ref_count(page) > 1)
> +		if (!dax_layout_is_idle_page(page))

Here too.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
