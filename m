Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468D286F3A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AADE6EA49;
	Thu,  8 Oct 2020 07:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008A36E029
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:33:25 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id 13so1599871qvc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TdSre1+FiF17b2WS+AUXMuyymNAaLTf4uLT17E+pnFU=;
 b=I7/owwaByfC+T615S4yoAl1o98d1ue1FvXLjxM8yebhh+9JecaDPgFNy3dbnkmB8TN
 Vzx15ySYhGig+ha8DgJwv0JB9nc9mTmHX7s01XzVMtrzGqF7F5ysx9nVT6a95aQv8luf
 ubR2OEMsVZaWQ7RmDyyDSLyoP0q7IOFEADlrOkM8v9xk0+G5fAvCgdRAbNUwL2HYX/wg
 NdxL0Agtty3FgSPu+bQMrdJNei+OMp8ipKgGOhWKyjOjRZlk7D/1NKUJUn0ab2X75jIZ
 GLdNE/c4Zf4maicgzgeRTMpXMrGmFUZrqUFukx9r5Pv+87LO5DNFvo/M0m7x2mbqppxs
 Yd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TdSre1+FiF17b2WS+AUXMuyymNAaLTf4uLT17E+pnFU=;
 b=dNaHg92kqUXKjlk64qVusGa6amJ2XZU3XSc79vkdIUDufUk1fSs9oOGRnirP1DjzH9
 I6WsgQ7BB7JHPkhnmuGa0XGI8X+r6sABuKSxFFZIkf+gtOnXBRKiOEz9AkMHZN5tNsrC
 6OeUnQpRsPuNlEdPYxfBOUUp2iRS3CDZiUnwbE/nPDu446Aorpqic9rXSIy5sIzeTZRO
 pI+6euB+nqSi82BzaiZj1Ihf6fDpGTRKqOv8NdtKPewEeZuEj5e9YyKHG02GsG4FOFu8
 C4reTgXaZeYG9Obs5WwLCZnA0BbpGfbvhBVLNT3NRzDSCSElIt3DNx3wDQGah73PILEe
 F2Jg==
X-Gm-Message-State: AOAM530V3LILL94w9SgWUb/TDCjpbjJTn8lpu2dceopFr4zfzO07a1tl
 koAAYJQ+zL4TCpWJaw88OMGHFw==
X-Google-Smtp-Source: ABdhPJw0qC4HxiG6+lNGoLhXdKRQ6phNXWeAziKb0zM4HKIClbwU3fAgBb5ZP6iA8tkK3T/vsUzqKA==
X-Received: by 2002:ad4:456c:: with SMTP id o12mr4490006qvu.48.1602092005183; 
 Wed, 07 Oct 2020 10:33:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 184sm1954180qkl.104.2020.10.07.10.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 10:33:24 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQDJb-0010xU-S5; Wed, 07 Oct 2020 14:33:23 -0300
Date: Wed, 7 Oct 2020 14:33:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201007173323.GV5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
 <20201007165316.GT5177@ziepe.ca>
 <CAKMK7uGTpZcHwrBNQOXwzDAzyfSgoLSt_Dae_3hMRE2xwGx+GA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGTpZcHwrBNQOXwzDAzyfSgoLSt_Dae_3hMRE2xwGx+GA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 07:12:24PM +0200, Daniel Vetter wrote:
> On Wed, Oct 7, 2020 at 6:53 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 07, 2020 at 06:44:18PM +0200, Daniel Vetter wrote:
> > >
> > > -     /*
> > > -      * While get_vaddr_frames() could be used for transient (kernel
> > > -      * controlled lifetime) pinning of memory pages all current
> > > -      * users establish long term (userspace controlled lifetime)
> > > -      * page pinning. Treat get_vaddr_frames() like
> > > -      * get_user_pages_longterm() and disallow it for filesystem-dax
> > > -      * mappings.
> > > -      */
> > > -     if (vma_is_fsdax(vma)) {
> > > -             ret = -EOPNOTSUPP;
> > > -             goto out;
> > > -     }
> > > -
> > > -     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > > -             vec->got_ref = true;
> > > -             vec->is_pfns = false;
> > > -             ret = pin_user_pages_locked(start, nr_frames,
> > > -                     gup_flags, (struct page **)(vec->ptrs), &locked);
> > > -             goto out;
> > > -     }
> >
> > The vm_flags still need to be checked before going into the while
> > loop. If the break is taken then nothing would check vm_flags
> 
> Hm right that's a bin inconsistent. follow_pfn also checks for this,
> so I think we can just ditch this entirely both here and in the do {}
> while () check, simplifying the latter to just while (vma). Well, just
> make it a real loop with less confusing control flow probably.

It does read very poorly with the redundant check, espeically since I
keep forgetting follow_pfn does it too :\

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
