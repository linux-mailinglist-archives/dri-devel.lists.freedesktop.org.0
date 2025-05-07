Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF38AAE455
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906E610E821;
	Wed,  7 May 2025 15:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="XR7SYh5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50E910E821
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746631000; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Wg0GsqTIi2WUqM+S4ZQJ0PFw2vZghyG4eFRQmY08WE+u9za5lByrXpBHOyF+vSh6o5eXwn8nJqOoIrBVrmdX7ckItcyeK1F6gWux5sfVERBNqyg0dNnpw5DpU6yX1lslVxDx6XynhB9WCpKyvFA/j8bdQ2gG2NUD5SpvnyDdqZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746631000;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=k61aakEccaP7dZAOfkTgPdzYRsNFVOmjLmKD7nlhJdY=; 
 b=h7uDFf97tViIaryte4cAzXT5dcEr/ysUgOKhsJZHUnDvdwKVkYvz/N8QO+MC25NwuBVEXimsOfwbsJU43AScZ2uGaVIcoJNzT2MhlILYVxuJOsJqoYP03VBnhY1ieIiF/2G1PcoLrXjtDf5yig6/uQHQmCuS4/DdcVyB/RYtC7M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746631000; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=k61aakEccaP7dZAOfkTgPdzYRsNFVOmjLmKD7nlhJdY=;
 b=XR7SYh5l2PJzLny4oQvUQ8bEe+lCTQaEY6Fkb3p34c3fLf29+HPmF+1Ga3W7BbP/
 cZmTkCcLRXIZOGN1+x7u2xvw39dw4kE0mMCXnDAttZJ/1pUMP4ZQhESUhdzQr/NsQCE
 4uJ0C43JpUyus/6Fi4hXjK3Xd/HssKfBi56Bl3PA=
Received: by mx.zohomail.com with SMTPS id 1746630997699833.1928376577795;
 Wed, 7 May 2025 08:16:37 -0700 (PDT)
Message-ID: <381091848a72424a333bb28006d83235068a9e33.camel@collabora.com>
Subject: Re: [PATCH v5 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Steven Price <steven.price@arm.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 07 May 2025 17:16:31 +0200
In-Reply-To: <2b85071a-e3e7-4cfc-a471-e81e463b7c37@arm.com>
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
 <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
 <2b85071a-e3e7-4cfc-a471-e81e463b7c37@arm.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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

Hi,

On Wed, 2025-05-07 at 15:06 +0100, Steven Price wrote:
> On 02/05/2025 13:17, Louis-Alexis Eyraud wrote:
> > Add a compatible for the MediaTek MT8370 SoC, with an integrated
> > ARM
> > Mali G57 MC2 GPU (Valhall-JM, dual core), with new platform data
> > for
> > its support in the panfrost driver.
> > It uses the same data as MT8186 for the power management features
> > to
> > describe power supplies, pm_domains and enablement (one regulator,
> > two
> > power domains) but also sets the FORCE_AARCH64_PGTABLE flag in the
> > GPU
> > configuration quirks bitfield to enable AARCH64 4K page table
> > format
> > mode.
> > As MT8186 and MT8370 SoC have different GPU architecture (Mali G52
> > 2EE
> > MC2 for MT8186), making them not compatible, and this mode is only
> > enabled for Mediatek SoC that are Mali G57 based (compatible with
> > mediatek,mali-mt8188 or mediatek,mali-8192), having specific
> > platform
> > data allows to set this flag for MT8370 without modifying MT8186
> > configuration and behaviour.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
>=20
> With one minor comment fixed below:
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
>=20
> > ---
> > =C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
> > =C2=A01 file changed, 11 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index
> > f1ec3b02f15a0029d20c7d81046ded59854e885c..8e0a1ae6940c73b7b60233950
> > ae3abdfa843cc8e 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -846,6 +846,16 @@ static const struct panfrost_compatible
> > mediatek_mt8192_data =3D {
> > =C2=A0	.gpu_quirks =3D BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
> > =C2=A0};
> > =C2=A0
> > +/* MT8370 uses the same power domains and power supplies as MT8186
> > */
>=20
> This comment is not correct - you've got the power domains of MT8186,
> but the supplies of MT8183. The comment doesn't actually add much so
> you=20
> could just drop it.
>=20
I'll remove it.

> If you're feeling adventurous then one option here is to actually
> clean=20
> up the mediatek entries a little. Instead of referring to particular=20
> part numbers we could have:
>=20
> static const char * const mediatek_2_pm_domains[] =3D { "core0",
> "core1" };
> static const char * const mediatek_3_pm_domains[] =3D { "core0",
> "core1", "core2" };
> static const char * const mediatek_5_pm_domains[] =3D { "core0",
> "core1", "core2",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "core3",
> "core4" };
>=20
> Or even just have the mediatek_5_domains[] array (dropping the '5' in
> the name) and not use ARRAY_SIZE().
>=20
> Equally the supplies arrays could be renamed. We have the one with=20
> "sram" for legacy and everything else uses {"mali", NULL} but we have
> two definitions for it (mt8183_b and mt8192).
>=20
> Thanks,
> Steve
I'll do the array cleaning as well in a separate patch in the v6.

Regards,
Louis-Alexis
>=20
> > +static const struct panfrost_compatible mediatek_mt8370_data =3D {
> > +	.num_supplies =3D ARRAY_SIZE(mediatek_mt8183_b_supplies) -
> > 1,
> > +	.supply_names =3D mediatek_mt8183_b_supplies,
> > +	.num_pm_domains =3D ARRAY_SIZE(mediatek_mt8186_pm_domains),
> > +	.pm_domain_names =3D mediatek_mt8186_pm_domains,
> > +	.pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> > +	.gpu_quirks =3D BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
> > +};
> > +
> > =C2=A0static const struct of_device_id dt_match[] =3D {
> > =C2=A0	/* Set first to probe before the generic compatibles */
> > =C2=A0	{ .compatible =3D "amlogic,meson-gxm-mali",
> > @@ -868,6 +878,7 @@ static const struct of_device_id dt_match[] =3D {
> > =C2=A0	{ .compatible =3D "mediatek,mt8186-mali", .data =3D
> > &mediatek_mt8186_data },
> > =C2=A0	{ .compatible =3D "mediatek,mt8188-mali", .data =3D
> > &mediatek_mt8188_data },
> > =C2=A0	{ .compatible =3D "mediatek,mt8192-mali", .data =3D
> > &mediatek_mt8192_data },
> > +	{ .compatible =3D "mediatek,mt8370-mali", .data =3D
> > &mediatek_mt8370_data },
> > =C2=A0	{ .compatible =3D "allwinner,sun50i-h616-mali", .data =3D
> > &allwinner_h616_data },
> > =C2=A0	{}
> > =C2=A0};
> >=20
