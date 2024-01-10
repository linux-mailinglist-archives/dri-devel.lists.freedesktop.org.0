Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF85829AEC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 14:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A13810E76C;
	Wed, 10 Jan 2024 13:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A587310E76C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 13:09:44 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3bc1e4d0fd8so526681b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704892184; x=1705496984; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axpQS9mt6EONwc4UHXjuYA8cIAmRvc0FbgaFcTL7424=;
 b=kwzOlIOCpsRcd4IEew9OhjOtgnSqpdnBNY6887fPGkAdvHO7Vu1QxlgXu9bjPuLn6e
 sxWkaSn/67VxUIS9uC3wdQCuHxjve6BD4VhRE7pU4FB7ZC6ilSlYNfU7hcb8x1m2EQy1
 ny16QK9q23EDekkXXFs77yx8nYG3F7Wr9jG+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704892184; x=1705496984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axpQS9mt6EONwc4UHXjuYA8cIAmRvc0FbgaFcTL7424=;
 b=w/lc+pR3GIic5PkPZNscEETrtco4U4eOQ3eQ5GL4PRThQiATi/cdFPyL9bO6TQ0lFB
 VoKR3sc1wJVXsgRV0PXoQaibe8r1Lh+d5U20tRnuvGsoZ4Qlm1eBGaBBBO4YqmrYmsGw
 Qy7UuN4kp3TOnsG7JA6k0YiaZScPLwZXytvJQ1ooZ9ITnFVSbWwrfrwXvZnY4jxDTgyJ
 VMT3Gxcgsfi4j6T4aLRb0uTi3pbKTacNSZ0ujSQH+zWGM8ZTggG6JjRRfdKmXhzRyW5l
 Sj7CEIXYzyE5+yrwf2gpI5fAqtUo/XAky8LLPY6htaFoay8G/yKNi5EKco1OMcP4cmIm
 uR1Q==
X-Gm-Message-State: AOJu0YyO5kbGR683TUFL5KPqqXOxMxwd3J1cFkXgSFK8AxipfRNfH/60
 Kfsk4oCd00gEO9t5gif4OazxgaiNOkQZCvEhWtIt39dzi7xb8g==
X-Google-Smtp-Source: AGHT+IH5PhKcQx1VfacgvsFkwrC19+V2RZMkdswfiLwrvrDfWNWWbhwatQpHwBl6QNABwcTT8HQd0hYsSvkAKtaiOtQ=
X-Received: by 2002:a05:6870:4304:b0:206:7561:280a with SMTP id
 w4-20020a056870430400b002067561280amr1694852oah.4.1704892183803; Wed, 10 Jan
 2024 05:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-4-andri@yngvason.is>
 <ZZ57Nl3CnRMPcfbj@phenom.ffwll.local>
 <CAFNQBQzo17cK4M-S=Mje8Lxub9Y74xFGj7iEq57vKJr47oiz5Q@mail.gmail.com>
In-Reply-To: <CAFNQBQzo17cK4M-S=Mje8Lxub9Y74xFGj7iEq57vKJr47oiz5Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 10 Jan 2024 14:09:32 +0100
Message-ID: <CAKMK7uGhMCwbztGdEmG4gFgpyhw6j-JFow-AaprFxcX710=qXA@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/amd/display: Add handling for new "active color
 format" property
To: Andri Yngvason <andri@yngvason.is>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Werner Sembach <wse@tuxedocomputers.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024 at 13:53, Andri Yngvason <andri@yngvason.is> wrote:
>
> mi=C3=B0., 10. jan. 2024 kl. 11:10 skrifa=C3=B0i Daniel Vetter <daniel@ff=
wll.ch>:
> >
> > On Tue, Jan 09, 2024 at 06:11:00PM +0000, Andri Yngvason wrote:
> > > +     /* Extract information from crtc to communicate it to userspace=
 as connector properties */
> > > +     for_each_new_connector_in_state(state, connector, new_con_state=
, i) {
> > > +             struct drm_crtc *crtc =3D new_con_state->crtc;
> > > +             struct dc_stream_state *stream;
> > > +
> > > +             if (crtc) {
> > > +                     new_crtc_state =3D drm_atomic_get_new_crtc_stat=
e(state, crtc);
> > > +                     dm_new_crtc_state =3D to_dm_crtc_state(new_crtc=
_state);
> > > +                     stream =3D dm_new_crtc_state->stream;
> > > +
> > > +                     if (stream) {
> > > +                             drm_connector_set_active_color_format_p=
roperty(connector,
> > > +                                     convert_dc_pixel_encoding_into_=
drm_color_format(
> > > +                                             dm_new_crtc_state->stre=
am->timing.pixel_encoding));
> > > +                     }
> > > +             } else {
> > > +                     drm_connector_set_active_color_format_property(=
connector, 0);
> >
> > Just realized an even bigger reason why your current design doesn't wor=
k:
> > You don't have locking here.
> >
> > And you cannot grab the required lock, which is
> > drm_dev->mode_config.mutex, because that would result in deadlocks. So
> > this really needs to use the atomic state based design I've described.
> >
>
> Maybe we should just drop "actual color format" and instead fail the
> modeset if the "preferred color format" property cannot be satisfied?
> It seems like the simplest thing to do here, though it is perhaps less
> convenient for userspace. In that case, the "preferred color format"
> property should just be called "color format".

Yeah that's more in line with how other atomic properties work. This
way userspace can figure out what works with a TEST_ONLY commit too.
And for this to work you probably want to have an "automatic" setting
too.
-Sima
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
