Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8978A7FC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001DA10E24B;
	Mon, 28 Aug 2023 08:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FBC10E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 08:45:47 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50091b91a83so4418489e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 01:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1693212345; x=1693817145;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bgtKJ6JG028uzitdv2BANG++TBn+0S2HAATaukIgA3o=;
 b=RFESEAkaE0WsGbmAwVUbbXSu2QEpYYUDd190Eq3l0YgxI7RTFoWDvSC1ADWd7vozff
 CANlFpsbHlm2iKJJEq8tgfPW49rJbp49D9D0/fBU5Fgiyj3l0KQwzNrRYxe/52JAmDZH
 +PfoRxLn6wKGavbI/So8/GOUkRF0/CKGaZlued1PZT3QxPvN+mhBO4IYBEeouRJGdIU0
 hL6KViwZrFbXKTwWYd2KnFlKpE4G5bQaGFf6n07NXn2HBTZ88Dul6M1Bqf7SP3Uex+Lx
 9z5acITqfOO5ldGdZTNH3IfOPMKUhDMbrceyJ2BXTS0wIm5UnSNQg/6MDGNMkRybWUex
 cJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693212345; x=1693817145;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bgtKJ6JG028uzitdv2BANG++TBn+0S2HAATaukIgA3o=;
 b=g17zwW7uX87Rn/Kcwi76tan5l4xq+cexQSml3vDgMakazNVAuDd5cHOBOC5PKN+lK2
 jVmXR8lOkE4wUTbuEWcRTvSCp4Q5Z9WsKCBpkDF+uCesSWBNkXI0NwYz3GKUy0osq1sR
 379IqQp0FPdGXMyn+am0FRos06thwXymXA4SO4iSD0m7s6NcOProO/x9lBw0OLCuQvlv
 dObwNy4jC1/HcZmAzaq+bp6B9B6CyD6uTF1K4EtMIAci8WHTOikHSzP5DykHHLn5PA7n
 QebvZkgdEP8HfdePsY8iTI+uJune5G9C9Ng7v2z7NUTe/GYrY9+Do9Vrn/+o4lMCRN7W
 q3VA==
X-Gm-Message-State: AOJu0YwI5L+SvZz9NjVyZEumzV2IQ41Lp3MNvV6xErZrYkaxU7EWW3iC
 uqXWIY1tM2v1AR6FAuBANDDSxk4RoHytG+HsUailuw==
X-Google-Smtp-Source: AGHT+IF4z7kmCYYRBFplG38so2/LZkucAx7xlrlOW+e6qKFzbBpFQuyP3vJmirj8x36Eufe4MEkyhCeprex2gFefbfE=
X-Received: by 2002:a19:3845:0:b0:500:9de4:5966 with SMTP id
 d5-20020a193845000000b005009de45966mr7509608lfj.62.1693212345181; Mon, 28 Aug
 2023 01:45:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c05f:b0:57:31f:17bc with HTTP; Mon, 28 Aug 2023
 01:45:44 -0700 (PDT)
In-Reply-To: <20230822151110.3107b745.pekka.paalanen@collabora.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
From: Joshua Ashton <joshua@froggi.es>
Date: Mon, 28 Aug 2023 09:45:44 +0100
Message-ID: <CAEZNXZCfvc909iFZQMdNEz=P_T=rYEYKq1Tdrt+8RNQpBSNt_g@mail.gmail.com>
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping CRTC
 degamma to DC plane
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000005d44af0603f7b88f"
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

--0000000000005d44af0603f7b88f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Degamma has always been on the plane on AMD. CRTC DEGAMMA_LUT has actually
just been applying it to every plane pre-blend.

Degamma makes no sense after blending anyway.
The entire point is for it to happen before blending to blend in linear
space. Otherwise DEGAMMA_LUT and REGAMMA_LUT are the exact same thing...

- Joshie =F0=9F=90=B8

On Tuesday, 22 August 2023, Pekka Paalanen <pekka.paalanen@collabora.com>
wrote:
> On Thu, 10 Aug 2023 15:02:59 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>
>> The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
>> pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
>> atomic degamma or implict degamma on legacy gamma. Detach degamma usage
>> regarging CRTC color properties to manage plane and CRTC color
>> correction combinations.
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
>>  1 file changed, 41 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index 68e9f2c62f2e..74eb02655d96 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct
dm_crtc_state *crtc)
>>       return 0;
>>  }
>>
>> -/**
>> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC
plane.
>> - * @crtc: amdgpu_dm crtc state
>> - * @dc_plane_state: target DC surface
>> - *
>> - * Update the underlying dc_stream_state's input transfer function
(ITF) in
>> - * preparation for hardware commit. The transfer function used depends
on
>> - * the preparation done on the stream for color management.
>> - *
>> - * Returns:
>> - * 0 on success. -ENOMEM if mem allocation fails.
>> - */
>> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>> -                                   struct dc_plane_state
*dc_plane_state)
>> +static int
>> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>> +                          struct dc_plane_state *dc_plane_state)
>>  {
>>       const struct drm_color_lut *degamma_lut;
>>       enum dc_transfer_func_predefined tf =3D TRANSFER_FUNCTION_SRGB;
>> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct
dm_crtc_state *crtc,
>>                                                &degamma_size);
>>               ASSERT(degamma_size =3D=3D MAX_COLOR_LUT_ENTRIES);
>>
>> -             dc_plane_state->in_transfer_func->type =3D
>> -                     TF_TYPE_DISTRIBUTED_POINTS;
>> +             dc_plane_state->in_transfer_func->type =3D
TF_TYPE_DISTRIBUTED_POINTS;
>>
>>               /*
>>                * This case isn't fully correct, but also fairly
>> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct
dm_crtc_state *crtc,
>>                                  degamma_lut, degamma_size);
>>               if (r)
>>                       return r;
>> -     } else if (crtc->cm_is_degamma_srgb) {
>> +     } else {
>>               /*
>>                * For legacy gamma support we need the regamma input
>>                * in linear space. Assume that the input is sRGB.
>> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct
dm_crtc_state *crtc,
>>
>>               if (tf !=3D TRANSFER_FUNCTION_SRGB &&
>>                   !mod_color_calculate_degamma_params(NULL,
>> -                         dc_plane_state->in_transfer_func, NULL, false)=
)
>> +
 dc_plane_state->in_transfer_func,
>> +                                                     NULL, false))
>>                       return -ENOMEM;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +/**
>> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC
plane.
>> + * @crtc: amdgpu_dm crtc state
>> + * @dc_plane_state: target DC surface
>> + *
>> + * Update the underlying dc_stream_state's input transfer function
(ITF) in
>> + * preparation for hardware commit. The transfer function used depends
on
>> + * the preparation done on the stream for color management.
>> + *
>> + * Returns:
>> + * 0 on success. -ENOMEM if mem allocation fails.
>> + */
>> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>> +                                   struct dc_plane_state
*dc_plane_state)
>> +{
>> +     bool has_crtc_cm_degamma;
>> +     int ret;
>> +
>> +     has_crtc_cm_degamma =3D (crtc->cm_has_degamma ||
crtc->cm_is_degamma_srgb);
>> +     if (has_crtc_cm_degamma){
>> +             /* AMD HW doesn't have post-blending degamma caps. When DR=
M
>> +              * CRTC atomic degamma is set, we maps it to DPP degamma
block
>> +              * (pre-blending) or, on legacy gamma, we use DPP degamma
to
>> +              * linearize (implicit degamma) from sRGB/BT709 according
to
>> +              * the input space.
>
> Uhh, you can't just move degamma before blending if KMS userspace
> wants it after blending. That would be incorrect behaviour. If you
> can't implement it correctly, reject it.
>
> I hope that magical unexpected linearization is not done with atomic,
> either.
>
> Or maybe this is all a lost cause, and only the new color-op pipeline
> UAPI will actually work across drivers.
>
>
> Thanks,
> pq
>
>> +              */
>> +             ret =3D map_crtc_degamma_to_dc_plane(crtc, dc_plane_state)=
;
>> +             if (ret)
>> +                     return ret;
>>       } else {
>>               /* ...Otherwise we can just bypass the DGM block. */
>>               dc_plane_state->in_transfer_func->type =3D TF_TYPE_BYPASS;
>
>

--0000000000005d44af0603f7b88f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Degamma has always been on the plane on AMD. CRTC DEGAMMA_LUT has actually =
just been applying it to every plane pre-blend.<br><br>Degamma makes no sen=
se after blending anyway.<br>The entire point is for it to happen before bl=
ending to blend in linear space. Otherwise DEGAMMA_LUT and REGAMMA_LUT are =
the exact same thing...<br><br>- Joshie =F0=9F=90=B8<br><br>On Tuesday, 22 =
August 2023, Pekka Paalanen &lt;<a href=3D"mailto:pekka.paalanen@collabora.=
com">pekka.paalanen@collabora.com</a>&gt; wrote:<br>&gt; On Thu, 10 Aug 202=
3 15:02:59 -0100<br>&gt; Melissa Wen &lt;<a href=3D"mailto:mwen@igalia.com"=
>mwen@igalia.com</a>&gt; wrote:<br>&gt;<br>&gt;&gt; The next patch adds pre=
-blending degamma to AMD color mgmt pipeline, but<br>&gt;&gt; pre-blending =
degamma caps (DPP) is currently in use to provide DRM CRTC<br>&gt;&gt; atom=
ic degamma or implict degamma on legacy gamma. Detach degamma usage<br>&gt;=
&gt; regarging CRTC color properties to manage plane and CRTC color<br>&gt;=
&gt; correction combinations.<br>&gt;&gt;<br>&gt;&gt; Reviewed-by: Harry We=
ntland &lt;<a href=3D"mailto:harry.wentland@amd.com">harry.wentland@amd.com=
</a>&gt;<br>&gt;&gt; Signed-off-by: Melissa Wen &lt;<a href=3D"mailto:mwen@=
igalia.com">mwen@igalia.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt;=C2=A0 .../a=
md/display/amdgpu_dm/amdgpu_dm_color.c=C2=A0 =C2=A0| 59 +++++++++++++------=
<br>&gt;&gt;=C2=A0 1 file changed, 41 insertions(+), 18 deletions(-)<br>&gt=
;&gt;<br>&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu=
_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c<br>&g=
t;&gt; index 68e9f2c62f2e..74eb02655d96 100644<br>&gt;&gt; --- a/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c<br>&gt;&gt; +++ b/drivers/gpu=
/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c<br>&gt;&gt; @@ -764,20 +764,9 =
@@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)<br>&gt;=
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>&gt;&gt;=C2=A0 }<br>&gt;&gt;=C2=
=A0<br>&gt;&gt; -/**<br>&gt;&gt; - * amdgpu_dm_update_plane_color_mgmt: Map=
s DRM color management to DC plane.<br>&gt;&gt; - * @crtc: amdgpu_dm crtc s=
tate<br>&gt;&gt; - * @dc_plane_state: target DC surface<br>&gt;&gt; - *<br>=
&gt;&gt; - * Update the underlying dc_stream_state&#39;s input transfer fun=
ction (ITF) in<br>&gt;&gt; - * preparation for hardware commit. The transfe=
r function used depends on<br>&gt;&gt; - * the preparation done on the stre=
am for color management.<br>&gt;&gt; - *<br>&gt;&gt; - * Returns:<br>&gt;&g=
t; - * 0 on success. -ENOMEM if mem allocation fails.<br>&gt;&gt; - */<br>&=
gt;&gt; -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,<=
br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dc_pl=
ane_state *dc_plane_state)<br>&gt;&gt; +static int<br>&gt;&gt; +map_crtc_de=
gamma_to_dc_plane(struct dm_crtc_state *crtc,<br>&gt;&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct dc_plane_state *dc_plane_state)<br>&gt;&gt;=C2=A0 {<br>&gt;&gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_color_lut *degamma_lut;<br>&gt;=
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enum dc_transfer_func_predefined tf =3D TRAN=
SFER_FUNCTION_SRGB;<br>&gt;&gt; @@ -800,8 +789,7 @@ int amdgpu_dm_update_pl=
ane_color_mgmt(struct dm_crtc_state *crtc,<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;degamma_size);<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ASSERT(degamma_size =3D=3D MAX_COLOR_LUT_ENTRIES);<br>&gt;&gt;=C2=
=A0<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc_plane_s=
tate-&gt;in_transfer_func-&gt;type =3D<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TF_TYPE_DISTRIBUTED_=
POINTS;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc_pla=
ne_state-&gt;in_transfer_func-&gt;type =3D TF_TYPE_DISTRIBUTED_POINTS;<br>&=
gt;&gt;=C2=A0<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/*<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * This case isn&#39;t fully correct, but also fairly<br>&gt;&gt; @@ -837,7=
 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc=
,<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 degamma_lut, degam=
ma_size);<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (r)<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0}=
 else if (crtc-&gt;cm_is_degamma_srgb) {<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}=
 else {<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
*<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For =
legacy gamma support we need the regamma input<br>&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in linear space. Assume that the i=
nput is sRGB.<br>&gt;&gt; @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_c=
olor_mgmt(struct dm_crtc_state *crtc,<br>&gt;&gt;=C2=A0<br>&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tf !=3D TRANSFER_FUNCTI=
ON_SRGB &amp;&amp;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0!mod_color_calculate_degamma_params(NULL,<br>&gt;&g=
t; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dc_plane_state-&gt;in_transfer_func, NULL, false))<br>&=
gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc_plane_state-&gt;in_trans=
fer_func,<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, false))=
<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>&=
gt;&gt; +<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>&gt;&gt; +}<br>&gt;=
&gt; +<br>&gt;&gt; +/**<br>&gt;&gt; + * amdgpu_dm_update_plane_color_mgmt: =
Maps DRM color management to DC plane.<br>&gt;&gt; + * @crtc: amdgpu_dm crt=
c state<br>&gt;&gt; + * @dc_plane_state: target DC surface<br>&gt;&gt; + *<=
br>&gt;&gt; + * Update the underlying dc_stream_state&#39;s input transfer =
function (ITF) in<br>&gt;&gt; + * preparation for hardware commit. The tran=
sfer function used depends on<br>&gt;&gt; + * the preparation done on the s=
tream for color management.<br>&gt;&gt; + *<br>&gt;&gt; + * Returns:<br>&gt=
;&gt; + * 0 on success. -ENOMEM if mem allocation fails.<br>&gt;&gt; + */<b=
r>&gt;&gt; +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crt=
c,<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dc=
_plane_state *dc_plane_state)<br>&gt;&gt; +{<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=
=A0bool has_crtc_cm_degamma;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>&=
gt;&gt; +<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0has_crtc_cm_degamma =3D (crtc-&g=
t;cm_has_degamma || crtc-&gt;cm_is_degamma_srgb);<br>&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0if (has_crtc_cm_degamma){<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* AMD HW doesn&#39;t have post-blending degamma ca=
ps. When DRM<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
* CRTC atomic degamma is set, we maps it to DPP degamma block<br>&gt;&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (pre-blending) or, on le=
gacy gamma, we use DPP degamma to<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * linearize (implicit degamma) from sRGB/BT709 accordi=
ng to<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the i=
nput space.<br>&gt;<br>&gt; Uhh, you can&#39;t just move degamma before ble=
nding if KMS userspace<br>&gt; wants it after blending. That would be incor=
rect behaviour. If you<br>&gt; can&#39;t implement it correctly, reject it.=
<br>&gt;<br>&gt; I hope that magical unexpected linearization is not done w=
ith atomic,<br>&gt; either.<br>&gt;<br>&gt; Or maybe this is all a lost cau=
se, and only the new color-op pipeline<br>&gt; UAPI will actually work acro=
ss drivers.<br>&gt;<br>&gt;<br>&gt; Thanks,<br>&gt; pq<br>&gt;<br>&gt;&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D map_crtc_degamma_to_dc_pla=
ne(crtc, dc_plane_state);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (ret)<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt;&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0} else {<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* ...Otherwise we can just bypass the DGM block. */<br>&gt;&g=
t;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc_plane_state-&gt=
;in_transfer_func-&gt;type =3D TF_TYPE_BYPASS;<br>&gt;<br>&gt;

--0000000000005d44af0603f7b88f--
