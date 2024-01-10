Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA846829AAA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 13:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C9A10E5A8;
	Wed, 10 Jan 2024 12:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6C310E5A8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 12:53:22 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-dbed729a51eso3060317276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704891202; x=1705496002; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tumM7ZgHm0hfd7iZgxyi6dhv3yMhPnlkKGS30wXR09c=;
 b=e56qb+FEVSFhxED5RQ+Xv80A6DXq76Wo0078EXmxbTRmEHL+ws1m2x/b+70rfuRUl1
 tzqAfwml2h1r5Eu/Q9ou1qZJLDs3F+l/EITAxaNy7rFVPgeMZLVXuH5JPngSMre6Sw74
 tmHsrFKO/hdPMvQgu+pBcTtTa/rQvu8cOZNwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704891202; x=1705496002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tumM7ZgHm0hfd7iZgxyi6dhv3yMhPnlkKGS30wXR09c=;
 b=AhIlCrWlM1XaNjdcry1AGNPFwbiL/+3bSlSmqrAQDoVrOgMpzST64ejEEO/3uBlJkd
 WC9aK+kC0DNvFNSG42opK2XFBb042QFHqXMvyO2x9NApm98126zoGIy1ZyJS2S4pDenn
 VZ3fx9wE7vuAGUeFi8tdhpzQaZkAXRaK6TL80bLp1JID8mbobzcr0ga8Q37bRJOZzPPA
 b/SPIPiyIuHr8aSq4OJGm0sNkJf7oSGlKPox1zJH8cweYsLUbLbIJjGv1RHVxCcopDCZ
 6b+C0EvUUXZ597YR/C551yU902WKGBDqSRuIyD5SCKMRhRuuOyoDKbC9VqGr6QluJeCU
 LKbg==
X-Gm-Message-State: AOJu0YzGZDOm2te8oVHDrdASshVUUnJ4fAqZJfs6/VFn5ela2XOZqxJ7
 EDfibks5jAKUgjIY2R0lDYPEPoaYl5qa6KEMgRdKLr0FTrGRow==
X-Google-Smtp-Source: AGHT+IEdEju6g56OensZJBuTZt9it0HPqzyt0o4DWwDRHwkW6tKsf3VmrtAhshl6Dqs1AQIYgIHNU9Hnp9bHW2jrsSo=
X-Received: by 2002:a5b:d51:0:b0:dbd:ab70:4e8f with SMTP id
 f17-20020a5b0d51000000b00dbdab704e8fmr625799ybr.4.1704891201874; Wed, 10 Jan
 2024 04:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-4-andri@yngvason.is>
 <ZZ57Nl3CnRMPcfbj@phenom.ffwll.local>
In-Reply-To: <ZZ57Nl3CnRMPcfbj@phenom.ffwll.local>
From: Andri Yngvason <andri@yngvason.is>
Date: Wed, 10 Jan 2024 12:52:46 +0000
Message-ID: <CAFNQBQzo17cK4M-S=Mje8Lxub9Y74xFGj7iEq57vKJr47oiz5Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/amd/display: Add handling for new "active color
 format" property
To: Andri Yngvason <andri@yngvason.is>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, 
 Werner Sembach <wse@tuxedocomputers.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mi=C3=B0., 10. jan. 2024 kl. 11:10 skrifa=C3=B0i Daniel Vetter <daniel@ffwl=
l.ch>:
>
> On Tue, Jan 09, 2024 at 06:11:00PM +0000, Andri Yngvason wrote:
> > +     /* Extract information from crtc to communicate it to userspace a=
s connector properties */
> > +     for_each_new_connector_in_state(state, connector, new_con_state, =
i) {
> > +             struct drm_crtc *crtc =3D new_con_state->crtc;
> > +             struct dc_stream_state *stream;
> > +
> > +             if (crtc) {
> > +                     new_crtc_state =3D drm_atomic_get_new_crtc_state(=
state, crtc);
> > +                     dm_new_crtc_state =3D to_dm_crtc_state(new_crtc_s=
tate);
> > +                     stream =3D dm_new_crtc_state->stream;
> > +
> > +                     if (stream) {
> > +                             drm_connector_set_active_color_format_pro=
perty(connector,
> > +                                     convert_dc_pixel_encoding_into_dr=
m_color_format(
> > +                                             dm_new_crtc_state->stream=
->timing.pixel_encoding));
> > +                     }
> > +             } else {
> > +                     drm_connector_set_active_color_format_property(co=
nnector, 0);
>
> Just realized an even bigger reason why your current design doesn't work:
> You don't have locking here.
>
> And you cannot grab the required lock, which is
> drm_dev->mode_config.mutex, because that would result in deadlocks. So
> this really needs to use the atomic state based design I've described.
>

Maybe we should just drop "actual color format" and instead fail the
modeset if the "preferred color format" property cannot be satisfied?
It seems like the simplest thing to do here, though it is perhaps less
convenient for userspace. In that case, the "preferred color format"
property should just be called "color format".

Thanks,
Andri
