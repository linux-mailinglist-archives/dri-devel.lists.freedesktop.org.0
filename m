Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC23A4F95C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 09:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BF210E712;
	Wed,  5 Mar 2025 08:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="BxrMHxKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135510E712
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 08:59:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5257njAs000665;
 Wed, 5 Mar 2025 09:58:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LQXDAu/Cz7vbFe21nnUqOtM+s7wpjqaQJEOHMcYs7/M=; b=BxrMHxKZiP8/Y8ea
 2dfoLCbqIp1LweePpkqi/ok1F4YMl1EY/3CjUjbEJNHP3FYGzk4hAcIl7Z0d0igz
 c6SrcoubvDpKLCsulpE/eByZ2RKXO5HJgLdvmXDDNCOwTa/e5yRgUfyVqRNgHDHD
 VZhkmbHJ53FuFoRJrn9FHWQB3VL6ZT0Efs65QnpVQWUbtVsa9dsppR7KQKH40ib5
 Of61j9H2Hwow7nyqYo1nWxNjN1X56w6GazUjfJkyI3okMV23LbmzQDvnrAnc9dXA
 zditwB0noEho8RahiQ9x715E5b8RSaE08xq2SJukA3Zvz7C8MXybPRxixLhJdvi4
 /IsjlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 453t9natuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Mar 2025 09:58:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 84E0140056;
 Wed,  5 Mar 2025 09:54:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 722C55AC880;
 Wed,  5 Mar 2025 09:47:07 +0100 (CET)
Received: from [10.130.77.153] (10.130.77.153) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 09:47:05 +0100
Message-ID: <3b173c1c-4e74-4907-961c-9c90d48a9412@foss.st.com>
Date: Wed, 5 Mar 2025 09:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 07/12] drm/sti: move to
 devm_platform_ioremap_resource() usage
To: Anusha Srivatsa <asrivats@redhat.com>
CC: Joel Stanley <joel@jms.id.au>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>,
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Marek
 Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, <linux-aspeed@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-tegra@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
 <20250225-memory-drm-misc-next-v1-7-9d0e8761107a@redhat.com>
 <24958ae8-6153-4798-abeb-e770d66ca8e4@foss.st.com>
 <CAN9Xe3Q8=_Tz51i6gxNM6445p-rhNiK7B5Ljcga8g_Nn676dCQ@mail.gmail.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <CAN9Xe3Q8=_Tz51i6gxNM6445p-rhNiK7B5Ljcga8g_Nn676dCQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.77.153]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
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


On 3/3/25 18:29, Anusha Srivatsa wrote:
> On Wed, Feb 26, 2025 at 5:19 AM Raphael Gallais-Pou <
> raphael.gallais-pou@foss.st.com> wrote:
>
>> On 2/25/25 23:20, Anusha Srivatsa wrote:
>>> Replace platform_get_resource/_byname + devm_ioremap
>>> with just devm_platform_ioremap_resource()
>>>
>>> Used Coccinelle to do this change. SmPl patch:
>>>
>>> @rule@
>>> identifier res;
>>> expression ioremap;
>>> identifier pdev;
>>> constant mem;
>>> expression name;
>>> @@
>>> -struct resource *res;
>>> ...
>>> -res = platform_get_resource_byname(pdev,mem,name);
>>> <...
>>> -if (!res) {
>>> -...
>>> -}
>>> ...>
>>> -ioremap = devm_ioremap(...);
>>> +ioremap = devm_platform_ioremap_resource_byname(pdev,name);
>>>
>>> and
>>> @rule_2@
>>> identifier res;
>>> expression ioremap;
>>> identifier pdev;
>>> @@
>>> -struct resource *res;
>>> ...
>>> -res = platform_get_resource(pdev,...);
>>> <...
>>> -if (!res) {
>>> -...
>>> -}
>>> ...>
>>> -ioremap = devm_ioremap(...);
>>> +ioremap = devm_platform_ioremap_resource(pdev,0);
>>>
>>> v2: Fix compilation error.
>>
>> Hi Anusha,
>>
>>
>> You did not take into account my comment regarding the changelog. :-)
>>
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#commentary
>>
>> While the commit summary do not specify the version, this changelog
>> suggests
>> that the version of your series as been incremented.
>> If this is a v2, then a version descriptor should be applied to the
>> patchset.
>>
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#subject-line
>>
>> Hi  Raphael,
> That is correct. While this patch is a v2, there is another patch or two in
> the same series that is on v4 when it got acked and reviewed. Having
> patches belonging to the same series with different version prefixes seemed
> odd when I sent the series. Hence added what exactly changed in the commit
> log.


Indeed, the serie version should remain consistent across all patches.

Maxime told you in an earlier answer, any modification of any patch what so ever
increases the serie version. Thus all patches are at v5 (looking at your latest
revision).

Verbatim from the documentation :

Other comments relevant only to the moment or the maintainer, not suitable for
the permanent changelog, should also go here [under the --- marker]. A good
example of such comments might be patch changelogs which describe what has
changed between the v1 and v2 version of the patch.

Please put this information after the --- line which separates the changelog
from the rest of the patch. The version information is not part of the changelog
which gets committed to the git tree. It is additional information for the
reviewers. If it’s placed above the commit tags, it needs manual interaction to
remove it. If it is below the separator line, it gets automatically stripped off
when applying the patch:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#commentary

Raphaël

>
> Anusha
>
>
>> Regards,
>> Raphaël
>>
>>> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>> Cc: Alain Volmat <alain.volmat@foss.st.com>
>>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>> Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>>> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>>> ---
>>>  drivers/gpu/drm/sti/sti_compositor.c | 10 +---------
>>>  drivers/gpu/drm/sti/sti_dvo.c        | 10 +---------
>>>  drivers/gpu/drm/sti/sti_hda.c        |  9 +--------
>>>  drivers/gpu/drm/sti/sti_hdmi.c       | 11 +----------
>>>  drivers/gpu/drm/sti/sti_hqvdp.c      | 10 +---------
>>>  drivers/gpu/drm/sti/sti_tvout.c      | 10 +---------
>>>  drivers/gpu/drm/sti/sti_vtg.c        | 10 +---------
>>>  7 files changed, 7 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/sti/sti_compositor.c
>> b/drivers/gpu/drm/sti/sti_compositor.c
>>> index
>> 063f82d23d80c4ba83624a0066a18416a2b37351..7aefce6706ba2cd7d97a33228c9b9812edecf06f
>> 100644
>>> --- a/drivers/gpu/drm/sti/sti_compositor.c
>>> +++ b/drivers/gpu/drm/sti/sti_compositor.c
>>> @@ -177,7 +177,6 @@ static int sti_compositor_probe(struct
>> platform_device *pdev)
>>>       struct device_node *np = dev->of_node;
>>>       struct device_node *vtg_np;
>>>       struct sti_compositor *compo;
>>> -     struct resource *res;
>>>       unsigned int i;
>>>
>>>       compo = devm_kzalloc(dev, sizeof(*compo), GFP_KERNEL);
>>> @@ -194,14 +193,7 @@ static int sti_compositor_probe(struct
>> platform_device *pdev)
>>>       memcpy(&compo->data, of_match_node(compositor_of_match, np)->data,
>>>              sizeof(struct sti_compositor_data));
>>> -
>>> -     /* Get Memory ressources */
>>> -     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -     if (res == NULL) {
>>> -             DRM_ERROR("Get memory resource failed\n");
>>> -             return -ENXIO;
>>> -     }
>>> -     compo->regs = devm_ioremap(dev, res->start, resource_size(res));
>>> +     compo->regs = devm_platform_ioremap_resource(pdev, 0);
>>>       if (compo->regs == NULL) {
>>>               DRM_ERROR("Register mapping failed\n");
>>>               return -ENXIO;
>>> diff --git a/drivers/gpu/drm/sti/sti_dvo.c
>> b/drivers/gpu/drm/sti/sti_dvo.c
>>> index
>> 4dcddd02629b6a1052be8fb8333bd3aa17c083c5..c877298a7f2bad171724eca4d43ea622db4c81cd
>> 100644
>>> --- a/drivers/gpu/drm/sti/sti_dvo.c
>>> +++ b/drivers/gpu/drm/sti/sti_dvo.c
>>> @@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device
>> *pdev)
>>>  {
>>>       struct device *dev = &pdev->dev;
>>>       struct sti_dvo *dvo;
>>> -     struct resource *res;
>>>       struct device_node *np = dev->of_node;
>>>
>>>       DRM_INFO("%s\n", __func__);
>>> @@ -523,14 +522,7 @@ static int sti_dvo_probe(struct platform_device
>> *pdev)
>>>       }
>>>
>>>       dvo->dev = pdev->dev;
>>> -
>>> -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> "dvo-reg");
>>> -     if (!res) {
>>> -             DRM_ERROR("Invalid dvo resource\n");
>>> -             return -ENOMEM;
>>> -     }
>>> -     dvo->regs = devm_ioremap(dev, res->start,
>>> -                     resource_size(res));
>>> +     dvo->regs = devm_platform_ioremap_resource_byname(pdev, "dvo-reg");
>>>       if (!dvo->regs)
>>>               return -ENOMEM;
>>>
>>> diff --git a/drivers/gpu/drm/sti/sti_hda.c
>> b/drivers/gpu/drm/sti/sti_hda.c
>>> index
>> 14fdc00d2ba03d4f96ba407ac8e576decb6f32c0..3ca3abb80d425901f4c031edfd327a770d624e1c
>> 100644
>>> --- a/drivers/gpu/drm/sti/sti_hda.c
>>> +++ b/drivers/gpu/drm/sti/sti_hda.c
>>> @@ -750,14 +750,7 @@ static int sti_hda_probe(struct platform_device
>> *pdev)
>>>               return -ENOMEM;
>>>
>>>       hda->dev = pdev->dev;
>>> -
>>> -     /* Get resources */
>>> -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> "hda-reg");
>>> -     if (!res) {
>>> -             DRM_ERROR("Invalid hda resource\n");
>>> -             return -ENOMEM;
>>> -     }
>>> -     hda->regs = devm_ioremap(dev, res->start, resource_size(res));
>>> +     hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");
>>>       if (!hda->regs)
>>>               return -ENOMEM;
>>>
>>> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c
>> b/drivers/gpu/drm/sti/sti_hdmi.c
>>> index
>> 164a34d793d86f114394048667ae3189e1c39242..c64ce7a1ef58b9ce4429edd368269bea87d86984
>> 100644
>>> --- a/drivers/gpu/drm/sti/sti_hdmi.c
>>> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
>>> @@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device
>> *pdev)
>>>       struct device *dev = &pdev->dev;
>>>       struct sti_hdmi *hdmi;
>>>       struct device_node *np = dev->of_node;
>>> -     struct resource *res;
>>>       struct device_node *ddc;
>>>       int ret;
>>>
>>> @@ -1399,15 +1398,7 @@ static int sti_hdmi_probe(struct platform_device
>> *pdev)
>>>       }
>>>
>>>       hdmi->dev = pdev->dev;
>>> -
>>> -     /* Get resources */
>>> -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> "hdmi-reg");
>>> -     if (!res) {
>>> -             DRM_ERROR("Invalid hdmi resource\n");
>>> -             ret = -ENOMEM;
>>> -             goto release_adapter;
>>> -     }
>>> -     hdmi->regs = devm_ioremap(dev, res->start, resource_size(res));
>>> +     hdmi->regs = devm_platform_ioremap_resource_byname(pdev,
>> "hdmi-reg");
>>>       if (!hdmi->regs) {
>>>               ret = -ENOMEM;
>>>               goto release_adapter;
>>> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c
>> b/drivers/gpu/drm/sti/sti_hqvdp.c
>>> index
>> 0f658709c9d0d398c4eed65202443db9d0b41f8c..420395598d119a403d531211022e6005d6a2bd59
>> 100644
>>> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
>>> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
>>> @@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_device
>> *pdev)
>>>       struct device *dev = &pdev->dev;
>>>       struct device_node *vtg_np;
>>>       struct sti_hqvdp *hqvdp;
>>> -     struct resource *res;
>>>
>>>       DRM_DEBUG_DRIVER("\n");
>>>
>>> @@ -1367,14 +1366,7 @@ static int sti_hqvdp_probe(struct platform_device
>> *pdev)
>>>       }
>>>
>>>       hqvdp->dev = dev;
>>> -
>>> -     /* Get Memory resources */
>>> -     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -     if (!res) {
>>> -             DRM_ERROR("Get memory resource failed\n");
>>> -             return -ENXIO;
>>> -     }
>>> -     hqvdp->regs = devm_ioremap(dev, res->start, resource_size(res));
>>> +     hqvdp->regs = devm_platform_ioremap_resource(pdev, 0);
>>>       if (!hqvdp->regs) {
>>>               DRM_ERROR("Register mapping failed\n");
>>>               return -ENXIO;
>>> diff --git a/drivers/gpu/drm/sti/sti_tvout.c
>> b/drivers/gpu/drm/sti/sti_tvout.c
>>> index
>> af6c06f448c4819def8cc0d0836e30f991529690..0bebe815f5e7567f84388af93723a6fa7d2cc7a2
>> 100644
>>> --- a/drivers/gpu/drm/sti/sti_tvout.c
>>> +++ b/drivers/gpu/drm/sti/sti_tvout.c
>>> @@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device
>> *pdev)
>>>       struct device *dev = &pdev->dev;
>>>       struct device_node *node = dev->of_node;
>>>       struct sti_tvout *tvout;
>>> -     struct resource *res;
>>>
>>>       DRM_INFO("%s\n", __func__);
>>>
>>> @@ -850,14 +849,7 @@ static int sti_tvout_probe(struct platform_device
>> *pdev)
>>>               return -ENOMEM;
>>>
>>>       tvout->dev = dev;
>>> -
>>> -     /* get memory resources */
>>> -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> "tvout-reg");
>>> -     if (!res) {
>>> -             DRM_ERROR("Invalid glue resource\n");
>>> -             return -ENOMEM;
>>> -     }
>>> -     tvout->regs = devm_ioremap(dev, res->start, resource_size(res));
>>> +     tvout->regs = devm_platform_ioremap_resource_byname(pdev,
>> "tvout-reg");
>>>       if (!tvout->regs)
>>>               return -ENOMEM;
>>>
>>> diff --git a/drivers/gpu/drm/sti/sti_vtg.c
>> b/drivers/gpu/drm/sti/sti_vtg.c
>>> index
>> 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..b5353fe774d72fd629ecd3ef75a5d2817ca8617f
>> 100644
>>> --- a/drivers/gpu/drm/sti/sti_vtg.c
>>> +++ b/drivers/gpu/drm/sti/sti_vtg.c
>>> @@ -380,20 +380,12 @@ static int vtg_probe(struct platform_device *pdev)
>>>  {
>>>       struct device *dev = &pdev->dev;
>>>       struct sti_vtg *vtg;
>>> -     struct resource *res;
>>>       int ret;
>>>
>>>       vtg = devm_kzalloc(dev, sizeof(*vtg), GFP_KERNEL);
>>>       if (!vtg)
>>>               return -ENOMEM;
>>> -
>>> -     /* Get Memory ressources */
>>> -     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -     if (!res) {
>>> -             DRM_ERROR("Get memory resource failed\n");
>>> -             return -ENOMEM;
>>> -     }
>>> -     vtg->regs = devm_ioremap(dev, res->start, resource_size(res));
>>> +     vtg->regs = devm_platform_ioremap_resource(pdev, 0);
>>>       if (!vtg->regs) {
>>>               DRM_ERROR("failed to remap I/O memory\n");
>>>               return -ENOMEM;
>>>
>>
