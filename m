Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC64C98F1F9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 16:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388DC10E86F;
	Thu,  3 Oct 2024 14:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kvTn1y3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA21810E86F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727967511;
 bh=GKHtfj37CNGse5EH3aylphaiOEB5Kj4jq9UhlQgMeXY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kvTn1y3IB4Z2Hk2S+3CF3KHUcG/q6JntATwfk2XtcdS604ITksKF2IGNzOZ7pyYEA
 sxTsJhKR2E+uG6zP5nWyQivgmL3ixBho9Iy/NzqaalMVAllQek2BbIHqqqFOG/xXZP
 eq4qJh59TlG7Xnkv+aqoHqr0MQ+RNWWU+ycG8k0+TW2pAyw9jH3bW4vmv4LsZaLlHU
 ySWEU4+FPo8NpC+uyi5q6cXFTLhiLpK1yWnVc/R6wDQvsphY2Ueh8MKruD8fykQkzP
 j34HnKRTwyiKc9JTPbQcNnkGu26DooGqctwkZAYdjb6c2KXvq7jA5sxq57l7EKWHes
 7KI6cfImEHt/A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F111E17E3601;
 Thu,  3 Oct 2024 16:58:30 +0200 (CEST)
Date: Thu, 3 Oct 2024 16:58:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Grant Likely
 <grant.likely@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panthor: Fix OPP refcnt leaks in devfreq
 initialisation
Message-ID: <20241003165825.178bb096@collabora.com>
In-Reply-To: <20241003133037.3398144-2-adrian.larumbe@collabora.com>
References: <20241003133037.3398144-1-adrian.larumbe@collabora.com>
 <20241003133037.3398144-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  3 Oct 2024 14:30:29 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Make sure in case of errors between the first fetch of an OPP in
> panthor_devfreq_init and its successive put, the error path decrements its
> reference count to avoid OPP object leaks when removing the device.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: fac9b22df4b1 ("drm/panthor: Add the devfreq logical block")
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 9d0f891b9b53..ce0ac4563f65 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -197,7 +197,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	if (ret && ret !=3D -ENODEV) {
>  		if (ret !=3D -EPROBE_DEFER)
>  			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
> -		return ret;
> +		goto opp_err;
>  	}
> =20
>  	/*
> @@ -207,7 +207,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	ret =3D dev_pm_opp_set_opp(dev, opp);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> -		return ret;
> +		goto opp_err;
>  	}
> =20
>  	dev_pm_opp_put(opp);
> @@ -242,6 +242,10 @@ int panthor_devfreq_init(struct panthor_device *ptde=
v)
>  		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> =20
>  	return 0;
> +
> +opp_err:
> +	dev_pm_opp_put(opp);
> +	return ret;

If you re-order things (see the following diff), you shouldn't need
this error path.

--->8---

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/pa=
nthor/panthor_devfreq.c
index 9d0f891b9b53..4f1a30f29c06 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -163,13 +163,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
=20
        cur_freq =3D clk_get_rate(ptdev->clks.core);
=20
-       opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
-       if (IS_ERR(opp))
-               return PTR_ERR(opp);
-
-       panthor_devfreq_profile.initial_freq =3D cur_freq;
-       ptdev->current_frequency =3D cur_freq;
-
        /* Regulator coupling only takes care of synchronizing/balancing vo=
ltage
         * updates, but the coupled regulator needs to be enabled manually.
         *
@@ -200,17 +193,24 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
                return ret;
        }
=20
+       opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
+       if (IS_ERR(opp))
+               return PTR_ERR(opp);
+
+       panthor_devfreq_profile.initial_freq =3D cur_freq;
+       ptdev->current_frequency =3D cur_freq;
+
        /*
         * Set the recommend OPP this will enable and configure the regulat=
or
         * if any and will avoid a switch off by regulator_late_cleanup()
         */
        ret =3D dev_pm_opp_set_opp(dev, opp);
+       dev_pm_opp_put(opp);
        if (ret) {
                DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
                return ret;
        }
=20
-       dev_pm_opp_put(opp);
=20
        /* Find the fastest defined rate  */
        opp =3D dev_pm_opp_find_freq_floor(dev, &freq);
