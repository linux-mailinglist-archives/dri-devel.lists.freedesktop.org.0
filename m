Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B97B0F4BE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 16:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BC010E7D9;
	Wed, 23 Jul 2025 14:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="G0kKPqh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CF710E7DD;
 Wed, 23 Jul 2025 14:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753279207; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N5iTYjyepKeVwUsy3xrnJ4o2yQ4MvSLS0+wVMYJIhtDO6OtRzVkVxixiHzAcyscQVMe7UvVYHuvPClxlM+HfJ4UMrTSM1XcpCpqZVjzcopzbY2LznpdY79xbE50oe+Cu9hT+gknNlDNXt2o70wS7QzOAv3rBmJZ09dMD3V2ZTSk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753279207;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zk0L+C4K3jKWIEouwPa+VL9hBipstr3UBV39eVVZtzc=; 
 b=Jw4SDO6N3L3BFKFPA4ODrr8giHGyK3mcSnIc4dSU3U2iJk69f3jpd3YoI1vo5lplER3+Xm0j2ZCgJXPTXYft/Kw+2PUH2sE86+vdQXOQ8CRjh+Gl6OhTEitDriYUx4i5b29uKEhQKbeI36GXOKrh5LTwxmLlwxybtHd+YAG1Les=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753279207; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=zk0L+C4K3jKWIEouwPa+VL9hBipstr3UBV39eVVZtzc=;
 b=G0kKPqh8jyzSZ6yDdQ8uATQ+4yyJhgz6epyn7MMhI3OATuz8yrUx8lJDsGj+JVol
 q/dnNabJ90ozFxka9o1xQL1bx7Drn76RT5OXDmwArKmnke3caUb67Hr1NL2ip8NG2Z2
 OwxJh4MgkdZEJzTleapyxtx54gvF+r23GZaL4j9Y=
Received: by mx.zohomail.com with SMTPS id 1753279204657109.55205778707705;
 Wed, 23 Jul 2025 07:00:04 -0700 (PDT)
Message-ID: <5bf31a150ac7556d59cf9d1828a5d2a7a1c0da8f.camel@collabora.com>
Subject: Re: [PATCH V10 41/46] drm/colorop: allow non-bypass colorops
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
Date: Wed, 23 Jul 2025 10:00:01 -0400
In-Reply-To: <20250617041746.2884343-42-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-42-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <5bf31a150ac7556d59cf9d1828a5d2a7a1c0da8f.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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
> Not all HW will be able to do bypass on all color
> operations. Introduce an 32 bits 'flags' for all colorop
> init functions and DRM_COLOROP_FLAG_ALLOW_BYPASS for creating
> the BYPASS property when it's true.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
[..]
> =C2=A0
> =C2=A0	/* next */
> =C2=A0	prop =3D drm_property_create_object(dev,
> DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
> @@ -195,10 +197,11 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
> =C2=A0 * @supported_tfs: A bitfield of supported
> drm_plane_colorop_curve_1d_init enum values,
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 created using BIT(curve_type) and combine=
d with
> the OR '|'
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 operator.
> + * @flags: bitmask of misc, see DRM_COLOROP_FLAGS_* defines.

Typo, should be DRM_COLOROP_FLAG_*

Same on the other kernel-docs below.

--=20
Thanks,

N=C3=ADcolas
