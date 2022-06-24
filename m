Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1555A15D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F9010E685;
	Fri, 24 Jun 2022 19:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 313 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jun 2022 19:05:31 UTC
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEF610E685
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1656097215; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THNfze9JEECbMTbkniNl4WxsrwffazR6yHW49pczds4=;
 b=K941P0DpIoJDcsyNQjtu54obkjlHXfjLrCJBJoMhBy8bzMbVZkEcE5OXtUNtK5CFnOQVkC
 6PUACCO5JqQSInC01JnI685UZIAKzhA5KZvrb3V5xUdLntYxsH1Uu/73nVZ7r6AM66/277
 4NZVnmpuPNbMaBbBZIo99FOznMgIXUY=
Date: Fri, 24 Jun 2022 20:00:05 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Use resource_size function on resource object
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Message-Id: <5SWZDR.5KODQDXQB5142@crapouillou.net>
In-Reply-To: <20220624013159.88646-1-jiapeng.chong@linux.alibaba.com>
References: <20220624013159.88646-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: airlied@linux.ie, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le ven., juin 24 2022 at 09:31:59 +0800, Jiapeng Chong=20
<jiapeng.chong@linux.alibaba.com> a =E9crit :
> This was found by coccicheck:
>=20
> ./drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1149:35-38: WARNING:=20
> Suspicious code. resource_size is maybe missing with res.
>=20
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 2c559885347a..5514b163999f 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1146,7 +1146,7 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	}
>=20
>  	regmap_config =3D ingenic_drm_regmap_config;
> -	regmap_config.max_register =3D res->end - res->start;
> +	regmap_config.max_register =3D resource_size(res);

These two are not equivalent. resource_size() is (res->end - res->start=20
+ 1).

If the memory resource has a size of 0x10 bytes, then using=20
resource_size() will set .max_register =3D=3D 0x10, which is invalid, as it=
=20
is already outside the memory resource.

Cheers,
-Paul


>  	priv->map =3D devm_regmap_init_mmio(dev, base,
>  					  &regmap_config);
>  	if (IS_ERR(priv->map)) {
> --
> 2.20.1.7.g153144c
>=20


