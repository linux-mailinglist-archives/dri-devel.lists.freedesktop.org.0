Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF49618052
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 16:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7C610E611;
	Thu,  3 Nov 2022 15:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 474 seconds by postgrey-1.36 at gabe;
 Thu, 03 Nov 2022 15:00:24 UTC
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9038110E643
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667487146; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcEFQh2mJj09+NlvXdp3LL/fR13GF9B0LXaEa5C3vRY=;
 b=0J8yvYJKvrkttI97aho87IkV6Ngk9YZhb1W9HFDDt1IOPvUA7hsWmIA/ag/rSD1nrpAQsP
 Xypk28sCUlq28A09KAeXtWuDe5D32+xZR+EMuCOYqYaAp1y593arzcvfeoWM0R2uBETNDs
 GVj4G4+zkGDjh+MRAw3Z4ehazYzma4Q=
Date: Thu, 03 Nov 2022 14:52:17 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix missing platform_driver_unregister()
 call in ingenic_drm_init()
To: Yuan Can <yuancan@huawei.com>
Message-Id: <5B1SKR.FZ7TSOMCSE4N2@crapouillou.net>
In-Reply-To: <20221103140148.76385-1-yuancan@huawei.com>
References: <20221103140148.76385-1-yuancan@huawei.com>
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
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuan,

Le jeu. 3 nov. 2022 =E0 14:01:48 +0000, Yuan Can <yuancan@huawei.com> a=20
=E9crit :
> A problem about modprobe ingenic-drm failed is triggered with the=20
> following
> log given:
>=20
>  [  303.561088] Error: Driver 'ingenic-ipu' is already registered,=20
> aborting...
>  modprobe: ERROR: could not insert 'ingenic_drm': Device or resource=20
> busy
>=20
> The reason is that ingenic_drm_init() returns=20
> platform_driver_register()
> directly without checking its return value, if=20
> platform_driver_register()
> failed, it returns without unregistering ingenic_ipu_driver_ptr,=20
> resulting
> the ingenic-drm can never be installed later.
> A simple call graph is shown as below:
>=20
>  ingenic_drm_init()
>    platform_driver_register() # ingenic_ipu_driver_ptr are registered
>    platform_driver_register()
>      driver_register()
>        bus_add_driver()
>          priv =3D kzalloc(...) # OOM happened
>    # return without unregister ingenic_ipu_driver_ptr
>=20
> Fixing this problem by checking the return value of
> platform_driver_register() and do platform_unregister_drivers() if
> error happened.
>=20
> Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Missing a Cc: to linux-stable, no?

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index ab0515d2c420..4499a04f7c13 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1629,7 +1629,11 @@ static int ingenic_drm_init(void)
>  			return err;
>  	}
>=20
> -	return platform_driver_register(&ingenic_drm_driver);
> +	err =3D platform_driver_register(&ingenic_drm_driver);
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && err)
> +		platform_driver_unregister(ingenic_ipu_driver_ptr);
> +
> +	return err;
>  }
>  module_init(ingenic_drm_init);
>=20
> --
> 2.17.1
>=20


