Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98747C574F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 16:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A3C10E8CC;
	Wed, 11 Oct 2023 14:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F128C10E8CC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:49:22 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B5AC46607319;
 Wed, 11 Oct 2023 15:49:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697035761;
 bh=S00DgrlhsoGQbyPcxPahupxUyVYAwi65yHTASHRYm5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LrBkN146LfO8GtVXDEXHzKx7koACuUqeL5gn0uvhHvyWAzEhBIlyymCn3Cx3CgNfY
 NwZKAoLt77+L9RywQ4+NbG/10HhHOYz6jcK4PlwBsj4N/0TKjmoV6rkpn/g2OgfIWq
 uSt6HpwZs+Hiag2B6z1B3kAdyDllp9tZ8ewaZClkzkmjlKWx5Y7p4nIQjpjbKD16zM
 nCTtN4RO0LeiRvSC3+v0eIOvloxv7L0p1AfTRDSvvwQmLkSRC7i6XCLaQde/vrN8Ry
 +z4ieHNaWs7t2Mw4QpDgSkI9DT1C8Tuj9kFdhlpN7DOBNV8vVBj+gqlowK5uonbfpp
 JoPGsXLBxmPzQ==
Date: Wed, 11 Oct 2023 17:49:10 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Message-ID: <20231011174910.4c975ade.pekka.paalanen@collabora.com>
In-Reply-To: <20231011092051.640422-1-daniel.vetter@ffwll.ch>
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ml8UbNzUtgVA/Hy1W.HR9VT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Manasi Navare <navaremanasi@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ml8UbNzUtgVA/Hy1W.HR9VT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Oct 2023 11:20:51 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> msm is automagically upgrading normal commits to full modesets, and
> that's a big no-no:
>=20
> - for one this results in full on->off->on transitions on all these
>   crtc, at least if you're using the usual helpers. Which seems to be
>   the case, and is breaking uapi
>=20
> - further even if the ctm change itself would not result in flicker,
>   this can hide modesets for other reasons. Which again breaks the
>   uapi
>=20
> v2: I forgot the case of adding unrelated crtc state. Add that case
> and link to the existing kerneldoc explainers. This has come up in an
> irc discussion with Manasi and Ville about intel's bigjoiner mode.
> Also cc everyone involved in the msm irc discussion, more people
> joined after I sent out v1.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Manasi Navare <navaremanasi@google.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index cf8e1220a4ac..545c48545402 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -372,8 +372,27 @@ struct drm_atomic_state {
>  	 *
>  	 * Allow full modeset. This is used by the ATOMIC IOCTL handler to
>  	 * implement the DRM_MODE_ATOMIC_ALLOW_MODESET flag. Drivers should
> -	 * never consult this flag, instead looking at the output of
> -	 * drm_atomic_crtc_needs_modeset().
> +	 * not consult this flag, instead looking at the output of
> +	 * drm_atomic_crtc_needs_modeset(). The detailed rules are:
> +	 *
> +	 * - Drivers must not consult @allow_modeset in the atomic commit path,
> +	 *   and instead use drm_atomic_crtc_needs_modeset().

Change to

	Drivers must not consult @allow_modeset in the atomic commit path.
	Use drm_atomic_crtc_needs_modeset() instead.

maybe?

It's hard for me to see the difference between "instead use X" and
"instead of X". "Use Y instead (of X)." helps me at least.

> +	 *
> +	 * - Drivers may consult @allow_modeset in the atomic check path, if
> +	 *   they have the choice between an optimal hardware configuration
> +	 *   which requires a modeset, and a less optimal configuration which
> +	 *   can be committed without a modeset. An example would be suboptimal
> +	 *   scanout FIFO allocation resulting in increased idle power
> +	 *   consumption. This allows userspace to avoid flickering and delays
> +	 *   for the normal composition loop at reasonable cost.
> +	 *
> +	 * - Drivers must consult @allow_modeset before adding unrelated struct
> +	 *   drm_crtc_state to this commit by calling
> +	 *   drm_atomic_get_crtc_state(). See also the warning in the
> +	 *   documentation for that function.
> +	 *
> +	 * - Drivers must never change this flag, it is only under the control
> +	 *   of userspace.

*only userspace may set it. ?

>  	 */
>  	bool allow_modeset : 1;
>  	/**

Wording bikeshed aside,

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/Ml8UbNzUtgVA/Hy1W.HR9VT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUmteYACgkQI1/ltBGq
qqexKQ/+KwyZEY5Epxlx793ZMDpwSFAv+YX6/xj8xraCzshgb7mz0Ytf8VvyCBcF
4yg5ixfHGJHzssIBF/74QmooGKozXOStfdKPFdna+0e4hqZl3bRR8EaNfUqFcczy
uoeN5MVyWWvUXycprLZXNZ47B2SvIkdZvX63YBsHOwTKq/qJhW770UlcF3dUNn97
5+QdAOEHlBQQXxHkAlZCcdLGvc0eBPSnb3W2CeQ/Ws0eaoduuKe7+U3jseV5zfIV
s9o+iBgX6ZIsQTdTyglgw66pooa0+vgrdwNpbxh7OxrsxtF5p15Iqjljnqa+4vOS
XMYeeQrasqcOwsADRS5emtbNwzzzE3rXt2ZQK1s5EEtGLtn2bGmoh+O40cARexZo
s8HkW0q3lwNaZjNFH63OVth0KAYA0H6zBXJpatkvkJSYdyapY7kX17D1HIO6x6/a
lgSh4R6nd3Sr0jEI6b0bIZIucH3JjDzZTFhhkAaLOMKM+Hn9dnSBv4VMRUQwb7d6
hD7jwTpaJNGmStIvxGk0BWqrwI04Hx5uUvXXiuCd+5QJFP3l4lo8vrj88752P+zM
M6baQIWQkRhGAyw7cG96n+JdSyjvBuZxODJNh6FxJtDjXo2TrTmuU3dU9dLk5pP+
s8iYuBJtW9aNeOhnsBhp+H9NHBY51g49o/xcMN8IXoSeA1mAiCg=
=48Kc
-----END PGP SIGNATURE-----

--Sig_/Ml8UbNzUtgVA/Hy1W.HR9VT--
