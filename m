Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C27930221
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 00:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B5710E1B3;
	Fri, 12 Jul 2024 22:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Uih6pPFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DD110E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 22:32:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DB915CE1B59;
 Fri, 12 Jul 2024 22:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982EDC32782;
 Fri, 12 Jul 2024 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1720823543;
 bh=Sb9um4v6rFADbPuFfpnL5WI5TuACgL+7jpgXo5oNcXU=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=Uih6pPFiUkJDfccq0Q8NyMpzls0+QOKHTw6wxNJgTac8i/Ec+l85Gew9XW7IOfM3e
 TPJ2j1hYTNWj+oqMJZDcUkqfSKg7BwRWSf1Ng47d0KAGUStuj/mOrKigJPS2JOWmTi
 BskptDKHQE9N/DoZu3oYYTZPg2mc5LWBtC5GBpkk=
Date: Fri, 12 Jul 2024 15:32:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, SeongJae Park
 <sj@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>, Matthew Wilcox
 <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>, Peter Xu
 <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, "Christoph Hellwig" <hch@lst.de>, Dave Airlie
 <airlied@redhat.com>
Subject: Re: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for
 pinning memfd folios
Message-Id: <20240712153222.dfc15d0c3604eedb76e0ae52@linux-foundation.org>
In-Reply-To: <20240705155523.2f098948237715f8a0ffa56c@linux-foundation.org>
References: <20240624063952.1572359-4-vivek.kasireddy@intel.com>
 <20240705204825.109189-1-sj@kernel.org>
 <20240705142320.000b1e520b856b7c034bc829@linux-foundation.org>
 <IA0PR11MB7185570E3FCFAE3E7BDE7991F8DF2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20240705155523.2f098948237715f8a0ffa56c@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 5 Jul 2024 15:55:23 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Fri, 5 Jul 2024 22:11:14 +0000 "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:
> 
> > Hi Andrew and SJ, 
> > 
> > > 
> > > >
> > > > I didn't look deep into the patch, so unsure if that's a valid fix, though.
> > > > May I ask your thoughts?
> > > 
> > > Perhaps we should propagate the errno which was returned by
> > > try_grab_folio()?
> > > 
> > > I'll do it this way.  Vivek, please check and let us know?
> > Yeah, memfd_pin_folios() doesn't need the fast version, so replacing with
> > the slow version (try_grab_folio) should be fine. And, as you suggest,
> > propagating the errno returned by try_grab_folio() would be the right thing
> > to do instead of explicitly setting errno to -EINVAL. Either way, this change is
> > Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> Cool, thanks.
> 
> We could do this to propagate the try_grab_folio() return value:
> 
> --- a/mm/gup.c~mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-folios-fix-fix
> +++ a/mm/gup.c
> @@ -3848,6 +3848,8 @@ long memfd_pin_folios(struct file *memfd
>  
>  			next_idx = 0;
>  			for (i = 0; i < nr_found; i++) {
> +				int ret2;
> +
>  				/*
>  				 * As there can be multiple entries for a
>  				 * given folio in the batch returned by
> @@ -3860,10 +3862,10 @@ long memfd_pin_folios(struct file *memfd
>  					continue;
>  
>  				folio = page_folio(&fbatch.folios[i]->page);
> -
> -				if (try_grab_folio(folio, 1, FOLL_PIN)) {
> +				ret2 = try_grab_folio(folio, 1, FOLL_PIN);
> +				if (ret2) {
>  					folio_batch_release(&fbatch);
> -					ret = -EINVAL;
> +					ret = ret2;
>  					goto err;
>  				}
>  
> 
> But try_grab_folio can return that weird -EREMOTEIO.  The
> try_grab_folio() kerneldoc doesn't even mention that - it incorrectly
> claims that only -ENOMEM can be returned. (needs fixing!).
> 
> And if memfd_pin_folios() returns -EREMOTEIO then I expect
> udmabuf_ioctl() will return -EREMOTEIO to userspace.  And userspace
> will wonder "what the hell is that".  If there's a udmabuf_ioctl
> manpage then will that explain this errno?  And similar concerns for
> future callers of memfd_pin_folios().

-ENOREPLY.  I'll drop the above fixup.
