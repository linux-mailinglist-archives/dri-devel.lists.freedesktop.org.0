Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A23B71A4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062D76E879;
	Tue, 29 Jun 2021 11:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Tue, 29 Jun 2021 11:26:04 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66516E864
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 11:26:04 +0000 (UTC)
Received: from smtp.263.net (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id 285E3120126
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 19:18:41 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.233])
 by smtp.263.net (Postfix) with ESMTP id C449B19C6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 19:18:35 +0800 (CST)
Received: from localhost (unknown [192.168.167.105])
 by regular1.263xmail.com (Postfix) with ESMTP id A4493F12;
 Tue, 29 Jun 2021 19:18:33 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.10] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P13110T140560568407808S1624965510067257_; 
 Tue, 29 Jun 2021 19:18:33 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3fcf2cd44b3224a230bc17c7e69a24d8>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: linux-kernel@vger.kernel.org
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH] drm/rockchip: Check iommu itself instead of it's parent
 for device_is_available
To: Robin Murphy <robin.murphy@arm.com>, hjc@rock-chips.com, heiko@sntech.de, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
References: <20210627084737.309163-1-andy.yan@rock-chips.com>
 <66fb4977-4e6f-f7ed-0dac-18710ebd782a@arm.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <f20e1547-649e-2d9b-cd90-7b8291d505a6@rock-chips.com>
Date: Tue, 29 Jun 2021 19:18:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <66fb4977-4e6f-f7ed-0dac-18710ebd782a@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 29 Jun 2021 11:54:54 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin:

On 6/28/21 5:54 PM, Robin Murphy wrote:
> On 2021-06-27 09:47, Andy Yan wrote:
>> When iommu itself is disabled in dts, we should
>> fallback to non-iommu buffer, check iommu parent
>> is meanless here.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
>>
>>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c 
>> b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> index 212bd87c0c4a..0d20c8cc1ffa 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
>> @@ -366,7 +366,7 @@ static int rockchip_drm_platform_of_probe(struct 
>> device *dev)
>>           }
>>             iommu = of_parse_phandle(port->parent, "iommus", 0);
>> -        if (!iommu || !of_device_is_available(iommu->parent)) {
>> +        if (!iommu || !of_device_is_available(iommu)) {
>
> Just wondering, could you use device_iommu_mapped() to avoid poking at 
> the DT at all here, or is it that you need to check remote graph 
> endpoints whose struct device may not be ready yet?


device_iommu_mapped(dev)  can't be called from rockchip_drm_init_iommu, 
as there is no  iommu dev(vop) in these function.

>
> Robin.
>
>>               DRM_DEV_DEBUG(dev,
>>                         "no iommu attached for %pOF, using non-iommu 
>> buffers\n",
>>                         port->parent);
>>
>
>
>


