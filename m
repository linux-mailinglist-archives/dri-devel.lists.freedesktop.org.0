Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D828838F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4C56EC59;
	Fri,  9 Oct 2020 07:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1476E3D6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hGKd+b2PDJmrK7I1iaMWnsLEdLIJgUmIc968eU6gSGI=; b=hb3caxEsSqO2SAWuEx6k9VmjRr
 FvNBTft8RFWbxyohm5ZUhu8/5X3568bQwHEoiT9s98I1JvRYqWV1/kSqOMCb/e6M5RAV8p7rmbU3P
 6ROo6LQMBEmE9j8mT0U0pdoi++QC3zcCtZ2QIrk2ikW86SWW058+DQxyRxqvMpG8z+9NNH/mfrw/G
 5K7WGWC74Yo5BYUFTZ2g7EpA+UsW6PGHbbhphz1Qw/DbSrduMVtDe7OFcPaRfgvfW88uv1fEp6CDv
 1BTYCkHodojnaCPQypJ6Ju8WQPucPEHuKiAMMjw/RP7YR27aMzhPwJNwCVkusYRFHKcxHM5czDT31
 HW4yfhfQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQUGn-0001yz-7F; Thu, 08 Oct 2020 11:39:37 +0000
Date: Thu, 8 Oct 2020 12:39:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
Message-ID: <20201008113937.GB20115@casper.infradead.org>
References: <20201008112342.9394-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 01:23:39PM +0200, Christian K=F6nig wrote:
>  drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
>  drivers/gpu/drm/msm/msm_gem.c              |  4 +---
>  drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
>  drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
>  drivers/staging/android/ashmem.c           |  5 ++---
...
> +++ b/mm/mmap.c
> @@ -136,6 +136,22 @@ void vma_set_page_prot(struct vm_area_struct *vma)
>  	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
>  }
>  =

> +/*
> + * Change backing file, only valid to use during initial VMA setup.
> + */
> +struct file *vma_set_file(struct vm_area_struct *vma, struct file *file)
> +{
> +	if (file)
> +	        get_file(file);
> +
> +	swap(vma->vm_file, file);
> +
> +	if (file)
> +		fput(file);
> +
> +	return file;
> +}
> +

These users are all potentially modules.  You need an EXPORT_SYMBOL()?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
