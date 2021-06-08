Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE639FDD1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3806E3F7;
	Tue,  8 Jun 2021 17:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14D6E3F7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:36:01 +0000 (UTC)
IronPort-SDR: PlgMlviH3D+oP7V0036mDxijwwNcwZEjGnI06m3SuqEnhbO5GwfYpqOas5/iafB1bEH9gU/o2d
 Acxp7qsqtbuA==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="204861870"
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; d="scan'208";a="204861870"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 10:36:00 -0700
IronPort-SDR: NWRtmws0IGY1Cln2m/l4XE0Y2Xe6pE1R1Oxh2QxUn1vL6xpyHQM2uJQwC/WyAthRtze2Z6RwKh
 e318OU2lkvPQ==
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; d="scan'208";a="413452701"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.212.5.106])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 10:36:00 -0700
Date: Tue, 8 Jun 2021 10:35:58 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] udmabuf: Add support for mapping hugepages (v3)
Message-ID: <20210608173558.GB432@dongwonk-MOBL.amr.corp.intel.com>
References: <20210604055903.g2bp4vuay2555omg@sirius.home.kraxel.org>
 <20210604205939.376598-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604205939.376598-1-vivek.kasireddy@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I see the number of entries in the list often exceeds list_limit
currently hardcoded to 1024 for full HD scanout resource (==
1920*1080*4 bytes). Can we include a change to increase it to something
like 4096 or higher in this patch?

On Fri, Jun 04, 2021 at 01:59:39PM -0700, Vivek Kasireddy wrote:
> If the VMM's (Qemu) memory backend is backed up by memfd + Hugepages
> (hugetlbfs and not THP), we have to first find the hugepage(s) where
> the Guest allocations are located and then extract the regular 4k
> sized subpages from them.
> 
> v2: Ensure that the subpage and hugepage offsets are calculated correctly
> when the range of subpage allocations cuts across multiple hugepages.
> 
> v3: Instead of repeatedly looking up the hugepage for each subpage,
> only do it when the subpage allocation crosses over into a different
> hugepage. (suggested by Gerd and DW)
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/dma-buf/udmabuf.c | 51 +++++++++++++++++++++++++++++++++------
>  1 file changed, 44 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index db732f71e59a..2e02bbfe30fd 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -11,6 +11,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
>  #include <linux/udmabuf.h>
> +#include <linux/hugetlb.h>
>  
>  static const u32    list_limit = 1024;  /* udmabuf_create_list->count limit */
>  static const size_t size_limit_mb = 64; /* total dmabuf size, in megabytes  */
> @@ -163,7 +164,9 @@ static long udmabuf_create(struct miscdevice *device,
>  	struct udmabuf *ubuf;
>  	struct dma_buf *buf;
>  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
> -	struct page *page;
> +	struct page *page, *hpage = NULL;
> +	pgoff_t subpgoff, maxsubpgs;
> +	struct hstate *hpstate;
>  	int seals, ret = -EINVAL;
>  	u32 i, flags;
>  
> @@ -194,7 +197,8 @@ static long udmabuf_create(struct miscdevice *device,
>  		memfd = fget(list[i].memfd);
>  		if (!memfd)
>  			goto err;
> -		if (!shmem_mapping(file_inode(memfd)->i_mapping))
> +		if (!shmem_mapping(file_inode(memfd)->i_mapping) &&
> +		    !is_file_hugepages(memfd))
>  			goto err;
>  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
>  		if (seals == -EINVAL)
> @@ -205,17 +209,50 @@ static long udmabuf_create(struct miscdevice *device,
>  			goto err;
>  		pgoff = list[i].offset >> PAGE_SHIFT;
>  		pgcnt = list[i].size   >> PAGE_SHIFT;
> +		if (is_file_hugepages(memfd)) {
> +			hpstate = hstate_file(memfd);
> +			pgoff = list[i].offset >> huge_page_shift(hpstate);
> +			subpgoff = (list[i].offset &
> +				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
> +			maxsubpgs = huge_page_size(hpstate) >> PAGE_SHIFT;
> +		}
>  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
> -			page = shmem_read_mapping_page(
> -				file_inode(memfd)->i_mapping, pgoff + pgidx);
> -			if (IS_ERR(page)) {
> -				ret = PTR_ERR(page);
> -				goto err;
> +			if (is_file_hugepages(memfd)) {
> +				if (!hpage) {
> +					hpage = find_get_page_flags(
> +						file_inode(memfd)->i_mapping,
> +						pgoff, FGP_ACCESSED);
> +					if (IS_ERR(hpage)) {
> +						ret = PTR_ERR(hpage);
> +						goto err;
> +					}
> +				}
> +				page = hpage + subpgoff;
> +				get_page(page);
> +				subpgoff++;
> +				if (subpgoff == maxsubpgs) {
> +					put_page(hpage);
> +					hpage = NULL;
> +					subpgoff = 0;
> +					pgoff++;
> +				}
> +			} else {
> +				page = shmem_read_mapping_page(
> +					file_inode(memfd)->i_mapping,
> +					pgoff + pgidx);
> +				if (IS_ERR(page)) {
> +					ret = PTR_ERR(page);
> +					goto err;
> +				}
>  			}
>  			ubuf->pages[pgbuf++] = page;
>  		}
>  		fput(memfd);
>  		memfd = NULL;
> +		if (hpage) {
> +			put_page(hpage);
> +			hpage = NULL;
> +		}
>  	}
>  
>  	exp_info.ops  = &udmabuf_ops;
> -- 
> 2.30.2
> 
