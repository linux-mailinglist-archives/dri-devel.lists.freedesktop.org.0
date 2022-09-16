Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E25BA96F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 11:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE6B10E2D0;
	Fri, 16 Sep 2022 09:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DFC10E043;
 Fri, 16 Sep 2022 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663320698; x=1694856698;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gN8wKDuQpTpNxIQf6BxBuR3+q76KJdL+ncUpI4QbVlo=;
 b=DFeaeXFm7AmABqFKvHFbLZfOkACXt9ycpG96N1uJ/lKcCnxoTgygM7dI
 RUsBgKMVF3hsNu0BgoBrDCb5JXZtJacZ/AS9r1TB1mmB2CmNVj7IhH46h
 k/JxP6GzpNRf2xFYVV3Q/c/NHxMB6q3e9NpfatHdon3gPTrfk08VR1R0f
 cVTJR+J4/SZXruUYClRhw/G9kkKA/h9ny+AHx30PYS0BMfLflOi9f+ow0
 O5POXwlRPEAYSQgbpBkQTZ1mvb6aMg9b2Z6c6Ms7Hw/eQnOyzE6VYbol4
 /IT8fjznVMJBeISGyXf0HzPn3m++dY8zNawbUUx6azxgHCR/9JgorR762 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="362917405"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="362917405"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:31:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="620029789"
Received: from agiridha-mobl1.ger.corp.intel.com (HELO [10.213.204.25])
 ([10.213.204.25])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:31:36 -0700
Message-ID: <3a9627c5-498c-c749-77cd-f273f10e474e@linux.intel.com>
Date: Fri, 16 Sep 2022 10:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/3] drm/etnaviv: export client GPU usage statistics via
 fdinfo
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220908181013.3214205-1-l.stach@pengutronix.de>
 <20220908181013.3214205-3-l.stach@pengutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220908181013.3214205-3-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


Hi Lucas,

On 08/09/2022 19:10, Lucas Stach wrote:
> This exposes a accumulated GPU active time per client via the
> fdinfo infrastructure.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 38 ++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index b69edb40ae2a..11b1f11fcb58 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -22,6 +22,7 @@
>   #include "etnaviv_gem.h"
>   #include "etnaviv_mmu.h"
>   #include "etnaviv_perfmon.h"
> +#include "common.xml.h"
>   
>   /*
>    * DRM operations:
> @@ -471,7 +472,42 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>   	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>   };
>   
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct drm_device *dev = file->minor->dev;
> +	struct etnaviv_drm_private *priv = dev->dev_private;
> +	struct etnaviv_file_private *ctx = file->driver_priv;
> +	struct drm_printer p = drm_seq_file_printer(m);

Any specific reason not to use seq_printf directly? (May be my ignorance.)

> +	int i;
> +
> +	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
> +	drm_printf(&p, "drm-client-id:\t%u\n", ctx->id);
> +
> +	for (i = 0; i < ETNA_MAX_PIPES; i++) {
> +                struct etnaviv_gpu *gpu = priv->gpu[i];
> +		char engine[8];
> +		int cur = 0;

Alignment renders odd in my client.

> +
> +		if (!gpu)
> +			continue;

I'd stick a comment in here to the effect of "For text output format 
description please see drm-usage-stats.rst!".

Just to leave a breadcrumb putting some restraint on adding vendor 
specific things which may be already covered by the common spec. To help 
with common tools in the future as much as possible.

> +
> +		if (gpu->identity.features & chipFeatures_PIPE_2D)
> +			cur = snprintf(engine, sizeof(engine), "2D");
> +		if (gpu->identity.features & chipFeatures_PIPE_3D)
> +			cur = snprintf(engine + cur, sizeof(engine) - cur,
> +				       "%s3D", cur ? "/" : "");
> +
> +		drm_printf(&p, "drm-engine-%s:\t%llu ns\n", engine,
> +			   ctx->sched_entity[i].elapsed_ns);

Two questions:

1)
So you have max four pipes, each can be either only 2d, 3d, or 2d/3d? 
Can you have multiple of the same like 2x 3D? If you do, have you 
considered exporting one drm-engine-% together with drm-engine-capacity- 
for it?

2)
Have you tried my, yet unmerged, vendor agnostic gputop tool with your 
changes?

https://patchwork.freedesktop.org/series/102175/

It would be interesting to know if it works.

Regards,

Tvrtko

> +	}
> +}
> +
> +static const struct file_operations fops = {
> +        .owner = THIS_MODULE,
> +        DRM_GEM_FOPS,
> +        .show_fdinfo = etnaviv_fop_show_fdinfo,
> +};
>   
>   static const struct drm_driver etnaviv_drm_driver = {
>   	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
