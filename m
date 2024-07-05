Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D685E928EC9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 23:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882CF10E050;
	Fri,  5 Jul 2024 21:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D+kPDDPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77210E033
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 21:23:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35E9462C97;
 Fri,  5 Jul 2024 21:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E7EC116B1;
 Fri,  5 Jul 2024 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1720214601;
 bh=/a2OUm7cxEflYbLigLsIP8POwXF3bZzqnywG6FfJ/ZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D+kPDDPmf4yGGvKmVH7Q0v21yRIpg6mUdgARvgpmskozk76aZ0ECPhAYzbjsPWQaa
 CmAK6+EPcDsMCnTIEsMbF82j3FTQXPZaEPwcomiKSLb5RCVwnuKGEBl8UYzIDB+jOT
 N+ABnAsU9J82j0XZULXmrSQkMc4A3zup8oBQxWDk=
Date: Fri, 5 Jul 2024 14:23:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: SeongJae Park <sj@kernel.org>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig
 <hch@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins
 <hughd@google.com>, Peter Xu <peterx@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>, Junxiao Chang
 <junxiao.chang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Christoph
 Hellwig <hch@lst.de>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for
 pinning memfd folios
Message-Id: <20240705142320.000b1e520b856b7c034bc829@linux-foundation.org>
In-Reply-To: <20240705204825.109189-1-sj@kernel.org>
References: <20240624063952.1572359-4-vivek.kasireddy@intel.com>
 <20240705204825.109189-1-sj@kernel.org>
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

On Fri,  5 Jul 2024 13:48:25 -0700 SeongJae Park <sj@kernel.org> wrote:

> > + * memfd_pin_folios() - pin folios associated with a memfd
> [...]
> > +			for (i = 0; i < nr_found; i++) {
> > +				/*
> > +				 * As there can be multiple entries for a
> > +				 * given folio in the batch returned by
> > +				 * filemap_get_folios_contig(), the below
> > +				 * check is to ensure that we pin and return a
> > +				 * unique set of folios between start and end.
> > +				 */
> > +				if (next_idx &&
> > +				    next_idx != folio_index(fbatch.folios[i]))
> > +					continue;
> > +
> > +				folio = try_grab_folio(&fbatch.folios[i]->page,
> > +						       1, FOLL_PIN);
> > +				if (!folio) {
> > +					folio_batch_release(&fbatch);
> > +					ret = -EINVAL;
> > +					goto err;
> > +				}
> 
> I found this patch is applied on mm-unstable as commit 7618d1ff59ef ("mm/gup:
> introduce memfd_pin_folios() for pinning memfd folios").  Somehow, however, the
> commit has changd the above try_grab_folio() call to try_grab_folio_fast()
> call.
> 
> As a result, building kernel without CONFIG_MMU fais as below:
> 
> ...
>
> Maybe the change has made to fix conflict with another mm-unstable commit
> 02a2d55767d1 ("mm: gup: stop abusing try_grab_folio"), but forgot the
> CONFIG_MMU unset case?

Yes.  That patch didn't add a CONFIG_MMU=n version of
try_grab_folio_fast().  Maybe it should have?

> I confirmed the failure disappears after further cleanup like below:
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 46a266ed84f7..9f4902425070 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3859,9 +3859,9 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
>                                     next_idx != folio_index(fbatch.folios[i]))
>                                         continue;
> 
> -                               folio = try_grab_folio_fast(&fbatch.folios[i]->page,
> -                                                      1, FOLL_PIN);
> -                               if (!folio) {
> +                               folio = page_folio(&fbatch.folios[i]->page);
> +
> +                               if (try_grab_folio(folio, 1, FOLL_PIN)) {
>                                         folio_batch_release(&fbatch);
>                                         ret = -EINVAL;
>                                         goto err;
> 
> I didn't look deep into the patch, so unsure if that's a valid fix, though.
> May I ask your thoughts?

Perhaps we should propagate the errno which was returned by
try_grab_folio()?

I'll do it this way.  Vivek, please check and let us know?
