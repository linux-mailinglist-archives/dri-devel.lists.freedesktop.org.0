Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05BE712A9C
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868EA10E7FA;
	Fri, 26 May 2023 16:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7C110E80A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685118469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLGWYvt/AG+suCZwZTxUSu1+8DySrAKPlVf+EbWxioE=;
 b=WjN6Mp4SvjS9VcuB11CSpA4UAN29oSOo6xHGPkFTz6A6H2zheldMDYLhhPi45D/AWx9CIT
 MpJiGCHDGScFx79qHFt/fcRcErS8N5mz90epJg3a0mafUs4OTTn6+AV24TWjp3DRAZjXE4
 +54CIySBoS9C1OFNyyXhovZtkViDpmI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-rmNmHccVO6S2vXxenCtIqg-1; Fri, 26 May 2023 12:27:47 -0400
X-MC-Unique: rmNmHccVO6S2vXxenCtIqg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2af2790f4a2so4497081fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685118465; x=1687710465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLGWYvt/AG+suCZwZTxUSu1+8DySrAKPlVf+EbWxioE=;
 b=auwEo/GQcTDhBC98YvbjNb0Kk4YDV5Lok2mwoR8pDd41BA09JNtnlaRztzfeUodzdI
 iEyp7fPO9WAxGUy6t/eukjK+92Th/PjRe7Ld915tjzm3OIpflc5vKJTj0waAJQltlsVU
 J8mHVhgS29mYZcSwApHiIx7j/+p0HJQuo6+k3PCJdQnHMFIopPZ3odNqwwIxx1ohqFwG
 qtUuJ1pO0ExxFeQHt9m/9t0zKrZ6oHBt0S3yHFDMeikSeH+z+4rRgW5l9qoRGwpzdKh7
 OTDxehvBBBvGy9KExwmBvsYeiL1Gxb5DXWPCnPCKRBqnPSPRdzaIRQrCXcq0Lg5G1RFg
 Z6wg==
X-Gm-Message-State: AC+VfDxp+dkXy0kTVYZkxvcI65ddoc2//hy6XkFul8DeX79rWz5PadB6
 9tFGKsGZWjoor2T0B4lhn3Ayqv/fg+VW7d2kpj9WvTvFwu9I9pmOLgQOk1V3QXo8jXCrsFwwLHH
 Y8QfHRsycqrYYH25ddNLyRcjg8oy7NiiA9g/Nd1tFRIHg
X-Received: by 2002:a2e:9d44:0:b0:2a8:c858:fb9 with SMTP id
 y4-20020a2e9d44000000b002a8c8580fb9mr833838ljj.29.1685118465269; 
 Fri, 26 May 2023 09:27:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6EfMM3R3AP/sdg4PC8zxFRuLJWcuwGxr84H1bYZeWNx1HybTepkJAZlgBUedXa8jaWPcBfvhi6C3QMZJKBB40=
X-Received: by 2002:a2e:9d44:0:b0:2a8:c858:fb9 with SMTP id
 y4-20020a2e9d44000000b002a8c8580fb9mr833833ljj.29.1685118464987; Fri, 26 May
 2023 09:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230525191809.3524-1-harry.wentland@amd.com>
 <20230525191809.3524-3-harry.wentland@amd.com>
In-Reply-To: <20230525191809.3524-3-harry.wentland@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 26 May 2023 18:27:33 +0200
Message-ID: <CA+hFU4xpYguvZi7n48xB3BS-dONShUvDOwBqpM2aZXRAH_DGwQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] drm/connector: Add enum documentation to
 drm_colorspace
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 9:18=E2=80=AFPM Harry Wentland <harry.wentland@amd.=
com> wrote:
>
> From: Joshua Ashton <joshua@froggi.es>
>
> To match the other enums, and add more information about these values.
>
> v2:
>  - Specify where an enum entry comes from
>  - Clarify DEFAULT and NO_DATA behavior
>  - BT.2020 CYCC is "constant luminance"
>  - correct type for BT.601
>
> v4:
> - drop DP/HDMI clarifications that might create
>   more questions than answers
>
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  include/drm/drm_connector.h | 62 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 77401e425341..ee597593d7e6 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -363,13 +363,71 @@ enum drm_privacy_screen_status {
>         PRIVACY_SCREEN_ENABLED_LOCKED,
>  };
>
> -/*
> - * This is a consolidated colorimetry list supported by HDMI and
> +/**
> + * enum drm_colorspace - color space
> + *
> + * This enum is a consolidated colorimetry list supported by HDMI and
>   * DP protocol standard. The respective connectors will register
>   * a property with the subset of this list (supported by that
>   * respective protocol). Userspace will set the colorspace through
>   * a colorspace property which will be created and exposed to
>   * userspace.
> + *
> + * DP definitions come from the DP v2.0 spec
> + * HDMI definitions come from the CTA-861-H spec
> + *
> + * @DRM_MODE_COLORIMETRY_DEFAULT:
> + *   Driver specific behavior.
> + * @DRM_MODE_COLORIMETRY_NO_DATA:
> + *   Driver specific behavior.

TBH this is still confusing me. Is DEFAULT really just driver specific
behavior? What's the difference to NO_DATA? Is NO_DATA actually not
driver-specific but display-specific? I.e. the default colorimetry of
the display?

> + * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
> + *   (HDMI)
> + *   SMPTE ST 170M colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT709_YCC:
> + *   (HDMI, DP)
> + *   ITU-R BT.709 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_601:
> + *   (HDMI, DP)
> + *   xvYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_709:
> + *   (HDMI, DP)
> + *   xvYCC709 colorimetry format
> + * @DRM_MODE_COLORIMETRY_SYCC_601:
> + *   (HDMI, DP)
> + *   sYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_OPYCC_601:
> + *   (HDMI, DP)
> + *   opYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_OPRGB:
> + *   (HDMI, DP)
> + *   opRGB colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> + *   (HDMI, DP)
> + *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> + *   (HDMI, DP)
> + *   ITU-R BT.2020 R' G' B' colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> + *   (HDMI, DP)
> + *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> + *   (HDMI)
> + *   SMPTE ST 2113 P3D65 colorimetry format
> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> + *   (HDMI)
> + *   SMPTE ST 2113 P3DCI colorimetry format
> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
> + *   (DP)
> + *   RGB wide gamut fixed point colorimetry format
> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
> + *   (DP)
> + *   RGB wide gamut floating point
> + *   (scRGB (IEC 61966-2-2)) colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT601_YCC:
> + *   (DP)
> + *   ITU-R BT.601 colorimetry format
> + *   The DP spec does not say whether this is the 525 or the 625
> + *   line version.
>   */
>  enum drm_colorspace {
>         /* For Default case, driver will set the colorspace */
> --
> 2.40.1
>

