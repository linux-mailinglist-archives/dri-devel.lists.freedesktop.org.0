Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8271E3C87
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D72896E9;
	Wed, 27 May 2020 08:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FCF896E9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:48:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x14so17798531wrp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=VqFFiZfGTbc8P2V8UkxE4/9YOD3nXn4RELpwJoqQ81I=;
 b=EMK4bcnQ7/+Q5MfW9rh9+O6CGjH+D8d4W+4xa0rWGd2pgNmC1N2cxia66QgtL8hkJ6
 kVJ283VUAzpEMylrepZH+71qgNpQvQ36boHdljw3jencpgVYymWr5N1wvioH4/r5ZMfW
 vLdRrBL31nK8Ib/W5DsqFKci93EFPmviaeEmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=VqFFiZfGTbc8P2V8UkxE4/9YOD3nXn4RELpwJoqQ81I=;
 b=KkQ6JNUTO8WFEVIohbfIFWbOTexqam7ruS0/2h3SNzpQjgJYjBHcJuyYrpFaRk/Pl7
 QD+HrzolSfPm1eY6KqszsRUHR1TMlQYVVM+kc3I+bsZcIsq12a4KarihdOxICOPLbOPP
 jq/NJgH1evDN+nrZgZs2vKztA20WPIihzdE5pQvsN6/WHyqwx2NrmxlVzSBkPmSybJfl
 0wWNGU4SmF0xtZZWLnWLw+vL43lCWtmP2rW/QcVYG4EzmcuEgemfzQLLzrjX5xz6jOpC
 8Xgq9JtvGUpeJ8Vfmf+hyhjaL3uGOhCFN3p53QweAZUg08uQ4mp195lF/OmXC1+RdunE
 Nllg==
X-Gm-Message-State: AOAM533v63zfwsA1fCbUyDRN4oQn/grQavtYL8BzapnEOGoJkyS1mhgx
 l8HgnV3qFAu1CY2fyqp/fwy/ug==
X-Google-Smtp-Source: ABdhPJxBgHLELumDQ6KR3S9SHzcOIiQ+gJIdtc/ogj+uZAf3f2SROpvRAbWhfyAQGSzLHPcAGpjB9Q==
X-Received: by 2002:a5d:608d:: with SMTP id w13mr23428615wrt.298.1590569334883; 
 Wed, 27 May 2020 01:48:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 1sm2112167wms.25.2020.05.27.01.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 01:48:54 -0700 (PDT)
Date: Wed, 27 May 2020 10:48:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] drm/radeon: Convert get_user_pages() --> pin_user_pages()
Message-ID: <20200527084852.GN206103@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1590526802-3008-1-git-send-email-jrdr.linux@gmail.com>
 <69a033cf-63b2-7da6-6a5e-a5bbc94b8afb@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69a033cf-63b2-7da6-6a5e-a5bbc94b8afb@nvidia.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 03:57:45PM -0700, John Hubbard wrote:
> On 2020-05-26 14:00, Souptick Joarder wrote:
> > This code was using get_user_pages(), in a "Case 2" scenario
> > (DMA/RDMA), using the categorization from [1]. That means that it's
> > time to convert the get_user_pages() + release_pages() calls to
> > pin_user_pages() + unpin_user_pages() calls.
> > 
> > There is some helpful background in [2]: basically, this is a small
> > part of fixing a long-standing disconnect between pinning pages, and
> > file systems' use of those pages.
> > 
> > [1] Documentation/core-api/pin_user_pages.rst
> > 
> > [2] "Explicit pinning of user-space pages":
> >      https://lwn.net/Articles/807108/

I don't think this is a case 2 here, nor is it any of the others. Feels
like not covered at all by the doc.

radeon has a mmu notifier (might be a bit broken, but hey whatever there's
other drivers which have the same concept, but less broken). So when you
do an munmap, radeon will release the page refcount.

Which case it that?

Note that currently only amdgpu doesn't work like that for gpu dma
directly to userspace ranges, it uses hmm and afaiui doens't hold a full
page pin refcount.

Cheers, Daniel


> > 
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > 
> > Hi,
> > 
> > I'm compile tested this, but unable to run-time test, so any testing
> > help is much appriciated.
> > ---
> >   drivers/gpu/drm/radeon/radeon_ttm.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> > index 5d50c9e..e927de2 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -506,7 +506,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
> >   		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
> >   		struct page **pages = ttm->pages + pinned;
> > -		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> > +		r = pin_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> >   				   pages, NULL);
> >   		if (r < 0)
> >   			goto release_pages;
> > @@ -535,7 +535,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
> >   	kfree(ttm->sg);
> >   release_pages:
> > -	release_pages(ttm->pages, pinned);
> > +	unpin_user_pages(ttm->pages, pinned);
> >   	return r;
> >   }
> > @@ -562,7 +562,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
> >   			set_page_dirty(page);
> 
> 
> Maybe we also need a preceding patch, to fix the above? It should be
> set_page_dirty_lock(), rather than set_page_dirty(), unless I'm overlooking
> something (which is very possible!).
> 
> Either way, from a tunnel vision perspective of changing gup to pup, this
> looks good to me, so
> 
>     Acked-by: John Hubbard <jhubbard@nvidia.com>
> 
> 
> thanks,
> -- 
> John Hubbard
> NVIDIA
> 
> >   		mark_page_accessed(page);
> > -		put_page(page);
> > +		unpin_user_page(page);
> >   	}
> >   	sg_free_table(ttm->sg);
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
