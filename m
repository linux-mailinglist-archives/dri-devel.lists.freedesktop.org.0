Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DDD8BBB2F
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 14:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4299E1128E4;
	Sat,  4 May 2024 12:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OgN+LpJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26F41128E4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 12:21:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2289B3;
 Sat,  4 May 2024 14:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1714825227;
 bh=Hwf6BwiJa8ZRxoW+TR/H4hruqs8CRpJc1VnyKBbiGLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgN+LpJmEuZCtUZsnj50UvM5nLmbhhPB3Rtk0Z6H0L7WxvSULUZG3FpSsTUk835FC
 H+Eku077+HaStlFLbIlSevJAv1XmXv4JSRo4Awsr8xElI0VWeI+25QCTgKHSqOFAQ2
 tvwMbCpMYXlAm44Ad33ocqilgINQ7wPXsQ2Gmb9M=
Date: Sat, 4 May 2024 15:21:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when
 device is unbound
Message-ID: <20240504122118.GB24548@pendragon.ideasonboard.com>
References: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
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

Hi Sean,

On Fri, May 03, 2024 at 05:54:32PM -0400, Sean Anderson wrote:
> Hi,
> 
> I have discovered a bug in the displayport driver on drm-misc-next. To
> trigger it, run
> 
> echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind
> 
> The system will become unresponsive and (after a bit) splat with a hard
> LOCKUP. One core will be unresponsive at the first zynqmp_dp_read in
> zynqmp_dp_bridge_detect.
> 
> I believe the issue is due the registers being unmapped and the block
> put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_release.

That is on purpose. Drivers are not allowed to access the device at all
after .remove() returns.

> This
> could be resolved by deferring things until zynqmp_dpsub_release
> (requiring us to skip devm_*), or by adding a flag to struct zynqmp_dp
> and checking it before each callback. A subsystem-level implementation
> might be better for the latter.
> 
> For a better traceback, try applying the below patch and running the
> following commands before triggering the lockup:
> 
> echo 4 > /sys/module/drm/parameters/debug
> echo 8 > /proc/sys/kernel/printk
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 9df068a413f3..17b477b14ab5 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -296,6 +296,7 @@ struct zynqmp_dp_config {
>   * @train_set: set of training data
>   */
>  struct zynqmp_dp {
> +       unsigned long long magic;
>         struct device *dev;
>         struct zynqmp_dpsub *dpsub;
>         void __iomem *iomem;
> @@ -1533,6 +1534,8 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
>         u32 state, i;
>         int ret;
>  
> +       WARN_ON(dp->magic != 0x0123456789abcdefULL);
> +
>         /*
>          * This is from heuristic. It takes some delay (ex, 100 ~ 500 msec) to
>          * get the HPD signal with some monitors.
> @@ -1723,6 +1726,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>         if (!dp)
>                 return -ENOMEM;
>  
> +       dp->magic = 0x0123456789abcdefULL;
>         dp->dev = &pdev->dev;
>         dp->dpsub = dpsub;
>         dp->status = connector_status_disconnected;
> @@ -1839,4 +1843,5 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
>  
>         zynqmp_dp_phy_exit(dp);
>         zynqmp_dp_reset(dp, true);
> +       dp->magic = 0xdeadbeefdeadbeefULL;
>  }

-- 
Regards,

Laurent Pinchart
