Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2EDB1685E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE03610E387;
	Wed, 30 Jul 2025 21:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="RSWTzA4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874A810E387;
 Wed, 30 Jul 2025 21:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753911753; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZUq4TMpmPLGCyyUN7vfBqrygD0X+BuKEPoWTDoreS4mYfiUv4ixBQOHmVuaOLd7kbXa6Hx/WsAF7AdGUWIJtBK+oKl8CFl4np5EVHte8w64gKhS00B8NzQFstRVmpnap74h3TmQMX3nvHTNyQInuTg4xeVp+klDdEqU7PPkULOk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753911753;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tDwqJNnbeCGx3m5FbRR2/yW5Q9kGf4UwpcQNheNkTlo=; 
 b=fkBRZG5k8wPnL/gwSDlKcMh3v8ewh3I9iVs3crjezs3K+WNZFZ+M2F/dajef1NlK3GiClKKM8AWJZw4Utyu9zz2qbjZ1VE/IDbM7ltRSdf5eJOIPcnlHsNmG0/rZKzd3luSAlAzETx0P2dafL9PTDc+ZjoLcVItyz/Cug63Oz2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753911753; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=tDwqJNnbeCGx3m5FbRR2/yW5Q9kGf4UwpcQNheNkTlo=;
 b=RSWTzA4Qv+Lxrqd54eLeEr5oUZjZWiSjCuBoxXV527Lz5phCYSZi1SqHMXhOUUeo
 SXiTkFatVjZiLIFZ8h/1sX2/nc/yFXHcgzYh2+Sp9R7f6W/UPifQpCxQFs4foqGdVMc
 kpUCo1oIo+BK8FpH8mvzo0rc9p8sQ/xdOYf0o9U0=
Received: by mx.zohomail.com with SMTPS id 17539117502288.545850020648345;
 Wed, 30 Jul 2025 14:42:30 -0700 (PDT)
Message-ID: <9183e2effaf17f7d98fbb4f18d1c8e502d8f20e4.camel@collabora.com>
Subject: Re: [PATCH V10 18/46] drm/vkms: add 3x4 matrix in color pipeline
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
Date: Wed, 30 Jul 2025 17:42:20 -0400
In-Reply-To: <20250617041746.2884343-19-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-19-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <9183e2effaf17f7d98fbb4f18d1c8e502d8f20e4.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Mon, 2025-06-16 at 22:17 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>=20
> We add two 3x4 matrices into the VKMS color pipeline. The reason
> we're adding matrices is so that we can test that application
> of a matrix and its inverse yields an output equal to the input
> image.
>=20
> One complication with the matrix implementation has to do with
> the fact that the matrix entries are in signed-magnitude fixed
> point, whereas the drm_fixed.h implementation uses 2s-complement.
> The latter one is the one that we want for easy addition and
> subtraction, so we convert all entries to 2s-complement.
>=20
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> V9:
> =C2=A0- Update function names by _plane_ (Chaitanya Kumar Borah)
>=20
> v8:
> =C2=A0- Replace DRM_ERROR with drm_err (Louis Chauvet)
>=20
> v7:
> =C2=A0- Fix checkpatch warnings
> =C2=A0 - Change kzalloc(sizeof(struct drm_colorop) ...) to
> kzalloc(sizeof(*ops[i]) ...)
> =C2=A0 - Change i-1to i - 1
> =C2=A0 - Add a new line at EOF
>=20
> v6:
> =C2=A0- pre-compute colors (Louis Chauvet)
> =C2=A0- round matrix output (Louis Chauvet)
>=20
> =C2=A0drivers/gpu/drm/vkms/vkms_colorop.c=C2=A0 | 34
> +++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/vkms/vkms_composer.c | 33
> +++++++++++++++++++++++++++
> =C2=A02 files changed, 66 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
> b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 2fb74b2bd001..70be35804ea9 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -12,7 +12,7 @@ static const u64 supported_tfs =3D
> =C2=A0	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> =C2=A0	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
> =C2=A0
> -#define MAX_COLOR_PIPELINE_OPS 2
> +#define MAX_COLOR_PIPELINE_OPS 4
> =C2=A0
> =C2=A0static int vkms_initialize_color_pipeline(struct drm_plane *plane,
> struct drm_prop_enum_list *list)
> =C2=A0{
> @@ -48,6 +48,38 @@ static int vkms_initialize_color_pipeline(struct
> drm_plane *plane, struct drm_pr
> =C2=A0		goto cleanup;
> =C2=A0	}
> =C2=A0

This should also update the comment above as it still says "2nd op: 1d
curve", but 2nd op is now a 3x4 matrix.

--=20
Thanks,

N=C3=ADcolas

> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i - 1], ops[i]);
> +
> +	i++;
> +
> +	/* 3rd op: 3x4 matrix */
> +	ops[i] =3D kzalloc(sizeof(*ops[i]), GFP_KERNEL);
> +	if (!ops[i]) {
> +		drm_err(dev, "KMS: Failed to allocate colorop\n");
> +		ret =3D -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i - 1], ops[i]);
> +
> +	i++;
> +
> +	/* 4th op: 1d curve */
> +	ops[i] =3D kzalloc(sizeof(*ops[i]), GFP_KERNEL);
> +	if (!ops[i]) {
> +		drm_err(dev, "KMS: Failed to allocate colorop\n");
> +		ret =3D -ENOMEM;
> +		goto cleanup;
> +	}
> +
