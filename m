Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD8762BFBC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A54E10E4AE;
	Wed, 16 Nov 2022 13:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E077910E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 13:40:55 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1ovIes-0001jl-70; Wed, 16 Nov 2022 14:40:54 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1ovIer-0004zC-VF; Wed, 16 Nov 2022 14:40:53 +0100
Date: Wed, 16 Nov 2022 14:40:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 3/3] drm/etnaviv: export client GPU usage statistics
 via fdinfo
Message-ID: <20221116134053.GB12239@pengutronix.de>
References: <20220916151205.165687-1-l.stach@pengutronix.de>
 <20220916151205.165687-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916151205.165687-3-l.stach@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 05:12:05PM +0200, Lucas Stach wrote:
> This exposes a accumulated GPU active time per client via the
> fdinfo infrastructure.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> v2:
> - fix code style
> - switch to raw seq_printf
> - leave some breadcrumbs about the output format
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 40 ++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index b69edb40ae2a..c08748472f74 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -22,6 +22,7 @@
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
>  #include "etnaviv_perfmon.h"
> +#include "common.xml.h"
>  
>  /*
>   * DRM operations:
> @@ -471,7 +472,44 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
>  
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct drm_device *dev = file->minor->dev;
> +	struct etnaviv_drm_private *priv = dev->dev_private;
> +	struct etnaviv_file_private *ctx = file->driver_priv;
> +
> +	/*
> +	 * For a description of the text output format used here, see
> +	 * Documentation/gpu/drm-usage-stats.rst.
> +	 */
> +	seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
> +	seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
> +
> +	for (int i = 0; i < ETNA_MAX_PIPES; i++) {
> +		struct etnaviv_gpu *gpu = priv->gpu[i];
> +		char engine[8];

Maybe initialize this as well? See below.

> +		int cur = 0;
> +
> +		if (!gpu)
> +			continue;
> +
> +		if (gpu->identity.features & chipFeatures_PIPE_2D)
> +			cur = snprintf(engine, sizeof(engine), "2D");
> +		if (gpu->identity.features & chipFeatures_PIPE_3D)
> +			cur = snprintf(engine + cur, sizeof(engine) - cur,
> +				       "%s3D", cur ? "/" : "");

Does the NPU have either bit set? If not, this must not be forgotten to
be changed when NPU support is added, to avoid uninitalized use of the
engine variable.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

with gputop [1].

[1] https://lore.kernel.org/dri-devel/20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com/

regards
Philipp
