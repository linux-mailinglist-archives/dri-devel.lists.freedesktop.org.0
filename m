Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1443A867AA2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8CE10E25A;
	Mon, 26 Feb 2024 15:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="kEIGGlL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F0010E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:46:36 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-21f10aae252so367639fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708962395; x=1709567195; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=unAClle+u941FHaZg01gKmCQSRKv2wx+bkTeMlPTsH4=;
 b=kEIGGlL+oXKkIGCrk1BY5MZmYZ4YNPNZ+qv7eVJUDcyN7KNYiRvjy6dUWB+/78flRf
 XeI8WcNm4dCK83Mn1fEpYva9Ayv8D2KjueDO9c9F4tGIDta/HZdKpEbCoBE4V+jNzQ9N
 fprTMYtwYGXfNV3xRAWptd0CR7ZpdW7Leiyws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962395; x=1709567195;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unAClle+u941FHaZg01gKmCQSRKv2wx+bkTeMlPTsH4=;
 b=BORRvS459Ix6sTirpC60c7kHmZ3p0zmKaTIHN+jjbp35auZz9qBn//vpslqymCr76r
 d6HC09dLazJM+m74+kXC/yqYpMgqvcb3G67r7SIEajsgpJWrxW6J7e3NJUtEhv8ZzBvn
 0oe3fM8UD1vG2jO7sS90pDY71CYyHi/pQuqSADuFWwwKoJ/1h4kaMyf6Tun5XnQPralf
 SbDSa0Gg7yvlsLJtwaXLOmpl+B5d54ZdYHoZqIWP0gJ+/1bjVJ1YlgXTHExocRAz5LrQ
 kpDh4GTZWrY3nbd8LqzlncDToJgZIX7FSITGzZ/Q5qQzZYlEk11bALuC3+ihW0/grQX6
 4I5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+LS3VGDFEIOe37yjpLMqiaUqiOgghBlUfuHYh+0K3qzDUCN6htP5lPaUjWbmp8zhp8CJgM22sJsZgOosObBvpVM8gZNHLyWR/lN/mDRzQ
X-Gm-Message-State: AOJu0YxoRgqvmZIjAdn0rSmt6IM7ooUvEa2Bkv66OcWGd0vYaqTP8AXK
 iGZ5ofQCpok0+sy9lyUPqPSS0evu82MagcdO6gD6NCjjfX5kUJn8PRRzqElmlJpJorHdiP6KYU5
 PCccmZidAqCAvO6uB3yPODxy3rUHh+RVifhx8bw==
X-Google-Smtp-Source: AGHT+IExO/jK+BYNdSXCJ92BRHeixfVc9MgUCXfmYlTkBRUqn0eGZFua/I3/VuTDS8dSpblfkJjSETcZ0f91dDwn7W4=
X-Received: by 2002:a05:6870:6b9b:b0:21f:9c9c:b399 with SMTP id
 ms27-20020a0568706b9b00b0021f9c9cb399mr8493265oab.1.1708962395519; Mon, 26
 Feb 2024 07:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20240226153854.99471-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240226153854.99471-1-jacopo.mondi@ideasonboard.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Feb 2024 16:46:24 +0100
Message-ID: <CAKMK7uE2CBuGsJUYDT-L8x1Tbjb-PiHUjro8-hDpxLvBWycgLw@mail.gmail.com>
Subject: Re: [RFC] drm/fourcc: Add RPI modifiers
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
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

On Mon, 26 Feb 2024 at 16:39, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Add modifiers for the Raspberry Pi PiSP compressed formats.
>
> The compressed formats are documented at:
> Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
>
> and in the PiSP datasheet:
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>
> Background:
> -----------
>
> The Raspberry Pi PiSP camera subsystem is on its way to upstream through the
> Video4Linux2 subsystem:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=12310
>
> The PiSP camera system is composed by a "Front End" and a "Back End".
> The FrontEnd part is a MIPI CSI-2 receiver that store frames to memory and
> produce statistics, and the BackEnd is a memory-to-memory ISP that converts
> images in a format usable by application.
>
> The "FrontEnd" is capable of encoding RAW Bayer images as received by the
> image sensor in a 'compressed' format defined by Raspberry Pi and fully
> documented in the PiSP manual:
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
>
> The compression scheme is documented in the in-review patch series for the BE
> support at:
> https://patchwork.linuxtv.org/project/linux-media/patch/20240223163012.300763-7-jacopo.mondi@ideasonboard.com/
>
> The "BackEnd" is capable of consuming images in the compressed format and
> optionally user application might want to inspect those images for debugging
> purposes.
>
> Why a DRM modifier
> ------------------
>
> The PiSP support is entirely implemented in libcamera, with the support of an
> hw-specific library called 'libpisp'.
>
> libcamera uses the fourcc codes defined by DRM to define its formats:
> https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/formats.yaml
>
> And to define a new libcamera format for the Raspberry Pi compressed ones we
> need to associate the above proposed modifiers with a RAW Bayer format
> identifier.
>
> In example:
>
>   - RGGB16_PISP_COMP1:
>       fourcc: DRM_FORMAT_SRGGB16
>       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
>   - GRBG16_PISP_COMP1:
>       fourcc: DRM_FORMAT_SGRBG16
>       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
>   - GBRG16_PISP_COMP1:
>       fourcc: DRM_FORMAT_SGBRG16
>       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
>   - BGGR16_PISP_COMP1:
>       fourcc: DRM_FORMAT_SBGGR16
>       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
>   - MONO_PISP_COMP1:
>       fourcc: DRM_FORMAT_R16
>       mod: PISP_FORMAT_MOD_COMPRESS_MODE1
>
> See
> https://patchwork.libcamera.org/patch/19503/
>
> Would if be acceptable for DRM to include the above proposed modifiers for the
> purpose of defining the above presented libcamera formats ? There will be no
> graphic format associated with these modifiers as their purpose it not
> displaying images but rather exchange them between the components of the
> camera subsystem (and possibly be inspected by specialized test applications).

Yeah I think libcamera using drm-fourcc formats and modifiers is
absolutely ok, and has my ack in principle. And for these users we're
ok with merging modifiers that the kernel doesn't use.

I think it would be really good to formalize this by adding libcamera
to the officially listed users in the "Open Source User Waiver"
section in the drm_fourcc.h docs:

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#open-source-user-waiver

You might want to convert that into a list, it could get a bit
confusing. Then we can get that patch properly acked (by kernel and
libcamera folks) to record the community consensus.

For the rpi modifiers themselves: They need to be properly documented,
least to exclude a screw-up like with the rpi modifiers we already
have, which unfortunately encode the buffer height (instead of just
the rounding algorithim to align the height to the right tile size) in
the modifiers, which breaks assumptions everywhere. For details see
https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4529#note_2262057

Cheers, Sima

>
> ---
>  include/uapi/drm/drm_fourcc.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 00db00083175..09b182a959ad 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -425,6 +425,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_RPI 0x0b
>
>  /* add more to the end as needed */
>
> @@ -1568,6 +1569,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>         (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>
> +/* RPI (Raspberry Pi) modifiers */
> +#define PISP_FORMAT_MOD_COMPRESS_MODE1 fourcc_mod_code(RPI, 1)
> +#define PISP_FORMAT_MOD_COMPRESS_MODE2 fourcc_mod_code(RPI, 2)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.43.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
