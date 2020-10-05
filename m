Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C3283DC0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 19:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4690389B7D;
	Mon,  5 Oct 2020 17:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAB389B7D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 17:53:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EAA9ADDF;
 Mon,  5 Oct 2020 17:53:09 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4D3281E12F3; Mon,  5 Oct 2020 19:53:08 +0200 (CEST)
Date: Mon, 5 Oct 2020 19:53:08 +0200
From: Jan Kara <jack@suse.cz>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005175308.GI4225@quack2.suse.cz>
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 linux-mm@kvack.org, Hans Verkuil <hans.verkuil@cisco.com>,
 Mel Gorman <mgorman@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 05-10-20 14:38:54, Jason Gunthorpe wrote:
> When get_vaddr_frames() does its hacky follow_pfn() loop it should never
> be allowed to extract a struct page from a normal VMA. This could allow a
> serious use-after-free problem on any kernel memory.
> 
> Restrict this to only work on VMA's with one of VM_IO | VM_PFNMAP
> set. This limits the use-after-free problem to only IO memory, which while
> still serious, is an improvement.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  mm/frame_vector.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> index 10f82d5643b6de..26cb20544b6c37 100644
> --- a/mm/frame_vector.c
> +++ b/mm/frame_vector.c
> @@ -99,6 +99,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>  		if (ret >= nr_frames || start < vma->vm_end)
>  			break;
>  		vma = find_vma_intersection(mm, start, start + 1);
> +		if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  	} while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));

Hum, I fail to see how this helps. If vma has no VM_IO or VM_PFNMAP flag,
we'd exit the loop (to out: label) anyway due to the loop termination
condition and why not return the frames we already have? Furthermore
find_vma_intersection() can return NULL which would oops in your check
then. What am I missing?

								Honza

>  out:
>  	if (locked)
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
