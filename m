Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF428B818
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 15:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09D26E45E;
	Mon, 12 Oct 2020 13:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1770D6E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 13:49:19 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id t15so15927416otk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8X09Z4RduZw54E7UULyfcMVsq59sUX38yzJavXEvAuQ=;
 b=OxcKeNhvQoR0L8nxbCn1cXzOLqpqQBDfywbnUKwin8fP1jeNNo8TXGjdlV3i/RFefc
 kiDn5u8kWGFx2VxB985ageHcqSHKlzq4zLw3IXCA9ks8vIzNebZc3IQZx/DZrDgmJSXd
 NsUKEksWwYQT7XMaHoiEwCdO/DkttVP0ejuaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8X09Z4RduZw54E7UULyfcMVsq59sUX38yzJavXEvAuQ=;
 b=PozUWM3XJgptMJUWtSYlrXnbPxAX546saFqPNUoj8XO0Mc8CfRKR6d/4JDTjFY3ANb
 HmT/0/wtibE+uxTrQwGUrV4wAt7lsFaladKpsBX0YCggOLx36JtkM6YrZs0zIz8WRu3J
 efS0+gonGdX3qep9D0zstYbeqBFsvguodf5jDep+qiM7FGV/ADF46qmYaah6eCBhGyIq
 MRORl6nSZtZdkhW1bjSO24dMP7GqjijTVNe1vVbaOG4acqU9iNtmWLVGg9XqISgQOL+z
 HwNbHe40ZsL987UIA/C2s881KClfIISt4B82rX1Zw/orjJCyoaKoKY3UdZz/M6C/R/MA
 UUqQ==
X-Gm-Message-State: AOAM531ygJokVfcqZA0ptuMos36xb9aMewNOFVxV0ZprNeHEhb6gIJGM
 gxRcsP2b05SPB31RePL5zYSCFF0xYrdcmO/1iAAhEA==
X-Google-Smtp-Source: ABdhPJx2SbzoAtarumY1qTqnmUTVH9IgcM13EmZUSL9fGwCe3viWjRc3PXrzmY6z+PXG92wLIZXLR8i7oO5kJrgMePc=
X-Received: by 2002:a05:6830:8b:: with SMTP id
 a11mr7008058oto.303.1602510558346; 
 Mon, 12 Oct 2020 06:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
 <CGME20201009124900eucas1p26c93caa29c9925f1eef9be9ff7c6c65c@eucas1p2.samsung.com>
 <20201009124850.GP5177@ziepe.ca>
 <ed68968b-27bc-d776-8da8-ef21d6b3c378@samsung.com>
In-Reply-To: <ed68968b-27bc-d776-8da8-ef21d6b3c378@samsung.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 12 Oct 2020 15:49:07 +0200
Message-ID: <CAKMK7uGLOubJrr9A=usxkoVx+nXDW3bxhykfeU-TYXTUZyBoeQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 Linux MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
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

On Mon, Oct 12, 2020 at 12:47 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jason,
>
> On 09.10.2020 14:48, Jason Gunthorpe wrote:
> > On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
> >
> >> I'm not a mm/ expert, but, from what I understood from Daniel's patch
> >> description is that this is unsafe *only if*  __GFP_MOVABLE is used.
> > No, it is unconditionally unsafe. The CMA movable mappings are
> > specific VMAs that will have bad issues here, but there are other
> > types too.
>
> I'm trying to follow this thread, but I really wonder what do you mean
> by CMA movable mappings? If a buffer has been allocated from CMA and
> used for DMA, it won't be moved in the memory. It will stay at the same
> physical memory address all the time until freed by the owner. It just a
> matter of proper usage count tracking to delay freeing if it is still
> used somewhere.

 Yup. The problem is that this usage count tracking doesn't exist. And
drivers could at least in theory treat CMA like vram and swap buffers
in&out of it, so just refcounting the userspace vma isn't enough. In
practice, right now, it might be enough for CMA drivers though (but
there's more that's possible here).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
