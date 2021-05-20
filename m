Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2838B7E9
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1D86E437;
	Thu, 20 May 2021 19:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDA96E436
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:58:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n2so18933646wrm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=fvRDr1D5/5+LCAmUf65vl1i5y+y4alcViE7GRSVhNkM=;
 b=IJTQEmled92Limq65lxrtZal8HOwFj/1/UhSrjJkbEbu08DIpkT2M+pXl4vT54YMb/
 1SEvjeoR8uPrk6as9bd43zO4V1j8Aa75jbzkHbhMRT9KmUCawIf5NbEbJIVb+b0b++Mn
 FgEo/rN7Yfst8gFYO0KjrBYTSoknMUpMulURY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=fvRDr1D5/5+LCAmUf65vl1i5y+y4alcViE7GRSVhNkM=;
 b=HRU/VObBNYgWAOk489AAblJqba1X8GKYB1JDeVslmUmYaw3cU9TvcGPtWVMS6V4cqy
 qXi1fk8qtMLmMqTctkZU3Y/meoj6FyNku2IHCCkXH3vdhjFTbQNXzi2CvrU4It3bzGcX
 vyw4ljL2xI29fvNC9rE9HvtrZNVoOTvZ874BVmWCCfYS4eISdryHW5R9gclHi4sVps46
 AK4gbIvGcgWJjpm9kgljsdBHbL+dPYh57eFPATvZKeemnbslM2WWUFfU7vXS3aznR3uO
 vRyZMPL01qoM6iA7DjgXIrgarsd4KzCLNfkpkZ0pmn9AYxH4Vk0iAK263tBItEqlUMUv
 VDMQ==
X-Gm-Message-State: AOAM531v7scRBoAwOtkRlaBAiismaDk15fe4M2QiZOa4ySNBrQUbhv6O
 95vCByII/t+OG0AfD+KDgHa/xw==
X-Google-Smtp-Source: ABdhPJxkVwauF/EHL3NdcMJKAi/zvLETHClTk9XUCWU1LnHRqZ+1dbG0hruL8BgFaGFXrcbqn/w6cg==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr6126622wru.396.1621540734354; 
 Thu, 20 May 2021 12:58:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v11sm5059609wrs.9.2021.05.20.12.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:58:53 -0700 (PDT)
Date: Thu, 20 May 2021 21:58:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 7/7] drm/msm: Migrate to aggregate driver
Message-ID: <YKa/fEuVqHhV9CPC@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <20210520002519.3538432-8-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520002519.3538432-8-swboyd@chromium.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 05:25:19PM -0700, Stephen Boyd wrote:
> The device lists are poorly ordered when the component device code is
> used. This is because component_master_add_with_match() returns 0
> regardless of component devices calling component_add() first. It can
> really only fail if an allocation fails, in which case everything is
> going bad and we're out of memory. The driver that registers the
> aggregate driver, can succeed at probe and put the attached device on
> the DPM lists before any of the component devices are probed and put on
> the lists.
> 
> Within the component device framework this usually isn't that bad
> because the real driver work is done at bind time via
> component{,master}_ops::bind(). It becomes a problem when the driver
> core, or host driver, wants to operate on the component device outside
> of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> driver core doesn't understand the relationship between the host device
> and the component devices and could possibly try to operate on component
> devices when they're already removed from the system or shut down.
> 
> Normally, device links or probe defer would reorder the lists and put
> devices that depend on other devices in the lists at the correct
> location, but with component devices this doesn't happen because this
> information isn't expressed anywhere. Drivers simply succeed at
> registering their component or the aggregate driver with the component
> framework and wait for their bind() callback to be called once the other
> components are ready. In summary, the drivers that make up the aggregate
> driver can probe in any order.
> 
> This ordering problem becomes fairly obvious when shutting down the
> device with a DSI controller connected to a DSI bridge that is
> controlled via i2c. In this case, the msm display driver wants to tear
> down the display pipeline on shutdown via msm_pdev_shutdown() by calling
> drm_atomic_helper_shutdown(), and it can't do that unless the whole
> display chain is still probed and active in the system. When a display
> bridge is on i2c, the i2c device for the bridge will be created whenever
> the i2c controller probes, which could be before or after the msm
> display driver probes. If the i2c controller probes after the display
> driver, then the i2c controller will be shutdown before the display
> controller during system wide shutdown and thus i2c transactions will
> stop working before the display pipeline is shut down. This means we'll
> have the display bridge trying to access an i2c bus that's shut down
> because drm_atomic_helper_shutdown() is trying to disable the bridge
> after the bridge is off.
> 
> The solution is to make the aggregate driver into a real struct driver
> that is bound to a device when the other component devices have all
> probed. Now that the component driver code is a proper bus, we can
> simply register an aggregate driver with that bus via
> component_aggregate_register() and then attach the shutdown hook to that
> driver to be sure that the shutdown for the display pipeline is called
> before any of the component device driver shutdown hooks are called.
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> As stated in the cover letter, this isn't perfect but it still works. I
> get a warning from runtime PM that the parent device (e00000.mdss) is
> not runtime PM enabled but the child device (the aggregate device) is
> being enabled by the bus logic. I need to move around the place that the
> parent device is runtime PM enabled and probably keep it powered up
> during the entire time that the driver is probed until the aggregate
> driver probes.
> 
>  drivers/gpu/drm/msm/msm_drv.c | 47 +++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e1104d2454e2..0c64e6a2ce25 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1265,19 +1265,35 @@ static int add_gpu_components(struct device *dev,
>  	return 0;
>  }
>  
> -static int msm_drm_bind(struct device *dev)
> +static int msm_drm_bind(struct aggregate_device *adev)
>  {
> -	return msm_drm_init(dev, &msm_driver);
> +	return msm_drm_init(adev->dev.parent, &msm_driver);
>  }
>  
> -static void msm_drm_unbind(struct device *dev)
> +static void msm_drm_unbind(struct aggregate_device *adev)
>  {
> -	msm_drm_uninit(dev);
> +	msm_drm_uninit(adev->dev.parent);
> +}
> +
> +static void msm_drm_shutdown(struct aggregate_device *adev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(to_platform_device(adev->dev.parent));
> +	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> +
> +	if (!priv || !priv->kms)
> +		return;
> +
> +	drm_atomic_helper_shutdown(drm);
>  }
>  
> -static const struct component_master_ops msm_drm_ops = {
> -	.bind = msm_drm_bind,
> -	.unbind = msm_drm_unbind,
> +static struct aggregate_driver msm_drm_aggregate_driver = {
> +	.probe = msm_drm_bind,
> +	.remove = msm_drm_unbind,
> +	.shutdown = msm_drm_shutdown,
> +	.driver = {
> +		.name	= "msm_drm",
> +		.owner	= THIS_MODULE,
> +	},
>  };
>  
>  /*
> @@ -1306,7 +1322,8 @@ static int msm_pdev_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto fail;
>  
> -	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
> +	msm_drm_aggregate_driver.match = match;

This is a bit awkward design, because it means the driver struct can't be
made const, and it will blow up when you have multiple instance of the
same driver. I think the match should stay as part of the register
function call, and be stored in the aggregate_device struct somewhere.

Otherwise I think this looks really solid and fixes your issue properly.
Obviously needs careful review from Greg KH for the device model side of
things, and from Rafael Wysocki for pm side.

Bunch of thoughts from a very cursory reading:

- I think it'd be good if we pass the aggregate_device to all components
  when we bind them, plus the void * parameter just to make this less
  disruptive. Even more device model goodies.

- Maybe splatter a pile of sysfs links around so that this all becomes
  visible? Could be interesting for debugging ordering issues. Just an
  idea, feel free to entirely ignore.

- Needs solid kerneldoc for everything exposed to drivers and good
  overview DOC:

- Needs deprecation warnings in the kerneldoc for all the
  component_master_* and if feasible with a mechanical conversion,
  converting existing users. I'd like to not be stuck with the old model
  forever, plus this will give a pile more people to review this code
  here.

Anyway the name changes in probe and remove hooks below are already worth
this on their own imo. That's why I'd like to see them in all drivers.

Cheers, Daniel

> +	ret = component_aggregate_register(&pdev->dev, &msm_drm_aggregate_driver);
>  	if (ret)
>  		goto fail;
>  
> @@ -1319,23 +1336,12 @@ static int msm_pdev_probe(struct platform_device *pdev)
>  
>  static int msm_pdev_remove(struct platform_device *pdev)
>  {
> -	component_master_del(&pdev->dev, &msm_drm_ops);
> +	component_aggregate_unregister(&pdev->dev, &msm_drm_aggregate_driver);
>  	of_platform_depopulate(&pdev->dev);
>  
>  	return 0;
>  }
>  
> -static void msm_pdev_shutdown(struct platform_device *pdev)
> -{
> -	struct drm_device *drm = platform_get_drvdata(pdev);
> -	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> -
> -	if (!priv || !priv->kms)
> -		return;
> -
> -	drm_atomic_helper_shutdown(drm);
> -}
> -
>  static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>  	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> @@ -1351,7 +1357,6 @@ MODULE_DEVICE_TABLE(of, dt_match);
>  static struct platform_driver msm_platform_driver = {
>  	.probe      = msm_pdev_probe,
>  	.remove     = msm_pdev_remove,
> -	.shutdown   = msm_pdev_shutdown,
>  	.driver     = {
>  		.name   = "msm",
>  		.of_match_table = dt_match,
> -- 
> https://chromeos.dev
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
