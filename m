Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CA778C8CF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F274410E3C1;
	Tue, 29 Aug 2023 15:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E3610E3BF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693323769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u6sDIU3K4vYx0nS6YYLcsSqypEnaVcZpJGHz3tdgGMc=;
 b=CJvCt50fqCMAh9COza3e0t/bdXTWQcGT8SnEnOeawlDYM/O5H0tQcxEp3cEjfGURpd8IMy
 PYCkMlGPfQMb4GE7SwP1N3TRSHTNH5li1P8MMezr7OheBxLJjCfdZdUB47o660BC3Fl4La
 l7qkjfRsZuBUeiYg0EwHLavF9qc3ADY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-8GByAEJRM6OZaGuSksVp5A-1; Tue, 29 Aug 2023 11:42:48 -0400
X-MC-Unique: 8GByAEJRM6OZaGuSksVp5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso2851133f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 08:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693323767; x=1693928567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6sDIU3K4vYx0nS6YYLcsSqypEnaVcZpJGHz3tdgGMc=;
 b=PlgvFRX52wR6TJP2kb9UB4b15wSDTTxh+DJTmcVp2VDyYT83kRtmpzIIK4S27nNOKF
 CJqcp22K7y2oXYjX3DVQBj334tFwyl6jkmWFtcKywOMgxWKZ11ciNBNPjM1Ouxt2FhDi
 Bl17SdrHMsVbLd7l6VR06RRhJpH9zR4QZXB5H4++Azoo8Lztc3mlDG0Xuqq6fqgoiciJ
 iPjgGzFNaGNFPWBGePYUuxiRuhfvjVnjbR9LQ5TF5bSGhtjImRlDrPS0xFmmmV1R9iac
 e2FSB2mxR2kcJkbZC31G3O5iSXm7hDtZMGHiqRHTNraIiwPxgd3+owb4N+TPJAD3ziAp
 LT0g==
X-Gm-Message-State: AOJu0Yx0X4GyUnR1EtMR6y415u157CbTd0RAzJ9xF1POXJpDu12yt1Aa
 H/PN5dap+ObGnxiV7V+qPP7jgGWTZn7Eix64dn0ZR6kyvXfiF2xFwzQv8e6eQDuN8TZVi+xaEwL
 YSkeDhoOf4gGTANzNzXxdlECcOVwo
X-Received: by 2002:a05:6000:98c:b0:31d:caae:982c with SMTP id
 by12-20020a056000098c00b0031dcaae982cmr5603157wrb.47.1693323766839; 
 Tue, 29 Aug 2023 08:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE68Tjgg1iNWjdiPHoiTE7fPT5ClNu+9OggcScdoXXlRdgxO5W4SL2VyHLt3ahqOCnHuM4ilw==
X-Received: by 2002:a05:6000:98c:b0:31d:caae:982c with SMTP id
 by12-20020a056000098c00b0031dcaae982cmr5603141wrb.47.1693323766510; 
 Tue, 29 Aug 2023 08:42:46 -0700 (PDT)
Received: from toolbox ([2001:9e8:898c:cd00:3d7e:40e1:d773:8f52])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a1c6a13000000b003fefcbe7fa8sm14264216wmc.28.2023.08.29.08.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 08:42:46 -0700 (PDT)
Date: Tue, 29 Aug 2023 17:42:44 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v6 00/10] Support for Solid Fill Planes
Message-ID: <20230829154244.GA260653@toolbox>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 ppaalanen@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 05:05:06PM -0700, Jessica Zhang wrote:
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> app.
> 
> In order to expose this capability to userspace, this series will:
> 
> - Introduce solid_fill and pixel_source properties to allow userspace to
>   toggle between FB and solid fill sources
> - Loosen NULL FB checks within the DRM atomic commit callstack to allow
>   for NULL FB when solid fill is enabled.
> - Add NULL FB checks in methods where FB was previously assumed to be
>   non-NULL
> - Have MSM DPU driver use drm_plane_state.solid_fill instead of
>   dpu_plane_state.color_fill
> 
> Note: The solid fill planes feature depends on both the solid_fill *and*
> pixel_source properties.
> 
> To use this feature, userspace can set the solid_fill property to a blob
> containing the appropriate version number and solid fill color (in
> RGB323232 format) and and setting the pixel_source property to
> DRM_PLANE_PIXEL_SOURCE_COLOR. This will disable memory fetch and the
> resulting plane will display the color specified by the solid_fill blob.
> 
> Currently, there's only one version of the solid_fill blob property.
> However if other drivers want to support a similar feature, but require
> more than just the solid fill color, they can extend this feature by
> creating additional versions of the drm_solid_fill struct.
> 
> This 2 property approach was chosen because passing in a special 1x1 FB
> with the necessary color information would have unecessary overhead that
> does not reflect the behavior of the solid fill feature. In addition,
> assigning the solid fill blob to FB_ID would require loosening some core
> drm_property checks that might cause unwanted side effects elsewhere.

The cover letter is a bit outdated by now. Anyway, with Pekkas issues
addressed the core drm parts are

Acked-by: Sebastian Wick <sebastian@sebastianwick.net>
 
> ---
> Changes in v6:
> - Have _dpu_plane_color_fill() take in a single ABGR8888 color instead
>   of having separate alpha and BGR color parameters (Dmitry)
> - Drop plane->state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB check
>   in SetPlane ioctl (Dmitry)
> - Add DRM_PLANE_PIXEL_SOURCE_NONE as a default pixel source (Sebastian)
> - Dropped versioning from solid fill property blob (Dmitry)
> - Use DRM_ENUM_NAME_FN (Dmitry)
> - Use drm_atomic_replace_property_blob_from_id() (Dmitry)
> - drm_atomic_check_fb -> drm_atomic_plane_check_fb (Dmitry)
> - Group redundant NULL FB checks (Dmitry)
> - Squashed drm_plane_needs_disable() implementation with 
>   DRM_PLANE_PIXEL_SOURCE_NONE declaration (Sebastian)
> - Add comment to support RGBA solid fill color in the future (Dmitry)
> - Link to v5: https://lore.kernel.org/r/20230728-solid-fill-v5-0-053dbefa909c@quicinc.com
> 
> Changes in v5:
> - Added support for PIXEL_SOURCE_NONE (Sebastian)
> - Added WARN_ON() in drm_plane_has_visible_data() if pixel_source isn't
>   set (Dmitry)
> - Added debugfs support for both properties (Dmitry)
> - Corrected u32 to u8 conversion (Pekka)
> - Moved drm_solid_fill_info struct and related documentation to
>   include/uapi (Pekka)
> - Changed drm_solid_fill_info.version to __u32 for data alignment (Pekka)
> - Added more detailed UAPI and kernel documentation (Pekka)
> - Reordered patch series so that the pixel_source property is introduced
>   before solid_fill (Dmitry)
> - Fixed inconsistent ABGR8888/RGBA8888 format declaration (Pekka)
> - Reset pixel_source to FB in drm_mode_setplane() (Dmitry)
> - Rename supported_sources to extra_sources (Dmitry)
> - Only destroy old solid_fill blob state if new state is valid (Pekka)
> - Link to v4: https://lore.kernel.org/r/20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com
> 
> Changes in v4:
> - Rebased onto latest kernel
> - Reworded cover letter for clarity (Dmitry)
> - Reworded commit messages for clarity
> - Split existing changes into smaller commits
> - Added pixel_source enum property (Dmitry, Pekka, Ville)
> - Updated drm-kms comment docs with pixel_source and solid_fill
>   properties (Dmitry)
> - Inlined drm_atomic_convert_solid_fill_info() (Dmitry)
> - Passed in plane state alpha value to _dpu_plane_color_fill_pipe()
> - Link to v3: https://lore.kernel.org/r/20230104234036.636-1-quic_jesszhan@quicinc.com
> 
> Changes in v3:
> - Fixed some logic errors in atomic checks (Dmitry)
> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
>   methods (Dmitry)
> - Fixed typo in drm_solid_fill struct documentation
> - Created drm_plane_has_visible_data() helper and corrected CRTC and FB
>   NULL-check logic (Dmitry)
> - Merged `if (fb)` blocks in drm_atomic_plane_check() and abstracted
>   them into helper method (Dmitry)
> - Inverted `if (solid_fill_enabled) else if (fb)` check order (Dmitry)
> - Fixed indentation (Dmitry)
> 
> Changes in v2:
> - Dropped SOLID_FILL_FORMAT property (Simon)
> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> - Added drm_solid_fill and drm_solid_fill_info structs (Simon)
> - Changed to checks for if solid_fill_blob is set (Dmitry)
> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>   (Dmitry)
> - Removed DPU_PLANE_COLOR_FILL_FLAG
> - Fixed whitespace and indentation issues (Dmitry)
> - Changed to checks for if solid_fill_blob is set (Dmitry)
> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>   (Dmitry)
> - Fixed dropped 'const' warning
> - Added helper to convert color fill to BGR888 (Rob)
> - Fixed indentation issue (Dmitry)
> - Added support for solid fill on planes of varying sizes
> 
> ---
> Jessica Zhang (10):
>       drm: Introduce pixel_source DRM plane property
>       drm: Introduce solid fill DRM plane property
>       drm: Add solid fill pixel source
>       drm/atomic: Add pixel source to plane state dump
>       drm/atomic: Add solid fill data to plane state dump
>       drm/atomic: Move framebuffer checks to helper
>       drm/atomic: Loosen FB atomic checks
>       drm/msm/dpu: Allow NULL FBs in atomic commit
>       drm/msm/dpu: Use DRM solid_fill property
>       drm/msm/dpu: Add solid fill and pixel source properties
> 
>  drivers/gpu/drm/drm_atomic.c              | 147 +++++++++++++++++-------------
>  drivers/gpu/drm/drm_atomic_helper.c       |  36 ++++----
>  drivers/gpu/drm/drm_atomic_state_helper.c |  10 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         |  30 ++++++
>  drivers/gpu/drm/drm_blend.c               | 129 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h       |   1 +
>  drivers/gpu/drm/drm_plane.c               |  27 +++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  80 ++++++++++------
>  include/drm/drm_atomic_helper.h           |   4 +-
>  include/drm/drm_blend.h                   |   3 +
>  include/drm/drm_plane.h                   |  90 ++++++++++++++++++
>  include/uapi/drm/drm_mode.h               |  24 +++++
>  13 files changed, 478 insertions(+), 112 deletions(-)
> ---
> base-commit: 00ee72279c963989ab435b0bc90b5dc05a9aab79
> change-id: 20230404-solid-fill-05016175db36
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

