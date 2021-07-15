Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4433CAB11
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 21:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0428689BA9;
	Thu, 15 Jul 2021 19:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B489D89BA9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 19:18:36 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id g19so10823276ybe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kc3sgpi0w1W1O3X0GV+6z8HtDSJLE2cafMSxX+FW0r0=;
 b=HGZn8DqMTaLw52xkYzy+4OA5ncfta7HKrjze9VcW4HI1KEUAODBD1M64BpGrTNm1u2
 aYoAwdWe2EJc2xQZ+Od69DXuBdPDZeozRXcsC3i/GK3V+UugzQUP0Jl41XdkBCOO1XSF
 6L7h6wj0Lh5MxQU8qifYqEBizh/D0w/tIhRkW+lAMb3ob+yGdht3Z5dh5tXdZhrnJl9Y
 0v9GE88mRbtlC+6qMR1G7QW2pCd3nJJ3pz+n7/DyBIgvTrCGK5yIBFFAeW9HW3wZgU6u
 9MTR11KvxB0Jrq95tYMy4cbAQCyn1SQyy2QqqiuAPG/hSQuYy8buKqamSUtBTysNg0Pg
 msSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kc3sgpi0w1W1O3X0GV+6z8HtDSJLE2cafMSxX+FW0r0=;
 b=YGHAQcKGrrKXTIFYfnZdcLL6yYucq6LmOUiuSjj/Xdna7gwStLmwn9/024kSH182qj
 nJQPqCPL/CyvNssdnCKRvO6+vNCigURse7qUTNtRgwc40V5zRxPyTOoYKMQiEIbjDAxt
 xwgTa/YaaqhQNoDlQuJSQgbT8+CDMxCvhwG9FhlzzxvLBpSelPqyPGtPwu/9QwiSnfAz
 tm1pNw5Rs5iTpmeIXBODxkbbDs1Vn0X27oYEpMNUX+bky2h/yD+IKmhB7UZQ8brsQMiU
 Pi9HenUWxaTBPguYOnvzWa59NevSXUUbkMnPXX/wKTB3x9u4DGppTDBFqS1Iq0Qh39oG
 xpUA==
X-Gm-Message-State: AOAM53220F8zkZvsYND6gyIH9E4j6CP4uxvOtQiscijMrQXmiRGa2AcJ
 c055Zq01njdguFZW9b+ocaYtT9nVO5KKdwAH/juKc44z54W5hw==
X-Google-Smtp-Source: ABdhPJwRIz4sx2/+rwl9SoWnkLI8BEHcEXogda0r7ZT4pOwvSLYwYQO/DQ8nznsLyno0Os2Eq4c+BnFeP8A+7PW7dWg=
X-Received: by 2002:a25:d113:: with SMTP id i19mr7916958ybg.180.1626376715678; 
 Thu, 15 Jul 2021 12:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <YPAW9f/2oJV4UNnB@phenom.ffwll.local>
 <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>
 <2516720.Dzi6zm1QmA@mizzik>
In-Reply-To: <2516720.Dzi6zm1QmA@mizzik>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Jul 2021 14:18:24 -0500
Message-ID: <CAOFGe95V98PRhZ7LxFcHTsXwfBz8GCrt3-O2729ExQC3tbF5yw@mail.gmail.com>
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 1:21 PM Kenneth Graunke <kenneth@whitecape.org> wrote:
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

And before someone chimes in saying that Vulkan doesn't need this
because we can just VK_ERROR_DEVICE_LOST later, that's not true.  We'd
like to be able to return VK_ERROR_INVALID_EXTERNAL_HANDLE in the
easily checkable cases like if they try to pass in a mmapped file.

--Jason
