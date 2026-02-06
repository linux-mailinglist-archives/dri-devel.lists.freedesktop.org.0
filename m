Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGMHJJP0hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:02:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB6FE948
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ECF10E7AD;
	Fri,  6 Feb 2026 14:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="j2wTubrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226A410E7AD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770386556; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VR0eJx/pQ+e9fiD8Srp2mnUP05Y4jBuK6/X7+2iz3u8cS1uVVHAiFaNzqMxXmRMONOkza7x39xfM0bn/pAoAnfGdWhFn75EyXY26fzgSWPy6m3My7aea0ECemyFrl0KwxGMRZwZOmLJBEq51b9WmD6q57WJJqs5VXbVrMFXAZLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770386556;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7h/m+OM+IZSrfWnlY71Nxs1XBfrAQxoSp8VocCjjCNo=; 
 b=e9R/Jw5DOGv0+XGxAIS1rb5XEipGrOqK++LC/CNAaX2a8SsBezkiow0N80G9nnLLy0o8OyRIVXwEdC6vDu3I9Nzn+ioKNpOOP4OcJBC9JBZtCFfFvaZBUHcNrtdQpp4zY+tDhBMQRF8wQBwGXh3bKXk/dB/rB5dAGSaC/zYI9SY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770386556; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=7h/m+OM+IZSrfWnlY71Nxs1XBfrAQxoSp8VocCjjCNo=;
 b=j2wTubrDqNZt4Vkq343Qo2TSF2n/xtyUewmbCAT+/zj/uTPqgypQxgxzQAj1UDmG
 rraL+v7AhuR6OtWVECpz9hA3YtMTp/FNbjQoNV69NyCQypfS3SXviSQdaoazcKLhbQ5
 neR0R0fDJSBEyP5Q9snSiW8T9oMTfOrDxNXIgjT4=
Received: by mx.zohomail.com with SMTPS id 1770386554174417.2631923055201;
 Fri, 6 Feb 2026 06:02:34 -0800 (PST)
Message-ID: <45b44706a86046b795b3a29d3987b7764455b21d.camel@collabora.com>
Subject: Re: [PATCH 07/11] drm/colorop: Introduce HLG EOTF
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
Date: Fri, 06 Feb 2026 09:02:31 -0500
In-Reply-To: <20260206105102.1208fff9@eldfell>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
 <20260206105102.1208fff9@eldfell>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DCAB6FE948
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 10:51 +0200, Pekka Paalanen wrote:
> On Tue, 23 Dec 2025 16:44:48 -0300
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> wrote:
>=20
> > Introduce definition of a hybrid log-gamma electro-optical transfer
> > function for 1D Curve colorops.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_colorop.c |=C2=A0 1 +
> > =C2=A0include/drm/drm_colorop.h=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
> > =C2=A02 files changed, 11 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_colorop.c
> > b/drivers/gpu/drm/drm_colorop.c
> > index fafe45b93ff8..a19e03fb9c7c 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -79,6 +79,7 @@ static const char * const
> > colorop_curve_1d_type_names[] =3D {
> > =C2=A0	[DRM_COLOROP_1D_CURVE_BT2020_OETF] =3D "BT.2020 OETF",
> > =C2=A0	[DRM_COLOROP_1D_CURVE_GAMMA22] =3D "Gamma 2.2",
> > =C2=A0	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] =3D "Gamma 2.2 Inverse",
> > +	[DRM_COLOROP_1D_CURVE_HLG_EOTF] =3D "HLG",
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const struct drm_prop_enum_list
> > drm_colorop_lut1d_interpolation_list[] =3D {
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index ee6454b08b2d..8ec98521607d 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -126,6 +126,16 @@ enum drm_colorop_curve_1d_type {
> > =C2=A0	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
> > =C2=A0	 */
> > =C2=A0	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
> > +
> > +	/**
> > +	 * @DRM_COLOROP_1D_CURVE_HLG_EOTF:
> > +	 *
> > +	 * enum string "HLG"
> > +	 *
> > +	 * Hybrid log-gamma transfer function.
> > +	 */
> > +	DRM_COLOROP_1D_CURVE_HLG_EOTF,
> > +
>=20
> Hi,
>=20
> if you read ITU-R BT.2100[1], you will see that the HLG EOTF has
> three
> parameters: the system gamma, the display nominal peak luminance, and
> the display black luminance. You cannot define a HLG EOTF or its
> inverse without these parameters. One might assume to derive the
> system
> gamma from the peak luminance, but I would like to leave that as a
> free
> parameter if possible, because I'm not convinced the formulas for it
> are
> universally applicable.
>=20
> The HLG OETF on the other hand is a fixed function. Did you mean that
> instead?

Thank you for the insights! But as it's obvious by now I don't have
enough information to answer that. Hopefully someone from MediaTek
could clarify what is the precise function implemented in hardware.

I didn't know about this difference between the HLG EOTF and OETF, but
what made me guess it would be the EOTF is that this curve is available
at the GAMMA block, which is right before blending the planes (the
pipeline topology I reverse-engineered from testing is on the cover-
letter), which I believe is usually done in the optical domain. But I
suppose one option would be that this curve really is the Inverse HLG
OETF, which wouldn't require additional parameters and also brings the
content to the optical domain.

--=20
Thanks,

N=C3=ADcolas
