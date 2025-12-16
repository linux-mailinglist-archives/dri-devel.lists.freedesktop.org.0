Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DAACC4E8B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 19:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0596A10E855;
	Tue, 16 Dec 2025 18:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="V92jnDUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A70E10E855;
 Tue, 16 Dec 2025 18:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765909161; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R8NVnrJynJ8nWlkbtAVc73HPnCoHjkzkxSfjSv+NpPH1CUxyTDOTf8V2wedK+2CxztEEDjidCiEGJ3uk3Jds9UcWcil8spdGg4qmbHZnU8DxDRPxrkX2wrQZYWe5Bbikt6bM1GHTTKBHFcKx4t93FEG/w3Kmiv6/uimfwdEH7vo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765909161;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ldQzGmAubC7NVX9bPfauxfMcjfkUz5993xydoMvzQvo=; 
 b=TpjorSZO8RPxihgc7ExYQFHbj9ns6cTsUAKo7riwl2YO++sFZmwYH28uBhE/YVgkLwDp/r3I24TW+1ucmsZdR9AIZpxyg2CZixtyb9tDIz3FFgfroAnA/8SYBZYihUpBNdJs1qMhkdc0LSYcojBBLtni1CdhhiBnbk8YyhgGUI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765909160; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=ldQzGmAubC7NVX9bPfauxfMcjfkUz5993xydoMvzQvo=;
 b=V92jnDUTjx1DQ3QtnduHkh7xpRz0lEyhkeYST1bSnaX50TFxlkGiOm3SQlR89dqJ
 maz7DiFRv9nAtk7bbBZZPn4nDqbW2US+DvZGzzMCTYbr1Or5tR79eVE/rdXkcYcdSTz
 wdgLf32kpVB8CEiy51nzhKclb3rwx3lO0DS2uccg=
Received: by mx.zohomail.com with SMTPS id 1765909159591146.60618131307228;
 Tue, 16 Dec 2025 10:19:19 -0800 (PST)
Message-ID: <492878007a02ffa87d0cff301571ffd100bc9c94.camel@collabora.com>
Subject: Re: [PATCH V13 06/51] drm/colorop: Add 1D Curve subtype
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Cc: ariel.dalessandro@collabora.com, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch, 
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com, 
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com, 
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com, 
 louis.chauvet@bootlin.com, mcanal@igalia.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
Date: Tue, 16 Dec 2025 15:19:05 -0300
In-Reply-To: <20251115000237.3561250-7-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <20251115000237.3561250-7-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <492878007a02ffa87d0cff301571ffd100bc9c94.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Fri, 2025-11-14 at 17:01 -0700, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>=20
> Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
> DRM_COLOROP_1D_CURVE_SRGB_EOTF and
> DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.
>=20
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Co-developed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
[..]
> diff --git a/drivers/gpu/drm/drm_colorop.c
> b/drivers/gpu/drm/drm_colorop.c
> index 1459a28c7e7b..6fbc3c284d33 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
[..]
> +static int drm_plane_colorop_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> +			=C2=A0=C2=A0=C2=A0 struct drm_plane *plane, enum
> drm_colorop_type type)
> +{
> +	struct drm_mode_config *config =3D &dev->mode_config;
> +	struct drm_property *prop;
> +	int ret =3D 0;
> +
> +	ret =3D drm_mode_object_add(dev, &colorop->base,
> DRM_MODE_OBJECT_COLOROP);
> +	if (ret)
> +		return ret;
> +
> +	colorop->base.properties =3D &colorop->properties;
> +	colorop->dev =3D dev;
> +	colorop->type =3D type;
> +	colorop->plane =3D plane;
> +
> +	list_add_tail(&colorop->head, &config->colorop_list);
> +	colorop->index =3D config->num_colorop++;

Hi Alex,

I know this series has already been merged, but I was looking through
the code together with Ariel and we noticed that while this init
function adds the colorop to the list in the drm_mode_config, it
doesn't remove it in the error paths below, and I believe it should.

Does that make sense?

Thanks,
Nicolas

> +
> +	/* add properties */
> +
> +	/* type */
> +	prop =3D drm_property_create_enum(dev,
> +					DRM_MODE_PROP_IMMUTABLE,
> +					"TYPE",
> drm_colorop_type_enum_list,
> +					ARRAY_SIZE(drm_colorop_type_
> enum_list));
> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->type_property =3D prop;
> +
> +	drm_object_attach_property(&colorop->base,
> +				=C2=A0=C2=A0 colorop->type_property,
> +				=C2=A0=C2=A0 colorop->type);
> +
> +	return ret;
> +}
