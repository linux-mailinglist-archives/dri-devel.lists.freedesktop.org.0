Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FF198350
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 20:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2444B8995F;
	Mon, 30 Mar 2020 18:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337068995F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 18:24:29 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c9so19124782otl.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N127iZAeP0ovR2ZlvUIPNqqX7kSak9PpwOu8dE07Qmw=;
 b=Dy6hK2+JS2dWqz4Y384D//abgS7DAB4KmYLu41pCwpaay8Msa+MLBwObWWKq4MnlSQ
 YOKFWmwfBruoeQuElM89+oGiyw24jZ8U9a2D3ZnrzGvIzQNrWH+Myi7MXi7LNHVmYNaI
 BM5mJ/+mfQIRDUCu4x+1bYcV7El1zNAKaS7RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N127iZAeP0ovR2ZlvUIPNqqX7kSak9PpwOu8dE07Qmw=;
 b=SD2eHgI5j3QH2rpFGimMiGLcJ+WNWB2s3/5iqvvxwxRoZUGUIKRmufLduAYRjisfSr
 Wj/6DpDxEFgXO7sgeySHqU9AvVbDCLoEkYq8Ydh59nrW8cl5yJK3vWp7oUkqLRq4Vk1/
 jrmhUxFL7Sgvk7ys/XX6mToFAf3YlIxthsYg2YDLvuJS3IhXIOM3W4CMnZ2biIl+Xn40
 gRse/KdWMPkszbFmUKrTrxA9mZNCWEji6UOUOLpDV1l34ZJZ3AsjD2nNC6o0JgVo4he9
 SZf2lCMS9p497ahWELGxXlJjNT7HIXUh6WjXrrbNw2n9AR+xBY0PQ88cjltgvwtGd9Cl
 f1yg==
X-Gm-Message-State: ANhLgQ0XpY2Cthy7DqyBODYUVG84GfPvuM/lHMQgnYbJgKiM3bSVk3du
 D0KdFqHU5OXbyY8RQxRAf9zHF/kZ+HtvYh2J9Y0h5g==
X-Google-Smtp-Source: ADFU+vtJeqQJsr8L4z4Kfa0/6rDKpjP/uAwEUsQvBtYgWcqAU2a01U448pSsxhqGdDNFJOBe9P//OE4xbQ+shsGq+9Q=
X-Received: by 2002:a4a:c819:: with SMTP id s25mr340123ooq.6.1585592668314;
 Mon, 30 Mar 2020 11:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-3-andrzej.p@collabora.com>
 <CAKMK7uEx4c+9wELxnEjtRentt=L8w6wbr7YHX5No_2PUcB_+YQ@mail.gmail.com>
 <785e44e9-f77f-1464-786c-e28b12b9fa4b@collabora.com>
In-Reply-To: <785e44e9-f77f-1464-786c-e28b12b9fa4b@collabora.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 30 Mar 2020 20:24:17 +0200
Message-ID: <CAKMK7uE67t-qWLXNo5FHDUubVWdb+sDxF=yijtM-0n626d-10g@mail.gmail.com>
Subject: Re: [PATCHv7 2/6] drm/core: Add drm_afbc_framebuffer and a
 corresponding helper
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, James Wang <james.qian.wang@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 7:44 PM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Hi Daniel,
>
> W dniu 30.03.2020 o 19:01, Daniel Vetter pisze:
> > On Wed, Mar 11, 2020 at 3:55 PM Andrzej Pietrasiewicz
> > <andrzej.p@collabora.com> wrote:
> >>
> >> The new struct contains afbc-specific data.
>
> <snip>
>
> >> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> >> index 439656f55c5d..37a3a023c114 100644
> >> --- a/Documentation/gpu/todo.rst
> >> +++ b/Documentation/gpu/todo.rst
> >> @@ -404,6 +404,21 @@ Contact: Laurent Pinchart, respective driver maintainers
> >>
> >>   Level: Intermediate
> >>
> >> +Encode cpp properly in malidp
> >> +-----------------------------
> >> +
> >> +cpp (chars per pixel) is not encoded properly in malidp, zero is
> >> +used instead. afbc implementation needs bpp or cpp, but if it is
> >> +zero it needs to be provided elsewhere, and so the bpp field exists
> >> +in struct drm_afbc_framebuffer.
> >> +
> >> +Properly encode cpp in malidp and remove the bpp field in struct
> >> +drm_afbc_framebuffer.
> >> +
> >> +Contact: malidp maintainers
> >> +
> >> +Level: Intermediate
> >
> > Just stumbled over this todo, which is really surprising. Also
> > definitely not something I wanted to ack, earlier versions at least
> > didn't have this.
> >
> > Why is this needed? drm_afbc_framebuffer contains a drm_framebuffer,
> > which has a pointer to drm_format_info, which we're always setting
> > (the core does that for all drivers, both for addfb and addfb2). Why
> > is that not good enough to get at cpp for everyone?
> >
> > Cheers, Daniel
> >
>
> Let me quote James https://patchwork.freedesktop.org/patch/345603/#comment_653081:
>
> "Seems we can remove this bpp or no need to define it as a pass in argument
> for size check, maybe the komeda/malidp get_afbc_bpp() function mislead
> you that afbc formats may have vendor specific bpp.
>
> But the story is:
>
> for afbc only formats like DRM_FORMAT_YUV420_8BIT/10BIT, we have set
> nothing in drm_format_info, neither cpp nor block_size, so both malidp
> or komeda introduce a get_bpp(), but actually the two funcs basically
> are same.
>
> So my suggestion is we can temporary use the get_afbc_bpp() in malidp
> or komeda. and eventually I think we'd better set the block size
> for these formats, then we can defines a common get_bpp() like pitch".

Hm iirc we had some good reasons not to set the block size for these,
but maybe with these afbc helpers that's changed. We could also
compute cpp/bpp in the helper, starting from the format_info/fourcc
code, for these special cases. Essentially move the exact computation
that komeda/malidp do right now to set afbc->bpp and move it into the
helper. Just kinda feels like unfinished work that we still leave this
to drivers, that's some very quirky api.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
