Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3E475500
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA88E10E27E;
	Wed, 15 Dec 2021 09:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45B10E27E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:18:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mxQQg-0000v3-KC; Wed, 15 Dec 2021 10:18:30 +0100
Message-ID: <190d0eea4c134539a500a3fae514bb6e3025a7ec.camel@pengutronix.de>
Subject: Re: [PATCH 07/60] drm/etnaviv: Add support for the nomodeset kernel
 parameter
From: Lucas Stach <l.stach@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Wed, 15 Dec 2021 10:18:29 +0100
In-Reply-To: <20211215010008.2545520-8-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-8-javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

Am Mittwoch, dem 15.12.2021 um 01:59 +0100 schrieb Javier Martinez Canillas:
> According to disable Documentation/admin-guide/kernel-parameters.txt, this
> parameter can be used to disable kernel modesetting.
> 
> DRM drivers will not perform display-mode changes or accelerated rendering
> and only the systewm system framebuffer will be available if it was set-up.
> 
Etnaviv is a render-only driver, so will no perform any modesetting on
a display device, so I'm not sure if it's sensible to cover it under
the nomodeset parameter. I see that it is consistent with the other
drivers that deal with a combined render/display device, where the
render device also gets disabled with the nomodeset param, but it
doesn't really match the description of what the parameter is supposed
to do.

I'm not opposed to take this patch for consistency reasons, but I would
like to hear some more opinions from other DRM folks.

Regards,
Lucas

> But only a few DRM drivers currently check for nomodeset, make this driver
> to also support the command line parameter.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 7dcc6392792d..58b092248f7b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -635,6 +635,9 @@ static int __init etnaviv_init(void)
>  	int ret;
>  	struct device_node *np;
>  
> +	if (drm_firmware_drivers_only())
> +		return -ENODEV;
> +
>  	etnaviv_validate_init();
>  
>  	ret = platform_driver_register(&etnaviv_gpu_driver);


