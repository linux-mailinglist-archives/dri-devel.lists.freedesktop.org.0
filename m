Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116962B62F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373310E440;
	Wed, 16 Nov 2022 09:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3877310E449
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:16:07 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ovEWb-0003Pi-76; Wed, 16 Nov 2022 10:16:05 +0100
Message-ID: <c937c4df9ed6b4a342996d7dd8e9c559af37b590.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] drm/etnaviv: allocate unique ID per drm_file
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Wed, 16 Nov 2022 10:16:04 +0100
In-Reply-To: <20220916151205.165687-2-l.stach@pengutronix.de>
References: <20220916151205.165687-1-l.stach@pengutronix.de>
 <20220916151205.165687-2-l.stach@pengutronix.de>
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 16.09.2022 um 17:12 +0200 schrieb Lucas Stach:
> Allows to easily track if several fd are pointing to the same
> execution context due to being dup'ed.
> 
I would appreciate it if someone could review path 2 and 3 of this
series. I would like to include it in my next upstream PR.

Regards,
Lucas

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 3 +++
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 1d2b4fb4bcf8..b69edb40ae2a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -49,6 +49,7 @@ static void load_gpu(struct drm_device *dev)
>  static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct etnaviv_drm_private *priv = dev->dev_private;
> +	static atomic_t ident = ATOMIC_INIT(0);
>  	struct etnaviv_file_private *ctx;
>  	int ret, i;
>  
> @@ -56,6 +57,8 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> +	ctx->id = atomic_inc_return(&ident);
> +
>  	ctx->mmu = etnaviv_iommu_context_init(priv->mmu_global,
>  					      priv->cmdbuf_suballoc);
>  	if (!ctx->mmu) {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index f32f4771dada..851b4b4ef146 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -27,6 +27,7 @@ struct etnaviv_iommu_global;
>  #define ETNAVIV_SOFTPIN_START_ADDRESS	SZ_4M /* must be >= SUBALLOC_SIZE */
>  
>  struct etnaviv_file_private {
> +	int id;
>  	struct etnaviv_iommu_context	*mmu;
>  	struct drm_sched_entity		sched_entity[ETNA_MAX_PIPES];
>  };


