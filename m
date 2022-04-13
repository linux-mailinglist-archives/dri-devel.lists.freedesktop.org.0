Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899A4FF0D2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668CC10EEDB;
	Wed, 13 Apr 2022 07:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C9D10EEDB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:50:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 880501F44E42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649836253;
 bh=kBohRZbbvH0FPbbKRTyvrZHhm1a8/xbvKLbr4Ggeb1g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LsGydncRfzaqHxjjpdOT4mnl9g2Fb5Z1tzlmd5qWcNEHOuIp0fsdoJeTBM0FKXHhi
 6kXmphv2HOGb5Z9N97JRclBtrUUT0s5UZnTDEtsMJLcHOw3Ccy6f/x0tfP/68faFTQ
 zZtH5xUBpL5RNbZgkRs5CpjTOqsP5OTTjRWe5lMwOyTWUCnTdX6/n1OKXxYSCgcMw/
 9ujbqctshpYYKyqIzjMP3MqF12oCydnqvAY/NveBufiEbAd4Zx7t8hnk2PAI/hA6z7
 MZdFiGIAuhh0WH1aCCmkCQafgbrc8btd7UmKye1jG3US6pK10zw0aARx7H13LneJWZ
 CccuGxXWFzWpw==
Message-ID: <1893708d-12d7-eefb-6e59-ab1074d01949@collabora.com>
Date: Wed, 13 Apr 2022 09:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, vkoul@kernel.org,
 airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org,
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com,
 kishon@ti.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
 <9a31c1ce-829b-acc7-6fc1-2a9df45e5c38@collabora.com>
 <CABnWg9tou2S-LX7SpW=ALEdLwu9dXbOsxhvQ2WBWaCJW-qt8_Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABnWg9tou2S-LX7SpW=ALEdLwu9dXbOsxhvQ2WBWaCJW-qt8_Q@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/04/22 11:46, Guillaume Ranquet ha scritto:
> On Mon, 28 Mar 2022 11:14, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
>>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>>
>>> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
>>>
>>> It supports the mt8195, the embedded DisplayPort units. It offers
>>> DisplayPort 1.4 with up to 4 lanes.
>>>
>>> The driver shares its iomap range with the mtk-dp-phy driver using
>>> the regmap/syscon facility.
>>>
>>> This driver is based on an initial version by
>>> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>>>
>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Hello Guillaume,
>> as you know, there's some more work to do on this driver.
>>
>> I will also mention here, not on the code, that at this point, your
>> mtk_dp_aux_transfer() function has something VERY similar to function
>> drm_dp_dpcd_access(), so I really believe that you can instead use
>> functions drm_dp_dpcd_read() and drm_dp_dpcd_write(), avoiding code
>> duplication around.
>>
>> Please check drivers/gpu/drm/dp/drm_dp.c.
>>
> 
> This is already in my TODO list as this has been suggested by Rex earlier.
> 
>>> ---
>>>    drivers/gpu/drm/mediatek/Kconfig       |    8 +
>>>    drivers/gpu/drm/mediatek/Makefile      |    2 +
>>>    drivers/gpu/drm/mediatek/mtk_dp.c      | 2221 ++++++++++++++++++++++++
>>>    drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
>>>    drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>>>    drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>>>    6 files changed, 2801 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>>>    create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>>> index 2976d21e9a34..03ffa9b896c3 100644
>>> --- a/drivers/gpu/drm/mediatek/Kconfig
>>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>>> @@ -28,3 +28,11 @@ config DRM_MEDIATEK_HDMI
>>>    	select PHY_MTK_HDMI
>>>    	help
>>>    	  DRM/KMS HDMI driver for Mediatek SoCs
>>> +
>>> +config MTK_DPTX_SUPPORT
>>
>> Actually, I think that the best would be DRM_MEDIATEK_DP_TX or DRM_MEDIATEK_DP...
>> ...also, ordering is important, please!
>>
> I will update the name.
> What do you mean by ordering? do you expect the configs to be ordered
> alphabetically?
> 

Yes, correct. Configuration options shall be alphabetically ordered.
Obviously, the same applies for Makefile :)

>>> +	tristate "DRM DPTX Support for Mediatek SoCs"
>>> +	depends on DRM_MEDIATEK
>>> +	select PHY_MTK_DP
>>> +	select DRM_DP_HELPER
>>> +	help
>>> +	  DRM/KMS Display Port driver for Mediatek SoCs.
>>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>>> index 29098d7c8307..d86a6406055e 100644
>>> --- a/drivers/gpu/drm/mediatek/Makefile
>>> +++ b/drivers/gpu/drm/mediatek/Makefile
>>> @@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>>>    			  mtk_hdmi_ddc.o
>>>
>>>    obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>>> +
>>> +obj-$(CONFIG_MTK_DPTX_SUPPORT) += mtk_dp.o
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>>> new file mode 100644
>>> index 000000000000..7cd8459cf719
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c

..snip..

>>> +
>>> +#define MTK_UPD_BITS_OR_OUT(mtk_dp, offset, val, mask, ret, label) \
>>> +	do {\
>>> +		ret = mtk_dp_update_bits(mtk_dp, offset, val, mask); \
>>> +		if (ret) \
>>> +			goto label; \
>>> +	} while (0)
>>
>> I'm sorry, no offense - but this macro is a bit ugly...
>>
>> I think I understand why you have introduced it, but in my opinion this decreases
>> human readability a lot, I was even about to point out multiple functions that
>> you had unused labels before checking this macro, as that was totally unexpected...
>>
>> In my opinion, this should be open-coded everywhere... yes it makes the file a
>> bit fatter in terms of amount of text, but eh... it's life :)))
>>
>>
> No offense taken... I find the macro ugly too... but I couldn't think
> of anything less
> ugly... I'll bite the bullet and write all of the code then.
> 

I can't think of anything shorter, either.. so yep, sometimes writing 'em all
is simply the best option.

>>> +
>>
>> ....snip....
>>
>>> +
>>> +static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
>>> +				   enum mtk_dp_color_format color_format)
>>> +{


..snip..

>>> +
>>> +static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
>>> +			   struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	int ret = 0;
>>> +	void __iomem *base;
>>> +
>>> +	base = devm_platform_ioremap_resource(pdev, 0);
>>> +	if (IS_ERR(base))
>>> +		return PTR_ERR(base);
>>> +
>>> +	mtk_dp->regs = syscon_node_to_regmap(dev->of_node);
>>> +	if (IS_ERR(mtk_dp->regs))
>>> +		return PTR_ERR(mtk_dp->regs);
>>> +
>>> +	//TODO: optional clock?
>>
>> Well, if it's optional, you should use devm_clk_get_optional(), meaning
>> that......
>>
>>> +	mtk_dp->dp_tx_clk = devm_clk_get(dev, "faxi");
>>> +	if (IS_ERR(mtk_dp->dp_tx_clk)) {
>>> +		ret = PTR_ERR(mtk_dp->dp_tx_clk);
>>> +		dev_info(dev, "Failed to get dptx clock: %d\n", ret);
>>> +		mtk_dp->dp_tx_clk = NULL;
>>
>> ...I shouldn't see this snippet of code, as it should be a bit different... :)
>>
> It is still unclear to me if this should be optional or not, hence the 'TODO'
> 

Thinking about this a bit more - this driver is for MT8195 only, for now... and
the DP cannot work without the AXI clock being up... logically.

I'd say, at this point, to make this mandatory.

If any newer platform will make this optional, we can either assign clk26m (ugh!)
or we can get back to this one and convert this to devm_clk_get_optional().

Don't forget that we can also manage this in devicetree bindings, where we can
for example declare a property to be optional for one or more compatibles, so
there's no problem if we'd be doing such a change in the future, I think.

>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>
>> ..snip..
>>
>>> +static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>>> +					 struct drm_bridge_state *old_state)
>>> +{
>>> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>>> +
>>> +	mtk_dp_video_mute(mtk_dp, true);
>>> +	mtk_dp->state = MTK_DP_STATE_IDLE;
>>> +	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
>>> +
>>> +	mtk_dp->enabled = false;
>>
>>> +	msleep(100);
>>
>> 100 milliseconds is an eternity, why are we sleeping for *so long* here?
>>
>> Please, either add a comment that fully explains the resons for that, or
>> remove the sleep entirely: to my eyes, it doesn't look like this sleep is
>> really needed for anything important because here you are disabling the
>> bridge and *powering off* the IP entirely.
>>
> This sleep can be removed.
> I will also make an effort to document all the other delays in the code for v10.
> 

Thanks for that.

(snip)

>>> +
>>
>>
> 
> Thx a lot for your review,
> Guillaume.


You're welcome!

Cheers,
Angelo
