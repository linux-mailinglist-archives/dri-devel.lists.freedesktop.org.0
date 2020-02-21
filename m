Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78A167BBC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612796F405;
	Fri, 21 Feb 2020 11:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379D989DD2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 07:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id BFD5D29329C
Subject: Re: [PATCH v8 6/6] clk/drm: mediatek: Fix mediatek-drm device probing
To: CK Hu <ck.hu@mediatek.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
 <20200220172147.919996-7-enric.balletbo@collabora.com>
 <1582262295.30425.8.camel@mtksdaap41>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <83aa2ed6-5bd7-6883-4c00-43f1d6f5f522@collabora.com>
Date: Fri, 21 Feb 2020 08:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582262295.30425.8.camel@mtksdaap41>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

Thanks for your quick feedback.

On 21/2/20 6:18, CK Hu wrote:
> Hi, Enric:
> 
> On Thu, 2020-02-20 at 18:21 +0100, Enric Balletbo i Serra wrote:
>> In the actual implementation the same compatible string
>> "mediatek,<chip>-mmsys" is used to bind the clock drivers
>> (drivers/clk/mediatek) as well as to the gpu driver
>> (drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
>> that the only probed driver is the clock driver and there is no display
>> at all.
>>
>> In any case having the same compatible string for two drivers is not
>> correct and should be fixed. To fix this, and maintain backward
>> compatibility, we can consider that the clk-<chip>-mm driver is the
>> top-level entry point for the MMSYS subsystem, so is not a pure clock
>> controller but a system controller, and the drm driver is instantiated
>> by that MMSYS driver.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v8:
>> - New patch introduced in this series.
>>
>> Changes in v7: None
>>
>>  drivers/clk/mediatek/clk-mt2701-mm.c   |  30 ++++++++
>>  drivers/clk/mediatek/clk-mt2712-mm.c   |  44 +++++++++++
>>  drivers/clk/mediatek/clk-mt8173-mm.c   |  35 +++++++++
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 102 ++-----------------------
>>  4 files changed, 115 insertions(+), 96 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
>> index 054b597d4a73..b1281680d5bf 100644
>> --- a/drivers/clk/mediatek/clk-mt2701-mm.c
>> +++ b/drivers/clk/mediatek/clk-mt2701-mm.c
>> @@ -5,6 +5,7 @@
>>   */
> 
> [snip]
> 
>>  
>>  
>> diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
>> index 1c5948be35f3..0ae971783997 100644
>> --- a/drivers/clk/mediatek/clk-mt2712-mm.c
>> +++ b/drivers/clk/mediatek/clk-mt2712-mm.c
>> @@ -5,6 +5,7 @@
>>   */
>>  
>>  #include <linux/clk-provider.h>
>> +#include <linux/platform_data/mtk_mmsys.h>
>>  #include <linux/platform_device.h>
>>  
>>  #include "clk-mtk.h"
>> @@ -126,9 +127,45 @@ static const struct mtk_gate mm_clks[] = {
>>  	GATE_MM2(CLK_MM_DSI3_DIGITAL, "mm_dsi3_digital", "dsi1_lntc", 6),
>>  };
>>  
>> +static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
>> +	DDP_COMPONENT_OVL0,
>> +	DDP_COMPONENT_COLOR0,
>> +	DDP_COMPONENT_AAL0,
>> +	DDP_COMPONENT_OD0,
>> +	DDP_COMPONENT_RDMA0,
>> +	DDP_COMPONENT_DPI0,
>> +	DDP_COMPONENT_PWM0,
>> +};
>> +
>> +static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
>> +	DDP_COMPONENT_OVL1,
>> +	DDP_COMPONENT_COLOR1,
>> +	DDP_COMPONENT_AAL1,
>> +	DDP_COMPONENT_OD1,
>> +	DDP_COMPONENT_RDMA1,
>> +	DDP_COMPONENT_DPI1,
>> +	DDP_COMPONENT_PWM1,
>> +};
>> +
>> +static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
>> +	DDP_COMPONENT_RDMA2,
>> +	DDP_COMPONENT_DSI3,
>> +	DDP_COMPONENT_PWM2,
>> +};
>> +
>> +static struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>> +	.main_path = mt2712_mtk_ddp_main,
>> +	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
>> +	.ext_path = mt2712_mtk_ddp_ext,
>> +	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
>> +	.third_path = mt2712_mtk_ddp_third,
>> +	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
>> +};
>> +
> 
> [snip]
> 
>>  
>> diff --git a/drivers/clk/mediatek/clk-mt8173-mm.c b/drivers/clk/mediatek/clk-mt8173-mm.c
>> index 83884fd5a750..9136c7f543f1 100644
>> --- a/drivers/clk/mediatek/clk-mt8173-mm.c
>> +++ b/drivers/clk/mediatek/clk-mt8173-mm.c
>> @@ -5,6 +5,7 @@
>>   */
>>  
>>  #include <linux/clk-provider.h>
>> +#include <linux/platform_data/mtk_mmsys.h>
>>  #include <linux/platform_device.h>
>>  
>>  #include "clk-mtk.h"
>> @@ -99,10 +100,37 @@ static const struct mtk_gate mm_clks[] = {
>>  	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
>>  };
>>  
>> +static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
>> +	DDP_COMPONENT_OVL0,
>> +	DDP_COMPONENT_COLOR0,
>> +	DDP_COMPONENT_AAL0,
>> +	DDP_COMPONENT_OD0,
>> +	DDP_COMPONENT_RDMA0,
>> +	DDP_COMPONENT_UFOE,
>> +	DDP_COMPONENT_DSI0,
>> +	DDP_COMPONENT_PWM0,
>> +};
>> +
>> +static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
>> +	DDP_COMPONENT_OVL1,
>> +	DDP_COMPONENT_COLOR1,
>> +	DDP_COMPONENT_GAMMA,
>> +	DDP_COMPONENT_RDMA1,
>> +	DDP_COMPONENT_DPI0,
>> +};
>> +
>> +static struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>> +	.main_path = mt8173_mtk_ddp_main,
>> +	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
>> +	.ext_path = mt8173_mtk_ddp_ext,
>> +	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>> +};
>> +
>>  static int clk_mt8173_mm_probe(struct platform_device *pdev)
>>  {
>>  	struct device_node *node = pdev->dev.of_node;
>>  	struct clk_onecell_data *clk_data;
>> +	struct platform_device *drm;
>>  	int ret;
>>  
>>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>> @@ -118,6 +146,13 @@ static int clk_mt8173_mm_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	platform_set_drvdata(pdev, &mt8173_mmsys_driver_data);
>> +
>> +	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>> +					    PLATFORM_DEVID_NONE, NULL, 0);
>> +	if (IS_ERR(drm))
>> +		return PTR_ERR(drm);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index b68837ea02b3..5b60f6b7d710 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -61,88 +61,6 @@ static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
>>  	.atomic_commit = drm_atomic_helper_commit,
>>  };
>>  
>> -static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
>> -	DDP_COMPONENT_OVL0,
>> -	DDP_COMPONENT_RDMA0,
>> -	DDP_COMPONENT_COLOR0,
>> -	DDP_COMPONENT_BLS,
>> -	DDP_COMPONENT_DSI0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
>> -	DDP_COMPONENT_RDMA1,
>> -	DDP_COMPONENT_DPI0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
>> -	DDP_COMPONENT_OVL0,
>> -	DDP_COMPONENT_COLOR0,
>> -	DDP_COMPONENT_AAL0,
>> -	DDP_COMPONENT_OD0,
>> -	DDP_COMPONENT_RDMA0,
>> -	DDP_COMPONENT_DPI0,
>> -	DDP_COMPONENT_PWM0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
>> -	DDP_COMPONENT_OVL1,
>> -	DDP_COMPONENT_COLOR1,
>> -	DDP_COMPONENT_AAL1,
>> -	DDP_COMPONENT_OD1,
>> -	DDP_COMPONENT_RDMA1,
>> -	DDP_COMPONENT_DPI1,
>> -	DDP_COMPONENT_PWM1,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
>> -	DDP_COMPONENT_RDMA2,
>> -	DDP_COMPONENT_DSI3,
>> -	DDP_COMPONENT_PWM2,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
>> -	DDP_COMPONENT_OVL0,
>> -	DDP_COMPONENT_COLOR0,
>> -	DDP_COMPONENT_AAL0,
>> -	DDP_COMPONENT_OD0,
>> -	DDP_COMPONENT_RDMA0,
>> -	DDP_COMPONENT_UFOE,
>> -	DDP_COMPONENT_DSI0,
>> -	DDP_COMPONENT_PWM0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
>> -	DDP_COMPONENT_OVL1,
>> -	DDP_COMPONENT_COLOR1,
>> -	DDP_COMPONENT_GAMMA,
>> -	DDP_COMPONENT_RDMA1,
>> -	DDP_COMPONENT_DPI0,
>> -};
> 
> I prefer that display routing is placed in drm driver. If you want to
> move display routing into mmsys driver, I think you should move
> mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path() into
> mmsys driver because that is the register configuration part. This array
> could be changed by display driver according to its application. For
> example, the another routing could be:
> 
> static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
> 	DDP_COMPONENT_OVL0,
> 	DDP_COMPONENT_COLOR0,
> 	DDP_COMPONENT_AAL0,
> 	DDP_COMPONENT_OD0,
> 	DDP_COMPONENT_RDMA0,
> 	DDP_COMPONENT_UFOE,
> 	DDP_COMPONENT_DPI0,
> };
> 
> static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
> 	DDP_COMPONENT_OVL1,
> 	DDP_COMPONENT_COLOR1,
> 	DDP_COMPONENT_GAMMA,
> 	DDP_COMPONENT_RDMA1,
> 	DDP_COMPONENT_DSI0,
> 	DDP_COMPONENT_PWM0,
> };
> 
> I exchange the dsi and dpi component for the two display output. This
> array is how display driver want to route, so I think this should be
> kept in display driver.
> 
> Regards,
> CK
> 

I think that what I can do is leave all this part in the drm driver and get the
compatible string of the parent to match the data with the proper SoC. I'll try
to do this in next version.

Thanks.

>> -
>> -static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>> -	.main_path = mt2701_mtk_ddp_main,
>> -	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
>> -	.ext_path = mt2701_mtk_ddp_ext,
>> -	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
>> -	.shadow_register = true,
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>> -	.main_path = mt2712_mtk_ddp_main,
>> -	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
>> -	.ext_path = mt2712_mtk_ddp_ext,
>> -	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
>> -	.third_path = mt2712_mtk_ddp_third,
>> -	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>> -	.main_path = mt8173_mtk_ddp_main,
>> -	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
>> -	.ext_path = mt8173_mtk_ddp_ext,
>> -	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>> -};
>> -
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
