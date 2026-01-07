Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A6CFCD50
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25EF10E576;
	Wed,  7 Jan 2026 09:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kC1Epw/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F7B10E576
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:23:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D7398C1EC88;
 Wed,  7 Jan 2026 09:22:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B4EFD606F8;
 Wed,  7 Jan 2026 09:23:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20F6A103C8701; Wed,  7 Jan 2026 10:23:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767777786; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=F8avjswmx9B6sOWUaCD2+ZBX3Slu+Kiy8kz0hoCHI9I=;
 b=kC1Epw/S1UXIuwKxJbsvJ4/+AB9PAGz1ljoP2xcuIrKKp9lu655qIPe27DuBa0T+ghcB/K
 atA5kIELttVWqoxH/Go4ZYnqhv6r9UvzeVbRiZW/9op9uAAcaaPSJl4px5P9+kAAGOL/Vc
 Rb2UBFRSL6QRhO1IPBxx4cLUJkTLK2xmcl170aNkzyeiud2NvsTmWCNyRg2fDj8FlY9bUl
 adi+6gNmngc4ZFPQq0Ha5hKi5/HXl7Y3WRE22E9bs9vieQg6fObUy0AJvfXdfWEdXEEoVM
 Lux1YJ9VTvIJCtr4F6RS5rrk8fwheBAxVSA110NO1N3TpeNHtPXGt/hcYFicAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 10:23:01 +0100
Message-Id: <DFI8X9FKRV12.1XNFGJDUWR5PR@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/1] drm/bridge: lontium-lt9611uxc: use irq as
 optional parameter
Cc: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, <jernej.skrabec@gmail.com>,
 <jonas@kwiboo.se>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <simona@ffwll.ch>,
 <tzimmermann@suse.de>
To: "Vladimir Yakovlev" <vovchkir@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260107032342.332758-1-vovchkir@gmail.com>
 <20260107032342.332758-2-vovchkir@gmail.com>
In-Reply-To: <20260107032342.332758-2-vovchkir@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed Jan 7, 2026 at 4:23 AM CET, Vladimir Yakovlev wrote:
> On some systems the interrupt pin may not be used.
> In this case we exclude DRM_BRIDGE_OP_HPD from supported operations,
> after which a polling thread is started to detect the connection.
> (the default polling period for DRM is 10 seconds)
>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
> index bb5cff021c93..f7a74ec1f170 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -851,19 +851,25 @@ static int lt9611uxc_probe(struct i2c_client *clien=
t)
>  	init_waitqueue_head(&lt9611uxc->wq);
>  	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
>
> -	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> -					lt9611uxc_irq_thread_handler,
> -					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> -	if (ret) {
> -		dev_err(dev, "failed to request irq\n");
> -		goto err_disable_regulators;
> +	if (client->irq) {
> +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +						lt9611uxc_irq_thread_handler,
> +						IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> +		if (ret) {
> +			dev_err(dev, "failed to request irq\n");
> +			goto err_disable_regulators;
> +		}
> +		dev_dbg(dev, "Uses IRQ\n");
> +	} else {
> +		dev_dbg(dev, "The interrupt (IRQ) is not specified in the DTS.\n");
> +		dev_dbg(dev, "Check the interrupt (IRQ) or polling will be used!!!\n")=
;
>  	}

Thanks for having moved form a warning to a dbg. However these 2 lines are
overly verbose and that's not really needed. I would prefer to see all
those 3 dev_dbg() disappear honestly, being polling a perfectly supported
use case here. But if you really really want to keep them, at least replace
these 2 lines with just a "Uses polling\n" which gives the same info. Also
the 2 consecutive dev_dbg() may mix with other logging, making it awkward
to read in the logs.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
