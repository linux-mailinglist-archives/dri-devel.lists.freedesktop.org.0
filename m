Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F002784BE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 12:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DB86EC78;
	Fri, 25 Sep 2020 10:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390AB6EC71
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 10:09:51 +0000 (UTC)
Received: from [2a0a:edc0:0:900:6245:cbff:fea0:1793]
 (helo=kresse.office.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kLkfk-0004iC-DQ; Fri, 25 Sep 2020 12:09:48 +0200
Message-ID: <b33bd5ee52f4662bf530d9c120e196b9a772230a.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Robin Murphy <robin.murphy@arm.com>, linux+etnaviv@armlinux.org.uk, 
 christian.gmeiner@gmail.com
Date: Fri, 25 Sep 2020 12:09:47 +0200
In-Reply-To: <360728864e7aae4b839877d0bc49109fcf8dd14e.1599165521.git.robin.murphy@arm.com>
References: <360728864e7aae4b839877d0bc49109fcf8dd14e.1599165521.git.robin.murphy@arm.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:6245:cbff:fea0:1793
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: Re: [PATCH] drm/etnaviv: Drop local dma_parms
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2020-09-03 at 21:40 +0100, Robin Murphy wrote:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks, applied to etnaviv/next.

Regards,
Lucas

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 3 ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index a9a3afaef9a1..79b3bcd9f444 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -535,7 +535,6 @@ static int etnaviv_bind(struct device *dev)
>  	}
>  	drm->dev_private = priv;
>  
> -	dev->dma_parms = &priv->dma_parms;
>  	dma_set_max_seg_size(dev, SZ_2G);
>  
>  	mutex_init(&priv->gem_lock);
> @@ -585,8 +584,6 @@ static void etnaviv_unbind(struct device *dev)
>  
>  	component_unbind_all(dev, drm);
>  
> -	dev->dma_parms = NULL;
> -
>  	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
>  
>  	drm->dev_private = NULL;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index 4d8dc9236e5f..7db607817c0c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -33,7 +33,6 @@ struct etnaviv_file_private {
>  
>  struct etnaviv_drm_private {
>  	int num_gpus;
> -	struct device_dma_parameters dma_parms;
>  	struct etnaviv_gpu *gpu[ETNA_MAX_PIPES];
>  	gfp_t shm_gfp_mask;
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
