Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EDB27E79A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 13:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD986E4B7;
	Wed, 30 Sep 2020 11:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0506E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 11:25:26 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id h17so1456157otr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XPhNhgXjvXmO6qMe12Ico/ebR2/givwfQj61bckl1Qw=;
 b=ilt2tbwC7TC34+YDgjBCThqgVJBSTbEAwVvPYe1QHXusF6Z5z6Qhipdawxa2ueUHc/
 Z29fDYlSSnSdMgyHlZLEHRHHCCrU1VXxd0D4yc1r5I1TFQ8HqE4YbmwyD3qvfYnx7QeP
 4NwAkOjWuoMBi53qM8r+48EmM0QeY7MrIr5Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XPhNhgXjvXmO6qMe12Ico/ebR2/givwfQj61bckl1Qw=;
 b=H+id+TpyIMCQy6+z5lUg86BNnhdHvfodavOqlN/xYJRVNGpOqLwIe0YjFwCbRNHwwO
 ZREsa0PWTmBFCF4W488Dko6971KzCBiV6zavTCKpJm6qgbUdOve/VI6kcrk41a4qsPAz
 KX5W3eQbgvNK/VBDw+KAg81wfnrbHJCiu/B7IEQLpV/bg58HsAkxpb92uBU4RaYLZr5q
 KCAes3ME2ItVTUU+VRtutidimnbk7559BKF74r6I5uvnUN/NBY5Iv9y8RYWyeSr1p4Oi
 ipat85PCUxXhjujf4MQdm7ui+oRKKbavFX8QF4T49H1x1fHHQOnL+wP3sbNG2SgM4M7U
 CY+Q==
X-Gm-Message-State: AOAM533F+LIJqKDMyjatgtFqRL9MAFYvsx4hikLMeXJo2itgEVGWz14F
 U0WlMij40mtZOWMi6rI4LWzopVRB5U6pXR46MycGDw==
X-Google-Smtp-Source: ABdhPJxEgm74LL2epdjXJXLLzINvmmFbGywbDO4Fc87teAZPaKspdA7yDK4a1Y64+ZE5t7m/SLjyxrDFnCEfpchc8Ko=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr1190431otj.303.1601465125944; 
 Wed, 30 Sep 2020 04:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local> <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN> <20200930095317.GX438822@phenom.ffwll.local>
 <20200930105553.GA1154238@PWN>
In-Reply-To: <20200930105553.GA1154238@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2020 13:25:14 +0200
Message-ID: <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
To: Peilin Ye <yepeilin.cs@gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 12:56 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Wed, Sep 30, 2020 at 11:53:17AM +0200, Daniel Vetter wrote:
> > On Wed, Sep 30, 2020 at 03:11:51AM -0400, Peilin Ye wrote:
> > > On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > > > On Tue, Sep 29, 2020 at 2:34 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > > > Ah, and speaking of built-in fonts, see fbcon_startup():
> > > > >
> > > > >         /* Setup default font */
> > > > >                 [...]
> > > > >                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
> > > > >                             ^^^^^^^^^^^^^^^
> > > > >
> > > > > This is because find_font() and get_default_font() return a `struct
> > > > > font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
> > > > > think we also need to add a `charcount` field to `struct font_desc`.
> > > >
> > > > Hm yeah ... I guess maybe struct font_desc should be the starting
> > > > point for the kernel internal font structure. It's at least there
> > > > already ...
> > >
> > > I see, that will also make handling built-in fonts much easier!
> >
> > I think the only downside with starting with font_desc as the internal
> > font represenation is that there's a few fields we don't need/have for
> > userspace fonts (like the id/name stuff). So any helpers to e.g. print out
> > font information need to make sure they don't trip over that
> >
> > But otherwise I don't see a problem with this, I think.
>
> Yes, and built-in fonts don't use refcount. Or maybe we can let
> find_font() and get_default_font() kmalloc() a copy of built-in font
> data, then keep track of refcount for both user and built-in fonts, but
> that will waste a few K of memory for each built-in font we use...

A possible trick for this would be to make sure built-in fonts start
out with a refcount of 1. So never get freed. Plus maybe a check that
if the name is set, then it's a built-in font and if we ever underflow
the refcount we just WARN, but don't free anything.

Another trick would be kern_font_get/put wrappers (we'd want those
anyway if the userspace fonts are refcounted) and if kern_font->name
!= NULL (i.e. built-in font with name) then we simply don't call
kref_get/put.
-Daniel

> > > > I think for vc_date->vc_font we might need a multi-step approach:
> > > > - first add a new helper function which sets the font for a vc using
> > > > an uapi console_font struct (and probably hard-coded assumes cnt ==
> > > > 256.
> > >
> > > But user fonts may have a charcount different to 256... But yes I'll try
> > > to figure out how.
> >
> > Hm yeah, maybe we need a helper to give us the charcount then, which by
> > default is using the magic negative offset.
>
> Ah, I see! :)
>
> > Then once we've converted everything over to explicitly passing charcount
> > around, we can switch that helper. So something like
> >
> > int kern_font_charcount(struct kern_font *font);
> >
> > Feel free to bikeshed the struct name however you see fit :-)
>
> I think both `kern_font` and `font_desc` makes sense, naming is so
> hard...
>
> > > > For first steps I'd start with demidlayering some of the internal
> > > > users of uapi structs, like the console_font_op really shouldn't be
> > > > used anywhere in any function, except in the ioctl handler that
> > > > converts it into the right function call. You'll probably discover a
> > > > few other places like this on the go.
> > >
> > > Sure, I'll start from this, then cleaning up these dummy functions, then
> > > `vc_data`. Thank you for the insights!
> >
> > Please don't take this rough plan as fixed, it's just where I'd start from
> > browsing the code and your analysis a bit. We'll probably have to adapt as
> > we go and more nasty things turn up ...
>
> Sure, I'll first give it a try and see. Thank you!
>
> Peilin Ye
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
