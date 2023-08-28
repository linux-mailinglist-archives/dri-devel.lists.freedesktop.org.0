Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C287578AA99
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 12:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A7410E27B;
	Mon, 28 Aug 2023 10:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B112D10E27B;
 Mon, 28 Aug 2023 10:24:01 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 439396607197;
 Mon, 28 Aug 2023 11:23:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693218240;
 bh=TRZbDe8LQuMgVOMhiHo5O62FMhTtzu3Ux1yNcKFKK1M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gWHu19hdiXW9IhnxixEck7dEGyj1COfkIsc7EKiHF58iRkihvOlH6JN7iCdIvlVgq
 Lrdc6Xl3Ab8En3tbHsY6/p79OsM0SPznmJ7M2ikkTjcvafb9CMXfftkjO5v/XTQr1F
 rKgzyNhqDmf9q/cX+Oxyyg1IMjHjuZWczRcw80Lp6T/xHJBdg+c5DktFgeFXoKW3gs
 m5Tx/wOqn4sI0QPp8Grcv56rGAQGpR5ge7YWpNOcKb4/kGYEwbJ3peWFei1dLO4b7X
 f3xs7CyXAsElTsD7mc6ddC/VreTqLqSKeQz+1gp43pNhaWgGKNRYlrR+pY71JeAzbm
 kH5sMgLHuGbuw==
Date: Mon, 28 Aug 2023 13:23:55 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping
 CRTC degamma to DC plane
Message-ID: <20230828132355.21a8fd89.pekka.paalanen@collabora.com>
In-Reply-To: <CAEZNXZCfvc909iFZQMdNEz=P_T=rYEYKq1Tdrt+8RNQpBSNt_g@mail.gmail.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
 <CAEZNXZCfvc909iFZQMdNEz=P_T=rYEYKq1Tdrt+8RNQpBSNt_g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sungjoon.kim@amd.com" <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Aug 2023 09:45:44 +0100
Joshua Ashton <joshua@froggi.es> wrote:

> Degamma has always been on the plane on AMD. CRTC DEGAMMA_LUT has actually
> just been applying it to every plane pre-blend.

I've never seen that documented anywhere.

It has seemed obvious, that since we have KMS objects for planes and
CRTCs, stuff on the CRTC does not do plane stuff before blending. That
also has not been documented in the past, but it seemed the most
logical choice.

Even today
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#color-management-properties
make no mention of whether they apply before or after blending.

> Degamma makes no sense after blending anyway.

If the goal is to allow blending in optical or other space, you are
correct. However, APIs do not need to make sense to exist, like most of
the options of "Colorspace" connector property.

I have always thought the CRTC DEGAMMA only exists to allow the CRTC
CTM to work in linear or other space.

I have at times been puzzled by what the DEGAMMA and CTM are actually
good for.

> The entire point is for it to happen before blending to blend in linear
> space. Otherwise DEGAMMA_LUT and REGAMMA_LUT are the exact same thing...

The CRTC CTM is between CRTC DEGAMMA and CRTC GAMMA, meaning they are
not interchangeable.

I have literally believed that DRM KMS UAPI simply does not support
blending in optical space, unless your framebuffers are in optical
which no-one does, until the color management properties are added to
KMS planes. This never even seemed weird, because non-linear blending
is so common.

So I have been misunderstanding the CRTC DEGAMMA property forever. Am I
the only one? Do all drivers agree today at what point does CRTC
DEGAMMA apply, before blending on all planes or after blending?

Does anyone know of any doc about that?

If drivers do not agree on the behaviour of a KMS property, then that
property is useless for generic userspace.


Thanks,
pq


> On Tuesday, 22 August 2023, Pekka Paalanen <pekka.paalanen@collabora.com>
> wrote:
> > On Thu, 10 Aug 2023 15:02:59 -0100
> > Melissa Wen <mwen@igalia.com> wrote:
> >  
> >> The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
> >> pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
> >> atomic degamma or implict degamma on legacy gamma. Detach degamma usage
> >> regarging CRTC color properties to manage plane and CRTC color
> >> correction combinations.
> >>
> >> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >> ---
> >>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
> >>  1 file changed, 41 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >> index 68e9f2c62f2e..74eb02655d96 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct  
> dm_crtc_state *crtc)
> >>       return 0;
> >>  }
> >>
> >> -/**
> >> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC  
> plane.
> >> - * @crtc: amdgpu_dm crtc state
> >> - * @dc_plane_state: target DC surface
> >> - *
> >> - * Update the underlying dc_stream_state's input transfer function  
> (ITF) in
> >> - * preparation for hardware commit. The transfer function used depends  
> on
> >> - * the preparation done on the stream for color management.
> >> - *
> >> - * Returns:
> >> - * 0 on success. -ENOMEM if mem allocation fails.
> >> - */
> >> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >> -                                   struct dc_plane_state  
> *dc_plane_state)
> >> +static int
> >> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> >> +                          struct dc_plane_state *dc_plane_state)
> >>  {
> >>       const struct drm_color_lut *degamma_lut;
> >>       enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
> >> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct  
> dm_crtc_state *crtc,
> >>                                                &degamma_size);
> >>               ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
> >>
> >> -             dc_plane_state->in_transfer_func->type =
> >> -                     TF_TYPE_DISTRIBUTED_POINTS;
> >> +             dc_plane_state->in_transfer_func->type =  
> TF_TYPE_DISTRIBUTED_POINTS;
> >>
> >>               /*
> >>                * This case isn't fully correct, but also fairly
> >> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct  
> dm_crtc_state *crtc,
> >>                                  degamma_lut, degamma_size);
> >>               if (r)
> >>                       return r;
> >> -     } else if (crtc->cm_is_degamma_srgb) {
> >> +     } else {
> >>               /*
> >>                * For legacy gamma support we need the regamma input
> >>                * in linear space. Assume that the input is sRGB.
> >> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct  
> dm_crtc_state *crtc,
> >>
> >>               if (tf != TRANSFER_FUNCTION_SRGB &&
> >>                   !mod_color_calculate_degamma_params(NULL,
> >> -                         dc_plane_state->in_transfer_func, NULL, false))
> >> +  
>  dc_plane_state->in_transfer_func,
> >> +                                                     NULL, false))
> >>                       return -ENOMEM;
> >> +     }
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +/**
> >> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC  
> plane.
> >> + * @crtc: amdgpu_dm crtc state
> >> + * @dc_plane_state: target DC surface
> >> + *
> >> + * Update the underlying dc_stream_state's input transfer function  
> (ITF) in
> >> + * preparation for hardware commit. The transfer function used depends  
> on
> >> + * the preparation done on the stream for color management.
> >> + *
> >> + * Returns:
> >> + * 0 on success. -ENOMEM if mem allocation fails.
> >> + */
> >> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >> +                                   struct dc_plane_state  
> *dc_plane_state)
> >> +{
> >> +     bool has_crtc_cm_degamma;
> >> +     int ret;
> >> +
> >> +     has_crtc_cm_degamma = (crtc->cm_has_degamma ||  
> crtc->cm_is_degamma_srgb);
> >> +     if (has_crtc_cm_degamma){
> >> +             /* AMD HW doesn't have post-blending degamma caps. When DRM
> >> +              * CRTC atomic degamma is set, we maps it to DPP degamma  
> block
> >> +              * (pre-blending) or, on legacy gamma, we use DPP degamma  
> to
> >> +              * linearize (implicit degamma) from sRGB/BT709 according  
> to
> >> +              * the input space.  
> >
> > Uhh, you can't just move degamma before blending if KMS userspace
> > wants it after blending. That would be incorrect behaviour. If you
> > can't implement it correctly, reject it.
> >
> > I hope that magical unexpected linearization is not done with atomic,
> > either.
> >
> > Or maybe this is all a lost cause, and only the new color-op pipeline
> > UAPI will actually work across drivers.
> >
> >
> > Thanks,
> > pq
> >  
> >> +              */
> >> +             ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> >> +             if (ret)
> >> +                     return ret;
> >>       } else {
> >>               /* ...Otherwise we can just bypass the DGM block. */
> >>               dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;  
> >
> >  

