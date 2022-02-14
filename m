Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5924B6443
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EB310E3A0;
	Tue, 15 Feb 2022 07:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C6210E23E;
 Mon, 14 Feb 2022 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=81T6G2gHhfqrUwjVu5v8ouNRyx7VLTFiBZVLTO5rh/c=; b=Xd5rMP5hIZ0JwEE5p27UvD5QtH
 uCKd6i9XJg/PaBgi6VN01LvkTgzF6dtOL5wLEtbJtX37eKseK5Y7oQ9o/s1OPdTKqfznafrAyROqV
 MvNbDVdIgTbNEkyIOgzIBP6oTlTRCMIEBnG1ruZ9t2c+8ikid2c3sF1JDRXcbRnWRXDMHGWWDcI1t
 p6ha2v4ejdP6uPSa5r0VHjlrYpIXkaGki0cX0XXachfz6/U5Ll/GgQATG132vKqIk5mo62p6fk+SE
 gfw5DLnPL8RNLsPVhaaXiA+obF/x9nVyln4voBum/rQ3jkIgpv60w8nBYNSDluMB6z4KrGgNUk6NQ
 OxLOcjaw==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <logang@deltatee.com>)
 id 1nJfIJ-0004H9-Iu; Mon, 14 Feb 2022 10:37:48 -0700
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
References: <20220210072828.2930359-1-hch@lst.de>
 <20220210072828.2930359-10-hch@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <fd1338fb-ed28-19c3-bd86-350939d58226@deltatee.com>
Date: Mon, 14 Feb 2022 10:37:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220210072828.2930359-10-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, nvdimm@lists.linux.dev,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rcampbell@nvidia.com, apopple@nvidia.com, jgg@ziepe.ca, lyude@redhat.com,
 kherbst@redhat.com, bskeggs@redhat.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 dan.j.williams@intel.com, akpm@linux-foundation.org, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_FREE,NICE_REPLY_A,T_SCC_BODY_TEXT_LINE autolearn=no
 autolearn_force=no version=3.4.6
Subject: Re: [PATCH 09/27] mm: generalize the pgmap based page_free
 infrastructure
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Tue, 15 Feb 2022 07:25:06 +0000
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-10 12:28 a.m., Christoph Hellwig wrote:
> Key off on the existence of ->page_free to prepare for adding support for
> more pgmap types that are device managed and thus need the free callback.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Great! This makes my patch simpler.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>


> ---
>  mm/memremap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index fef5734d5e4933..e00ffcdba7b632 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -452,7 +452,7 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  
>  void free_zone_device_page(struct page *page)
>  {
> -	if (WARN_ON_ONCE(!is_device_private_page(page)))
> +	if (WARN_ON_ONCE(!page->pgmap->ops || !page->pgmap->ops->page_free))
>  		return;
>  
>  	__ClearPageWaiters(page);
> @@ -460,7 +460,7 @@ void free_zone_device_page(struct page *page)
>  	mem_cgroup_uncharge(page_folio(page));
>  
>  	/*
> -	 * When a device_private page is freed, the page->mapping field
> +	 * When a device managed page is freed, the page->mapping field
>  	 * may still contain a (stale) mapping value. For example, the
>  	 * lower bits of page->mapping may still identify the page as an
>  	 * anonymous page. Ultimately, this entire field is just stale
> 
