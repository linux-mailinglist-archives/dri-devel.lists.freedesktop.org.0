Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EAC98EA3C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945C610E1E3;
	Thu,  3 Oct 2024 07:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MHvIFztx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B6C10E1E3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 07:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727939866;
 bh=lT8bT5kSxgIfLqr7Z2JCHBxtG5CmBxPjUIRJ7Ggt7fw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MHvIFztxhjhDMGBD4nqw27saXhmX4h2DeAgqBUJynHF/mjC9uxB4OQmSCiJ4xGhZL
 n5FMwm+/NMqC/knPYDJ1QbHxbxPhE/HfcatTu8sY+CTShmP5qP9C7YueNWsFaIXqac
 uZCJT6sNkdYV1SL3/kT7OWuVar9Lz6JnqGFfG4pgnPfa1V2N7Ix5f8p1OkaEPza8ia
 97e2yNcrnzC6IicFMg+yex/+1nX7feZwta0VFnVYN9G6ZXzxpP7rKC20OzQH/y2vED
 xtIJpRrgY4meaKvDxlsHPmMG/Csf7FlQFzma7ow+NA6W5fm1iESOWXWHhiwsGXurLi
 u8Uk79hThnC8A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 56EB217E0F98;
 Thu,  3 Oct 2024 09:17:46 +0200 (CEST)
Date: Thu, 3 Oct 2024 09:17:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Add missing OPP table refcnt decremental
Message-ID: <20241003091740.4e610f21@collabora.com>
In-Reply-To: <20241003002603.3177741-1-adrian.larumbe@collabora.com>
References: <20241003002603.3177741-1-adrian.larumbe@collabora.com>
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

On Thu,  3 Oct 2024 01:25:37 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> retrieves the OPP for the maximum device clock frequency, but forgets to
> keep the reference count balanced by putting the returned OPP object. This
> eventually leads to an OPP core warning when removing the device.
>=20
> Fix it by putting OPP objects as many times as they're retrieved.
> Also remove an unnecessary whitespace.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")

Reviewed-by:=20

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.c
> index 2d30da38c2c3..c7d3f980f1e5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -38,7 +38,7 @@ static int panfrost_devfreq_target(struct device *dev, =
unsigned long *freq,
>  		return PTR_ERR(opp);
>  	dev_pm_opp_put(opp);
> =20
> -	err =3D  dev_pm_opp_set_rate(dev, *freq);
> +	err =3D dev_pm_opp_set_rate(dev, *freq);
>  	if (!err)
>  		ptdev->pfdevfreq.current_frequency =3D *freq;
> =20
> @@ -177,6 +177,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfd=
ev)
>  	 */
>  	pfdevfreq->current_frequency =3D cur_freq;
> =20
> +	dev_pm_opp_put(opp);
> +

Shouldn't this be moved after the dev_pm_opp_set_opp() that's
following?

>  	/*
>  	 * Set the recommend OPP this will enable and configure the regulator
>  	 * if any and will avoid a switch off by regulator_late_cleanup()

