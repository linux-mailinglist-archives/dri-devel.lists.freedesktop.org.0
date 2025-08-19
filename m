Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA1CB2CEAA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 23:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FAE10E48C;
	Tue, 19 Aug 2025 21:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dNS3n9qB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D923510E206
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755616532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urdHsObaOG1jXX610/w2zRrgWA6yWvXip6MOdg1GGfA=;
 b=dNS3n9qBIMspx1/1nBlXytv0S6Tt8WtmHdSiuR3aYDbzIca+lgJoA4uoPWxHn4QE8r4NON
 JMbCqjIXpIbK1IbSmbEyyLsSXNmjlLKEmP3URizj8bM69QqN8yilgT5EeusqyTo+Z2soTS
 SABDj40J/oj0vFKhVqnbE0ujk7Kf+oY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-gZdYh_m0OpCwPDn3cf-q9w-1; Tue, 19 Aug 2025 11:15:29 -0400
X-MC-Unique: gZdYh_m0OpCwPDn3cf-q9w-1
X-Mimecast-MFC-AGG-ID: gZdYh_m0OpCwPDn3cf-q9w_1755616529
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b05d3c4so35015425e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 08:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755616528; x=1756221328;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Qd6/RQ1WG+Wmnc4LLsuUrv6AI8lT/mvMMHnCxjiHteY=;
 b=xC88bx6ILG+Gmdmq8Q1Z3eE1YZkw+Fj+sBvHXDz8LLODkP+yyZbBvD1+FOyhAnjp7f
 eIlFpl1O8vJSH0NnOnvtRiMNpq2LJKQ5GC619mlZhxiQlKSbOEcH6S98hy0FPtc4rlYL
 xo1qw5a63jSpZtB5k3IlB5ML9NyvI3qlbKH2GdBadt8vM1ZQpbxSVuovzNVqfoyCcBBn
 rDeUgvKIKU97BXivdXId87lM/dx166Qh96+z9n5EFzLH0Zl7cFswyBlJm+Lf27eZUr1A
 mPsRdTtPMSE0FCmzyo5nZxIlxFLdxjCL3U+7MgP66dCBp8MYiXrjA/vwIq8HOx2f/C9J
 3Vrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLyLsNnHqEIORi0XuegZYLep5kfkOMHNp9MBy4PgllL+p7A7Edq2gt9oqxWzcfQaWGbx6WObQZ+tA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNzg7eGDBoljyOMogIvJESC2lNvq9wMYH3F+/fs41t+Betafn2
 Y0uVdx+SZyluVDsALzs3xZN329jOkcnC0ToUHVxD3Z4HNiGrHPLDy3YGj+9HrtQYV/F1jC8ZNOB
 +6DKS1Q5OF+CAXViL3w1yrvHZ0jfSopQpYXPgRpBWCsi5LBFEglFvae92u2Cca/ChtyslgQ==
X-Gm-Gg: ASbGncuLHTO1LC4dCn4JhJ6sIcQ8wpT4B8doD8wXX60nJcm28A0E8VfFjeY9SLji66Q
 m6cnwoaXgEjVlfrPPdUH+rDbF6IjG1DcOi/LJ8f46k40gVGO1vGXAYtA1biJms0WObosEeugczT
 UH2cNei5zM0xihiip3r+xtjIZg54t+C1jsbUR3fZkuKU3Y+9AWZ/nFRKsQamcQn3qOUMLT8xQ/B
 Mc/hIZrG03Bz1bdJweuFEykM+5re9pIlgPgwlIms6c2pMUMl+hqFhc5Y2XJ2ZqxT7fs+Vcit/Cn
 irbko4vmt5TAPJFfaiOnly6IpshvtcR5GrqPcvgG8A92AQ==
X-Received: by 2002:a05:6000:2481:b0:3b7:8c98:2f4c with SMTP id
 ffacd0b85a97d-3c0ecc3220fmr2136742f8f.33.1755616528356; 
 Tue, 19 Aug 2025 08:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXgoHOcG7SErbazMSNgqLyfCjntf4p02QTg/yNpblkgOV2M1ujm0obFgPSzikT/gDFxwYADg==
X-Received: by 2002:a05:6000:2481:b0:3b7:8c98:2f4c with SMTP id
 ffacd0b85a97d-3c0ecc3220fmr2136708f8f.33.1755616527801; 
 Tue, 19 Aug 2025 08:15:27 -0700 (PDT)
Received: from localhost ([2001:9e8:8986:8500:d724:cc1e:d6eb:bc50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077789d2esm4063774f8f.55.2025.08.19.08.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 08:15:27 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 19 Aug 2025 17:15:26 +0200
Message-Id: <DC6I49YHZDU2.3SRB6PN6VY1VQ@redhat.com>
Cc: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <shashank.sharma@amd.com>, <agoins@nvidia.com>,
 <joshua@froggi.es>, <mdaenzer@redhat.com>, <aleixpol@kde.org>,
 <xaver.hugl@gmail.com>, <victoria@system76.com>, <daniel@ffwll.ch>,
 <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, "Daniel Stone"
 <daniels@collabora.com>
Subject: Re: [PATCH V11 07/47] drm/colorop: Add BYPASS property
From: "Sebastian Wick" <sebastian.wick@redhat.com>
To: "Alex Hung" <alex.hung@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-8-alex.hung@amd.com>
In-Reply-To: <20250815035047.3319284-8-alex.hung@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c2uM-PXXunkkewZFX1HdmZfoA__rQctnzVlbVYOTM6s_1755616529
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Tue, 19 Aug 2025 21:42:05 +0000
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

On Fri Aug 15, 2025 at 5:49 AM CEST, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>
> We want to be able to bypass each colorop at all times.
> Introduce a new BYPASS boolean property for this.
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
> v6:
>  - clarify that bypass is only valid if BYPASS prop exists (Louis Chauvet=
)
>
>  drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
>  drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
>  include/drm/drm_colorop.h         | 22 ++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 52b5a9b5523e..44665efbef55 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -650,7 +650,9 @@ static int drm_atomic_colorop_set_property(struct drm=
_colorop *colorop,
>  =09=09struct drm_colorop_state *state, struct drm_file *file_priv,
>  =09=09struct drm_property *property, uint64_t val)
>  {
> -=09if (property =3D=3D colorop->curve_1d_type_property) {
> +=09if (property =3D=3D colorop->bypass_property) {
> +=09=09state->bypass =3D val;
> +=09} else if (property =3D=3D colorop->curve_1d_type_property) {
>  =09=09state->curve_1d_type =3D val;
>  =09} else {
>  =09=09drm_dbg_atomic(colorop->dev,
> @@ -670,6 +672,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *c=
olorop,
>  {
>  =09if (property =3D=3D colorop->type_property) {
>  =09=09*val =3D colorop->type;
> +=09} else if (property =3D=3D colorop->bypass_property) {
> +=09=09*val =3D state->bypass;
>  =09} else if (property =3D=3D colorop->curve_1d_type_property) {
>  =09=09*val =3D state->curve_1d_type;
>  =09} else {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 6fbc3c284d33..11c37916c758 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -79,6 +79,17 @@ static int drm_plane_colorop_init(struct drm_device *d=
ev, struct drm_colorop *co
>  =09=09=09=09   colorop->type_property,
>  =09=09=09=09   colorop->type);
> =20
> +=09/* bypass */
> +=09prop =3D drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
> +=09=09=09=09=09"BYPASS");
> +=09if (!prop)
> +=09=09return -ENOMEM;
> +
> +=09colorop->bypass_property =3D prop;
> +=09drm_object_attach_property(&colorop->base,
> +=09=09=09=09   colorop->bypass_property,
> +=09=09=09=09   1);
> +
>  =09return ret;
>  }
> =20
> @@ -136,6 +147,7 @@ int drm_plane_colorop_curve_1d_init(struct drm_device=
 *dev, struct drm_colorop *
>  =09/* initialize 1D curve only attribute */
>  =09prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1=
D_TYPE",
>  =09=09=09=09=09enum_list, len);
> +
>  =09if (!prop)
>  =09=09return -ENOMEM;
> =20
> @@ -152,6 +164,8 @@ static void __drm_atomic_helper_colorop_duplicate_sta=
te(struct drm_colorop *colo
>  =09=09=09=09=09=09=09struct drm_colorop_state *state)
>  {
>  =09memcpy(state, colorop->state, sizeof(*state));
> +
> +=09state->bypass =3D true;
>  }
> =20
>  struct drm_colorop_state *
> @@ -190,6 +204,7 @@ static void __drm_colorop_state_reset(struct drm_colo=
rop_state *colorop_state,
>  =09u64 val;
> =20
>  =09colorop_state->colorop =3D colorop;
> +=09colorop_state->bypass =3D true;
> =20
>  =09if (colorop->curve_1d_type_property) {
>  =09=09drm_object_property_get_default_value(&colorop->base,
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index fa167e642e0d..49e6564c17ba 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -82,6 +82,16 @@ struct drm_colorop_state {
>  =09 * information.
>  =09 */
> =20
> +
> +=09/**
> +=09 * @bypass:
> +=09 *
> +=09 * When the property BYPASS exists on this colorop, this stores
> +=09 * the requested bypass state: true if colorop shall be bypassed,
> +=09 * false if colorop is enabled.
> +=09 */
> +=09bool bypass;
> +
>  =09/**
>  =09 * @curve_1d_type:
>  =09 *
> @@ -171,6 +181,18 @@ struct drm_colorop {
>  =09 */
>  =09struct drm_property *type_property;
> =20
> +=09/**
> +=09 * @bypass_property:
> +=09 *
> +=09 * Boolean property to control enablement of the color
> +=09 * operation. Setting bypass to "true" shall always be supported

This doesn't actually seem to be the case when the patches later in the
series are to be believed.

Somewhere else it says

  The BYPASS property is not mandatory for a colorop, as long as the
  entire pipeline can get bypassed by setting the COLOR_PIPELINE on a
  plane to '0'.

and later there is a "drm/colorop: allow non-bypass colorops" patch.

So I'm pretty sure this instance here should be adjusted.

> +=09 * in order to allow compositors to quickly fall back to
> +=09 * alternate methods of color processing. This is important
> +=09 * since setting color operations can fail due to unique
> +=09 * HW constraints.
> +=09 */
> +=09struct drm_property *bypass_property;
> +
>  =09/**
>  =09 * @curve_1d_type_property:
>  =09 *

