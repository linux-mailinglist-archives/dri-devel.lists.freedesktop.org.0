Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D23CB90D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F64D6E98D;
	Fri, 16 Jul 2021 14:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A6A6E98D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:50:20 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 e1-20020a9d63c10000b02904b8b87ecc43so10131928otl.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y7XaefixmPkk8HKAYzXCs3EMf0hhXmp4f2S1F2eeElE=;
 b=GTle12w9KfVGeEYL+NabYMPsPHzOxs3tpfC815lBxZZLhJp9otZNi79VTnPNxLrP/V
 VC5Ui7Cl2tmQMqB/bH3iiro3bUjaqG9Mh58BFopEyOSqrWetfLEErnEO576aKwc59dsB
 qOfzxdDagf7RXfqDARJZGRdA8xJRK0qAMwO0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7XaefixmPkk8HKAYzXCs3EMf0hhXmp4f2S1F2eeElE=;
 b=AwKQC21OklJcrFYOhzPBCLV+Rk7oO7o6SFqVJb3Uat80V0teGF1saZIeSKeFI2hRYC
 0JSdSdsc5jRSm9QDnNC4BXNRQ1Z9XHc/vJqP4FyX06y2QGi4+n2PGbMcvPhTsEdnUwCe
 9skVScH4Q68NOnYpmFVUVSVoKVWrjCEtnlpSOaS9hZhobMMBpXNLS4OLyoNGFjUh/2lK
 iDji1wkAtW31M5jOX775+o5H46eTiZCyOvmi5uumkSfnhm/AnidWXWQlnPepFhGQ2P3X
 Fean46S9qfSPzyLWUvgGGh5gTwXJIELFzb+sjwlg585BEu9r8bvHyeaULvGGWf9xhmxI
 m5Kg==
X-Gm-Message-State: AOAM533hBTYoTbAcR6XPPrSeAuqCkjTF8QNFCW3pTh+u6xGsMnouGY+B
 Vm5LxYWnfrQYGRcQKzRq1txFgeIXaS1VFrmIPz5+sA==
X-Google-Smtp-Source: ABdhPJyzIMkoNyXBQfbdDAhEaWVy6smCwVIDIDx4px8elsLrQEPZzAsdP3eRSzzCmQ9yhq7gV4kl0GPsLrrOqomlhco=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr7625356otu.303.1626447019828; 
 Fri, 16 Jul 2021 07:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <YPAW9f/2oJV4UNnB@phenom.ffwll.local>
 <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>
 <2516720.Dzi6zm1QmA@mizzik>
In-Reply-To: <2516720.Dzi6zm1QmA@mizzik>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Jul 2021 16:50:08 +0200
Message-ID: <CAKMK7uEi5ANiwU_T1uC_F4+YdpGDuqjtWby33fOB5PErUpgC3A@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/i915/userptr: Probe existence of backing struct
 pages upon creation
To: Kenneth Graunke <kenneth@whitecape.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 8:21 PM Kenneth Graunke <kenneth@whitecape.org> wrote:
>
> On Thursday, July 15, 2021 4:27:44 AM PDT Tvrtko Ursulin wrote:
> >
> > On 15/07/2021 12:07, Daniel Vetter wrote:
> > > On Thu, Jul 15, 2021 at 11:33:10AM +0100, Tvrtko Ursulin wrote:
> > >>
> > >> On 15/07/2021 11:15, Matthew Auld wrote:
> > >>> From: Chris Wilson <chris@chris-wilson.co.uk>
> > >>>
> > >>> Jason Ekstrand requested a more efficient method than userptr+set-domain
> > >>> to determine if the userptr object was backed by a complete set of pages
> > >>> upon creation. To be more efficient than simply populating the userptr
> > >>> using get_user_pages() (as done by the call to set-domain or execbuf),
> > >>> we can walk the tree of vm_area_struct and check for gaps or vma not
> > >>> backed by struct page (VM_PFNMAP). The question is how to handle
> > >>> VM_MIXEDMAP which may be either struct page or pfn backed...
> > >>>
> > >>> With discrete are going to drop support for set_domain(), so offering a
> > >>> way to probe the pages, without having to resort to dummy batches has
> > >>> been requested.
> > >>>
> > >>> v2:
> > >>> - add new query param for the PROPBE flag, so userspace can easily
> > >>>     check if the kernel supports it(Jason).
> > >>> - use mmap_read_{lock, unlock}.
> > >>> - add some kernel-doc.
> > >>
> > >> 1)
> > >>
> > >> I think probing is too weak to be offered as part of the uapi. What probes
> > >> successfully at create time might not be there anymore at usage time. So if
> > >> the pointer is not trusted at one point, why should it be at a later stage?
> > >>
> > >> Only thing which works for me is populate (so get_pages) at create time. But
> > >> again with no guarantees they are still there at use time clearly
> > >> documented.
> > >
> > > Populate is exactly as racy as probe. We don't support pinned userptr
> > > anymore.
> >
> > Yes, wrote so myself - "..again with no guarantees they are still there
> > at use time..".
> >
> > Perhaps I don't understand what problem is probe supposed to solve. It
> > doesn't deal 1:1 with set_domain removal since that one actually did
> > get_pages so that would be populate. But fact remains regardless that if
> > userspace is given a pointer it doesn't trust, _and_ wants the check it
> > for this reason or that, then probe solves nothing. Unless there is
> > actually at minimum some protocol to reply to whoever sent the pointer
> > like "not that pointer please".
>
> That's exactly the point.  GL_AMD_pinned_memory requires us the OpenGL
> implementation to return an error for "not that pointer, please", at the
> time when said pointer is supplied - not at first use.
>
> Sure, there can be reasons why it might seem fine up front, and not work
> later.  But an early check of "just no, you're doing it totally wrong"
> at the right moment can be helpful for application developers.  While it
> shouldn't really happen, if it ever did, it would be a lot more obvious
> to debug than "much later on, when something randomly flushed the GPU
> commands we were building, something went wrong, and we don't know why."

Also, that extension doesn't make guarantees about importing nasty
userspace memory where some non-trusted entity could e.g. truncate()
the file and render all pages invalid, even if you're holding a
reference to it still.

It's purely to check "hey I got this random pointer here from
somewhere, I trust it, can you use it assuming I will not change
anything with hit?". Which is exactly what probe solves, and pulling
in the pages is kinda overkill.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
