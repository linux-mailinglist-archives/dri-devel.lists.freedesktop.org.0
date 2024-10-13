Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F099BA38
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 17:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949F110E37F;
	Sun, 13 Oct 2024 15:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="RYg8VvAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2555 seconds by postgrey-1.36 at gabe;
 Sun, 13 Oct 2024 15:58:37 UTC
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3210E37C;
 Sun, 13 Oct 2024 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1728835115; x=1729094315;
 bh=JltMR/85fzhL0RdMLc022qCfSKD2ptE/HJeBvbvaogQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RYg8VvAKmGyczqkSbWEWbv4WEK5XcNCoaZqhZLW9R5YuSq9aW0ezGdJPKC6lZoyFv
 bc+gmZZy43P4D2A15aRALHz8f6dqZ/c1mAygs9nFcZps8YuV/S4giQjA4CWATRX4rk
 R2uL+OWUI28VtnIVFcbbc1Bu7vMRQKO2/1I6oO8O9hlKXM3kRZaWA6CFgzwPFV462L
 ON9IA2bylCe6y5aF+oA0kpOnrnReEjFLX97QawJmWfg9z07PDn7HWxMwBuT9fiiYdq
 weNDZR33cFzngKySj3hKSta46tyaPe5wX7+p/jiV5hGz0licCDRPkuJSC7/jdJrHeS
 fNfs1K8eZoywg==
Date: Sun, 13 Oct 2024 15:58:33 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH v6 42/44] drm/colorop: Add 3D LUT supports to color
 pipeline
Message-ID: <W3Axn6bFNOkhZFPsRFRYAbmZno5mB1cyoecUKsIjsKIK5PRuT5cqddb9rHDFqg5fTCU5m9wT13G4Bt1GNR4DVpSHrAFXVX1FR83pedIfzBs=@emersion.fr>
In-Reply-To: <20241003200129.1732122-43-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-43-harry.wentland@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: a6ec4d0bc684b113168b9a38e354cf2f1832de7e
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

On Thursday, October 3rd, 2024 at 22:01, Harry Wentland <harry.wentland@amd=
.com> wrote:

> From: Alex Hung <alex.hung@amd.com>
>=20
> It is to be used to enable HDR by allowing userpace to create and pass
> 3D LUTs to kernel and hardware.
>=20
> 1. new drm_colorop_type: DRM_COLOROP_3D_LUT.
> 2. 3D LUT modes define hardware capabilities to userspace applications.
> 3. mode index points to current 3D LUT mode in lut_3d_modes.

Do we really need all of this complexity here?

User-space needs to copy over its 3D LUT to the KMS blob. Kernel needs to
copy from the KMS blob when programming hardware. Why do we need a list of
different modes with negotiation?

I've heard that some of this complexity has been introduced to add in the
future BO-backed LUTs. That would be a nice addition, but it's not here
right now, so how can we design for that case when we haven't actually trie=
d
implementing it and made sure it actually works in practice?

It would be easy to introduce "modes" (or something different) when the
BO-based 3D LUT uAPI is introduced. There are many ways to handle backwards
compatibility: new properties can have their defaults set to the previously
fixed format/swizzle/etc, a new colorop can be introduced if there are
too many conflicts, and worst case new functionality can be gated behind a
DRM cap (although I don't think we'd need to resort to this here).

I'd recommend just having one fixed supported format, like we have for
1D LUTs. We can have a read-only props for the size and the color depth,
as well as a read-write prop for the data blob.

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ef87cb5b242..290c2e32f692 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -913,6 +913,90 @@ enum drm_colorop_type {
>  =09 * property.
>  =09 */
>  =09DRM_COLOROP_MULTIPLIER,
> +=09/**
> +=09 * @DRM_COLOROP_3D_LUT:
> +=09 *
> +=09 * A 3D LUT of &drm_color_lut entries,
> +=09 * packed into a blob via the DATA property. The driver's expected
> +=09 * LUT size is advertised via the SIZE property.
> +=09 */
> +=09DRM_COLOROP_3D_LUT,

User-space docs are missing many details I believe.

> +};
> +
> +/**
> + * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolati=
on
> + *
> + */
> +enum drm_colorop_lut3d_interpolation_type {
> +=09/**
> +=09 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
> +=09 *
> +=09 * Tetrahedral 3DLUT interpolation
> +=09 */
> +=09DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +};
> +
> +/**
> + * enum drm_colorop_lut3d_traversal_order - traversal order of the 3D LU=
T
> + *
> + * This enum describes the order of traversal of 3DLUT elements.
> + */
> +enum drm_colorop_lut3d_traversal_order {
> +=09/**
> +=09 * @DRM_COLOROP_LUT3D_TRAVERSAL_RGB:
> +=09 *
> +=09 * the LUT elements are traversed like so:
> +=09 *   for R in range 0..n
> +=09 *     for G in range 0..n
> +=09 *       for B in range 0..n
> +=09 *         color =3D lut3d[R][G][B]
> +=09 */
> +=09DRM_COLOROP_LUT3D_TRAVERSAL_RGB,
> +=09/**
> +=09 * @DRM_COLOROP_LUT3D_TRAVERSAL_BGR:
> +=09 *
> +=09 * the LUT elements are traversed like so:
> +=09 *   for R in range 0..n
> +=09 *     for G in range 0..n
> +=09 *       for B in range 0..n
> +=09 *         color =3D lut3d[B][G][R]
> +=09 */
> +=09DRM_COLOROP_LUT3D_TRAVERSAL_BGR,
> +};
> +
> +/**
> + * struct drm_mode_3dlut_mode - 3D LUT mode
> + *
> + * The mode describes the supported and selected format of a 3DLUT.
> + */
> +struct drm_mode_3dlut_mode {
> +=09/**
> +=09 * @lut_size: 3D LUT size - can be 9, 17 or 33
> +=09 */
> +=09__u16 lut_size;

Are "9, 17 or 33" just example values? Or does the kernel actually guarante=
e
that the advertised size can never be something else? It doesn't seem like
there is a check, and enforcing it would hinder extensibility (adding new
values would be a breaking uAPI change).

> +=09/**
> +=09 * @lut_stride: dimensions of 3D LUT. Must be larger than lut_size
> +=09 */
> +=09__u16 lut_stride[3];

It sounds a bit weird to have the driver dictate the stride which must be u=
sed.
Usually user-space picks and sends the stride to the driver.

> +=09/**
> +=09 * @interpolation: interpolation algorithm for 3D LUT. See drm_coloro=
p_lut3d_interpolation_type
> +=09 */
> +=09__u16 interpolation;
> +=09/**
> +=09 * @color_depth: color depth - can be 8, 10 or 12
> +=09 */
> +=09__u16 color_depth;

Ditto: reading these docs, user-space might not handle any other value.

It would be nice to better explain what this means exactly. Are the output
color values truncated at this depth? Or are the LUT values truncated? Or
something else?

> +=09/**
> +=09 * @color_format: color format specified by fourcc values
> +=09 * ex. DRM_FORMAT_XRGB16161616 - color in order of RGB, each is 16bit=
.
> +=09 */
> +=09__u32 color_format;

Do we really need to support many different formats?

User-space needs to perform a copy to the KMS blob anyways, so can easily
convert to an arbitrary format while at it.

Is there a use-case that I'm missing?

> +=09/**
> +=09 * @traversal_order:
> +=09 *
> +=09 * Traversal order when parsing/writing the 3D LUT. See enum drm_colo=
rop_lut3d_traversal_order
> +=09 */
> +=09 __u16 traversal_order;

DRM formats usually have variants for all of the supported/desirable swizzl=
es.
For instance we have DRM_FORMAT_XRGB16161616F and DRM_FORMAT_XBGR16161616F.
Can't see why we couldn't add more if we need to.
