Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF5A31361
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 18:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337AF10E738;
	Tue, 11 Feb 2025 17:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QLN8EdgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B7910E738
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 17:45:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4395561ab71so9382375e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739295937; x=1739900737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OVukLjmjU7JWbNgNRIVE9jMDHO3O38O0IgGphOEr4s4=;
 b=QLN8EdgNn8sxH8B7eCpuijH6ZmVI0LfOGp5iqZN3enhe9yya+he+H4bMHujQzUEViX
 QqA/CXL1W0fMWeUTqQoYQjXEtS5Th9WWtSJhWDTigeHWVidNN9UkM/IFDE0GdBfAI+OX
 1OVB4luqndie3PIsZOHTtVFVdw9A2AQJaifNoGybqZ19QI/0QvhhsiaJbgKc/W5i9ktI
 orHIcjZVAKAnZaVvrxbG5Gkyyd80A+ErRV/Rykx8w7+u7eYmrbljynm4fwK7GKH+8/Ru
 hKyu6Y/I+nqD1KuAegAXnjvJM4XN7ouFAbbAe0bnH5KMOTcyYLwRROt3kH2TUs6ls2hV
 wGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739295937; x=1739900737;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OVukLjmjU7JWbNgNRIVE9jMDHO3O38O0IgGphOEr4s4=;
 b=s45Ge+DcuoDHI4+FpGkRTRXT7QVk1fXKy1QeaILbhRy5zr3AtIMmNx6VtyUMS4aBDb
 opphD963dNsZdnSpb7koIeqf69gvc81RypbyZNIJEB7UWCiZbRVTbWNZAJKxOSdi5LQx
 GGgkFoUNa0wPReamgMkGFn1XcaE/bHOifTsa3TMTEGEuNyGEDssixpz0HgTmjUBo2yzJ
 saNMl783jQNKPgzQKkrBLIeVvI1d9eDvLGAUlZBUgKgnqU3KQ8eXkVyRLp1l+cR1v6XW
 lBZMuROROBOrz56klZwrk9tpLuVoaVWxhn9GcJS7P1+bxMCcSaTjaAkHVXtpX+O8lbeA
 bUkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvd/1Ccij0zAMGa9zRdkHv7ol1+/qJqPCmkdfSywNRTzdD0UAf4rX6N0UdRgWK1UKWyKT5wkycF20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGbJwGNrWtQYcY8UGRgXmMsuBP+bpu0/kOE3Y7b5/VSRKvMYI5
 DRYWfzrFoLVuHg7tLKsGnVrpB3qzPbHkJmLWHDdomidXr3uCgPUP
X-Gm-Gg: ASbGnctk8r04+HKD3hTbSj1k14G2ERtPUk5VvddXDiy4LJjTkpLOqIoKsXVFd7MSkT7
 5V8ZrdLaZU93z9TQfpU3D9bUJx6UAOGL6p7p8VrmcexNvPq/GVbG0ETTA8qY3XiXPVCaDwsn15E
 /NgeG4sAz53YzIcrj1VA/u/G8O5t3iHY6xlOgV5D2xVpWqVKUed2+3RE5jqE8F6qW05VwLuKfxN
 cHuSR3aLc372wvzHpbs9qrT6n1PRxM5HapHOJ38MBefG5AcIjMlYGMGKHGNVnGx3bI/8dnRXo6b
 rXv5suXtnmZsGav0xyqaD1kO9udvhGyS8VjJsLCeGHFQKstj3XsB0aEUZR+7dUs=
X-Google-Smtp-Source: AGHT+IHevhnQA52ksSDKCk/5HBFf2WQR6jKC1x+TgyxG0JLSuHfuqUjzxDwjKzCxF5CuvX9dIZjkUA==
X-Received: by 2002:a05:600c:c0c:b0:430:57e8:3c7e with SMTP id
 5b1f17b1804b1-439581caafbmr1240075e9.28.1739295936426; 
 Tue, 11 Feb 2025 09:45:36 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db11750sm222041925e9.40.2025.02.11.09.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 09:45:36 -0800 (PST)
Message-ID: <c11a234e-de9e-465e-bd09-bfa516dba6dd@gmail.com>
Date: Tue, 11 Feb 2025 18:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/sti: move to devm_platform_ioremap_resource()
 usage
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner
 <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 05/02/2025 à 21:08, Anusha Srivatsa a écrit :
> Replace platform_get_resource/_byname + devm_ioremap
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> 
> @rule@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap = devm_ioremap(...);
> +ioremap = devm_platform_ioremap_resource_byname(pdev,name);
> 
> and
> @rule_2@
> identifier res;
> expression ioremap;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap = devm_ioremap(...);
> +ioremap = devm_platform_ioremap_resource(pdev,0);
> 
> v2: Fix compilation error.

Hi Anusha,

Just a nit: changelog should be after the ‘---’ separator. :-)

Other than this, it is
Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Regards,
Raphaël
> 
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>   drivers/gpu/drm/sti/sti_compositor.c | 10 +---------
>   drivers/gpu/drm/sti/sti_dvo.c        | 10 +---------
>   drivers/gpu/drm/sti/sti_hda.c        |  9 +--------
>   drivers/gpu/drm/sti/sti_hdmi.c       | 11 +----------
>   drivers/gpu/drm/sti/sti_hqvdp.c      | 10 +---------
>   drivers/gpu/drm/sti/sti_tvout.c      | 10 +---------
>   drivers/gpu/drm/sti/sti_vtg.c        | 10 +---------
>   7 files changed, 7 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
> index 063f82d23d80c4ba83624a0066a18416a2b37351..7aefce6706ba2cd7d97a33228c9b9812edecf06f 100644
> --- a/drivers/gpu/drm/sti/sti_compositor.c
> +++ b/drivers/gpu/drm/sti/sti_compositor.c
> @@ -177,7 +177,6 @@ static int sti_compositor_probe(struct platform_device *pdev)
>   	struct device_node *np = dev->of_node;
>   	struct device_node *vtg_np;
>   	struct sti_compositor *compo;
> -	struct resource *res;
>   	unsigned int i;
>   
>   	compo = devm_kzalloc(dev, sizeof(*compo), GFP_KERNEL);
> @@ -194,14 +193,7 @@ static int sti_compositor_probe(struct platform_device *pdev)
>   
>   	memcpy(&compo->data, of_match_node(compositor_of_match, np)->data,
>   	       sizeof(struct sti_compositor_data));
> -
> -	/* Get Memory ressources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res == NULL) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENXIO;
> -	}
> -	compo->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	compo->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (compo->regs == NULL) {
>   		DRM_ERROR("Register mapping failed\n");
>   		return -ENXIO;
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index c6c2abaa1891cd3ea025805b50d275ec314512c3..660588f01f90950a9b2c180ab230188c19901f26 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct sti_dvo *dvo;
> -	struct resource *res;
>   	struct device_node *np = dev->of_node;
>   
>   	DRM_INFO("%s\n", __func__);
> @@ -523,14 +522,7 @@ static int sti_dvo_probe(struct platform_device *pdev)
>   	}
>   
>   	dvo->dev = pdev->dev;
> -
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvo-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid dvo resource\n");
> -		return -ENOMEM;
> -	}
> -	dvo->regs = devm_ioremap(dev, res->start,
> -			resource_size(res));
> +	dvo->regs = devm_platform_ioremap_resource_byname(pdev, "dvo-reg");
>   	if (!dvo->regs)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index b12863bea95559c4f874eb94cea8938609d435d4..0b5dbaf4d5305989846e25a1cab6f82d191aa9a5 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -750,14 +750,7 @@ static int sti_hda_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	hda->dev = pdev->dev;
> -
> -	/* Get resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hda-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid hda resource\n");
> -		return -ENOMEM;
> -	}
> -	hda->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");
>   	if (!hda->regs)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index ca2fe17de4a5d1e0199e59a97e6c7601e139ed9e..666143c48b0d0f2c20cd26323ddbc8e69d966622 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct sti_hdmi *hdmi;
>   	struct device_node *np = dev->of_node;
> -	struct resource *res;
>   	struct device_node *ddc;
>   	int ret;
>   
> @@ -1399,15 +1398,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>   	}
>   
>   	hdmi->dev = pdev->dev;
> -
> -	/* Get resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid hdmi resource\n");
> -		ret = -ENOMEM;
> -		goto release_adapter;
> -	}
> -	hdmi->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hdmi->regs = devm_platform_ioremap_resource_byname(pdev, "hdmi-reg");
>   	if (!hdmi->regs) {
>   		ret = -ENOMEM;
>   		goto release_adapter;
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
> index 0f658709c9d0d398c4eed65202443db9d0b41f8c..420395598d119a403d531211022e6005d6a2bd59 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct device_node *vtg_np;
>   	struct sti_hqvdp *hqvdp;
> -	struct resource *res;
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> @@ -1367,14 +1366,7 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
>   	}
>   
>   	hqvdp->dev = dev;
> -
> -	/* Get Memory resources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENXIO;
> -	}
> -	hqvdp->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hqvdp->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (!hqvdp->regs) {
>   		DRM_ERROR("Register mapping failed\n");
>   		return -ENXIO;
> diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
> index af6c06f448c4819def8cc0d0836e30f991529690..0bebe815f5e7567f84388af93723a6fa7d2cc7a2 100644
> --- a/drivers/gpu/drm/sti/sti_tvout.c
> +++ b/drivers/gpu/drm/sti/sti_tvout.c
> @@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct device_node *node = dev->of_node;
>   	struct sti_tvout *tvout;
> -	struct resource *res;
>   
>   	DRM_INFO("%s\n", __func__);
>   
> @@ -850,14 +849,7 @@ static int sti_tvout_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	tvout->dev = dev;
> -
> -	/* get memory resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tvout-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid glue resource\n");
> -		return -ENOMEM;
> -	}
> -	tvout->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	tvout->regs = devm_platform_ioremap_resource_byname(pdev, "tvout-reg");
>   	if (!tvout->regs)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
> index 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..b5353fe774d72fd629ecd3ef75a5d2817ca8617f 100644
> --- a/drivers/gpu/drm/sti/sti_vtg.c
> +++ b/drivers/gpu/drm/sti/sti_vtg.c
> @@ -380,20 +380,12 @@ static int vtg_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct sti_vtg *vtg;
> -	struct resource *res;
>   	int ret;
>   
>   	vtg = devm_kzalloc(dev, sizeof(*vtg), GFP_KERNEL);
>   	if (!vtg)
>   		return -ENOMEM;
> -
> -	/* Get Memory ressources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENOMEM;
> -	}
> -	vtg->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	vtg->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (!vtg->regs) {
>   		DRM_ERROR("failed to remap I/O memory\n");
>   		return -ENOMEM;
> 

