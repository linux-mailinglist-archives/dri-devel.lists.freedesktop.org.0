Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D68543FC05
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 14:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B83B6EA56;
	Fri, 29 Oct 2021 12:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52C96EA56
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 12:06:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9C2461177
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635509208;
 bh=wHSN4gzbMNlP3cL0uOMD0Bz+CpMAiXAmVJsjYeOYTuY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BqxXoqRchGkK6bbVqSvH6vrUMYS6QQNRuZLuHTaEwKjyesVVYW0M1R9xUyPPVBq/b
 Fdea7iZFhFgpqUeLPEnikp4auVRHTVZ6HsBgNJ9tVCXmRGjBtpowc5ra9WHKtd8yMs
 YnSeEwUk5p5XqZDY6LHNj4zVsV6VygKxVbIpTAFlPdDKR+iVPJo7M5gihmWgTLWa3m
 RwjDuf8KYntAKGwcMzWzt+36lC0HDhifSLL4qM84mnFq2EAb1YzMwcR3ltwpvOdGKG
 B9FDoUGyoMzoK9qogHhyPDZxWwb84e+trtmAoNNXN3M5Ajp+uRaiZXKT5tELtyfD5t
 mplXexvNHCfhA==
Received: by mail-wr1-f47.google.com with SMTP id d5so561458wrc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 05:06:48 -0700 (PDT)
X-Gm-Message-State: AOAM531lP7HUYhKgYWltkm9u/z+A3IKDr8m1W+DDNslapsezjgYmMm4f
 YONYX++CoAiTxBfD6KXwrpXs/XgIAy0ZhnBn09c=
X-Google-Smtp-Source: ABdhPJyuj/QVAPGVv6P9H50bSyp8g+Y5gAbxa7PrEH9Io/M+TBSmkz99ozucgwXHa/I3Q6KEGbXDDmRLxgKXyg6skhU=
X-Received: by 2002:adf:e292:: with SMTP id v18mr13328237wri.369.1635509207143; 
 Fri, 29 Oct 2021 05:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook>
 <YVXJLE8UqgcUNIKl@phenom.ffwll.local> <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
 <ca11cd15-3877-468b-c6b7-9022b6b11824@redhat.com>
 <YXrAm6d6ALx0aciQ@phenom.ffwll.local>
In-Reply-To: <YXrAm6d6ALx0aciQ@phenom.ffwll.local>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Oct 2021 14:06:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1i5=Z59=zL6MFL3oN-Wj9kbV8xsgoZG-rAn8NekZz9Og@mail.gmail.com>
Message-ID: <CAK8P3a1i5=Z59=zL6MFL3oN-Wj9kbV8xsgoZG-rAn8NekZz9Og@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
To: Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Kees Cook <keescook@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 5:24 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Oct 27, 2021 at 03:19:34PM +0200, Javier Martinez Canillas wrote:
> > On 10/27/21 14:18, Arnd Bergmann wrote:
> >
> > [snip]
> >
> > > Right, how about this change on top?
> > >
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -117,9 +117,8 @@ config DRM_DEBUG_MODESET_LOCK
> > >
> > >  config DRM_FBDEV_EMULATION
> > >         bool "Enable legacy fbdev support for your modesetting driver"
> > > -       depends on DRM
> > > -       depends on FB=y || FB=DRM
> > > -       select DRM_KMS_HELPER
> > > +       depends on DRM_KMS_HELPER
> > > +       depends on FB=y || FB=DRM_KMS_HELPER
> > >         select FB_CFB_FILLRECT
> > >         select FB_CFB_COPYAREA
> > >         select FB_CFB_IMAGEBLIT
> > >
> > > That would probably make it work for DRM=y, FB=m, DRM_KMS_HELPER=m,
> > > but it needs more randconfig testing, which I can help with.
> >
> > Looks good to me as well.
> >
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Is the mess I created sorted now, or something for me to do? I'm terribly
> burried in stuff :-/

I have done a few days worth of build testing with that patch applied, and
did not see any other problems. I've written a proper description and
submitted it as
https://lore.kernel.org/all/20211029120307.1407047-1-arnd@kernel.org/T

The version you have in linux-next works correctly, but this patch on top
is an improvement.

        Arnd
