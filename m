Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CA6A219B1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D98610E76F;
	Wed, 29 Jan 2025 09:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="WUzvCQIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E395910E76F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:10:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T709WK011701;
 Wed, 29 Jan 2025 10:09:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 d4lRw4reOPK0UHd/+3dPBUfWN8KUvnRJkMtwOHUFaOs=; b=WUzvCQIiT74G+1dw
 E0nAKIWNYvi6PU91/i8SIS6YYNz5nIhH6LYs79prM2JxDH2c2Yinxt2VyVqpwjK6
 MgNXRmVHjBIbXS7hABaYnkOk7YHSMjEsz3B9L3N4/EEn/DPda2NgG+QtV0a+riKM
 j91GZ1QKMUfSz6k4nqRF/zV2lPCBf7SRRpyN+klZTsD+TJDDKMaS9bM2uoYqqTUO
 bNj3ktcHuPjMlryHx3xEJxWhomkosq+ww3WiPIeH8dirdo/0JJZfqBMRsEB+w+rH
 yq7iIhaV4Mc/IuL9fRIh+IfU/DByVhE4zLUjUCdVoRkeQNA06lCUDaV7+jIaBHdC
 hYmTTA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f5gva2mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 10:09:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CF703400D6;
 Wed, 29 Jan 2025 10:05:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB96526AD6E;
 Wed, 29 Jan 2025 10:01:55 +0100 (CET)
Received: from [10.129.178.211] (10.129.178.211) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 29 Jan
 2025 10:01:54 +0100
Message-ID: <83c922b8-9cf0-4c4f-9a10-ee7c26bd85c4@foss.st.com>
Date: Wed, 29 Jan 2025 10:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] drm/sti: move to devm_platform_ioremap_resource()
 usage
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, Alison Wang
 <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao
 <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>
CC: <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-tegra@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-9-0d1609a29587@redhat.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250128-cocci-memory-api-v1-9-0d1609a29587@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.211]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
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


On 1/28/25 23:29, Anusha Srivatsa wrote:
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
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>


Hi Anusha,


Thanks again for your work,

> ---
>  drivers/gpu/drm/sti/sti_compositor.c | 10 +---------
>  drivers/gpu/drm/sti/sti_dvo.c        | 10 +---------
>  drivers/gpu/drm/sti/sti_hda.c        | 10 +---------
>  drivers/gpu/drm/sti/sti_hdmi.c       | 11 +----------
>  drivers/gpu/drm/sti/sti_hqvdp.c      | 10 +---------
>  drivers/gpu/drm/sti/sti_tvout.c      | 10 +---------
>  drivers/gpu/drm/sti/sti_vtg.c        | 10 +---------
>  7 files changed, 7 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
> index 063f82d23d80c4ba83624a0066a18416a2b37351..7aefce6706ba2cd7d97a33228c9b9812edecf06f 100644
> --- a/drivers/gpu/drm/sti/sti_compositor.c
> +++ b/drivers/gpu/drm/sti/sti_compositor.c
> @@ -177,7 +177,6 @@ static int sti_compositor_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	struct device_node *vtg_np;
>  	struct sti_compositor *compo;
> -	struct resource *res;
>  	unsigned int i;
>  
>  	compo = devm_kzalloc(dev, sizeof(*compo), GFP_KERNEL);
> @@ -194,14 +193,7 @@ static int sti_compositor_probe(struct platform_device *pdev)
>  
>  	memcpy(&compo->data, of_match_node(compositor_of_match, np)->data,
>  	       sizeof(struct sti_compositor_data));
> -
> -	/* Get Memory ressources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res == NULL) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENXIO;
> -	}
> -	compo->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	compo->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (compo->regs == NULL) {
>  		DRM_ERROR("Register mapping failed\n");
>  		return -ENXIO;
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index c6c2abaa1891cd3ea025805b50d275ec314512c3..660588f01f90950a9b2c180ab230188c19901f26 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct sti_dvo *dvo;
> -	struct resource *res;
>  	struct device_node *np = dev->of_node;
>  
>  	DRM_INFO("%s\n", __func__);
> @@ -523,14 +522,7 @@ static int sti_dvo_probe(struct platform_device *pdev)
>  	}
>  
>  	dvo->dev = pdev->dev;
> -
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvo-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid dvo resource\n");
> -		return -ENOMEM;
> -	}
> -	dvo->regs = devm_ioremap(dev, res->start,
> -			resource_size(res));
> +	dvo->regs = devm_platform_ioremap_resource_byname(pdev, "dvo-reg");
>  	if (!dvo->regs)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index b12863bea95559c4f874eb94cea8938609d435d4..28fde4c568d0069ecf2f2f69f5be0e87c1d5f4f3 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -741,7 +741,6 @@ static int sti_hda_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct sti_hda *hda;
> -	struct resource *res;

There is a compile error, using an ARM toolchain on this patch and several others.

struct ressource *res is used on other places, which does not allow to remove
the instanciation here.


/local/home/gallais1/src/drm-misc/drivers/gpu/drm/sti/sti_hda.c: In function
‘sti_hda_probe’:
/local/home/gallais1/src/drm-misc/drivers/gpu/drm/sti/sti_hda.c:756:9: error:
‘res’ undeclared (first use in this function)
  756 |         res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
      |         ^~~
/local/home/gallais1/src/drm-misc/drivers/gpu/drm/sti/sti_hda.c:756:9: note:
each undeclared identifier is reported only once for each function it appears in
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/event.o
make[8]: *** [/local/home/gallais1/src/drm-misc/scripts/Makefile.build:194:
drivers/gpu/drm/sti/sti_hda.o] Error 1
make[8]: *** Waiting for unfinished jobs....


This can be applied:


* regarding [PATCH 07/14] rockchip driver:

/local/home/gallais1/src/drm-misc/drivers/gpu/drm/rockchip/rockchip_drm_vop.c:
In function ‘vop_bind’:
/local/home/gallais1/src/drm-misc/drivers/gpu/drm/rockchip/rockchip_drm_vop.c:2212:34:
error: ‘res’ undeclared (first use in this function); did you mean ‘ret’?
 2212 |         vop->len = resource_size(res);
      |                                  ^~~
      |                                  ret
/local/home/gallais1/src/drm-misc/drivers/gpu/drm/rockchip/rockchip_drm_vop.c:2212:34:
note: each undeclared identifier is reported only once for each function it
appears in
  CC [M]  drivers/gpu/drm/nouveau/nvif/fifo.o
make[8]: *** [/local/home/gallais1/src/drm-misc/scripts/Makefile.build:194:
drivers/gpu/drm/rockchip/rockchip_drm_vop.o] Error 1
make[8]: *** Waiting for unfinished jobs....


* regarding  [PATCH 13/14] vc4 driver:

/local/home/gallais1/src/drm-misc/drivers/gpu/drm/vc4/vc4_hdmi.c: In function
‘vc5_hdmi_init_resources’:
/local/home/gallais1/src/drm-misc/drivers/gpu/drm/vc4/vc4_hdmi.c:2961:9: error:
‘res’ undeclared (first use in this function); did you mean ‘ret’?
 2961 |         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
      |         ^~~
      |         ret
/local/home/gallais1/src/drm-misc/drivers/gpu/drm/vc4/vc4_hdmi.c:2961:9: note:
each undeclared identifier is reported only once for each function it appears in
make[8]: *** [/local/home/gallais1/src/drm-misc/scripts/Makefile.build:194:
drivers/gpu/drm/vc4/vc4_hdmi.o] Error 1
make[8]: *** Waiting for unfinished jobs....


Regards,
Raphaël

>  
>  	DRM_INFO("%s\n", __func__);
>  
> @@ -750,14 +749,7 @@ static int sti_hda_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	hda->dev = pdev->dev;
> -
> -	/* Get resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hda-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid hda resource\n");
> -		return -ENOMEM;
> -	}
> -	hda->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");
>  	if (!hda->regs)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index ca2fe17de4a5d1e0199e59a97e6c7601e139ed9e..666143c48b0d0f2c20cd26323ddbc8e69d966622 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct sti_hdmi *hdmi;
>  	struct device_node *np = dev->of_node;
> -	struct resource *res;
>  	struct device_node *ddc;
>  	int ret;
>  
> @@ -1399,15 +1398,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>  	}
>  
>  	hdmi->dev = pdev->dev;
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
>  	if (!hdmi->regs) {
>  		ret = -ENOMEM;
>  		goto release_adapter;
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
> index 0f658709c9d0d398c4eed65202443db9d0b41f8c..420395598d119a403d531211022e6005d6a2bd59 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *vtg_np;
>  	struct sti_hqvdp *hqvdp;
> -	struct resource *res;
>  
>  	DRM_DEBUG_DRIVER("\n");
>  
> @@ -1367,14 +1366,7 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
>  	}
>  
>  	hqvdp->dev = dev;
> -
> -	/* Get Memory resources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENXIO;
> -	}
> -	hqvdp->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hqvdp->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (!hqvdp->regs) {
>  		DRM_ERROR("Register mapping failed\n");
>  		return -ENXIO;
> diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
> index af6c06f448c4819def8cc0d0836e30f991529690..0bebe815f5e7567f84388af93723a6fa7d2cc7a2 100644
> --- a/drivers/gpu/drm/sti/sti_tvout.c
> +++ b/drivers/gpu/drm/sti/sti_tvout.c
> @@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->of_node;
>  	struct sti_tvout *tvout;
> -	struct resource *res;
>  
>  	DRM_INFO("%s\n", __func__);
>  
> @@ -850,14 +849,7 @@ static int sti_tvout_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	tvout->dev = dev;
> -
> -	/* get memory resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tvout-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid glue resource\n");
> -		return -ENOMEM;
> -	}
> -	tvout->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	tvout->regs = devm_platform_ioremap_resource_byname(pdev, "tvout-reg");
>  	if (!tvout->regs)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
> index 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..b5353fe774d72fd629ecd3ef75a5d2817ca8617f 100644
> --- a/drivers/gpu/drm/sti/sti_vtg.c
> +++ b/drivers/gpu/drm/sti/sti_vtg.c
> @@ -380,20 +380,12 @@ static int vtg_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct sti_vtg *vtg;
> -	struct resource *res;
>  	int ret;
>  
>  	vtg = devm_kzalloc(dev, sizeof(*vtg), GFP_KERNEL);
>  	if (!vtg)
>  		return -ENOMEM;
> -
> -	/* Get Memory ressources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENOMEM;
> -	}
> -	vtg->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	vtg->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (!vtg->regs) {
>  		DRM_ERROR("failed to remap I/O memory\n");
>  		return -ENOMEM;
>
