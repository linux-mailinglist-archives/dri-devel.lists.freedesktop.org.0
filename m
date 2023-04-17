Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9A6E4F4C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 19:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFB210E097;
	Mon, 17 Apr 2023 17:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021F10E097;
 Mon, 17 Apr 2023 17:34:46 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bb20so12321757oib.12;
 Mon, 17 Apr 2023 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681752885; x=1684344885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eeGDsMuMU6qRe43N99vF2ssCtRufnnsTh9UIA9+QypE=;
 b=IDInwrW+xH9jdKHhQwGZ9AMx5IBZdTD6+1g3OhLs9BWIvByeuF8PqXlZYUpbq13ny8
 /CYUx0aSkCiH+tnQ1E70s+IGQ8WA2eqmH7hS/7MnAaKcHofmJ86YfSi1Y38FKGOCNdMA
 g3m+DAZpNsBcTuqDcyVLYTwgcWMeqR0Jb3MZD8ZYVQNxghqAIUU6r/lyLwqGDpf0w29g
 WjOwYOtrKN8/k4FPwJhoEp1I0+NGXF6sglPcQq3Qlo1TNlp6XLoWjB1IP4AI9+4i64bv
 UqXueR38VYZqbwHAIWrwo/ZOTqmMuybmySOdU86AU7kuz5YsH33MG6ug6/G30vMd7Pl4
 o6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681752885; x=1684344885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eeGDsMuMU6qRe43N99vF2ssCtRufnnsTh9UIA9+QypE=;
 b=b5YT/Ns6gwI9Q7QJghb2FCMM/1LWttL7oFI8E6cOiAgeOvT/NS9Q3B0VjaumE/S+I7
 jL190HWqOD9zh0+8gVGqeJOqXF7NVv7AjGrVVpU32IyuvomLK9I6WBdkcWbJ6VNruZeg
 F3R6EFB0fixhprUjlIKqxEyWXsuJDWcmI85XlcH2Q7uinT3narVTChFP+nE2bQC7LiIL
 AHEt/N1OT8GiFJT9PclsFXPZztlQk03xuk4+Jqj4RXf3M/akoSuBIEyjtSgnBaRHqXnA
 DDc3a6aXqkgYTAAqzvdy+O1gJLQ9Rkc0KeYONI5gGu/5kbCk15z86aZq6e5sQsuazgtm
 p2RA==
X-Gm-Message-State: AAQBX9fcXC685LpA2oJ1u975mcMoIBa3Rb7m3AmkJJtt9AhFcKflNVSf
 7feXZ1G/rKztmoFee2xkqs7iLwP1Vr60HZuY6bJrQDJQ
X-Google-Smtp-Source: AKy350bTrioIHzK5dr57vHhkLOTsyDawAXA2vhtRBswSuZM9nYlM43t4FGB7iGqblWvkCMZohmexiSP4DPey+QT8DqY=
X-Received: by 2002:aca:ea8b:0:b0:38e:2135:697f with SMTP id
 i133-20020acaea8b000000b0038e2135697fmr426732oih.3.1681752885378; Mon, 17 Apr
 2023 10:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230414193331.199598-1-hamza.mahfooz@amd.com>
 <4207e848-4e79-29a7-2bb0-44f74a2d62c7@amd.com>
In-Reply-To: <4207e848-4e79-29a7-2bb0-44f74a2d62c7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Apr 2023 13:34:33 -0400
Message-ID: <CADnq5_MRMjr3byW_qO==Ps+X9grYQ9FLYGFEnd_Jsu3FLQBzCw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix flickering caused by S/G mode
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, dri-devel@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 1:59=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 14.04.23 um 21:33 schrieb Hamza Mahfooz:
> > Currently, we allow the framebuffer for a given plane to move between
> > memory domains, however when that happens it causes the screen to
> > flicker, it is even possible for the framebuffer to change memory
> > domains on every plane update (causing a continuous flicker effect). So=
,
> > to fix this, don't perform an immediate flip in the aforementioned case=
.
>
> That sounds strongly like you just forget to wait for the move to finish!

It doesn't exhibit when we allow only gtt or only vram, only when
switches between pools does it flicker.

Alex

>
> What is the order of things done here? E.g. who calls amdgpu_bo_pin()
> and who waits for fences for finish signaling? Is that maybe just in the
> wrong order?
>
> Regards,
> Christian.
>
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v=
2)")
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41 ++++++++++++++++++=
-
> >   1 file changed, 39 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index da3045fdcb6d..9a4e7408384a 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -7897,6 +7897,34 @@ static void amdgpu_dm_commit_cursors(struct drm_=
atomic_state *state)
> >                       amdgpu_dm_plane_handle_cursor_update(plane, old_p=
lane_state);
> >   }
> >
> > +static inline uint32_t get_mem_type(struct amdgpu_device *adev,
> > +                                 struct drm_gem_object *obj,
> > +                                 bool check_domain)
> > +{
> > +     struct amdgpu_bo *abo =3D gem_to_amdgpu_bo(obj);
> > +     uint32_t mem_type;
> > +
> > +     if (unlikely(amdgpu_bo_reserve(abo, true)))
> > +             return 0;
> > +
> > +     if (unlikely(dma_resv_reserve_fences(abo->tbo.base.resv, 1)))
> > +             goto err;
> > +
> > +     if (check_domain &&
> > +         amdgpu_display_supported_domains(adev, abo->flags) !=3D
> > +         (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT))
> > +             goto err;
> > +
> > +     mem_type =3D abo->tbo.resource->mem_type;
> > +     amdgpu_bo_unreserve(abo);
> > +
> > +     return mem_type;
> > +
> > +err:
> > +     amdgpu_bo_unreserve(abo);
> > +     return 0;
> > +}
> > +
> >   static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
> >                                   struct dc_state *dc_state,
> >                                   struct drm_device *dev,
> > @@ -7916,6 +7944,7 @@ static void amdgpu_dm_commit_planes(struct drm_at=
omic_state *state,
> >                       to_dm_crtc_state(drm_atomic_get_old_crtc_state(st=
ate, pcrtc));
> >       int planes_count =3D 0, vpos, hpos;
> >       unsigned long flags;
> > +     uint32_t mem_type;
> >       u32 target_vblank, last_flip_vblank;
> >       bool vrr_active =3D amdgpu_dm_crtc_vrr_active(acrtc_state);
> >       bool cursor_update =3D false;
> > @@ -8035,13 +8064,21 @@ static void amdgpu_dm_commit_planes(struct drm_=
atomic_state *state,
> >                       }
> >               }
> >
> > +             mem_type =3D get_mem_type(dm->adev, old_plane_state->fb->=
obj[0],
> > +                                     true);
> > +
> >               /*
> >                * Only allow immediate flips for fast updates that don't
> > -              * change FB pitch, DCC state, rotation or mirroing.
> > +              * change memory domain, FB pitch, DCC state, rotation or
> > +              * mirroring.
> >                */
> >               bundle->flip_addrs[planes_count].flip_immediate =3D
> >                       crtc->state->async_flip &&
> > -                     acrtc_state->update_type =3D=3D UPDATE_TYPE_FAST;
> > +                     acrtc_state->update_type =3D=3D UPDATE_TYPE_FAST =
&&
> > +                     (!mem_type || (mem_type && get_mem_type(dm->adev,
> > +                                                             fb->obj[0=
],
> > +                                                             false) =
=3D=3D
> > +                                    mem_type));
> >
> >               timestamp_ns =3D ktime_get_ns();
> >               bundle->flip_addrs[planes_count].flip_timestamp_in_us =3D=
 div_u64(timestamp_ns, 1000);
>
