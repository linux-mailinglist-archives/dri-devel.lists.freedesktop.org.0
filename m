Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E43ADC6C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 05:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B676E110;
	Sun, 20 Jun 2021 03:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922156E110
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 03:26:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8358751E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 05:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624159584;
 bh=DZueLPFxASqP+rQsSO7Xy6Q0cc34R5fuvJfDHhELKjQ=;
 h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:
 References:In-Reply-To:From;
 b=i7Z+IUycr6lylLEFPVXz3WO59SkKxAhg9J31V94W8IBUTZZyzxdYQ6yk7r4ZeQd/V
 ZK9W0hyvSwPT28MdfbdmzbZ7RCVt/VgYTrJR1Z1nwhrQhnafeq2FGGxzcUdpGJRZdd
 Q9ax42xm5DKGRZq54ICRBdmmg4L1GpfVTGdPu4kM=
Resent-From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Resent-Date: Sun, 20 Jun 2021 06:26:00 +0300
Resent-Message-ID: <YM61SDH0aczxXrNt@pendragon.ideasonboard.com>
Resent-To: dri-devel@lists.freedesktop.org
Date: Sun, 20 Jun 2021 04:44:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm/vc4: dsi: Only register our component once a DSI
 device is attached
Message-ID: <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
References: <20200707101912.571531-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200707101912.571531-1-maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, Tim Gover <tim.gover@raspberrypi.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I'm testing this, and I'm afraid it causes an issue with all the
I2C-controlled bridges. I'm focussing on the newly merged ti-sn65dsi83
driver at the moment, but other are affected the same way.

With this patch, the DSI component is only added when the DSI device is
attached to the host with mipi_dsi_attach(). In the ti-sn65dsi83 driver,
this happens in the bridge attach callback, which is called when the
bridge is attached by a call to drm_bridge_attach() in vc4_dsi_bind().
This creates a circular dependency, and the DRM/KMS device is never
created.

How should this be solved ? Dave, I think you have shown an interest in
the sn65dsi83 recently, any help would be appreciated. On a side note,
I've tested the ti-sn65dsi83 driver on a v5.10 RPi kernel, without much
success (on top of commit e1499baa0b0c I get a very weird frame rate -
147 fps of 99 fps instead of 60 fps - and nothing on the screen, and on
top of the latest v5.10 RPi branch, I get lock-related warnings at every
page flip), which is why I tried v5.12 and noticed this patch. Is it
worth trying to bring up the display on the v5.10 RPi kernel in parallel
to fixing the issue introduced in this patch, or is DSI known to be
broken there ?

On Tue, Jul 07, 2020 at 12:19:12PM +0200, Maxime Ripard wrote:
> If the DSI driver is the last to probe, component_add will try to run all
> the bind callbacks straight away and return the error code.
> 
> However, since we depend on a power domain, we're pretty much guaranteed to
> be in that case on the BCM2711, and are just lucky on the previous SoCs
> since the v3d also depends on that power domain and is further in the probe
> order.
> 
> In that case, the DSI host will not stick around in the system: the DSI
> bind callback will be executed, will not find any DSI device attached and
> will return EPROBE_DEFER, and we will then remove the DSI host and ask to
> be probed later on.
> 
> But since that host doesn't stick around, DSI devices like the RaspberryPi
> touchscreen whose probe is not linked to the DSI host (unlike the usual DSI
> devices that will be probed through the call to mipi_dsi_host_register)
> cannot attach to the DSI host, and we thus end up in a situation where the
> DSI host cannot probe because the panel hasn't probed yet, and the panel
> cannot probe because the DSI host hasn't yet.
> 
> In order to break this cycle, let's wait until there's a DSI device that
> attaches to the DSI host to register the component and allow to progress
> further.
> 
> Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index eaf276978ee7..19aab4e7e209 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1246,10 +1246,12 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>  	return ret;
>  }
>  
> +static const struct component_ops vc4_dsi_ops;
>  static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
>  			       struct mipi_dsi_device *device)
>  {
>  	struct vc4_dsi *dsi = host_to_dsi(host);
> +	int ret;
>  
>  	dsi->lanes = device->lanes;
>  	dsi->channel = device->channel;
> @@ -1284,6 +1286,12 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
>  		return 0;
>  	}
>  
> +	ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
> +	if (ret) {
> +		mipi_dsi_host_unregister(&dsi->dsi_host);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1662,7 +1670,6 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct vc4_dsi *dsi;
> -	int ret;
>  
>  	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>  	if (!dsi)
> @@ -1670,26 +1677,10 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
>  	dev_set_drvdata(dev, dsi);
>  
>  	dsi->pdev = pdev;
> -
> -	/* Note, the initialization sequence for DSI and panels is
> -	 * tricky.  The component bind above won't get past its
> -	 * -EPROBE_DEFER until the panel/bridge probes.  The
> -	 * panel/bridge will return -EPROBE_DEFER until it has a
> -	 * mipi_dsi_host to register its device to.  So, we register
> -	 * the host during pdev probe time, so vc4 as a whole can then
> -	 * -EPROBE_DEFER its component bind process until the panel
> -	 * successfully attaches.
> -	 */
>  	dsi->dsi_host.ops = &vc4_dsi_host_ops;
>  	dsi->dsi_host.dev = dev;
>  	mipi_dsi_host_register(&dsi->dsi_host);
>  
> -	ret = component_add(&pdev->dev, &vc4_dsi_ops);
> -	if (ret) {
> -		mipi_dsi_host_unregister(&dsi->dsi_host);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
