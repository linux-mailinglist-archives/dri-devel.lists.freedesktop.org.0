Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B411131CCCE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 16:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35FE6E42F;
	Tue, 16 Feb 2021 15:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 16 Feb 2021 15:21:13 UTC
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533306E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 15:21:13 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602be1bb0000>; Tue, 16 Feb 2021 07:16:11 -0800
Received: from [10.21.180.91] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Feb
 2021 15:16:08 +0000
Subject: Re: [PATCH 3/3] drm/tegra: Add NVDEC driver
To: Mikko Perttunen <mperttunen@nvidia.com>, <thierry.reding@gmail.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <20210213101512.3275069-4-mperttunen@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ae6c0ee3-244b-896f-63c6-7c8a88e56f07@nvidia.com>
Date: Tue, 16 Feb 2021 15:16:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210213101512.3275069-4-mperttunen@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613488571; bh=Bvyw6WYHS0mbF0ur9xBy954MChniTTgGJ4L0kjaX+u8=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=lk3EOjYXOLK0NepzoWjxeuF/wR5m7nIqsxWx3AQqCRoEkZQDSISxI6QvyKFJCPYjI
 rAD/ZnzRVXuRz4SOn4xG8FqfT6j0uMH6+M9fp0cRpVCPpmUg8mISk9Z9cEic/RsFd/
 kkGT7wevChVcD6Hqf2QpfigXny05X5lX+A/RrlRnAl/NsuhXpYGUthA24Z9W0GTlEg
 nWKmlciN96kHnsfT9AfsvqZ7lYu/HZ2mG9zZWqBpPUpmSNZxA3qPu5mXvecCqi1OeY
 vh5vDIXPBKpN94HwT3uq7PMQ6ky3nk0M+wTS3/I48PJAvAGMpWNI3uwAp+CJSsRhX3
 TNUb+taWWqtYQ==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/02/2021 10:15, Mikko Perttunen wrote:
> Add support for booting and using NVDEC on Tegra210, Tegra186
> and Tegra194 to the Host1x and TegraDRM drivers. Booting in
> secure mode is not currently supported.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Makefile |   3 +-
>  drivers/gpu/drm/tegra/drm.c    |   4 +
>  drivers/gpu/drm/tegra/drm.h    |   1 +
>  drivers/gpu/drm/tegra/nvdec.c  | 497 +++++++++++++++++++++++++++++++++
>  drivers/gpu/host1x/dev.c       |  12 +
>  include/linux/host1x.h         |   1 +
>  6 files changed, 517 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tegra/nvdec.c

...

> +static int nvdec_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct host1x_syncpt **syncpts;
> +	struct resource *regs;
> +	struct nvdec *nvdec;
> +	int err;
> +
> +	/* inherit DMA mask from host1x parent */
> +	err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
> +		return err;
> +	}
> +
> +	nvdec = devm_kzalloc(dev, sizeof(*nvdec), GFP_KERNEL);
> +	if (!nvdec)
> +		return -ENOMEM;
> +
> +	nvdec->config = of_device_get_match_data(dev);
> +
> +	syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
> +	if (!syncpts)
> +		return -ENOMEM;
> +
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!regs) {
> +		dev_err(&pdev->dev, "failed to get registers\n");
> +		return -ENXIO;
> +	}
> +
> +	nvdec->regs = devm_ioremap_resource(dev, regs);
> +	if (IS_ERR(nvdec->regs))
> +		return PTR_ERR(nvdec->regs);
> +

We should be able to use devm_platform_get_and_ioremap_resource() here.

> +	nvdec->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(nvdec->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(nvdec->clk);
> +	}
> +
> +	if (!dev->pm_domain) {

Looks like the power-domain is required by device-tree and so do we need
this?

> +		nvdec->rst = devm_reset_control_get(dev, "nvdec");
> +		if (IS_ERR(nvdec->rst)) {
> +			dev_err(&pdev->dev, "failed to get reset\n");
> +			return PTR_ERR(nvdec->rst);
> +		}
> +	}
> +
> +	nvdec->falcon.dev = dev;
> +	nvdec->falcon.regs = nvdec->regs;
> +
> +	err = falcon_init(&nvdec->falcon);
> +	if (err < 0)
> +		return err;
> +
> +	platform_set_drvdata(pdev, nvdec);
> +
> +	INIT_LIST_HEAD(&nvdec->client.base.list);
> +	nvdec->client.base.ops = &nvdec_client_ops;
> +	nvdec->client.base.dev = dev;
> +	nvdec->client.base.class = HOST1X_CLASS_NVDEC;
> +	nvdec->client.base.syncpts = syncpts;
> +	nvdec->client.base.num_syncpts = 1;
> +	nvdec->dev = dev;
> +
> +	INIT_LIST_HEAD(&nvdec->client.list);
> +	nvdec->client.version = nvdec->config->version;
> +	nvdec->client.ops = &nvdec_ops;
> +
> +	err = host1x_client_register(&nvdec->client.base);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register host1x client: %d\n", err);
> +		goto exit_falcon;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +	if (!pm_runtime_enabled(&pdev->dev)) {
> +		err = nvdec_runtime_resume(&pdev->dev);
> +		if (err < 0)
> +			goto unregister_client;
> +	}

pm_runtime should always be enabled for 64-bit Tegra and so we should
not need to check pm_runtime_enabled().

Cheers
Jon

-- 
nvpublic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
