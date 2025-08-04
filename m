Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5FB1A9D2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 21:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B6B10E5C3;
	Mon,  4 Aug 2025 19:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="CYDRNTlL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA67210E384;
 Mon,  4 Aug 2025 19:51:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754337093; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Qo6ZYD5Zhao8z4Gg2R1lJVcBSxY8NlnozV4zwGF4X6EfRJtK/H9pWNumlvw7wJUJ++CSQNDIh6GqSqz9kdSp2DMMmuEHeYdPh4M9mzXIv4eY5chKeNhCA1t8H0jnsuTHw4+xZsLhUVxV9RpJeSde5EC/OEdibreFBNyH2z2ayVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754337093;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CqiqV8sCny1E2rh73ue0AWfEmoU01Ps9EzAWXLaEJCE=; 
 b=md5ve6HrzrhwrICkKL7u3+Sws4cHiYrd0kW00e39MyUXelp3f77/IfYdlzrf1LHAnAkplDyf1TC5MZPwnVUJbOE0oVk22jnM7dJdLZKeioCdyiHf7WxpNG5IOrjVi8gh75b9mqA5DqmDXEyyyda57jyXHE9BAMY7A+MisQlnPww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754337093; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=CqiqV8sCny1E2rh73ue0AWfEmoU01Ps9EzAWXLaEJCE=;
 b=CYDRNTlL1Rt6NJys858KbEYXn/JTNZ8kWZcCdtyh5ZFwrtU2XPn/MwHO4Td/OIQr
 EJccvbP32T5lfmc+7JX/7IBjRebEaYb6HHk3fp70PvOGA+L1m5CmrZ/wznsGrt+sGSZ
 KJBUWoKIfw3jHn/h8Hncf6kPMM+CQKMjN5CbNtEQ=
Received: by mx.zohomail.com with SMTPS id 1754337085916196.59332435118563;
 Mon, 4 Aug 2025 12:51:25 -0700 (PDT)
Message-ID: <df570128dd008a969885e82abf3644b302120170.camel@collabora.com>
Subject: Re: [PATCH V10 43/46] drm/amd/display: add 3D LUT colorop
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
Date: Mon, 04 Aug 2025 15:51:16 -0400
In-Reply-To: <20250617041746.2884343-44-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-44-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <df570128dd008a969885e82abf3644b302120170.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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
> This adds support for a 3D LUT.
>=20
> The color pipeline now consists of the following colorops:
> 1. 1D curve colorop
> 2. Multiplier
> 3. 3x4 CTM
> 4. 1D curve colorop
> 5. 1D LUT
> 6. 3D LUT
> 7. 1D curve colorop
> 8. 1D LUT
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
[..]
> +/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
> + * @drm_lut3d: user 3D LUT
> + * @drm_lut3d_size: size of 3D LUT
> + * @lut3d: DC 3D LUT
> + *
> + * Map user 3D LUT data to DC 3D LUT and all necessary bits to
> program it
> + * on DCN accordingly.
> + */
> +static void __set_colorop_3dlut(const struct drm_color_lut_32
> *drm_lut3d,
> +				uint32_t drm_lut3d_size,
> +				struct dc_3dlut *lut)
> +{
> +	if (!drm_lut3d_size) {
> +		lut->state.bits.initialized =3D 0;
> +		return;
> +	}

IIUC this means that setting a 3D LUT colorop with BYPASS=3D0 but not
passing in a DATA property will result in the 3D LUT being bypassed.
Meanwhile, in __set_dm_plane_colorop_3x4_matrix() in patch 36
"drm/amd/display: add 3x4 matrix colorop", when DATA is not set, an
error code will be bubbled up to atomic_check.

Given that this API is aimed at being prescriptive, I would expect the
second case, bubbling up an error to atomic_check, to happen whenever a
required DATA property is omitted, for all of the colorop types.

This makes me think it would be good to have a colorop validator helper
function that could be called from the driver's atomic_check to easily
do all such checks, such as that DATA is supplied when expected, not
only to remove the burden on every driver to check this, but also to
ensure consistency across them all.

--=20
Thanks,

N=C3=ADcolas

> +
> +	/* Only supports 17x17x17 3D LUT (12-bit) now */
> +	lut->lut_3d.use_12bits =3D true;
> +	lut->lut_3d.use_tetrahedral_9 =3D false;
> +
> +	lut->state.bits.initialized =3D 1;
> +	__drm_3dlut_32_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut-
> >lut_3d,
> +				=C2=A0=C2=A0 lut->lut_3d.use_tetrahedral_9,
> 12);
> +
> +}
[..]
