Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3667C27C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 02:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FA210E8CD;
	Thu, 26 Jan 2023 01:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B7110E8CD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 01:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674697102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FktJRh3Oo4iQu4tIjorwONtAD8Srts+yZHN78lIIaLI=;
 b=W+v9QvaU2I+XxU/CmIkxuJndAimp/TdVzUIGn42phD6RN3GGeLzMkTNtf3ytqySIicLJ/n
 zHr1N8UrMAkiWqW9od7BaH9jdbUiC+oqL4TqcWYzPygtfrkCVN3+eco8Rivw77dBcqoPfI
 /FNPUBll7JyYalxTay3p8Gj4fd8FbGY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-ZZnK4JdAPTymy6ifllS2aA-1; Wed, 25 Jan 2023 20:38:21 -0500
X-MC-Unique: ZZnK4JdAPTymy6ifllS2aA-1
Received: by mail-lf1-f71.google.com with SMTP id
 i13-20020a056512340d00b004b8825890a1so283915lfr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FktJRh3Oo4iQu4tIjorwONtAD8Srts+yZHN78lIIaLI=;
 b=zIauyzqnXKl7adZ+yrhBijtBkDIm9c8sPS7ObH1iQ7PjJvUZ878HmIJEMdhnXChfiF
 l3xbqzSJ2i4OQ7aNjiUQqdPXcdeO3LmbgVJx0jann8m4gB08DoP+0XgudmeqH2Mc33+o
 NPGI0JwNYiBoSB3x8YqbBIaZeyQ1W5Ub+nPVfe7V5DBFVXdZ5bzzYfpZ4dLNovQUW+vD
 TR9xjBs5cIg362ffwO9oHEC3u5zSCvuoruySc8830iTPFqpSO4rkoO7NX9aEyb/3qcdd
 v6xauYWVX7QNw58AnmI9gZ8ZNNAjWAmvpB5WSri5vQ/iMXaiX7HEuzcwe8b35VuAHOiJ
 BBwA==
X-Gm-Message-State: AO0yUKUalED5WoatkfD+jq/zH9cvxzRd9kOIAjDEmigsywblXQnCYg0Q
 yVZyANg7e5X5hfLyQXHOJIt2dI2rSb10Nx8fm4ZdzViGk2ggppfBneOEjwdDQoAobawFc2BGzma
 Peb3AdkGJyLTtHAy0SllV5c/ac6W1v3UXQ060woOwFUk4
X-Received: by 2002:a2e:9ac8:0:b0:28e:6a36:f4d with SMTP id
 p8-20020a2e9ac8000000b0028e6a360f4dmr205711ljj.89.1674697099922; 
 Wed, 25 Jan 2023 17:38:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+5BBSf1aysYGjXk5XIIuX0zPNbT7fJinNeGOCOXcqQXwUpH4PtPekzrcKiTxj1aGl7G1ErIUXVbtjOzsUiraQ=
X-Received: by 2002:a2e:9ac8:0:b0:28e:6a36:f4d with SMTP id
 p8-20020a2e9ac8000000b0028e6a360f4dmr205708ljj.89.1674697099707; Wed, 25 Jan
 2023 17:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-19-harry.wentland@amd.com>
 <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
 <79ca3c26-11e8-0dad-641d-af21ec557d07@froggi.es>
In-Reply-To: <79ca3c26-11e8-0dad-641d-af21ec557d07@froggi.es>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 26 Jan 2023 02:38:08 +0100
Message-ID: <CA+hFU4zNDMpz_khh9RndJbGjZXMwBpC7D0NOyds=8NZiCuGjYg@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the
 pixel encoding is not RGB
To: Joshua Ashton <joshua@froggi.es>
X-Mimecast-Spam-Score: 0
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 2:00 PM Joshua Ashton <joshua@froggi.es> wrote:
>
>
>
> On 1/23/23 20:30, Sebastian Wick wrote:
> > A new property to control YCC and subsampling would be the more
> > complete path here. If we actually want to fix this in the short-term
> > though, we should handle the YCC and RGB Colorspace values as
> > equivalent, everywhere. Technically we're breaking the user space API
> > here so it should be documented on the KMS property and other drivers
> > must be adjusted accordingly as well.
>
> I am happy with treating 2020_YCC and 2020_RGB as the same.
>
> I think having the YCC/RGB split here in Colorspace is a mistake.
> Pixel encoding should be completely separate from colorspace from a uAPI
> perspective when we want to expose that.
> It's just a design flaw from when it was added as it just mirrors the
> values in the colorimetry packets 1:1. I understand why this happened,
> and I don't think it's a big deal for us to correct ourselves now:
>
> I suggest we deprecate the _YCC variants, treat them the same as the RGB
> enum to avoid any potential uAPI breakage and key the split entirely off
> the pixel_encoding value.

Yeah, I agree. The kernel must know the wire encoding and can thus
always choose the correct variant. If anyone wants to provide a patch
I'll review it.

> That way when we do want to plumb more explicit pixel encoding down the
> line, userspace only has to manage one thing. There's no advantage for
> anything more here.
>
> - Joshie =F0=9F=90=B8=E2=9C=A8
>
> >
> > On Fri, Jan 13, 2023 at 5:26 PM Harry Wentland <harry.wentland@amd.com>=
 wrote:
> >>
> >> From: Joshua Ashton <joshua@froggi.es>
> >>
> >> Userspace might not aware whether we're sending RGB or YCbCr
> >> data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
> >> requested but the output encoding is YCbCr we should
> >> send COLOR_SPACE_2020_YCBCR.
> >>
> >> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >> Cc: Vitaly.Prosyak@amd.com
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index f74b125af31f..16940ea61b59 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_tim=
ing *dc_crtc_timing,
> >>                  color_space =3D COLOR_SPACE_ADOBERGB;
> >>                  break;
> >>          case DRM_MODE_COLORIMETRY_BT2020_RGB:
> >> -               color_space =3D COLOR_SPACE_2020_RGB_FULLRANGE;
> >> +               if (dc_crtc_timing->pixel_encoding =3D=3D PIXEL_ENCODI=
NG_RGB)
> >> +                       color_space =3D COLOR_SPACE_2020_RGB_FULLRANGE=
;
> >> +               else
> >> +                       color_space =3D COLOR_SPACE_2020_YCBCR;
> >>                  break;
> >>          case DRM_MODE_COLORIMETRY_BT2020_YCC:
> >>                  color_space =3D COLOR_SPACE_2020_YCBCR;
> >> --
> >> 2.39.0
> >>
> >
>

