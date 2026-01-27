Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDRvHAqgeGn4rQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:22:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B314D938B1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03510E052;
	Tue, 27 Jan 2026 11:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b="HwMZ8T4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Tue, 27 Jan 2026 11:22:46 UTC
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15E110E052
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769512002; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WUnQMh7L2MyGYwIOecN6E+tr6uoDbUc9tpOka4Jleu0xpYnaGgh8CiJ/aaQV+QbqLLn3kzHi4cBF2JkizSbZneKc9KY3iVNp/P0YGUcsSwV/hOcvIof23thdf8z9zN5Qc5yJktW7Kd16PRYXntT9FGUzFsdDy/Rsurl2B/1XiCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769512002;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+/ujX07We0Eu+qVpEjEN0/wc15ACrWyJnm3TpsaB8ls=; 
 b=bC84KUz50vqAbqA9R88DtaLcXGL5lajQxwlKoUImNrNRgtPyjtO8uJLDQFh3rIocpgyGg79kAL61bhJrR8An3yVxvNJZJYhglvI84pGMPQiw5kPpyctPcMjUOs7ZaJlFuptON2pfqb38lIYrC79ZAEKwDCEoKinv7iCsWm5WfTo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=caterina.shablia@collabora.com;
 dmarc=pass header.from=<caterina.shablia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769512002; 
 s=zohomail; d=collabora.com; i=caterina.shablia@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=+/ujX07We0Eu+qVpEjEN0/wc15ACrWyJnm3TpsaB8ls=;
 b=HwMZ8T4IjMkmBaNARBU5HKa+OPmgIrvzQsf2QSj7TPHH1yF83a37cFFhJhGINuFa
 sJlG93Ph28+7veHMY2BZikK8LauTL+tD/Pq2PhkegQ5zui9q7VVTOfunw7S4bwRYXPx
 bfDkxbyh6UtYEcQO7DRLTluJi1R0ZECQq+4e+zEA=
Received: by mx.zohomail.com with SMTPS id 1769512000549554.868623869763;
 Tue, 27 Jan 2026 03:06:40 -0800 (PST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm: add ARM interleaved 64k modifier
Date: Tue, 27 Jan 2026 12:06:35 +0100
Message-ID: <2773531.vuYhMxLoTh@fedora-1.home>
In-Reply-To: <20260126100545.08a4ffd1@fedora>
References: <20260123212327.83064-1-caterina.shablia@collabora.com>
 <20260126100545.08a4ffd1@fedora>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[caterina.shablia@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[caterina.shablia@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fedora-1.home:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: B314D938B1
X-Rspamd-Action: no action

El dilluns, 26 de gener del 2026, a les 10:05:45 (Hora est=C3=A0ndard d=E2=
=80=99Europa=20
central), Boris Brezillon va escriure:
> Hello Caterina,
>=20
> On Fri, 23 Jan 2026 21:23:25 +0000
>=20
> Caterina Shablia <caterina.shablia@collabora.com> wrote:
> > This modifier is intended to be used by panvk to implement sparse
> > partially-resident images with better map and unmap performance,
> > and no worse access performance, compared to implementing them in
> > terms of U-interleaved.
> >=20
> > With this modifier, the arrangement of texel blocks is very similar
> > to block U-interleaved. Tiles are laid out linearly. Tiles are
> > always 64k bytes in size and are 1:1-sided rectangles when texel
> > block is 1 byte or a multiple of 4 bytes, and 2:1-sided otherwise.
>=20
> It's not all that clear that we're dealing with mega tiles formed with
> a set of U-interleaved tiles. Also, the 1:1-sided rectangle sounds
> like a complex way to qualify a square.
>=20
> "
> This modifier is a exposing mega tiles of 64 KiB. It's formed of
> U-interleaved tiles laid out linearly to cover a square or a rectangle
> whose width is twice the height.
> "
>=20
> > Only power of two byte texel blocks can be used with this modifier.
> > Within a single tile, texels are arranged according to U-interleaving.
> >=20
> > Unlike block U-interleaved, the layout depends solely on texel block
> > size and doesn't change depending on whether the image format is
> > compressed or not.
>=20
> Hm, are you sure of that? I'd assume the inner tile size to still
> depend on compressed vs !compressed, meaning the overall layout is also
> dependent on the compressed vs !compressed property.
Yes, this can be confirmed using panvk and vk cts by making panvk use=20
INTERLEAVED_64K for images with BLOCK_TEXEL_VIEW_COMPATIBLE and then runnin=
g=20
the CTS exercising this feature. Using a modifier that changes under whethe=
r a=20
format is compressed, such as 16X16_BLOCK_U_INTERLEAVED, will result in=20
failures.
>=20
> > The hardware features corresponding to this modifier are available
> > starting with v10 (second gen Valhall.)
> >=20
> > The corresponding panvk MR can be found at:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38986
> >=20
> > Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> > ---
> >=20
> >  include/uapi/drm/drm_fourcc.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index e527b24bd824..0da2c880e08c 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -1422,6 +1422,16 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64
> > modifier)>=20
> >  #define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
> > =20
> >  	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
> >=20
> > +/*
> > + * ARM 64k interleaved modifier
> > + *
> > + * This is used by ARM Mali v10+ GPUs. It's basically the same as 16x16
> > block + * U-interleaved, but within 64k-byte 1:1 or 2:1 -sided tiles.
>=20
> Again, it's not clear from this description that this modifier is
> exposing "mega" tiles formed with a set of U-interleaved tiles spanning
> a 64KiB section. The way I read this is that it's U-interleaved, but
> over a bigger region, like 256x256 U-interleaved.
>=20
> Regards,
>=20
> Boris
>=20
> > Tiles themselves
> > + * are laid out linearly.
> > + */
> > +#define DRM_FORMAT_MOD_ARM_INTERLEAVED_64K \
> > +	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 2ULL)
> > +
> >=20
> >  /*
> > =20
> >   * Allwinner tiled modifier
> >   *
> >=20
> > base-commit: f08f665f8cda9520d98ee24545d306a92f386616




