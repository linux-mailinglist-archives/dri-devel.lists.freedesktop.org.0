Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0C6D1ABC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A3710F143;
	Fri, 31 Mar 2023 08:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F7610F143
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:49:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E1DA6603180;
 Fri, 31 Mar 2023 09:49:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680252557;
 bh=EIlHy/fOQ4nvThPIDq8IH7bbZG6jRaS0NwuvOWeucNU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HT7tilTwUS2yXnomFHF6Tjq9o6/wAyNNsybgq7DxBT8JuPLcJLov7IcJ091S5eWGu
 gNyn5DLK/b0uXCPWVBx22d71xpNzg1txgABQW16i8Kd0Ozk0rOGej4Pw15btAUBBoR
 3JHh7hmTNafjLVoIMs6ozO/MN6NKq5XufWN5m51wy1nWBFLxWxUEfyTll32QTfpAD1
 m/5oVpAVPpKwfb+DaNJGiHt46yzabfn8GxuObatGQg3z8qdr5vU2PhFHblkgZxPBmZ
 rPdul/Ib1m24iXdOGSI+1AB2eAmBBbAdjNssJi15zat9kX2K0tjcX77aquPArG35m1
 6tBKQC+ui0htw==
Date: Fri, 31 Mar 2023 10:49:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 RESEND 2/2] drm/panfrost: Add basic support for speed
 binning
Message-ID: <20230331104914.708b194e@collabora.com>
In-Reply-To: <5814d779-0635-43fe-3fe8-31c130f05b3a@collabora.com>
References: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
 <20230323090822.61766-3-angelogioacchino.delregno@collabora.com>
 <5814d779-0635-43fe-3fe8-31c130f05b3a@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 10:11:07 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 23/03/23 10:08, AngeloGioacchino Del Regno ha scritto:
> > Some SoCs implementing ARM Mali GPUs are subject to speed binning:
> > this means that some versions of the same SoC model may need to be
> > limited to a slower frequency compared to the other:
> > this is being addressed by reading nvmem (usually, an eFuse array)
> > containing a number that identifies the speed binning of the chip,
> > which is usually related to silicon quality.
> > 
> > To address such situation, add basic support for reading the
> > speed-bin through nvmem, as to make it possible to specify the
> > supported hardware in the OPP table for GPUs.
> > This commit also keeps compatibility with any platform that does
> > not specify (and does not even support) speed-binning.
> > 
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>  
> 
> Hello maintainers,
> I've seen that this got archived in the dri-devel patchwork; because of that and
> only that, I'm sending this ping to get this patch reviewed.

Looks good to me. If you can get a DT maintainer to review the binding
(Rob?), I'd be happy to queue the series to drm-misc-next.

> 
> (perhaps we can even get it picked for v6.4?)
> 
> Regards,
> Angelo
> 
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 30 +++++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > index fe5f12f16a63..58dfb15a8757 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > @@ -4,6 +4,7 @@
> >   #include <linux/clk.h>
> >   #include <linux/devfreq.h>
> >   #include <linux/devfreq_cooling.h>
> > +#include <linux/nvmem-consumer.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_opp.h>
> >   
> > @@ -82,6 +83,31 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
> >   	.get_dev_status = panfrost_devfreq_get_dev_status,
> >   };
> >   
> > +static int panfrost_read_speedbin(struct device *dev)
> > +{
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = nvmem_cell_read_variable_le_u32(dev, "speed-bin", &val);
> > +	if (ret) {
> > +		/*
> > +		 * -ENOENT means that this platform doesn't support speedbins
> > +		 * as it didn't declare any speed-bin nvmem: in this case, we
> > +		 * keep going without it; any other error means that we are
> > +		 * supposed to read the bin value, but we failed doing so.
> > +		 */
> > +		if (ret != -ENOENT) {
> > +			DRM_DEV_ERROR(dev, "Cannot read speed-bin (%d).", ret);
> > +			return ret;
> > +		}
> > +
> > +		return 0;
> > +	}
> > +	DRM_DEV_DEBUG(dev, "Using speed-bin = 0x%x\n", val);
> > +
> > +	return devm_pm_opp_set_supported_hw(dev, &val, 1);
> > +}
> > +
> >   int panfrost_devfreq_init(struct panfrost_device *pfdev)
> >   {
> >   	int ret;
> > @@ -101,6 +127,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
> >   		return 0;
> >   	}
> >   
> > +	ret = panfrost_read_speedbin(dev);
> > +	if (ret)
> > +		return ret;
> > +
> >   	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names);
> >   	if (ret) {
> >   		/* Continue if the optional regulator is missing */  
> 
> 

