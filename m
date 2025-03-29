Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD125A756F3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 16:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0BD10E262;
	Sat, 29 Mar 2025 15:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="g9VU3H0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch
 [109.224.244.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F33E10E255;
 Sat, 29 Mar 2025 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743262017; x=1743521217;
 bh=IAfZhDxUsY3VvVyJebVkTecdxLi5m8wue3CPYgDhFas=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=g9VU3H0eV/iQGFZUC2GrJMCJioaqR4Xz1varFRHdMcaQMRi8m28/D2m39LR1B3g8y
 tplP8NZVgkqSfbIca6hWRrEy0sgYYc2QlxGr4D4hvIlfdLfLDPivhhAoEehPkEypGg
 5s5r9SEC9jtXu/jJkLT+S1L+5XY0EWfefCCshwv6zlu9FsxsCdSWVg0pYacx2jhE9O
 lOYSeSn3daH8FK2T+0qFAGVjtx49R1SgsykrPRatZEfQIxbmXmGNO10VpOXj8UKFHW
 9Nx/XeHgrmT1OoJfoNoYjyTUkGdlcHBv7LLLMSsxoR6gTlKOzxaEBfEBYTHa6L3HPY
 CTrUMtXeld9Iw==
Date: Sat, 29 Mar 2025 15:26:52 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 03/43] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <ccapGdDxbM4lcrNuX1aXUz2dfv-z2MhxuugtqOXLuMMagujxDDdzmeyU74zve9pRXbILSWOBHOCecEaLtDI-181pLd-0qOQp-giAvPuPlWw=@emersion.fr>
In-Reply-To: <20250326234748.2982010-4-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-4-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: d4f0d7fd00a4c7db11bfbfdb7a5f53833306eb4e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Thanks a lot for these docs, very well written. I especially like the
"Driver Implementer's Guide" section.

A few minor comments below, regardless:

Reviewed-by: Simon Ser <contact@emersion.fr>

> +What problem are we solving?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +We would like to support pre-, and post-blending complex color
> +transformations in display controller hardware in order to allow for
> +HW-supported HDR use-cases, as well as to provide support to
> +color-managed applications, such as video or image editors.
> +
> +It is possible to support an HDR output on HW supporting the Colorspace
> +and HDR Metadata drm_connector properties, but that requires the
> +compositor or application to render and compose the content into one
> +final buffer intended for display. Doing so is costly.
> +
> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and ot=
her
> +operations to support color transformations. These operations are often
> +implemented in fixed-function HW and therefore much more power efficient=
 than
> +performing similar operations via shaders or CPU.
> +
> +We would like to make use of this HW functionality to support complex co=
lor
> +transformations with no, or minimal CPU or shader load.

I would also highlight that we need to seamlessly switch between HW
fixed-function blocks and shaders/CPU with no visible difference. Depending=
 on
the content being displayed we might need to fallback to shaders/CPU at any
time. (A classic example would be a new notification popup preventing us fr=
om
leveraging KMS planes.)

> +An example of a drm_colorop object might look like one of these::
> +
> +    /* 1D enumerated curve */
> +    Color operation 42
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve, 1D L=
UT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EO=
TF, PQ EOTF, PQ inverse EOTF, =E2=80=A6}
> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D 43
> +
> +    /* custom 4k entry 1D LUT */
> +    Color operation 52
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve, 1D L=
UT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 1D LUT
> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "SIZE": immutable range =3D 4096
> +    =E2=94=9C=E2=94=80 "DATA": blob
> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D 0
> +
> +    /* 17^3 3D LUT */
> +    Color operation 72
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve, 1D L=
UT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 3D LUT
> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "3DLUT_MODES": read-only blob of supported 3DLUT =
modes
> +    =E2=94=9C=E2=94=80 "3DLUT_MODE_INDEX": index of selected 3DLUT mode

Nit: the 3D LUT modes have been dropped from the initial patch series.

> +    =E2=94=9C=E2=94=80 "DATA": blob
> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D 73

[...]

> +Color Pipeline Discovery
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A DRM client wanting color management on a drm_plane will:
> +
> +1. Get the COLOR_PIPELINE property of the plane
> +2. iterate all COLOR_PIPELINE enum values
> +3. for each enum value walk the color pipeline (via the NEXT pointers)
> +   and see if the available color operations are suitable for the
> +   desired color management operations
> +
> +If userspace encounters an unknown or unsuitable color operation during
> +discovery it does not need to reject the entire color pipeline outright,
> +as long as the unknown or unsuitable colorop has a "BYPASS" property.
> +Drivers will ensure that a bypassed block does not have any effect.
> +
> +An example of chained properties to define an AMD pre-blending color
> +pipeline might look like this::
> +
> +    Plane 10
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D Primary
> +    =E2=94=94=E2=94=80 "COLOR_PIPELINE": enum {0, 44} =3D 0
> +
> +    Color operation 44
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} =3D sR=
GB EOTF
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 45
> +
> +    Color operation 45
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 3x4 Matrix
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "DATA": blob
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 46
> +
> +    Color operation 46
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inve=
rse EOTF} =3D sRGB EOTF
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 47
> +
> +    Color operation 47
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D LUT
> +    =E2=94=9C=E2=94=80 "SIZE": immutable range =3D 4096
> +    =E2=94=9C=E2=94=80 "DATA": blob
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 48
> +
> +    Color operation 48
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 3D LUT
> +    =E2=94=9C=E2=94=80 "3DLUT_MODE_INDEX": 0

Ditto

> +    =E2=94=9C=E2=94=80 "DATA": blob
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 49
> +
> +    Color operation 49
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} =3D sR=
GB EOTF
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 0
> +
> +
> +Color Pipeline Programming
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +Once a DRM client has found a suitable pipeline it will:
> +
> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
> +   drm_colorop object of the desired pipeline
> +2. Set the properties for all drm_colorop objects in the pipeline to the
> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
> +   and false for enabled drm_colorop blocks
> +3. Perform (TEST_ONLY or not) atomic commit with all the other KMS
> +   states it wishes to change
> +
> +To configure the pipeline for an HDR10 PQ plane and blending in linear
> +space, a compositor might perform an atomic commit with the following
> +property values::
> +
> +    Plane 10
> +    =E2=94=94=E2=94=80 "COLOR_PIPELINE" =3D 42
> +
> +    Color operation 42
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 44
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 45
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 46
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 47
> +    =E2=94=9C=E2=94=80 "LUT_3D_DATA" =3D Gamut mapping + tone mapping + =
night mode

I think this is just named "DATA" now?

> +    =E2=94=94=E2=94=80 "BYPASS" =3D false
> +
> +    Color operation 48
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE" =3D PQ EOTF
> +    =E2=94=94=E2=94=80 "BYPASS" =3D false
