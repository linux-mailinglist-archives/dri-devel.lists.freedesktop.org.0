Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6921FF80D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17206EB69;
	Thu, 18 Jun 2020 15:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D516EB69
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:51:42 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jlwpE-0005mk-KY; Thu, 18 Jun 2020 17:51:36 +0200
Message-ID: <be88faf0aa10d1c71dbf2c22e6c72623d4598a0c.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: convert get_user_pages() -->
 pin_user_pages()
From: Lucas Stach <l.stach@pengutronix.de>
To: John Hubbard <jhubbard@nvidia.com>
Date: Thu, 18 Jun 2020 17:51:34 +0200
In-Reply-To: <20200525234946.512848-1-jhubbard@nvidia.com>
References: <20200525234946.512848-1-jhubbard@nvidia.com>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, den 25.05.2020, 16:49 -0700 schrieb John Hubbard:
> This code was using get_user_pages*(), in a "Case 2" scenario
> (DMA/RDMA), using the categorization from [1]. That means that it's
> time to convert the get_user_pages*() + put_page() calls to
> pin_user_pages*() + unpin_user_pages() calls.
> 
> There is some helpful background in [2]: basically, this is a small
> part of fixing a long-standing disconnect between pinning pages, and
> file systems' use of those pages.
> 
> [1] Documentation/core-api/pin_user_pages.rst
> 
> [2] "Explicit pinning of user-space pages":
>     https://lwn.net/Articles/807108/
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Thanks, I've applied this to etnaviv/next.

Regards,
Lucas

> ---
> 
> Hi,
> 
> Changes since v1:
> 
> * Rebased onto Linux 5.7-rc7
> 
> * Added: Lucas Stach
> 
> thanks
> John Hubbard
> NVIDIA
> 
> 
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index dc9ef302f517..0f4578dc169d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -675,10 +675,10 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
>  		uint64_t ptr = userptr->ptr + pinned * PAGE_SIZE;
>  		struct page **pages = pvec + pinned;
>  
> -		ret = get_user_pages_fast(ptr, num_pages,
> +		ret = pin_user_pages_fast(ptr, num_pages,
>  					  !userptr->ro ? FOLL_WRITE : 0, pages);
>  		if (ret < 0) {
> -			release_pages(pvec, pinned);
> +			unpin_user_pages(pvec, pinned);
>  			kvfree(pvec);
>  			return ret;
>  		}
> @@ -702,7 +702,7 @@ static void etnaviv_gem_userptr_release(struct etnaviv_gem_object *etnaviv_obj)
>  	if (etnaviv_obj->pages) {
>  		int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
>  
> -		release_pages(etnaviv_obj->pages, npages);
> +		unpin_user_pages(etnaviv_obj->pages, npages);
>  		kvfree(etnaviv_obj->pages);
>  	}
>  }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
