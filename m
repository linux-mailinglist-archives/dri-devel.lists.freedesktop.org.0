Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10AC2E9CE0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 19:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4EF89FEC;
	Mon,  4 Jan 2021 18:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6933489FEC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 18:16:58 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id t8so25829775iov.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 10:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HRQlpPfYW2zzNDJvf0raq4/rBhWHnHE57OXwcFtdk50=;
 b=WnnCUkcbuUp4weXv1Lo6jDyBFBjxmCNij1gVTH9tANwqNYNhyI4fj2eiesJL9O5rge
 wzONlmCsP79Z6gdvJjTF2lPW/Yqm9OVyXgf1EqqaJDKwrhmIxL37ma+udHewLkJ+VndU
 6flzf2se2eOjrAy/o5/HIi8lutM5L3mbGiA/iRTqA6fYMsgUWTBGldDTCgY+N/PglHXE
 5QnfAF80cLNHf9GdR3Xoue/6hWs1ijJ5a+QXONmJgz7GFk3mjIhto01+BbEh4bsfD0BV
 xnjrBlzZ4+ink/CpgJjBXeOL5zRMEUkEnRvuzYRz+nQ+Zz687/Q9mdopIadtqGYDxkvO
 dxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRQlpPfYW2zzNDJvf0raq4/rBhWHnHE57OXwcFtdk50=;
 b=aLH/StdZB8q2dz0kYAbCrkvj57dfjfAJkSYPmXaeMuL0q4VqUd8K+tzvpSD1pb9cOp
 4r0Z2UW6kQk+YtFBzCwe84/SBPvEwD5xzwdxNxaJrzu9ogAu7OiWd7IDseM8Kt5EAI/6
 2TwhTA0gIg+099oyBHsu1U5wT03WPRtNsmjzwQsncX92yyWqUxqvswwndQJsAru1gC9j
 q82HMhFIvbQhe1hcPKxpXtt42520AG65/FcRxh5+SelXH2h2SkvfBTqjlCQUWxATTrmk
 uglt/jtZOwbWIeuRpcq8UNlaFTvJlwg2P3WoYlbewoS8XSVg3M9UbOdGDEQm2/S2pVjp
 eLtg==
X-Gm-Message-State: AOAM533lrE7tJ853oZvMUwLFRRBHUjI9LZiscjo2uSe6WQf0G2/8KBuO
 rWINxUu5H9xiJvM+9M25zGDsWdD/y0XWiKTiNK2Xtg==
X-Google-Smtp-Source: ABdhPJwlsbjJksZyW8hQYN8A5hTYFnyvTXAtyi17XbyIa9Vw5mY2y1aAL5G/N/0pO04YTgIIx8RJB3OiwRDL5ERCNo4=
X-Received: by 2002:a6b:5403:: with SMTP id i3mr60132716iob.136.1609784217833; 
 Mon, 04 Jan 2021 10:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
In-Reply-To: <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 4 Jan 2021 19:17:06 +0100
Message-ID: <CAP+8YyHJpE39aea8OhGuQNjaGjLq4vcK-hNL+pC_wL5qsHwv2A@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Zhan Liu <zhan.liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Ville

On Sat, Jan 2, 2021 at 4:31 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>
> On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
> >
> > With modifiers one can actually have different format_info structs
> > for the same format, which now matters for AMDGPU since we convert
> > implicit modifiers to explicit modifiers with multiple planes.
> >
> > I checked other drivers and it doesn't look like they end up triggering
> > this case so I think this is safe to relax.
> >
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
> > ---
> >  drivers/gpu/drm/drm_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index e6231947f987..f5085990cfac 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
> >         if (ret)
> >                 goto out;
> >
> > -       if (old_fb->format != fb->format) {
> > +       if (old_fb->format->format != fb->format->format) {
>
> This was btw. the original way before Ville made it more strict about
> 4 years ago, to catch issues related to tiling, and more complex
> layouts, like the dcc tiling/retiling introduced by your modifier
> patches. That's why I hope my alternative patch is a good solution for
> atomic drivers while keeping the strictness for potential legacy
> drivers.
>
> -mario
>
> >                 DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
> >                 ret = -EINVAL;
> >                 goto out;
> > --
> > 2.29.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
