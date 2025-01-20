Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F649A17406
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 22:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FC310E491;
	Mon, 20 Jan 2025 21:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="SjYGK97d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF7710E490;
 Mon, 20 Jan 2025 21:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737407819; x=1737667019;
 bh=ll+iGH0DSsyND+BXQlDFRyRUZpOxJZPYm/yhxI8Wylg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=SjYGK97dmg8noLW2qnykYCfrYNlgkRNnlVy1xXi/aXtbTYbcrjzXZjIvDdKkNBN+U
 AMD5iG5+95W1LBxLm4CsL2QPKGzgVE7TgOK26VOnMzBauofxvAso7iPR1kJ7sID4ir
 aDSZMN/Zgz4nacIrI2R0yj2yoyFaB5viyz1NJ9SZAe7Eg1+Z+vktP+1v9jvWwSJzMK
 9JR6Bd9X5jOM8WFdSgp/KQwLA/qlR4lNbRg2hoD4uEaDgnurtmX8ebNqdC+ASRQfjX
 JVf7E6b1PGQ2vNN+unsRx9EW20ymZTyeQRr5JtVKQqLtA7usWi3ARKxGKJkP3P3Pfb
 Ixoda+PtjV5fw==
Date: Mon, 20 Jan 2025 21:16:54 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 41/45] drm/colorop: Add 3D LUT supports to color pipeline
Message-ID: <2YTKvPAlWAkfNALxDRDgkOuXYBFbwqQ04Nd86Da-YAZqsBsoJHFSFSvDQ2BBdUiKYt1gMyZeG6AB9ghmMoy8hORJLdUrJbEcdIJvmbLgHa4=@emersion.fr>
In-Reply-To: <20241220043410.416867-42-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-42-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 9bbcb86476e20a0a5550917ae33631c4446549b9
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

Some minor comments below, apart from that looks good!

Typo in the commit title: s/supports/support/

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ef87cb5b242..316c643e0dea 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -913,6 +913,27 @@ enum drm_colorop_type {
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

These are user-space docs (in uapi/), so would be nice to include more deta=
ils
here. What is SIZE, the full size or just a single dimension? Seems to be t=
he
latter. How are the blob entries laid out?

> +=09DRM_COLOROP_3D_LUT,
> +};
> +
> +/**
> + * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolati=
on
> + *

Nit: stray empty line

> + */
> +enum drm_colorop_lut3d_interpolation_type {
> +=09/**
> +=09 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
> +=09 *
> +=09 * Tetrahedral 3DLUT interpolation
> +=09 */
> +=09DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  };
