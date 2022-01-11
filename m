Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19E48B139
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 16:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E323A10E136;
	Tue, 11 Jan 2022 15:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C248D10E136
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 15:47:41 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 y13-20020a4a624d000000b002daae38b0b5so4535917oog.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 07:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jMG0vbtEa+ML1xi6XUQirSdL6PThzAhk+T7wuKwADzk=;
 b=IuJx7n/w/EvIJQvmXmZO6O68L8pxYvFez3pzSAdz2MJ/yFaM4s0AHZJCXozWW8YLDV
 Zud7SIrTb8/P1VUt0l4alz3sJcK6oXN/UgOwPHivTzm7Rc6UgZyxYUM1t9IyLz4/4w3Y
 18NPuxOY2vOX1beWvFcYVtaZ6ZzchwB45XdaFYa5Amv5Hjim8fd0H5oT2TLRCeOOcG1l
 F7tPt2TDCDF36M5O76bLQDdViOXQWvm2VXy0/HCas2dNSW71QCbp3lUmMgGifX2STRgn
 5kVgzAuDbsGras11M+eyxJcfkHqUmKzBMB6osLdmGODvH/IxfhzAF5mXsqf8RXM4s+9A
 tTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMG0vbtEa+ML1xi6XUQirSdL6PThzAhk+T7wuKwADzk=;
 b=3BY+V1vfCOGvdsFRwqyiokyWV9Fzv0zTbWRjktXoaFFz9Io7e4kdcY4rnE1ytStnRI
 9X0biwSYytltRI2FB84HReqO2r4HRfkYflg1M/GTO2Q9vOTV3g1gR805Lre1yTn+21jd
 YfpHKe1ffElYdM1jbo1Fcq5G9HRBaHOA7MDh6PHbbiEwD+cWhrrkHYNtQYPMbCuvojxd
 tmWQDBeE99feXYkloomj2254FkAGiKOp7JTRgrsoKx2YYwa0XWLUvjngBh3PChmFcOYd
 ha+tv3AKTjJ6LwWu0CbrHRjJ0tXLgwG9Wb5n7uZaWozgQFiwtGTd6kJwlND9HttASDmv
 pjjw==
X-Gm-Message-State: AOAM532E+qvRd9iK20IYVjoTAhkoVt5VaUmNMcVqfZ3+FUrW5NipZ2el
 OFBh0u4zb3uHbDtjYGjsv5WEsh1fJKNHG0FODjU=
X-Google-Smtp-Source: ABdhPJznbu977mBLf8BFtnM4LnUCv4oN39tXDyA0UffhTak52PzKEZ7+ARl+Gh74qb/NmSkFDVimWK15hH2MtsVMmY8=
X-Received: by 2002:a4a:9568:: with SMTP id n37mr3492430ooi.73.1641916061107; 
 Tue, 11 Jan 2022 07:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20211230040626.646807-1-victor.liu@nxp.com>
 <CADnq5_PsxrYeZ+p5NbXRks3EaJrYNMN+vbUJkiKHZ4cf=x=dsg@mail.gmail.com>
 <d4ae974f38d96bc02db6c137e622315388a99ba0.camel@nxp.com>
In-Reply-To: <d4ae974f38d96bc02db6c137e622315388a99ba0.camel@nxp.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Jan 2022 10:47:29 -0500
Message-ID: <CADnq5_OxdYK9E8NRk2ExRdwgKdO0L431MaP8TOqvDMcrt61zcw@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Check new_crtc_state->active to determine if
 CRTC needs disable in self refresh mode
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed out to drm-misc-next-fixes.

Alex

On Fri, Jan 7, 2022 at 9:07 PM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Fri, 2022-01-07 at 14:53 -0500, Alex Deucher wrote:
> > On Wed, Dec 29, 2021 at 11:07 PM Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > Actual hardware state of CRTC is controlled by the member 'active'
> > > in
> > > struct drm_crtc_state instead of the member 'enable', according to
> > > the
> > > kernel doc of the member 'enable'.  In fact, the drm client modeset
> > > and atomic helpers are using the member 'active' to do the control.
> > >
> > > Referencing the member 'enable' of new_crtc_state, the function
> > > crtc_needs_disable() may fail to reflect if CRTC needs disable in
> > > self refresh mode, e.g., when the framebuffer emulation will be
> > > blanked
> > > through the client modeset helper with the next commit, the member
> > > 'enable' of new_crtc_state is still true while the member 'active'
> > > is
> > > false, hence the relevant potential encoder and bridges won't be
> > > disabled.
> > >
> > > So, let's check new_crtc_state->active to determine if CRTC needs
> > > disable
> > > in self refresh mode instead of new_crtc_state->enable.
> > >
> > > Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh
> > > mode in drivers")
> > > Cc: Sean Paul <seanpaul@chromium.org>
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Do you need someone to push this for you?
>
> Yes, please.  Thanks.
>
> Liu Ying
>
> >
> > Alex
> >
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> > > b/drivers/gpu/drm/drm_atomic_helper.c
> > > index a7a05e1e26bb..9603193d2fa1 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -1016,7 +1016,7 @@ crtc_needs_disable(struct drm_crtc_state
> > > *old_state,
> > >          * it's in self refresh mode and needs to be fully
> > > disabled.
> > >          */
> > >         return old_state->active ||
> > > -              (old_state->self_refresh_active && !new_state-
> > > >enable) ||
> > > +              (old_state->self_refresh_active && !new_state-
> > > >active) ||
> > >                new_state->self_refresh_active;
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
>
