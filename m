Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A8225A6A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 10:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0656E1E2;
	Mon, 20 Jul 2020 08:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119156E1E2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 08:53:12 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id AD23D5C0103;
 Mon, 20 Jul 2020 10:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1595235189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2psVOuBfQWzNlIeqUe0VNRfz3qCiweMFCB6YaVzx7DQ=;
 b=OCcsuc3lZe9WmOlUEF6jEi7nyes6LSwQy5g5TopNZORtWr0Ep51yf1sE3mU6HqZiwbvyuA
 9JypdNValYZNBHBHP8I2XVqQdnKwMr89UmWEvcqoJzoVj0Exy4JP0r03seyx/B5LHnR1dE
 pTh2v+BbFszjKF4Zv6DUdzrPHr8EW+g=
MIME-Version: 1.0
Date: Mon, 20 Jul 2020 10:53:09 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/mxsfb: miss err handle in probe
In-Reply-To: <20200611122311.20847-1-bernard@vivo.com>
References: <20200611122311.20847-1-bernard@vivo.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <4d83b3dfcd3efb0c639dacadd5b69619@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-11 14:23, Bernard Zhao wrote:
> There are three err return values in drm_fbdev_generic_setup.
> In mxsfb_probe we called this function, but didn`t handle the
> return value, this change is to add err handle, maybe make code
> a bit more readable.

This got recently changed, so I guess checking the return value isn't
required anymore:
https://patchwork.freedesktop.org/patch/msgid/20200408082641.590-11-tzimmermann@suse.de

--
Stefan

> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 497cf443a9af..a45f3b85f725 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -415,7 +415,9 @@ static int mxsfb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	ret = drm_fbdev_generic_setup(drm, 32);
> +	if (ret)
> +		goto err_unload;
>  
>  	return 0;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
