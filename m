Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D522244AF2A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 15:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586A96E86C;
	Tue,  9 Nov 2021 14:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8127F6E868
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 14:08:07 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id e11so17287866ljo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 06:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0fNV8RfZoUZ7pGCUW9oN4/Ld/VRPsjcpfRvL7NHa+ok=;
 b=Dw3p4eiz8eGOCbXLcaAeDFmGAM2TlruYqedkrVijfwP2B1qZUv3K6GbUret7GHTMFy
 Mn8nQI8B2fomSTc4701EnyjryqP/WIepKQ2DOvuYV18ccfUcstEx4ZLG4VUwsZIl9u3V
 M4JgLvntRn9m419n6XscEYhy773VTna9VSpkNs/P1w9D4hf3Y3HvaBsSfWEnMI2NTY1i
 kCZS69d10DbewSzS9cZ+xbwg+sPKmeXqEQLDjKf0TR/czBd8HalwyhSnJyRJkRWoPOLe
 f7S8OesO1TF6/areJoXbc1+4bQv3hxA60QWCTKCgB0ykcYYSPdcX+K6zTTZ+bniwozm1
 FwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0fNV8RfZoUZ7pGCUW9oN4/Ld/VRPsjcpfRvL7NHa+ok=;
 b=Hv+FIYyVgZQuBU2GafN59QDIdwpL5q2v+1cI3K5m8IYgJOmdYBZb8taRVcdWFGQr3e
 IZExL2roHDnoP0okVUbePtA86PnhNXl1ZmT82miYm0cw7qf8+YEGq8yAzZ8je4NuPlYa
 w4fBk3KYMLK+m/0K9s4ihDTEeoS1QIz6fChDQPAHGkD5Pihu74TSXhH7Ol29N6ICRVSL
 EdkybWJWon51se2iKMvsJRIZu/gLTCvmWN9+NRYFXykyEQKPgQM6zHCBUy07vd2stvPJ
 6R5LAGJafeOVHnKLUIyjh+NwBA3nr4nEG25D1rqcNYcmjBp8R5NyOL0UTX7Vw14jdDrf
 K6Ag==
X-Gm-Message-State: AOAM533WSOmwnFcLvxVk0hnm0Zy/6vuz17epxaDM1UBPp6A42TV4V4Vy
 rUULPbim8mjO5Ko/ikVbCHA=
X-Google-Smtp-Source: ABdhPJxdnXtfCaLm7deqH68jdOTWybvP1JXVhxrDYylmu+UZKMA4ed15ZvKvrx4ZypFwcl41M4KrgA==
X-Received: by 2002:a2e:7616:: with SMTP id r22mr7983147ljc.391.1636466885772; 
 Tue, 09 Nov 2021 06:08:05 -0800 (PST)
Received: from [192.168.2.145] (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.googlemail.com with ESMTPSA id j15sm1330348lfu.75.2021.11.09.06.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 06:08:05 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Thomas Graichen
 <thomas.graichen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
Message-ID: <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
Date: Tue, 9 Nov 2021 17:08:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

09.11.2021 16:52, Dmitry Osipenko пишет:
> 09.11.2021 12:19, Daniel Vetter пишет:
>> On Mon, Nov 08, 2021 at 09:16:07PM +0300, Dmitry Osipenko wrote:
>>> 08.11.2021 18:17, Daniel Vetter пишет:
>>>> On Mon, Nov 08, 2021 at 02:08:21AM +0300, Dmitry Osipenko wrote:
>>>>> Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
>>>>> adapter separately from the character device. This fixes broken display
>>>>> panel driver of Acer Chromebook CB5-311 that fails to probe starting with
>>>>> v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
>>>>> is never probed now using the new registration order because tegra-output
>>>>> always fails with -EPROBE_DEFER due to missing display panel that requires
>>>>> DP AUX DDC to be registered first. The offending commit made DDC to be
>>>>> registered after SOR's output, which can't ever happen. Use new helpers
>>>>> to restore the registration order and revive display panel.
>>>>
>>>> This feels a bit backward, I think the clean solution would be to untangle
>>>> the SOR loading from the panel driver loading, and then only block
>>>> registering the overall drm_device on both drivers having loaded.
>>>
>>> Sounds impossible.
>>>
>>> 1. DRM device can be created only when all components are ready, panel
>>> is one of the components.
>>
>> Nope. drm_device can be instantiated whenever you feel like.
>> drm_dev_register can only be called when it's all fully set up. Absolutely
>> nothing would work if drm_device wouldn't support this two-stage setup.
>>
>> So sequence:
>>
>> 1. drm_dev_init
>>
>> 2. bind sor driver
>>
>> 3. create dp aux ddc
>>
>> 4. bind panel
>>
>> 5. yay we have everything, drm_dev_register
>>
>> This should work, and it's designed to work like this actually. You
>> couldn't write big complex drivers otherwise.
> 
> All Tegra SoCs have graphics bus named Host1x, that is where components
> comprising DRM driver are sitting on.
> 
> The Tegra driver model works like this:
> 
> 1. Once Host1x driver is loaded, it populates children sub-nodes of
> Host1x device-tree node, this creates Tegra DRM platform sub-devices.
> 
> 2. Tegra DRM driver module-init call registers main "Host1x DRM" driver
> and platform sub-drivers. Now Host1x bus knows what devices comprise
> Tegra DRM because Host1x driver descriptor contains that info.
> 
> 3. Tegra DRM platform sub-drivers are bound to the sub-devices.
> 
> 4. Once Host1x bus sees that all Tegra DRM sub-drivers are bound, it
> creates Host1x DRM device.
> 
> 5. The Host1x DRM device is bound to the Host1x DRM driver and
> host1x_drm_probe(host1x_dev) is invoked, which does the following:
> 
> 	drm_dev_alloc(driver, host1x_dev)
> 	host1x_device_init(host1x_dev)
> 	drm_dev_register(drm).
> 
> 6. The host1x_device_init() invokes second stage initialization of Tegra
> DRM sub-drivers, that is init() callback of host1x_client_ops registered
> by DRM platform sub-drivers during theirs probe.
> 
> The DP AUX DDC is currently created in step 6, while it should be
> created in step 3, otherwise SOR driver can't be bound.
> 
> It's possible to add early-init stage to the Host1x driver model where
> DRM device can be created before DRM platform sub-drivers are registered
> and probed. This is ad-hoc solution, but it should work okay in practice.
> 
> I can make v2 if you and Thierry are okay with that solution, see it below.
> 
> --- 8< ---
> 
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 1f96e416fa08..9e17a75a1383 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -530,9 +530,12 @@ static int tegra_dpaux_probe(struct platform_device
> *pdev)
>  	disable_irq(dpaux->irq);
> 
>  	dpaux->aux.transfer = tegra_dpaux_transfer;
> +	dpaux->aux.drm_dev = tegra_drm_device();
>  	dpaux->aux.dev = &pdev->dev;
> 
> -	drm_dp_aux_init(&dpaux->aux);
> +	err = drm_dp_aux_register(&dpaux->aux);
> +	if (err < 0)
> +		return err;
> 
>  	/*
>  	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
> @@ -585,6 +588,8 @@ static int tegra_dpaux_remove(struct platform_device
> *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> 
> +	drm_dp_aux_unregister(&dpaux->aux);
> +
>  	mutex_lock(&dpaux_lock);
>  	list_del(&dpaux->list);
>  	mutex_unlock(&dpaux_lock);
> @@ -717,11 +722,6 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux,
> struct tegra_output *output)
>  	unsigned long timeout;
>  	int err;
> 
> -	aux->drm_dev = output->connector.dev;
> -	err = drm_dp_aux_register(aux);
> -	if (err < 0)
> -		return err;
> -
>  	output->connector.polled = DRM_CONNECTOR_POLL_HPD;
>  	dpaux->output = output;
> 
> @@ -759,7 +759,6 @@ int drm_dp_aux_detach(struct drm_dp_aux *aux)
>  	unsigned long timeout;
>  	int err;
> 
> -	drm_dp_aux_unregister(aux);
>  	disable_irq(dpaux->irq);
> 
>  	if (dpaux->output->panel) {
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index b2ebba802107..d95f9dea6b86 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1124,21 +1124,42 @@ static bool host1x_drm_wants_iommu(struct
> host1x_device *dev)
>  	return domain != NULL;
>  }
> 
> -static int host1x_drm_probe(struct host1x_device *dev)
> +static struct drm_device *terga_drm_dev;
> +
> +struct drm_device *tegra_drm_device(void)
>  {
> -	struct tegra_drm *tegra;
> -	struct drm_device *drm;
> -	int err;
> +	return terga_drm_dev;
> +}
> 
> -	drm = drm_dev_alloc(&tegra_drm_driver, &dev->dev);
> +static int host1x_drm_dev_init(struct host1x_device *dev)
> +{
> +	struct drm_device *drm = drm_dev_alloc(&tegra_drm_driver, &dev->dev);
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
> 
> +	dev_set_drvdata(&dev->dev, drm);
> +	terga_drm_dev = drm;

Although, platform_register_drivers() should be moved here out from
host1x_drm_init(), otherwise DRM drivers may get probed before main
host1x driver is registered and then terga_drm_dev will be NULL. But you
should get the idea anyways.

> +	return 0;
> +}
> +
> +static void host1x_drm_dev_deinit(struct host1x_device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(&dev->dev);

And platform_unregister_drivers() should be moved here.

> +	terga_drm_dev = NULL;
> +	drm_dev_put(drm);
> +}
> +
> +static int host1x_drm_probe(struct host1x_device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(&dev->dev);
> +	struct tegra_drm *tegra;
> +	int err;
> +
>  	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
> -	if (!tegra) {
> -		err = -ENOMEM;
> -		goto put;
> -	}
> +	if (!tegra)
> +		return -ENOMEM;
> 
>  	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
>  		tegra->domain = iommu_domain_alloc(&platform_bus_type);
> @@ -1155,7 +1176,6 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  	mutex_init(&tegra->clients_lock);
>  	INIT_LIST_HEAD(&tegra->clients);
> 
> -	dev_set_drvdata(&dev->dev, drm);
>  	drm->dev_private = tegra;
>  	tegra->drm = drm;
> 
> @@ -1276,8 +1296,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  		iommu_domain_free(tegra->domain);
>  free:
>  	kfree(tegra);
> -put:
> -	drm_dev_put(drm);
> +
>  	return err;
>  }
> 
> @@ -1310,7 +1329,6 @@ static int host1x_drm_remove(struct host1x_device
> *dev)
>  	}
> 
>  	kfree(tegra);
> -	drm_dev_put(drm);
> 
>  	return 0;
>  }
> @@ -1382,6 +1400,8 @@ static struct host1x_driver host1x_drm_driver = {
>  	.probe = host1x_drm_probe,
>  	.remove = host1x_drm_remove,
>  	.subdevs = host1x_drm_subdevs,
> +	.init = host1x_drm_dev_init,
> +	.deinit = host1x_drm_dev_deinit,
>  };
> 
>  static struct platform_driver * const drivers[] = {
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index fc0a19554eac..4bfe79b5c7ce 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -64,6 +64,8 @@ struct tegra_drm {
>  	struct tegra_display_hub *hub;
>  };
> 
> +struct drm_device *tegra_drm_device(void);
> +
>  static inline struct host1x *tegra_drm_to_host1x(struct tegra_drm *tegra)
>  {
>  	return dev_get_drvdata(tegra->drm->dev->parent);
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 0d81eede1217..25d688e5c742 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -479,8 +479,18 @@ static int host1x_device_add(struct host1x *host1x,
>  	device->dev.dma_parms = &device->dma_parms;
>  	dma_set_max_seg_size(&device->dev, UINT_MAX);
> 
> +	if (driver->init) {
> +		err = driver->init(device);
> +		if (err < 0) {
> +			kfree(device);
> +			return err;
> +		}
> +	}
> +
>  	err = host1x_device_parse_dt(device, driver);
>  	if (err < 0) {
> +		if (driver->deinit)
> +			driver->deinit(device);
>  		kfree(device);
>  		return err;
>  	}
> @@ -512,11 +522,16 @@ static int host1x_device_add(struct host1x *host1x,
>  static void host1x_device_del(struct host1x *host1x,
>  			      struct host1x_device *device)
>  {
> +	struct host1x_driver *driver = device->driver;
> +
>  	if (device->registered) {
>  		device->registered = false;
>  		device_del(&device->dev);
>  	}
> 
> +	if (driver->deinit)
> +		driver->deinit(device);
> +
>  	put_device(&device->dev);
>  }
> 
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index e8dc5bc41f79..5e5ba33af4ae 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -346,6 +346,8 @@ struct host1x_device;
>   * @driver: core driver
>   * @subdevs: table of OF device IDs matching subdevices for this driver
>   * @list: list node for the driver
> + * @init: called when the host1x logical driver is registered
> + * @deinit: called when the host1x logical driver is unregistered
>   * @probe: called when the host1x logical device is probed
>   * @remove: called when the host1x logical device is removed
>   * @shutdown: called when the host1x logical device is shut down
> @@ -356,6 +358,8 @@ struct host1x_driver {
>  	const struct of_device_id *subdevs;
>  	struct list_head list;
> 
> +	int (*init)(struct host1x_device *device);
> +	void (*deinit)(struct host1x_device *device);
>  	int (*probe)(struct host1x_device *device);
>  	int (*remove)(struct host1x_device *device);
>  	void (*shutdown)(struct host1x_device *device);
> 

