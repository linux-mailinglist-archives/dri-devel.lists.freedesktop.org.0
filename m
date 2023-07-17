Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395DE756093
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A810E227;
	Mon, 17 Jul 2023 10:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-50.mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545C210E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 10:36:29 +0000 (UTC)
Message-ID: <59365758-a14a-feb6-6a17-729c5b43e581@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689590187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkMjuh1v+2sdz1CZtDe1vdfKbs4DnmbzZ54ExQuiBD0=;
 b=AnX3rHXJKdWUgnb5Bn5ywZJfJbOtkR6Ij/4aELIBsviIyHp0J99iiSthhNGSuHpdj06Qp2
 mLz1nDwqr0SjJSZZMuTs2QKAPsX89UWMeSs2NxjIx/CiNdxXNqUTIUl2VMmtDfxVv0L7x1
 SXF8WtA75aY0V483zNtYXvHLh78yj4Q=
Date: Mon, 17 Jul 2023 18:36:23 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v1 8/8] drm/etnaviv: Add a helper to get a pointer to the
 first available node
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-9-sui.jingfeng@linux.dev>
 <66749b1b4523d2859b9fbc6e9120e5f1e887d531.camel@pengutronix.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <66749b1b4523d2859b9fbc6e9120e5f1e887d531.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/17 18:07, Lucas Stach wrote:
> Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> This make the code in etnaviv_pdev_probe() less twisted, drop the reference
>> to device node after finished. Also kill a double blank line.
>>
> I can't spot the double blank line you claim to remove.
>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 32 ++++++++++++++++++---------
>>   1 file changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 7d0eeab3e8b7..3446f8eabf59 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -27,6 +27,19 @@
>>    * DRM operations:
>>    */
>>   
>> +/* If the DT contains at least one available GPU, return a pointer to it */
>> +
> I think the code in the function is simple enough that we don't need a
> comment explaining what it does.

Because the DT could disable GPU cores by add "status=disabled" property.

So, only the word *available* in this comments is deserved.

But I'm fine to delete the comment for this function, will be fixed at 
the next version.

Thanks for reviewing.

> Regards,
> Lucas
>
>> +static struct device_node *etnaviv_of_first_node(void)
>> +{
>> +	struct device_node *np;
>> +
>> +	for_each_compatible_node(np, NULL, "vivante,gc") {
>> +		if (of_device_is_available(np))
>> +			return np;
>> +	}
>> +
>> +	return NULL;
>> +}
>>   
>>   static void load_gpu(struct drm_device *dev)
>>   {
>> @@ -587,7 +600,7 @@ static const struct component_master_ops etnaviv_master_ops = {
>>   static int etnaviv_pdev_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> -	struct device_node *first_node = NULL;
>> +	struct device_node *first_node;
>>   	struct component_match *match = NULL;
>>   
>>   	if (!dev->platform_data) {
>> @@ -597,11 +610,10 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>>   			if (!of_device_is_available(core_node))
>>   				continue;
>>   
>> -			if (!first_node)
>> -				first_node = core_node;
>> -
>>   			drm_of_component_match_add(&pdev->dev, &match,
>>   						   component_compare_of, core_node);
>> +
>> +			of_node_put(core_node);
>>   		}
>>   	} else {
>>   		char **names = dev->platform_data;
>> @@ -634,8 +646,11 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>>   	 * device as the GPU we found. This assumes that all Vivante
>>   	 * GPUs in the system share the same DMA constraints.
>>   	 */
>> -	if (first_node)
>> +	first_node = etnaviv_of_first_node();
>> +	if (first_node) {
>>   		of_dma_configure(&pdev->dev, first_node, true);
>> +		of_node_put(first_node);
>> +	}
>>   
>>   	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
>>   }
>> @@ -709,17 +724,14 @@ static int __init etnaviv_init(void)
>>   	 * If the DT contains at least one available GPU device, instantiate
>>   	 * the DRM platform device.
>>   	 */
>> -	for_each_compatible_node(np, NULL, "vivante,gc") {
>> -		if (!of_device_is_available(np))
>> -			continue;
>> +	np = etnaviv_of_first_node();
>> +	if (np) {
>>   		of_node_put(np);
>>   
>>   		ret = etnaviv_create_platform_device("etnaviv",
>>   						     &etnaviv_platform_device);
>>   		if (ret)
>>   			goto unregister_platform_driver;
>> -
>> -		break;
>>   	}
>>   
>>   	return 0;
