Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3D431134
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 09:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4376E96E;
	Mon, 18 Oct 2021 07:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4B56E96C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:13:28 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6] (unknown
 [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BE80A1F42642;
 Mon, 18 Oct 2021 08:13:25 +0100 (BST)
Subject: Re: [PATCH v8 04/12] iommu/mediatek: Add device_link between the
 consumer and the larb devices
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Matthias Kaehlcke <mka@chromium.org>,
 anan.sun@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-5-yong.wu@mediatek.com>
 <e00b92db-0562-27ca-2f96-1f03ff824988@collabora.com>
 <e4c98036dd73b91b8352a162f80240171e2b3f0f.camel@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <da5934de-65ad-4bac-c510-eb0d40d96d70@collabora.com>
Date: Mon, 18 Oct 2021 09:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e4c98036dd73b91b8352a162f80240171e2b3f0f.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16.10.21 04:23, Yong Wu wrote:
> On Mon, 2021-10-11 at 14:36 +0200, Dafna Hirschfeld wrote:
>>
>> On 29.09.21 03:37, Yong Wu wrote:
>>> MediaTek IOMMU-SMI diagram is like below. all the consumer connect
>>> with
>>> smi-larb, then connect with smi-common.
>>>
>>>           M4U
>>>            |
>>>       smi-common
>>>            |
>>>     -------------
>>>     |         |    ...
>>>     |         |
>>> larb1     larb2
>>>     |         |
>>> vdec       venc
>>>
>>> When the consumer works, it should enable the smi-larb's power
>>> which
>>> also need enable the smi-common's power firstly.
>>>
>>> Thus, First of all, use the device link connect the consumer and
>>> the
>>> smi-larbs. then add device link between the smi-larb and smi-
>>> common.
>>>
>>> This patch adds device_link between the consumer and the larbs.
>>>
>>> When device_link_add, I add the flag DL_FLAG_STATELESS to avoid
>>> calling
>>> pm_runtime_xx to keep the original status of clocks. It can avoid
>>> two
>>> issues:
>>> 1) Display HW show fastlogo abnormally reported in [1]. At the
>>> beggining,
>>> all the clocks are enabled before entering kernel, but the clocks
>>> for
>>> display HW(always in larb0) will be gated after clk_enable and
>>> clk_disable
>>> called from device_link_add(->pm_runtime_resume) and rpm_idle. The
>>> clock
>>> operation happened before display driver probe. At that time, the
>>> display
>>> HW will be abnormal.
>>>
>>> 2) A deadlock issue reported in [2]. Use DL_FLAG_STATELESS to skip
>>> pm_runtime_xx to avoid the deadlock.
>>>
>>> Corresponding, DL_FLAG_AUTOREMOVE_CONSUMER can't be added, then
>>> device_link_removed should be added explicitly.
>>>
>>> [1]
>>> https://lore.kernel.org/linux-mediatek/1564213888.22908.4.camel@mhfsdcap03/
>>> [2] https://lore.kernel.org/patchwork/patch/1086569/
>>>
>>> Suggested-by: Tomasz Figa <tfiga@chromium.org>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-
>>> R2/MT7623
>>> ---
>>>    drivers/iommu/mtk_iommu.c    | 22 ++++++++++++++++++++++
>>>    drivers/iommu/mtk_iommu_v1.c | 20 +++++++++++++++++++-
>>>    2 files changed, 41 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index d5848f78a677..a2fa55899434 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -560,22 +560,44 @@ static struct iommu_device
>>> *mtk_iommu_probe_device(struct device *dev)
>>>    {
>>>    	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>    	struct mtk_iommu_data *data;
>>> +	struct device_link *link;
>>> +	struct device *larbdev;
>>> +	unsigned int larbid;
>>>    
>>>    	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>>>    		return ERR_PTR(-ENODEV); /* Not a iommu client device
>>> */
>>>    
>>>    	data = dev_iommu_priv_get(dev);
>>>    
>>> +	/*
>>> +	 * Link the consumer device with the smi-larb device(supplier)
>>> +	 * The device in each a larb is a independent HW. thus only
>>> link
>>> +	 * one larb here.
>>> +	 */
>>> +	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
>>
>> so larbid is always the same for all the ids of a device?
> 
> Yes. For me, each a dtsi node should represent a HW unit which can only
> connect one larb.
> 
>> If so maybe it worth testing it and return error if this is not the
>> case.
> 
> Thanks for the suggestion. This is very helpful. I did see someone put
> the different larbs in one node. I will check this, and add return

I am working on bugs found on media drivers, could you please point me to
that wrong node?
Will you send a fix to that node in the dtsi?


Thanks,
Dafna

> EINVAL for this case.



> 
>>
>> Thanks,
>> Dafna
>   
>>>
