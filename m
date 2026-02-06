Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WErpBSv1hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:05:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724ADFE9DB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA9410E7B5;
	Fri,  6 Feb 2026 14:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="R3hWU0ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-g124.zoho.com (sender4-pp-g124.zoho.com
 [136.143.188.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B9810E7AE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:05:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770386715; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H1SP3ZWZy2n98oO2VRMxJGvKxvpA1VEp5Apb33GV/zAYu2rb5ydXgKTDBQ1nfEb0ay8KXRn2ntPixct3OenOr69IgpxflVP8EfC9ikjC/xQ0HicpRrxXyvodS66fM8sIwAP5i1/bIBHcwrolRrSg0U6ljAd1FyG9gd0LwPBEUiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770386715;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=D7VRj+v7qEc06M4Xk9DWJiXeX8foMwNN9cX3WL7kVL4=; 
 b=nL/TljZpqzFHkcaqPnRJAemc20d3H7DJVZPgCCQXsisSIUPSt9PQq3/4GIfKI+uDsFqdBaOHUW9Rr2fuXIgax+0ZWir7N5a/YYw1wkwqV4xstHKSGRQpV7LVAYiQ7WVw8D+pbvX4sbmlPZotqgjn7JZ+4gRCLnjSwMEv/2NKHpg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770386715; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=D7VRj+v7qEc06M4Xk9DWJiXeX8foMwNN9cX3WL7kVL4=;
 b=R3hWU0ey2b0XSdkkpcpslzY1kZSDT7TRQY2KMG+As2U7PZh3BKjqjbKvm0JXYHnI
 14L+DnBIZ6MEwy+gfQ3UiP7GCkJQU7Wh7TLZRiCySCZQtWldcRw3DJjlNap6XTZikN0
 gQZFuy1mF2Cjp71QPhmO/V/ilJKjb2E1kc8DDUsA=
Received: by mx.zohomail.com with SMTPS id 1770386713473881.7041592011303;
 Fri, 6 Feb 2026 06:05:13 -0800 (PST)
Message-ID: <2fc9635430e6af0c175d6d019b7cd1598034892c.camel@collabora.com>
Subject: Re: [PATCH 09/11] drm/colorop: Introduce 3x3 Matrix
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu	
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com, 
 ariel.dalessandro@collabora.com, kernel@collabora.com
Date: Fri, 06 Feb 2026 09:05:11 -0500
In-Reply-To: <20260206112702.4afdbc48@eldfell>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-9-0cb99bd0ab33@collabora.com>
 <20260206112702.4afdbc48@eldfell>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:pekka.paalanen@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 724ADFE9DB
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 11:27 +0200, Pekka Paalanen wrote:
> On Tue, 23 Dec 2025 16:44:50 -0300
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> wrote:
>=20
> > Introduce a 3x3 Matrix colorop analogous to the 3x4 Matrix colorop,
> > with
> > the difference of not supporting offset coefficients.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_atomic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> > =C2=A0drivers/gpu/drm/drm_atomic_uapi.c |=C2=A0 3 +++
> > =C2=A0drivers/gpu/drm/drm_colorop.c=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++=
+++++++++++++++
> > =C2=A0include/drm/drm_colorop.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +++
> > =C2=A0include/uapi/drm/drm_mode.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 16 ++++++++++++++++
> > =C2=A05 files changed, 44 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic.c
> > b/drivers/gpu/drm/drm_atomic.c
> > index 6d3ea8056b60..bf4a31c02b70 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -802,6 +802,7 @@ static void
> > drm_atomic_colorop_print_state(struct drm_printer *p,
> > =C2=A0		drm_printf(p, "\tdata blob id=3D%d\n", state->data ?
> > state->data->base.id : 0);
> > =C2=A0		break;
> > =C2=A0	case DRM_COLOROP_CTM_3X4:
> > +	case DRM_COLOROP_CTM_3X3:
> > =C2=A0		drm_printf(p, "\tdata blob id=3D%d\n", state->data ?
> > state->data->base.id : 0);
> > =C2=A0		break;
> > =C2=A0	case DRM_COLOROP_MULTIPLIER:
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 7320db4b8489..7a70e894a2ef 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -709,6 +709,9 @@ static int
> > drm_atomic_color_set_data_property(struct drm_colorop *colorop,
> > =C2=A0		size =3D colorop->size * colorop->size * colorop-
> > >size *
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct drm_color_lu=
t32);
> > =C2=A0		break;
> > +	case DRM_COLOROP_CTM_3X3:
> > +		size =3D sizeof(struct drm_color_ctm);
> > +		break;
> > =C2=A0	default:
> > =C2=A0		/* should never get here */
> > =C2=A0		return -EINVAL;
> > diff --git a/drivers/gpu/drm/drm_colorop.c
> > b/drivers/gpu/drm/drm_colorop.c
> > index a19e03fb9c7c..51c1a0726dfa 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -68,6 +68,7 @@ static const struct drm_prop_enum_list
> > drm_colorop_type_enum_list[] =3D {
> > =C2=A0	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
> > =C2=A0	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
> > =C2=A0	{ DRM_COLOROP_3D_LUT, "3D LUT"},
> > +	{ DRM_COLOROP_CTM_3X3, "3x3 Matrix"},
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const char * const colorop_curve_1d_type_names[] =3D {
> > @@ -377,6 +378,26 @@ int drm_plane_colorop_ctm_3x4_init(struct
> > drm_device *dev, struct drm_colorop *c
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
> > =C2=A0
> > +int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > +				=C2=A0=C2=A0 struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > +				=C2=A0=C2=A0 uint32_t flags)
> > +{
> > +	int ret;
> > +
> > +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> > DRM_COLOROP_CTM_3X3, flags);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_colorop_reset(colorop);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_plane_colorop_ctm_3x3_init);
> > +
> > =C2=A0/**
> > =C2=A0 * drm_plane_colorop_mult_init - Initialize a
> > DRM_COLOROP_MULTIPLIER
> > =C2=A0 *
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index 8ec98521607d..ee7fa0eb5dbf 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -426,6 +426,9 @@ int drm_plane_colorop_curve_1d_lut_init(struct
> > drm_device *dev, struct drm_color
> > =C2=A0int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > =C2=A0				=C2=A0=C2=A0 struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > =C2=A0				=C2=A0=C2=A0 uint32_t flags);
> > +int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > +				=C2=A0=C2=A0 struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > +				=C2=A0=C2=A0 uint32_t flags);
> > =C2=A0int drm_plane_colorop_mult_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > =C2=A0				struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > =C2=A0				uint32_t flags);
> > diff --git a/include/uapi/drm/drm_mode.h
> > b/include/uapi/drm/drm_mode.h
> > index cbbbfc1dfe2b..b894b19eb9f8 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -964,6 +964,22 @@ enum drm_colorop_type {
> > =C2=A0	 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 color =3D lut=
3d[index]
> > =C2=A0	 */
> > =C2=A0	DRM_COLOROP_3D_LUT,
> > +
> > +	/**
> > +	 * @DRM_COLOROP_CTM_3X3:
> > +	 *
> > +	 * enum string "3x3 Matrix"
> > +	 *
> > +	 * A 3x3 matrix. Its values are specified via the
> > +	 * &drm_color_ctm struct provided via the DATA property.
> > +	 *
> > +	 * The DATA blob is a float[9]:
> > +	 * out=C2=A0=C2=A0 matrix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 in
> > +	 * | R |=C2=A0=C2=A0 | 0=C2=A0 1=C2=A0 2 |=C2=A0=C2=A0 | R |
> > +	 * | G | =3D | 3=C2=A0 4=C2=A0 5 | x | G |
> > +	 * | B |=C2=A0=C2=A0 | 6=C2=A0 7=C2=A0 8 |=C2=A0=C2=A0 | B |
> > +	 */
> > +	DRM_COLOROP_CTM_3X3,
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> >=20
>=20
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>=20
> FWIW, the statement "The DATA blob is a float[9]" is incorrect, but
> the
> same wording exists already with the DRM_COLOROP_CTM_3X4. The data
> type
> is not a float, nor is it a float reinterpreted as __u64 (they are
> not
> even the same size). Documentation for the structs explains the
> correct
> type, which is a fixed-point number.
>=20
> The struct types document also the layout, so there is no need to
> repeat the layout here. It may be worth mentioning that the blob must
> contain exactly one instance of the struct.

Makes sense, thanks! I'll fix that in v2.

--=20
Thanks,

N=C3=ADcolas
