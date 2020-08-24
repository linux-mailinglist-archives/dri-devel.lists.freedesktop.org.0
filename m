Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D324FC48
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 13:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9C56E1E9;
	Mon, 24 Aug 2020 11:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718EF6E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 11:06:56 +0000 (UTC)
Received: from [2001:67c:670:201:5054:ff:fe8d:eefb] (helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kAA4y-0007Go-OV; Mon, 24 Aug 2020 12:51:56 +0200
Message-ID: <588560659bdb00a99897eb1685d3b85e82d48164.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: fix external abort seen on GC600 rev 0x19
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Mon, 24 Aug 2020 12:51:15 +0200
In-Reply-To: <20200823190924.6437-1-christian.gmeiner@gmail.com>
References: <20200823190924.6437-1-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, josua.mayer@jm0.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, den 23.08.2020, 21:09 +0200 schrieb Christian Gmeiner:
> It looks like that this GPU core triggers an abort when
> reading VIVS_HI_CHIP_PRODUCT_ID and/or VIVS_HI_CHIP_ECO_ID.
> 
> I looked at different versions of Vivante's kernel driver and did
> not found anything about this issue or what feature flag can be
> used. So go the simplest route and do not read these two registers
> on the affected GPU core.
> 
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> Reported-by: Josua Mayer <josua.mayer@jm0.eu>
> Fixes: 815e45bbd4d3 ("drm/etnaviv: determine product, customer and eco id")
> Cc: stable@vger.kernel.org
> ---
> Changelog:
> 
> V2:
>  - use correct register for conditional reads.

Thanks, I applied this patch to my etnaviv/fixes branch.

Regards,
Lucas

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index d5a4cd85a0f6..c6404b8d067f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -337,9 +337,16 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
>  
>  		gpu->identity.model = gpu_read(gpu, VIVS_HI_CHIP_MODEL);
>  		gpu->identity.revision = gpu_read(gpu, VIVS_HI_CHIP_REV);
> -		gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
>  		gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
> -		gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
> +
> +		/*
> +		 * Reading these two registers on GC600 rev 0x19 result in a
> +		 * unhandled fault: external abort on non-linefetch
> +		 */
> +		if (!etnaviv_is_model_rev(gpu, GC600, 0x19)) {
> +			gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
> +			gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
> +		}
>  
>  		/*
>  		 * !!!! HACK ALERT !!!!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
