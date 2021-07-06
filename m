Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD183BD749
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 14:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57EB8936E;
	Tue,  6 Jul 2021 12:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745388936E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 12:59:01 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 n99-20020a9d206c0000b029045d4f996e62so21472849ota.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GEiP9J1UgxQK0/cNY7a9scwAPFd9tZPVnelnU1KrVhE=;
 b=Hgv3qBPK2nCy3ZNB87CQ8tc+cSWS+0u2J/W278UqTqHCeqEAoSdS1uEBZYCpgd5f+J
 O/tsNx3RBhylbep91l5F+vbL0KIXEJh7qjmJNMevHb8JXLNB6D/4P3G521PW7XftANl+
 wKm1pqIsZIdsku4c12xyyOs5TQUCRqpUBjKgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GEiP9J1UgxQK0/cNY7a9scwAPFd9tZPVnelnU1KrVhE=;
 b=sxVDkdN+mJqfZ9KCB6JsfQHAeEaBQgj8eNV91ZuMQLJ7U7HM0AIJ6FYITrbCihP5mL
 aAjXhRPWcxXs+vzm/Zo99kOdFJWwwgTP0fTLcmahUIHL9nPsRIBBwdQ9De+X2ILz+UtO
 jsBmcSxsF0Sze7o3487LC++j4bMamvJc5tpy1oKVi92/sg+1odcmLwkB2T6yfIt70hNq
 1gnvUk1D9NUxJeWR3tq8Rt4S5FD1gZh4h6Z6BnauIjtCbFFqzpyWp7mdPnyIKXnRwECL
 H2D3b4FLLNOXKTGntgOV/gEaWzCi+2kXVbgP6YnlhD5vC4oWZqHk/FZEH79nZ0l/E5AM
 H7aA==
X-Gm-Message-State: AOAM5304T5k0fn931+WTrrV3gArCCBOHYRlM4ODPG2OP4sc+hICLG2GU
 p0vIj6ES+o0QV6q1rOCCokCzsH0qIQeXOVmYNx7kIw==
X-Google-Smtp-Source: ABdhPJxj4Jj7b3TaoQXaiBZj1PDXvEMbPWhPnvR+xXlBweenrnk8QQ+TZI49igbqKY3erA7zqeF/DYFkg8sNi1BARZM=
X-Received: by 2002:a05:6830:1f19:: with SMTP id
 u25mr11412664otg.303.1625576340884; 
 Tue, 06 Jul 2021 05:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-6-daniel.vetter@ffwll.ch>
 <CAM0jSHPqCQ58hnCkShZVq93k3y6J6cNJsyfagXdu5Y1zEN7NtA@mail.gmail.com>
In-Reply-To: <CAM0jSHPqCQ58hnCkShZVq93k3y6J6cNJsyfagXdu5Y1zEN7NtA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Jul 2021 14:58:50 +0200
Message-ID: <CAKMK7uFJBvu-N1W+LbhSGtqkKfOEb7CkgfxtAp2XaHZM93BMiw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915: Always wait for the exclusive
 fence
To: Matthew Auld <matthew.william.auld@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 2:47 PM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Tue, 6 Jul 2021 at 11:12, Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
> >
> > We're lifting, or well, clarifying that the restriction that shared
> > fences have to be strictly after the exclusive one doesn't apply
> > anymore.
> >
> > So adjust the code to always also wait for the exclusive fence.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/i915_sw_fence.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i91=
5/i915_sw_fence.c
> > index 91711a46b1c7..271d321cea83 100644
> > --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> > +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> > @@ -601,10 +601,10 @@ int i915_sw_fence_await_reservation(struct i915_s=
w_fence *fence,
> >                 for (i =3D 0; i < count; i++)
> >                         dma_fence_put(shared[i]);
> >                 kfree(shared);
> > -       } else {
> > -               excl =3D dma_resv_get_excl_unlocked(resv);
> >         }
> >
> > +       excl =3D dma_resv_get_excl_unlocked(resv);
> > +
>
> The dma_resv_get_fences() call looks like it already fishes out the
> exclusive fence. Does this not leak the extra ref now?

Oh right I overlooked this, we already pick up the exclusive fence
unconditionally. Control flow here was a bit too clever for my parser.
I'll drop this patch in the next round.
-Daniel

>
> >         if (ret >=3D 0 && excl) {
> >                 pending =3D i915_sw_fence_await_dma_fence(fence,
> >                                                         excl,
> > --
> > 2.32.0
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
