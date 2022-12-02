Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BA46402C3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 09:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FC710E1AA;
	Fri,  2 Dec 2022 08:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9147F10E1AA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 08:59:34 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p11tM-0003px-M7; Fri, 02 Dec 2022 09:59:32 +0100
Message-ID: <6dc1400c0f39849ca5ba675e25e26e5f4a663e78.camel@pengutronix.de>
Subject: Re: [PATCH] [RFC] drm/etnaviv: Disable softpin
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 02 Dec 2022 09:59:30 +0100
In-Reply-To: <20221201232100.221606-1-marex@denx.de>
References: <20221201232100.221606-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 02.12.2022 um 00:21 +0100 schrieb Marek Vasut:
> Currently softpin suffers from assorted race conditions exposed by newer
> versions of mesa 22.2.y and 22.3.y . Those races are difficult to fix in
> older kernel versions due to massive amount of backports necessary to do
> so. Disable softpin by default until Linux 6.1.y is out, which contains
> the necessary fixes to make softpin work reliably.
> 
Sorry, but that's a NACK. The userspace driver depends on softpin for
GPUs with texture descriptors, so this introduces a hard functional
regression for those GPUs. I.e. they would go from "require race fixes
that are already on the way to upstream" to not working at all.

Regards,
Lucas

> Fixes: 088880ddc0b20 ("drm/etnaviv: implement softpin")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: etnaviv@lists.freedesktop.org
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 51320eeebfcff..326c9696cccea 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -146,10 +146,7 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
>  		break;
>  
>  	case ETNAVIV_PARAM_SOFTPIN_START_ADDR:
> -		if (priv->mmu_global->version == ETNAVIV_IOMMU_V2)
> -			*value = ETNAVIV_SOFTPIN_START_ADDRESS;
> -		else
> -			*value = ~0ULL;
> +		*value = ~0ULL;
>  		break;
>  
>  	case ETNAVIV_PARAM_GPU_PRODUCT_ID:


