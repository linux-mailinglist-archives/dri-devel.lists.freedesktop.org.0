Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD21E3CA0
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802356E2B1;
	Wed, 27 May 2020 08:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBD26E2B1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:51:21 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so14779733wrn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 01:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=fhMSWvuNPBXpgKYtNNiDpeOzCXthXUhwfothIO9NKNc=;
 b=Xv/iIwQLTMFPM9ojjW89x4wU6m1Nk4zxlV2lFYOzK/YeX5SVJ2QS7zKO2ep51C8Idy
 stbGc0fsYeZ7fht0c/o9lfGLZTtr8jZZBFGQQMOpEetaU5IW4UPpENwNAuCY9GCGjkKW
 g12dEH4XXpkOyUjPEX3PfxZJomdQ1I72fgCGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=fhMSWvuNPBXpgKYtNNiDpeOzCXthXUhwfothIO9NKNc=;
 b=gtu6sQbzM3kZNAJiLsB9PV3mL3VXCDqmnr3rj145LiiT6acRVdZq6iBo7WhBqiICh/
 uWjnsF7xXBbfUeH/4zRb4qDTK4GrFNsETqpvvnTpgIt6PvGcgapEsFQ6dgbnRJGvRwTN
 sbW3t51mJgyqT93raz9iiFZBauiVuNFeU0lyN3OYjFMLS3TZfVWZU/x+2VNUxLQOQQI4
 iY2TEz0QMxYU6C4jcHSnKb8ihlMfR1OeZY7Rm+bzkWG/I4MrgU6MBZ7ccNTTEL+XhNN0
 UIdX+XoctUx3kynf7VXLlI8/kwTryQetf1yCmJg/2rsZiY0uuDS4Ec4eytEn0kaCWZdx
 WfqA==
X-Gm-Message-State: AOAM531kBQqQ4LA/H6xpU2LrYScxXyWD4k+o+VPkzSRolZtJYya9azZP
 Cndw3jKSajD/i8WEZbUslzBC+Q==
X-Google-Smtp-Source: ABdhPJxEZ23G/V3SZPvyhyfGWPt5N2KRE3O+yYWtCD/lwEOS2AoferVAQgqxVybjqghH58UBwveWpQ==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr25171654wrs.64.1590569479666; 
 Wed, 27 May 2020 01:51:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q13sm2157909wrn.84.2020.05.27.01.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 01:51:19 -0700 (PDT)
Date: Wed, 27 May 2020 10:51:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] drm/radeon: Convert get_user_pages() --> pin_user_pages()
Message-ID: <20200527085117.GO206103@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1590526802-3008-1-git-send-email-jrdr.linux@gmail.com>
 <69a033cf-63b2-7da6-6a5e-a5bbc94b8afb@nvidia.com>
 <20200527084852.GN206103@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527084852.GN206103@phenom.ffwll.local>
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

On Wed, May 27, 2020 at 10:48:52AM +0200, Daniel Vetter wrote:
> On Tue, May 26, 2020 at 03:57:45PM -0700, John Hubbard wrote:
> > On 2020-05-26 14:00, Souptick Joarder wrote:
> > > This code was using get_user_pages(), in a "Case 2" scenario
> > > (DMA/RDMA), using the categorization from [1]. That means that it's
> > > time to convert the get_user_pages() + release_pages() calls to
> > > pin_user_pages() + unpin_user_pages() calls.
> > > 
> > > There is some helpful background in [2]: basically, this is a small
> > > part of fixing a long-standing disconnect between pinning pages, and
> > > file systems' use of those pages.
> > > 
> > > [1] Documentation/core-api/pin_user_pages.rst
> > > 
> > > [2] "Explicit pinning of user-space pages":
> > >      https://lwn.net/Articles/807108/
> 
> I don't think this is a case 2 here, nor is it any of the others. Feels
> like not covered at all by the doc.
> 
> radeon has a mmu notifier (might be a bit broken, but hey whatever there's
> other drivers which have the same concept, but less broken). So when you
> do an munmap, radeon will release the page refcount.

I forgot to add: It's also not case 3, since there's no hw page fault
support. It's all faked in software, and explicitly synchronizes against
pending io (or preempts it, that depends a bit upon the jobs running).

> Which case it that?
> 
> Note that currently only amdgpu doesn't work like that for gpu dma
> directly to userspace ranges, it uses hmm and afaiui doens't hold a full
> page pin refcount.
> 
> Cheers, Daniel
> 
> 
> > > 
> > > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > 
> > > Hi,
> > > 
> > > I'm compile tested this, but unable to run-time test, so any testing
> > > help is much appriciated.
> > > ---
> > >   drivers/gpu/drm/radeon/radeon_ttm.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> > > index 5d50c9e..e927de2 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > > @@ -506,7 +506,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
> > >   		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
> > >   		struct page **pages = ttm->pages + pinned;
> > > -		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> > > +		r = pin_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> > >   				   pages, NULL);
> > >   		if (r < 0)
> > >   			goto release_pages;
> > > @@ -535,7 +535,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
> > >   	kfree(ttm->sg);
> > >   release_pages:
> > > -	release_pages(ttm->pages, pinned);
> > > +	unpin_user_pages(ttm->pages, pinned);
> > >   	return r;
> > >   }
> > > @@ -562,7 +562,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
> > >   			set_page_dirty(page);
> > 
> > 
> > Maybe we also need a preceding patch, to fix the above? It should be
> > set_page_dirty_lock(), rather than set_page_dirty(), unless I'm overlooking
> > something (which is very possible!).
> > 
> > Either way, from a tunnel vision perspective of changing gup to pup, this
> > looks good to me, so
> > 
> >     Acked-by: John Hubbard <jhubbard@nvidia.com>
> > 
> > 
> > thanks,
> > -- 
> > John Hubbard
> > NVIDIA
> > 
> > >   		mark_page_accessed(page);
> > > -		put_page(page);
> > > +		unpin_user_page(page);
> > >   	}
> > >   	sg_free_table(ttm->sg);
> > > 
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
