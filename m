Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36987AFCEA3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3551510E689;
	Tue,  8 Jul 2025 15:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="QMlKKsbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2038510E681
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1751987455; x=1752246655;
 bh=LOw0IxRYxrAR7YTDzDWu10EbhPmvzET6ycCHjFjRWAM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QMlKKsbIvGM7nROGA9ZuIJt5Ztvzsq29fObZXId06M5QE/cmDxK3eyYe1ZvgyAI7t
 1YWpyiguMOfl491l/vcrqLKMymZDlmM/CgRssp3Fp2pFWjIYnpv3k452YiG9JND3z+
 uNla5ilaCZBp/Ugk2kP8bbWxDI3GrgDDI2N9yTDP4RKoq9XuDmPPjoJh/rIyU3P09f
 08vkZdoxsX7eT2qqCaMUpHmpvx42DnFGyMVsSKyuq+rVWXpAz0rOlL4T519sh4jo/g
 PiD0k9uZxAQQ3oXSW9b54FIg8Wg8HjJQthbBxhaLeDybnQJBRrnRc+TzRSKl6ext82
 oaNBBiuFYNEPg==
Date: Tue, 08 Jul 2025 15:10:47 +0000
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
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net
Subject: Re: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Message-ID: <Mk2DCOdpZ75QLmGiZYM8GfnoMHRIGsx2S0_gzq2ryBHKEfLQMP5ArB3s94s8NYyci5xYBPN1md01QaUOqqlwKb3KxJIBRxMLO9yjoitMVJc=@emersion.fr>
In-Reply-To: <20250617041746.2884343-34-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-34-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: e0bc1fddeacac0aa8c8e207abe7f308697bda3ac
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

On Tuesday, June 17th, 2025 at 06:26, Alex Hung <alex.hung@amd.com> wrote:

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 651bdf48b766..21bd96f437e0 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -872,6 +872,16 @@ struct drm_color_lut {
>  =09__u16 reserved;
>  };
>=20
> +struct drm_color_lut_32 {

Subjective nit: I would personally prefer "lut32" over "lut_32", but that's
very deep into bike-shedding territory. Feel free to ignore.

> +=09/*
> +=09 * Similar to drm_color_lut but for high precision LUTs
> +=09 */

Instead of this code comment, would be nicer to have a proper doc comment.
In doc comments, "struct XXX" is enough to create a link. (struct drm_color=
_lut
doesn't have a doc comment, but has been introduced ages ago.)

"high precision" is a bit subjective, proibably "32-bit precision" would be
better.

> +=09__u32 red;
> +=09__u32 green;
> +=09__u32 blue;
> +=09__u32 reserved;
> +};
> +
>  /**
>   * enum drm_colorop_type - Type of color operation
>   *
> @@ -879,6 +889,7 @@ struct drm_color_lut {
>   * and defines a different set of properties. This enum defines all type=
s and
>   * gives a high-level description.
>   */
> +

Nit: probably this extra newline should get dropped?

>  enum drm_colorop_type {
>  =09/**
>  =09 * @DRM_COLOROP_1D_CURVE:
> --
> 2.43.0
