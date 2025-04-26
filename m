Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A546A9DA7E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 14:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC6210E097;
	Sat, 26 Apr 2025 12:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GZIhYvVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFD010E097
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745669595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xTcAXMj4tAsirXSeiAXOoY8tnLHpYX9Lnnx10mXT5k=;
 b=GZIhYvVCpsEGoCki7U26BLQDzWYfUltlCl8HpNnv1ClqjQ8ZraSDcQDaDJi86qbGrwXbTl
 6WFP/A+RS2vuzOfe3uoqg6XOJa7N3v7v49qEho4W/PISaVzlFPFro/CWD9jXuLlryTPYum
 b62ScYlKifPGa1LwnHFFiczQyK8CGH4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-805uRXWhOESB7v9Z-ppF7w-1; Sat, 26 Apr 2025 08:13:13 -0400
X-MC-Unique: 805uRXWhOESB7v9Z-ppF7w-1
X-Mimecast-MFC-AGG-ID: 805uRXWhOESB7v9Z-ppF7w_1745669592
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3011bee1751so2904846a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 05:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745669592; x=1746274392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xTcAXMj4tAsirXSeiAXOoY8tnLHpYX9Lnnx10mXT5k=;
 b=DbDuEqb7yb3e5O/N69DOqq1in4eJxIdvyEpewBwfm/fHDQQmoauZHkZSpuVZlVI9sS
 UuTBKkMoCqCS4sd9q/rPREMgfvaMdAytYhIdEdqK9Y3LbOkV+xpRwi4BkVoWJQxG3rwN
 1mq+/o7aNq3jl64GIso7sh/U8fEl6mmMzYGQMIwTfMNyWoY8EnL5HHKzoevAFj2zBPo9
 KIMtRQj7QNf/Atw371CvKHgAuHSsANZSg4EDH55+NL+JBkuyY1dZfimLq0rLiX+KBzWV
 KQKlTd0mo4qkUpFFTojDL9bxFny+c/huvWyS8Lm7kBBBSHtpEARvqMFXuM8+NuHOaA7k
 OKPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9EaYVjPQDEBg1Owivg8z2aS02Qhs4NdgCP8P3CgRHTzThJWQV1PPBLCBohAydAP/0Z8LFzXpm7yw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxa5SBBhJktX9y7LqWUa9snJjip4Nd1izhhpWqqDDgtcLKNXWl
 tCbeD0qJ/WgrzkxL6rv5fq6lY+kDql7Xoa/B7e2vXd4vD+shLBk+dk/bYumyOhGbxb3+smMjQA+
 MXTJGw1EYsKRiorDCJiFz46LFPhCFEHfOuFTtLZ0zCFcJEGSJoKnRpz6YVdIwD634z/IdlRyDMs
 mGi76/hMGPLSYoLb/uNTjGjruMvGJhegivLI5UlXdo
X-Gm-Gg: ASbGncu0WHLttAR8Zm+57715hsBdJIZngj1+4bcBH8iIqkDwEUX/bdeVqkEHFSti3+T
 3DOKa5S7/JLXMcZy5k/Z0FWThqySfNLjiH8ovm5fC98hk6Bs16d+SixYNTBh2ChQn9GyOvLnPOw
 SWSgmICdWoRVWV5YZRRC+id5/d
X-Received: by 2002:a17:90a:e70b:b0:301:1d9f:4ba2 with SMTP id
 98e67ed59e1d1-30a01398557mr4355675a91.28.1745669592388; 
 Sat, 26 Apr 2025 05:13:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbEOQ7OJ1l+r0ODl6FuQUy8VHIQMHy0KMCDKAuggeFJa2xVPLoqb7dQAjINDCv4vafGglRIW52yLgCmTZ3urA=
X-Received: by 2002:a17:90a:e70b:b0:301:1d9f:4ba2 with SMTP id
 98e67ed59e1d1-30a01398557mr4355644a91.28.1745669592087; Sat, 26 Apr 2025
 05:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250425063234.757344-1-ryasuoka@redhat.com>
 <87wmb8yani.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87wmb8yani.fsf@minerva.mail-host-address-is-not-set>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Sat, 26 Apr 2025 21:13:00 +0900
X-Gm-Features: ATxdqUEw5zYtq3FD3jK20hIdBkgB26BvzEwuuPr00vWIGWH2Uh-jkXnoDtXz9Kg
Message-ID: <CAHpthZqJPKtXUjFiVRLP+LEmTKFowUKVHGDe9=NS4aGx7WWcMA@mail.gmail.com>
Subject: Re: [PATCH drm-next v2] drm/hyperv: Replace simple-KMS with regular
 atomic helpers
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 jfalempe@redhat.com, linux-hyperv@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YLFGfsbfZRfV58q3NI0JxuBrlmSrKI8dLJtZn0Hpz7g_1745669592
X-Mimecast-Originator: redhat.com
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

Hi Javier,

On Fri, Apr 25, 2025 at 4:15=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Ryosuke Yasuoka <ryasuoka@redhat.com> writes:
>
> Hello Ryosuke,
>
> > Drop simple-KMS in favor of regular atomic helpers to make the code mor=
e
> > modular. The simple-KMS helper mix up plane and CRTC state, so it is
> > obsolete and should go away [1]. Since it just split the simple-pipe
> > functions into per-plane and per-CRTC, no functional changes is
> > expected.
> >
> > [1] https://lore.kernel.org/lkml/dae5089d-e214-4518-b927-5c4149babad8@s=
use.de/
> >
> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> >
>
>
>
> > -static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
> > -                            struct drm_crtc_state *crtc_state,
> > -                            struct drm_plane_state *plane_state)
> > +static const uint32_t hyperv_formats[] =3D {
> > +     DRM_FORMAT_XRGB8888,
> > +};
> > +
> > +static const uint64_t hyperv_modifiers[] =3D {
> > +     DRM_FORMAT_MOD_LINEAR,
> > +     DRM_FORMAT_MOD_INVALID
> > +};
> > +
>
> I think the kernel u32 and u64 types are preferred ?

I'm not sure if I should fix this in this patch because I did not add these
variables. IMO, we need to split the commit if we fix them.

> > +static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> > +                                          struct drm_atomic_state *sta=
te)
> >  {
> > -     struct hyperv_drm_device *hv =3D to_hv(pipe->crtc.dev);
> > -     struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shad=
ow_plane_state(plane_state);
> > +     struct hyperv_drm_device *hv =3D to_hv(crtc->dev);
> > +     struct drm_plane *plane =3D &hv->plane;
> > +     struct drm_plane_state *plane_state =3D plane->state;
> > +     struct drm_crtc_state *crtc_state =3D crtc->state;
> >
> >       hyperv_hide_hw_ptr(hv->hdev);
> >       hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
> >                               crtc_state->mode.hdisplay,
> >                               crtc_state->mode.vdisplay,
> >                               plane_state->fb->pitches[0]);
> > -     hyperv_blit_to_vram_fullscreen(plane_state->fb, &shadow_plane_sta=
te->data[0]);
> >  }
> >
> > -static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
> > -                          struct drm_plane_state *plane_state,
> > -                          struct drm_crtc_state *crtc_state)
> > +static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> > +                                           struct drm_atomic_state *st=
ate)
> > +{ }
> > +
>
> Why do you need an empty CRTC atomic disable callback? Can you just not
> set it instead?

OK. I'll fix it in my next patch.

> >
> > -static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
> > -                            struct drm_plane_state *old_state)
> > +static void hyperv_plane_atomic_update(struct drm_plane *plane,
> > +                                                   struct drm_atomic_s=
tate *old_state)
> >  {
> > -     struct hyperv_drm_device *hv =3D to_hv(pipe->crtc.dev);
> > -     struct drm_plane_state *state =3D pipe->plane.state;
> > +     struct drm_plane_state *old_pstate =3D drm_atomic_get_old_plane_s=
tate(old_state, plane);
> > +     struct hyperv_drm_device *hv =3D to_hv(plane->dev);
> > +     struct drm_plane_state *state =3D plane->state;
>
> You should never access the plane->state directly, instead the helper
> drm_atomic_get_new_plane_state() should be used. You can also rename
> the old_state paramete to just state, since it will be used to lookup
> both the old and new atomic states.
>
> More info is in the following email from Ville:
>
> https://lore.kernel.org/dri-devel/Yx9pij4LmFHrq81V@intel.com/

OK. I'll fix it in my next patch. Thank you for sharing the url.

> >       struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shad=
ow_plane_state(state);
> >       struct drm_rect rect;
> >
> > -     if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
> > +     if (drm_atomic_helper_damage_merged(old_pstate, state, &rect)) {
>
> I know that most of the simple-KMS drivers do this but since this driver
> enables FB damage clips support, it is better to iterate over the damage
> areas. For example:
>
>         struct drm_atomic_helper_damage_iter iter;
>         struct drm_rect dst_clip;
>         struct drm_rect damage;
>
>         drm_atomic_helper_damage_iter_init(&iter, old_pstate, state);
>         drm_atomic_for_each_plane_damage(&iter, &damage) {
>                 dst_clip =3D state->dst;
>
>                 if (!drm_rect_intersect(&dst_clip, &damage))
>                         continue;
>
>                 hyperv_blit_to_vram_rect(state->fb, &shadow_plane_state->=
data[0], &damage);
>                 hyperv_update_dirt(hv->hdev, &damage);
>         }
>

OK. As you said, other drivers like mgag200 implement like this. I'll
fix them in my next patch.

> Other than these small comments, the patch looks good to me. So if you ta=
ke
> into account my suggestions, feel free to add:
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Thank you for your review and comment. I'll fix them and add your ack.

Best regards,
Ryosuke

> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>

