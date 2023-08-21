Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5478278F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2E410E226;
	Mon, 21 Aug 2023 11:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6544B10E09A;
 Mon, 21 Aug 2023 11:06:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59D942F4;
 Mon, 21 Aug 2023 04:07:33 -0700 (PDT)
Received: from [10.57.3.137] (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F91B3F762;
 Mon, 21 Aug 2023 04:06:44 -0700 (PDT)
Message-ID: <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
Date: Mon, 21 Aug 2023 12:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
 David Airlie <airlied@gmail.com>, alsa-devel@alsa-project.org,
 Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Sinan Kaya <okaya@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Sean Paul <sean@poorly.run>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <jroedel@suse.de>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-18 22:32, Jason Gunthorpe wrote:
> It turns out several drivers are calling of_dma_configure() outside the
> expected bus_type.dma_configure op. This ends up being mis-locked and
> triggers a lockdep assertion, or instance:
> 
>    iommu_probe_device_locked+0xd4/0xe4
>    of_iommu_configure+0x10c/0x200
>    of_dma_configure_id+0x104/0x3b8
>    a6xx_gmu_init+0x4c/0xccc [msm]
>    a6xx_gpu_init+0x3ac/0x770 [msm]
>    adreno_bind+0x174/0x2ac [msm]
>    component_bind_all+0x118/0x24c
>    msm_drm_bind+0x1e8/0x6c4 [msm]
>    try_to_bring_up_aggregate_device+0x168/0x1d4
>    __component_add+0xa8/0x170
>    component_add+0x14/0x20
>    dsi_dev_attach+0x20/0x2c [msm]
>    dsi_host_attach+0x9c/0x144 [msm]
>    devm_mipi_dsi_attach+0x34/0xb4
>    lt9611uxc_attach_dsi.isra.0+0x84/0xfc [lontium_lt9611uxc]
>    lt9611uxc_probe+0x5c8/0x68c [lontium_lt9611uxc]
>    i2c_device_probe+0x14c/0x290
>    really_probe+0x148/0x2b4
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0x3c/0x160
>    __device_attach_driver+0xb8/0x138
>    bus_for_each_drv+0x84/0xe0
>    __device_attach+0xa8/0x1b0
>    device_initial_probe+0x14/0x20
>    bus_probe_device+0xb0/0xb4
>    deferred_probe_work_func+0x8c/0xc8
>    process_one_work+0x1ec/0x53c
>    worker_thread+0x298/0x408
>    kthread+0x124/0x128
>    ret_from_fork+0x10/0x20
> 
> It is subtle and was never documented or enforced, but there has always
> been an assumption that of_dma_configure_id() is not concurrent. It makes
> several calls into the iommu layer that require this, including
> dev_iommu_get(). The majority of cases have been preventing concurrency
> using the device_lock().
> 
> Thus the new lock debugging added exposes an existing problem in
> drivers. On inspection this looks like a theoretical locking problem as
> generally the cases are already assuming they are the exclusive (single
> threaded) user of the target device.

Sorry to be blunt, but the only problem is that you've introduced an 
idealistic new locking scheme which failed to take into account how 
things currently actually work, and is broken and achieving nothing but 
causing problems.

The solution is to drop those locking patches entirely and rethink the 
whole thing. When their sole purpose was to improve the locking and make 
it easier to reason about, and now the latest "fix" is now to remove one 
of the assertions which forms the fundamental basis for that reasoning, 
then the point has clearly been lost. All we've done is churned a dodgy 
and incomplete locking scheme into a *different* dodgy and incomplete 
locking scheme. I do not think that continuing to dig in deeper is the 
way out of the hole...

It's now rc7, and I have little confidence that aren't still more latent 
problems which just haven't been hit yet (e.g. acpi_dma_configure() is 
also called in different contexts relative to the device lock, which is 
absolutely by design and not broken).

And on the subject of idealism, the fact is that doing IOMMU 
configuration based on driver probe via bus->dma_configure is 
*fundamentally wrong* and breaking a bunch of other IOMMU API 
assumptions, so it is not a robust foundation to build anything upon in 
the first place. The problem it causes with broken groups has been known 
about for several years now, however it's needed a lot of work to get to 
the point of being able to fix it properly (FWIW that is now #2 on my 
priority list after getting the bus ops stuff done, which should also 
make it easier).

Thanks,
Robin.

> Sadly, there are deeper technical problems with all of the places doing
> this. There are several problemetic patterns:
> 
> 1) Probe a driver on device A and then steal device B and use it as part
>     of the driver operation.
> 
>     Since no driver was probed to device B it means we never called
>     bus_type.dma_configure and thus the drivers hackily try to open code
>     this.
> 
>     Unfortunately nothing prevents another driver from binding to device B
>     and creating total chaos. eg vfio bind triggered by userspace
> 
> 2) Probe a driver on device A and then create a new platform driver B for a
>     fwnode that doesn't have one, then do #1
> 
>     This has the same essential problem as #1, the new device is never
>     probed so the hack call to of_dma_configure() is needed to setup DMA,
>     and we are at risk of something else trying to use the device.
> 
> 3) Probe a driver on device A but the of_node was incorrect for DMA so fix
>     it by figuring out the right node and calling of_dma_configure()
> 
>     This will blow up in the iommu code if the driver is unprobed because
>     the bus_type now assumes that dma_configure and dma_cleanup are
>     strictly paired. Since dma_configure will have done the wrong thing due
>     to the missing of_node, dma_cleanup will be unpaired and
>     iommu_device_unuse_default_domain() will blow up.
> 
>     Further the driver operating on device A will not be protected against
>     changes to the iommu domain since it never called
>     iommu_device_use_default_domain()
> 
>     At least this case will not throw a lockdep warning as probe
>     is done under the device_lock already.
> 
> While it is tempting to just add a device_lock() around the few missing
> places, this doesn't solve the above underlying problems with those
> callers.
> 
> For this reason remove the locking assertion in the iommu code so that
> theses driver problems continue to remain hidden.
> 
> Add a comment to all the problematic call sites to encourage fixing and
> discourage future cut & paste expanding the problem.
> 
> Add documentation to of_dma_configure_id() explaining the locking.
> 
> Fixes: b19ca5922dff ("iommu: Do not attempt to re-lock the iommu device when probing")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/d090f196-a5c2-b188-31bf-e42553d8d251@samsung.com/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/bcma/main.c                              |  4 ++++
>   drivers/dma/qcom/hidma_mgmt.c                    |  4 ++++
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c            |  4 ++++
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c            |  8 ++++++++
>   drivers/gpu/drm/sun4i/sun4i_backend.c            |  4 ++++
>   drivers/gpu/drm/sun4i/sun8i_mixer.c              |  4 ++++
>   drivers/gpu/drm/vc4/vc4_drv.c                    |  4 ++++
>   drivers/gpu/host1x/bus.c                         |  4 ++++
>   drivers/iommu/iommu.c                            | 12 ++++++++----
>   drivers/media/platform/qcom/venus/firmware.c     |  4 ++++
>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c |  4 ++++
>   drivers/net/wireless/ath/ath10k/snoc.c           |  4 ++++
>   drivers/net/wireless/ath/ath11k/ahb.c            |  4 ++++
>   drivers/of/device.c                              |  3 +++
>   sound/soc/bcm/bcm63xx-pcm-whistler.c             |  4 ++++
>   15 files changed, 67 insertions(+), 4 deletions(-)
> 
> This is my suggestion to the issue, I don't like removing the locking
> assertion but if we can't have debug kernels reporting existing bugs then this
> would be the next best option.
> 
> I've CC'd all the driver owners, if people have better explanations for what
> their drivers are doing please share :)
> 
> diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
> index 7061d3ee836a15..4df97000d7e0a7 100644
> --- a/drivers/bcma/main.c
> +++ b/drivers/bcma/main.c
> @@ -208,6 +208,10 @@ static void bcma_of_fill_device(struct device *parent,
>   
>   	core->irq = bcma_of_get_irq(parent, core, 0);
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	of_dma_configure(&core->dev, node, false);
>   }
>   
> diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> index 05e96b31d87169..2efd97747d37b3 100644
> --- a/drivers/dma/qcom/hidma_mgmt.c
> +++ b/drivers/dma/qcom/hidma_mgmt.c
> @@ -390,6 +390,10 @@ static int __init hidma_mgmt_of_populate_channels(struct device_node *np)
>   			goto out;
>   		}
>   		new_pdev->dev.of_node = child;
> +		/*
> +		 * FIXME: of_dma_configure() should not be called outside
> +		 * bus_type.dma_configure
> +		 */
>   		of_dma_configure(&new_pdev->dev, child, true);
>   		/*
>   		 * It is assumed that calling of_msi_configure is safe on
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 31a7f59ccb49ee..22729c66e39a65 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -635,6 +635,10 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>   	 * device as the GPU we found. This assumes that all Vivante
>   	 * GPUs in the system share the same DMA constraints.
>   	 */
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	if (first_node)
>   		of_dma_configure(&pdev->dev, first_node, true);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 5deb79924897af..509bd8b7ec12ae 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1492,6 +1492,10 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   
>   	gmu->dev = &pdev->dev;
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	of_dma_configure(gmu->dev, node, true);
>   
>   	pm_runtime_enable(gmu->dev);
> @@ -1556,6 +1560,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   
>   	gmu->dev = &pdev->dev;
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	of_dma_configure(gmu->dev, node, true);
>   
>   	/* Fow now, don't do anything fancy until we get our feet under us */
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index b11dbd50d73e98..30cbefb6799e51 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -800,6 +800,10 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
>   		 * for us, and DRM doesn't do per-device allocation either, so
>   		 * we would need to fix DRM first...
>   		 */
> +		/*
> +		 * FIXME: of_dma_configure() should not be called outside
> +		 * bus_type.dma_configure
> +		 */
>   		ret = of_dma_configure(drm->dev, dev->of_node, true);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 11d5244a5aa5fc..e26bea207599d3 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -399,6 +399,10 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>   		 * DRM doesn't do per-device allocation either, so we
>   		 * would need to fix DRM first...
>   		 */
> +		/*
> +		 * FIXME: of_dma_configure() should not be called outside
> +		 * bus_type.dma_configure
> +		 */
>   		ret = of_dma_configure(drm->dev, dev->of_node, true);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 823395c23cc308..82496d8fb50f84 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -305,6 +305,10 @@ static int vc4_drm_bind(struct device *dev)
>   	node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
>   					       NULL);
>   	if (node) {
> +		/*
> +		 * FIXME: of_dma_configure() should not be called outside
> +		 * bus_type.dma_configure
> +		 */
>   		ret = of_dma_configure(dev, node, true);
>   		of_node_put(node);
>   
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 4d16a3396c4abf..5c7ef738a7d7d7 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -475,6 +475,10 @@ static int host1x_device_add(struct host1x *host1x,
>   	device->dev.bus = &host1x_bus_type;
>   	device->dev.parent = host1x->dev;
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	of_dma_configure(&device->dev, host1x->dev->of_node, true);
>   
>   	device->dev.dma_parms = &device->dma_parms;
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 18162049bd2294..eb623a611f571d 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -458,8 +458,15 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
>   	 * Allow __iommu_probe_device() to be safely called in parallel,
>   	 * both dev->iommu_group and the initial setup of dev->iommu are
>   	 * protected this way.
> +	 *
> +	 * We cannot have the assertion yet because of a number of drivers
> +	 * improperly calling of_dma_configure() and expecting to attach
> +	 * the iommu outside the bus_type.dma_configure callback. This messes
> +	 * up our ownership tracking, does not exclude other drivers from
> +	 * binding an operating the device, and is technically mislocked.
> +	 *
> +	 * device_lock_assert(dev);
>   	 */
> -	device_lock_assert(dev);
>   
>   	if (!ops)
>   		return -ENODEV;
> @@ -527,8 +534,6 @@ int iommu_probe_device_locked(struct device *dev)
>   	const struct iommu_ops *ops;
>   	int ret;
>   
> -	device_lock_assert(dev);
> -
>   	ret = __iommu_probe_device(dev, NULL);
>   	if (ret)
>   		return ret;
> @@ -1202,7 +1207,6 @@ void iommu_group_remove_device(struct device *dev)
>   		__iommu_group_remove_device(dev);
>   	}
>   	device_unlock(dev);
> -
>   }
>   EXPORT_SYMBOL_GPL(iommu_group_remove_device);
>   
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index cfb11c551167ce..f70360c5534d64 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -296,6 +296,10 @@ int venus_firmware_init(struct venus_core *core)
>   
>   	pdev->dev.of_node = np;
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	ret = of_dma_configure(&pdev->dev, np, true);
>   	if (ret) {
>   		dev_err(core->dev, "dma configure fail\n");
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> index e30e54935d79a9..40fa7b62545d7a 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> @@ -1114,6 +1114,10 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
>   	 * to be treated as valid DMA masters we need a bit of a hack to force
>   	 * them to inherit the MFC node's DMA configuration.
>   	 */
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	of_dma_configure(child, dev->of_node, true);
>   
>   	if (device_add(child) == 0) {
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 26214c00cd0d7b..977e5c6186b131 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1614,6 +1614,10 @@ static int ath10k_fw_init(struct ath10k *ar)
>   
>   	pdev->dev.of_node = node;
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	ret = of_dma_configure(&pdev->dev, node, true);
>   	if (ret) {
>   		ath10k_err(ar, "dma configure fail: %d\n", ret);
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 139da578831a44..a4d2a89ab96de0 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1012,6 +1012,10 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>   		return PTR_ERR(pdev);
>   	}
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	ret = of_dma_configure(&pdev->dev, node, true);
>   	if (ret) {
>   		ath11k_err(ab, "dma configure fail: %d\n", ret);
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 0f00f1b8070829..bc6f62ebcbd040 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -108,6 +108,9 @@ of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
>    * If platform code needs to use its own special DMA configuration, it
>    * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE events
>    * to fix up DMA configuration.
> + *
> + * This function should only be called from the bus_type.dma_configure callback
> + * and the driver_lock(dev) must be held.
>    */
>   int of_dma_configure_id(struct device *dev, struct device_node *np,
>   			bool force_dma, const u32 *id)
> diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
> index 2c600b017524f3..d8e0520ca61155 100644
> --- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
> +++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
> @@ -354,6 +354,10 @@ static int bcm63xx_soc_pcm_new(struct snd_soc_component *component,
>   
>   	i2s_priv = dev_get_drvdata(asoc_rtd_to_cpu(rtd, 0)->dev);
>   
> +	/*
> +	 * FIXME: of_dma_configure() should not be called outside
> +	 * bus_type.dma_configure
> +	 */
>   	of_dma_configure(pcm->card->dev, pcm->card->dev->of_node, 1);
>   
>   	ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(32));
> 
> base-commit: 1bba4f1c0b4f2429e16da231a246ab4b99cc633c
