Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADA3A0BFA8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 19:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2AB10E7A5;
	Mon, 13 Jan 2025 18:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="aiUNA7YW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E7D10E797;
 Mon, 13 Jan 2025 18:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736792370; x=1737051570;
 bh=CptqjcfLLzqWwpSYrc05Qrls93CHNxrDChWxJ4ZQnC0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=aiUNA7YWq4LrQewJA5xZA8eHGBWyiLups4maFxfB6JMN/gOWyMylZDM/lBVvXEAjr
 dE9U7yNAa02LGuiyKziKxqXnoTNzOWaVDpnGcvaTyI5cJtlpX+uLqNKo8vmPtnlowh
 wICcpk3AubfUJbPD9t9o7MZBXI2ULN7R0YOwbfOgXrHW7jtggalxTcism1EYJ9bnDR
 yrxDb5qcxRz3BDf442nF32zIXR2ZOGnTuuSmK9btKoPzvnRfhCaCdbmTljMdMBfDgd
 sFR3NjMhG7ripFpr6MM1Eyy9l/HBdvE0rVU31swwsuS+AK4fGV8l70kF7A3MlKKr8P
 nlAYnfJqrBikw==
Date: Mon, 13 Jan 2025 18:19:27 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 16/45] drm/colorop: Add 3x4 CTM type
Message-ID: <LGBrOr6qOIy-3T81oLPJxoMag_HrrN5aDiudOpxNR7iQQX6ys-6NClpkPc5O-pNcIUf4EdMp_huVMcD_9m_L9scDxGpJb_kjuUYw-k2aues=@emersion.fr>
In-Reply-To: <20241220043410.416867-17-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-17-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 355371c0fbbd1f6d4db00af20219e2d9f7135864
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

Two nits below, regardless:

Reviewed-by: Simon Ser <contact@emersion.fr>

> +static int drm_colorop_create_data_prop(struct drm_device *dev, struct d=
rm_colorop *colorop)
> +{
> +=09struct drm_property *prop;
> +
> +=09/* data */
> +=09prop =3D drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PRO=
P_BLOB,
> +=09=09=09=09=09"DATA", 0);
> +=09if (!prop)
> +=09=09return -ENOMEM;
> +
> +=09colorop->data_property =3D prop;
> +=09drm_object_attach_property(&colorop->base,
> +=09=09=09=09=09colorop->data_property,
> +=09=09=09=09=090);

Nit: indentation is off here, also applies to other spots in this patch

> @@ -288,6 +329,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
> =20
>  static const char * const colorop_type_name[] =3D {
>  =09[DRM_COLOROP_1D_CURVE] =3D "1D Curve",
> +=09[DRM_COLOROP_CTM_3X4] =3D "3x4 Matrix"

Nit: missing trailing comma (these reduce diff churn)
