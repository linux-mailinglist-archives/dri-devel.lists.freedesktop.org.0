Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F39BCF1AB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 09:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524F910E2EA;
	Sat, 11 Oct 2025 07:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sjoerd@collabora.com header.b="hiki661m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B7B10E2EA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 07:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760169446; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KLl1+e+W9DzaoLYJzbMiO+O4s8HsZP3p9CwUndYoD+5DAstyBx7vEDq6NO9esSXLuGBmO4vjde+as/e0soTpuf7kAnK+8E7IJx+E5oCM3HmHiaeukGrrhiJk6bMc0VePbLVuMtmz3/E2UwZG5GZT2v+qNdJg2Vlx1GCvfFaZL3o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760169446;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=T8D9JSmjoAYBStsc1vhdarg1O0rJKit5HAJi7BCHXNI=; 
 b=YMujKQP4mm5PtNOhEaGYZ5xuDL/TUvVWfuIX7aciWq6fbNWyZZoRneJVOMl4k+ZoCWeK6qpMKj49CVm/gEvQpNZekC8MOjKAsNMMMr8y6+7PuKlAwFTL8Y0KTVnjxWE3jfrCFUbotjPuFtj38umH+V5cMBUaGPD2fVFasjDAArg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sjoerd@collabora.com;
 dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760169446; 
 s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=T8D9JSmjoAYBStsc1vhdarg1O0rJKit5HAJi7BCHXNI=;
 b=hiki661mfVPG5vQuxCUrKp4b9mhLeonNq8bnkGxHq05iBV7aBX4Z7ACWoYFpcFqc
 dJxjLUptDbelZ0S6Kf6A7s8tg6h6ii+NL7ThCswSP57Qjyds/lC6I0/cxZ5uZNGHitK
 5cRsY1j0zQ1hFKZ7XwfQ7TZnDzmlnVtYD9OBeKVM=
Received: by mx.zohomail.com with SMTPS id 1760169443955726.6866621828841;
 Sat, 11 Oct 2025 00:57:23 -0700 (PDT)
Message-ID: <5137227fee0bb06dac3558b0d2db47972785df48.camel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
From: Sjoerd Simons <sjoerd@collabora.com>
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  CK Hu <ck.hu@mediatek.com>, Ma
 Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Sat, 11 Oct 2025 09:57:20 +0200
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
References: <20251006093937.27869-1-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
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

On Mon, 2025-10-06 at 11:39 +0200, Johan Hovold wrote:
> A recent change fixed device reference leaks when looking up drm
> platform device driver data during bind() but failed to remove a partial
> fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
> kobject put for component sub-drivers").
>=20
> This results in a reference imbalance on component bind() failures and
> on unbind() which could lead to a user-after-free.
>=20
> Make sure to only drop the references after retrieving the driver data
> by effectively reverting the previous partial fix.
>=20
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.

Thanks for correcting my "fix". This looks better and i can confirm it fixe=
s the issue :)

Reviewed-By: Sjoerd Simons <sjoerd@collabora.com>
Tested-By: Sjoerd Simons <sjoerd@collabora.com>
=20
>=20
> Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks=
 in
> mtk_drm_get_all_drm_priv")
> Reported-by: Sjoerd Simons <sjoerd@collabora.com>
> Link: https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0=
db@collabora.com
> Cc: stable@vger.kernel.org
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 ----------
> =C2=A01 file changed, 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 384b0510272c..a94c51a83261 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -686,10 +686,6 @@ static int mtk_drm_bind(struct device *dev)
> =C2=A0	for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> =C2=A0		private->all_drm_private[i]->drm =3D NULL;
> =C2=A0err_put_dev:
> -	for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> -		/* For device_find_child in mtk_drm_get_all_priv() */
> -		put_device(private->all_drm_private[i]->dev);
> -	}
> =C2=A0	put_device(private->mutex_dev);
> =C2=A0	return ret;
> =C2=A0}
> @@ -697,18 +693,12 @@ static int mtk_drm_bind(struct device *dev)
> =C2=A0static void mtk_drm_unbind(struct device *dev)
> =C2=A0{
> =C2=A0	struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> -	int i;
> =C2=A0
> =C2=A0	/* for multi mmsys dev, unregister drm dev in mmsys master */
> =C2=A0	if (private->drm_master) {
> =C2=A0		drm_dev_unregister(private->drm);
> =C2=A0		mtk_drm_kms_deinit(private->drm);
> =C2=A0		drm_dev_put(private->drm);
> -
> -		for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> -			/* For device_find_child in mtk_drm_get_all_priv() */
> -			put_device(private->all_drm_private[i]->dev);
> -		}
> =C2=A0		put_device(private->mutex_dev);
> =C2=A0	}
> =C2=A0	private->mtk_drm_bound =3D false;
