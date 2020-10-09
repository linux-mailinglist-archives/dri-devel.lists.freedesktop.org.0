Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B118289049
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 19:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26596ED75;
	Fri,  9 Oct 2020 17:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608CB6ED75
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 17:52:17 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id t15so9811099otk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Chc8637Rd8yI9tLS7AREeItMweAw4M0AE06Zuj7bhU0=;
 b=L4kTmlRVcZoe/avVgvgJLaWOs03iPF87kjF+Wg5Dr1BO68grQeWij+sKeGLbjkKVnS
 uWxXV8aahQlRlzimSn7k7/L57rwPuRVe9l/HoPbmKuzL42kNzmiAubvKP93NNRPozIcb
 M7wzXGB/zvSu+un9zoWu7yVJIqeg+g4rBMVIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Chc8637Rd8yI9tLS7AREeItMweAw4M0AE06Zuj7bhU0=;
 b=AQVBGNmR/RCxFxT/dfYoRH8DjHuOD2RcqUgrVjmW60ogTXdOXp5ZR6g/4NAe9Sx7F8
 PraHkagbllIaz+sAi7AsSpU0fqidcipnaJAEanzIxJaTxZIZ6XkOQ8Gksvh5mdmNn28B
 1XCOFU19MMhIU5OedkBUyo06G00M4w2TuEY2XpwORFaloBdAAv56w2M6ketqRgb2x030
 DTczb1RSma3uSGEYgL1o9DMq5+8k4x6yu1DUXX8nqb9HUr5VYlqabSXmXsSdrdWOP5TN
 hdRhPbqsKww1RORdGKCoKGOZv+FX4CiXhrae71fnuRCdZuuWYm9BaofKHJC9TndAa262
 JCmA==
X-Gm-Message-State: AOAM532Xwd7qkA/WNnRUEc8LqHi1bjIyVZ8QH3tGl6Vw07Yd48KrK0F3
 ov+MCQfzNEpYo15yafKIsZ3ztEbuORXXFcQDbTiVCw==
X-Google-Smtp-Source: ABdhPJxFnmBLRj+lrjXy7n2SbqbKqfPXOoR4PVOcPvoZoMGu71c5Uydzax6ZExKmO8/pv5qIPQDGfl3spZzjZBbiaDw=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr10168614otr.281.1602265936612; 
 Fri, 09 Oct 2020 10:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
 <20201009124850.GP5177@ziepe.ca>
In-Reply-To: <20201009124850.GP5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 9 Oct 2020 19:52:05 +0200
Message-ID: <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 9, 2020 at 2:48 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
>
> > I'm not a mm/ expert, but, from what I understood from Daniel's patch
> > description is that this is unsafe *only if*  __GFP_MOVABLE is used.
>
> No, it is unconditionally unsafe. The CMA movable mappings are
> specific VMAs that will have bad issues here, but there are other
> types too.
>
> The only way to do something at a VMA level is to have a list of OK
> VMAs, eg because they were creatd via a special mmap helper from the
> media subsystem.
>
> > Well, no drivers inside the media subsystem uses such flag, although
> > they may rely on some infrastructure that could be using it behind
> > the bars.
>
> It doesn't matter, nothing prevents the user from calling media APIs
> on mmaps it gets from other subsystems.

I think a good first step would be to disable userptr of non struct
page backed storage going forward for any new hw support. Even on
existing drivers. dma-buf sharing has been around for long enough now
that this shouldn't be a problem. Unfortunately right now this doesn't
seem to exist, so the entire problem keeps getting perpetuated.

> > If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> > flag that it would be denying the core mm code to set __GFP_MOVABLE.
>
> We can't tell from the VMA these kinds of details..
>
> It has to go the other direction, evey mmap that might be used as a
> userptr here has to be found and the VMA specially created to allow
> its use. At least that is a kernel only change, but will need people
> with the HW to do this work.

I think the only reasonable way to keep this working is:
- add a struct dma_buf *vma_tryget_dma_buf(struct vm_area_struct *vma);
- add dma-buf export support to fbdev and v4l
- roll this out everywhere we still need it.

Realistically this just isn't going to happen. And anything else just
reimplements half of dma-buf, which is kinda pointless (you need
minimally refcounting and some way to get at a promise of a permanent
sg list for dma. Plus probably the vmap for kernel cpu access.

> > Please let address the issue on this way, instead of broken an
> > userspace API that it is there since 1991.
>
> It has happened before :( It took 4 years for RDMA to undo the uAPI
> breakage caused by a security fix for something that was a 15 years
> old bug.

Yeah we have a bunch of these on the drm side too. Some of them are
really just "you have to upgrade userspace", and there's no real fix
for the security nightmare without that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
