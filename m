Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB0B178E7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 00:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACD310E107;
	Thu, 31 Jul 2025 22:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="S7q0Dm1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9447F10E107;
 Thu, 31 Jul 2025 22:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753999900; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FTQOke1wXXBsJp1pesALpiGt1rXkwXFv5K2Obk6GXM9rE0KZ9clM7HHJxwUG/mtMTlSZQkC0/Pn7lagbw+INNA92N7ezzjWJfNi5G8hBgSho+xH8WyhJrBvcRKxriz6Ix6T4WD+e9UQWvvwjH1H5wPtbypGHDWH0RR7HGt6iIJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753999900;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SJekZKIs4xkWlDPe5Nspf1dfkuNrbOGVSx9x/miPPkw=; 
 b=iaK6aXf8S3oxMHUh0OwbHiBgUrFndo4NpranHjt9cNfD2UdXO6N565sylp5jZXqHQ8eG6h1zR/YEmmclONwT9xEK1R0M5SlXVINnjO02fvY3w4fP4ekDvbciy/5bhbVnlRZZe5+lPMOxVcfLrPgolTpB06fA0gchmtR+kJs9M14=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753999900; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=SJekZKIs4xkWlDPe5Nspf1dfkuNrbOGVSx9x/miPPkw=;
 b=S7q0Dm1AFcNfkvM/eO9q+HKcZvPMw529SG3OTVxwNWAjFWzw5aoiqB9LHL10HP1J
 3tELsT68TB9o0XmVDqEukW8Dol3RCpCKrswc5SIVlULDTxjyKr9DQyMTHtce/+HHdAO
 YxBKdDQcp0y07fwkaId/fdcXIPJyVae78AV305WM=
Received: by mx.zohomail.com with SMTPS id 1753999896732929.7894287121911;
 Thu, 31 Jul 2025 15:11:36 -0700 (PDT)
Message-ID: <07cd16202b742b37a0d4f70ff8d3a7a3ce3b1648.camel@collabora.com>
Subject: Re: [PATCH V10 13/46] drm/colorop: Add destroy functions for color
 pipeline
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, 
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, 	contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, 	shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, 
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, 	uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, 	quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, 	sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, 	louis.chauvet@bootlin.com,
 arthurgrillo@riseup.net, Daniel Stone	 <daniels@collabora.com>
Date: Thu, 31 Jul 2025 18:11:33 -0400
In-Reply-To: <20250617041746.2884343-14-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-14-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <07cd16202b742b37a0d4f70ff8d3a7a3ce3b1648.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Mon, 2025-06-16 at 22:16 -0600, Alex Hung wrote:
> The functions are to clean up color pipeline when a device driver
> fails to create its color pipeline.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
> v9:
> =C2=A0- Move from from latest commit to here, and
> drm_colorop_pipeline_destroy
> =C2=A0=C2=A0 is called in respective commits.
>=20
> =C2=A0drivers/gpu/drm/drm_colorop.c | 36
> +++++++++++++++++++++++++++++++++++
> =C2=A0include/drm/drm_colorop.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c
> b/drivers/gpu/drm/drm_colorop.c
> index 7b3ecf7ddd11..57a8c1063fdd 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -135,6 +135,42 @@ static int drm_plane_colorop_init(struct
> drm_device *dev, struct drm_colorop *co
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/**
> + * drm_colorop_cleanup - Cleanup a drm_colorop object in
> color_pipeline
> + *
> + * @colorop: The drm_colorop object to be cleaned
> + */
> +static void drm_colorop_cleanup(struct drm_colorop *colorop)
> +{
> +	struct drm_device *dev =3D colorop->dev;
> +	struct drm_mode_config *config =3D &dev->mode_config;
> +
> +	list_del(&colorop->head);
> +	config->num_colorop--;
> +
> +	kfree(colorop->state);
> +}
> +
> +/**
> + * drm_colorop_pipeline_destroy - Helper for color pipeline
> destruction
> + *
> + * @plane: - The drm_plane structure containing the color_pipeline
> + *
> + * Provides a default color pipeline destroy handler for a planes.
> + */
> +void drm_colorop_pipeline_destroy(struct drm_plane *plane)
> +{

This function implies it only cleans up the colorops in the color
pipeline of a specific plane, but it actually cleans up all colorops in
the drm_mode_config of a device.

--=20
Thanks,

N=C3=ADcolas

> +	struct drm_device *dev =3D plane->dev;
> +	struct drm_mode_config *config =3D &dev->mode_config;
> +	struct drm_colorop *colorop, *next;
> +
> +	list_for_each_entry_safe(colorop, next, &config-
> >colorop_list, head) {
> +		drm_colorop_cleanup(colorop);
> +		kfree(colorop);
> +	}
> +}
> +EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
> +
