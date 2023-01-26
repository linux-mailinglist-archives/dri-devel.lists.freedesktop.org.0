Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3967C290
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 02:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6911910E8DB;
	Thu, 26 Jan 2023 01:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA7610E8D3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 01:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674697742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=55oXUvKJv5zA+iwYnkMUZm8fMlbrL386D0K5UMBBNjo=;
 b=a5idIKxA+VXqkUhLjuvDBp3zS6Md1AR76yVjsI66KgPLlqUb0HasAJPW17wLk5Rqu3ht2I
 5zwTHU8Zi0h1wjtYZYq/xUyMTARxU0ylcroHAmv4S4F9pTqBH35Et7pzDBNYywvFCPqV9j
 6isIDBPA8SV+Q2u/OKo/S/NLpAEgNhY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-Yw4ngZGiPYuoCeY7LLrHGQ-1; Wed, 25 Jan 2023 20:49:01 -0500
X-MC-Unique: Yw4ngZGiPYuoCeY7LLrHGQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 a20-20020ac25214000000b004b57756f937so294043lfl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55oXUvKJv5zA+iwYnkMUZm8fMlbrL386D0K5UMBBNjo=;
 b=d6TnZ+SVq0toY57OnbmH/CJOSL2CLNPtBCOUIYm4EyIBJcnrjMAS8uNuLeQvME2qVX
 u7mspzxHiMQ+gjAHyHx2l2oOvbXDRpxoCH9AHcvBsv4p02nLIbwb8keE/3N+tr+EY62H
 Gz/pMG2DZ1kk7/QIXjnrqpOI9iENmJOD748BeAvw4wNpjv5/wuluzPi2DF6bpXJdoZy3
 IuHrcDfKghFEFNBsE2W7Mwu4m523lfuWi6kGrtmJirVnZYRP2qd4CB5V83BmQdVKMMMj
 Rou9rKwcOS5wsc7AynfyUq7GMGzwMjGcHpvwCxrjDZugmlt0AYgHmbzxmFFOz4SSTO/6
 YSGw==
X-Gm-Message-State: AFqh2kridLvXPuFb+PfKtZu2S9RPC4YXdu7GKflOVAMeZf6G3gbELmQn
 RkbaOVIr34cZa0P1NBxHzqH11zZ+TkO79+qJy+Vmmy5vNoGSXf0cuqBzrlSQLsFJBEJhI84MJ5a
 8ZX784ZIQRh3GAVRuduWkeqkPUo6uLEzCv6XOU1hW99RG
X-Received: by 2002:a2e:9591:0:b0:28b:68b4:f3b0 with SMTP id
 w17-20020a2e9591000000b0028b68b4f3b0mr1805706ljh.101.1674697739408; 
 Wed, 25 Jan 2023 17:48:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuf0aoTAlt6VgNBD5XlWfeuUbZj7+kaJ9PzXpQIutM+m7jd3oE5rq28NN1uh8Evwa2kBgM5o4FJe2pojbh7++c=
X-Received: by 2002:a2e:9591:0:b0:28b:68b4:f3b0 with SMTP id
 w17-20020a2e9591000000b0028b68b4f3b0mr1805704ljh.101.1674697739191; Wed, 25
 Jan 2023 17:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-19-harry.wentland@amd.com>
 <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
 <0a57bc76-91f7-dc00-6877-cd0a1dfa7347@amd.com>
 <351e0c24-8359-f42a-03b2-baf09cdb55ab@amd.com>
In-Reply-To: <351e0c24-8359-f42a-03b2-baf09cdb55ab@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 26 Jan 2023 02:48:48 +0100
Message-ID: <CA+hFU4xFakk0Di-gVO784dSw4JeN5VgzpnJa4MMTvXBfV1vSww@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the
 pixel encoding is not RGB
To: Harry Wentland <harry.wentland@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 7:57 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 1/24/23 10:37, Harry Wentland wrote:
> >
> >
> > On 1/23/23 15:30, Sebastian Wick wrote:
> >> A new property to control YCC and subsampling would be the more
> >> complete path here. If we actually want to fix this in the short-term
> >> though, we should handle the YCC and RGB Colorspace values as
> >> equivalent, everywhere. Technically we're breaking the user space API
> >> here so it should be documented on the KMS property and other drivers
> >> must be adjusted accordingly as well.
> >>
> >
> > Could someone point me to a userspace that uses this currently?
> >
>
> To elaborate a bit more...
>
> A driver has always had the ability to pick the wire format, whether
> it'd be RGB or YCbCr (444, or 420). In some cases that selection
> is required in order to satisfy bandwidth requirements. In others
> we follow a certain policy to ensure similar behaviors between our
> Windows and Linux drivers. I don't think it makes sense for userspace
> to control this.

I disagree. The subsampling is degrading the image considerably in
some cases. We need control over this.

It does mean that user space has to be smart and try to reduce the
bandwidth if a KMS commit fails, but the same is true for resolution
and refresh rate right now and will be true for a min bpc property as
well.

> Based on what I see I am not convinced the entirety of the
> colorspace definition has a corresponding implementation in an
> upstream, canonical userspace, hence my question. Not even an IGT
> test existed when I started looking at this. In the absence of a
> missing userspace implementation I am not convinced we're breaking
> anything. Even then, this was never implemented in amdgpu so
> there is no way this regresses any existing behavior.

I don't think this breaks anything in practice. The change would only
break use cases where you want to set the infoframe to a variant which
does not match the wire format and that would be broken. So yes, I
agree.

We can't just remove the enum values though. If we deprecate the YCC
variants that must be documented and user space has to understand that
choosing the RGB variant will result in the kernel just doing the
"right thing".

>
> Harry
>
> > Harry
> >
> >> On Fri, Jan 13, 2023 at 5:26 PM Harry Wentland <harry.wentland@amd.com> wrote:
> >>>
> >>> From: Joshua Ashton <joshua@froggi.es>
> >>>
> >>> Userspace might not aware whether we're sending RGB or YCbCr
> >>> data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
> >>> requested but the output encoding is YCbCr we should
> >>> send COLOR_SPACE_2020_YCBCR.
> >>>
> >>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> >>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> >>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >>> Cc: Vitaly.Prosyak@amd.com
> >>> Cc: Joshua Ashton <joshua@froggi.es>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: amd-gfx@lists.freedesktop.org
> >>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >>> ---
> >>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>> index f74b125af31f..16940ea61b59 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>> @@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
> >>>                 color_space = COLOR_SPACE_ADOBERGB;
> >>>                 break;
> >>>         case DRM_MODE_COLORIMETRY_BT2020_RGB:
> >>> -               color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
> >>> +               if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
> >>> +                       color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
> >>> +               else
> >>> +                       color_space = COLOR_SPACE_2020_YCBCR;
> >>>                 break;
> >>>         case DRM_MODE_COLORIMETRY_BT2020_YCC:
> >>>                 color_space = COLOR_SPACE_2020_YCBCR;
> >>> --
> >>> 2.39.0
> >>>
> >>
> >
>

