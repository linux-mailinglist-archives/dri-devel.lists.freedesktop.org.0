Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE14471986B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 12:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E67C10E1A2;
	Thu,  1 Jun 2023 10:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBEF310E1A2;
 Thu,  1 Jun 2023 10:09:27 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxBvFUbnhknz8DAA--.7279S3;
 Thu, 01 Jun 2023 18:09:25 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxi7ZUbnhklAuEAA--.16817S3; 
 Thu, 01 Jun 2023 18:09:24 +0800 (CST)
Message-ID: <44072a8e-8f8b-a151-4306-9fe2e5153ea8@loongson.cn>
Date: Thu, 1 Jun 2023 18:09:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 2/6] drm/etnaviv: add a dedicated function to get
 various clocks
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230530160643.2344551-1-suijingfeng@loongson.cn>
 <20230530160643.2344551-3-suijingfeng@loongson.cn>
 <85565974d45b5553035aeabe8a98a667718482d5.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <85565974d45b5553035aeabe8a98a667718482d5.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bxi7ZUbnhklAuEAA--.16817S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZFy8XF1rAw4UZF1xuw4Uurg_yoW7Gry7pF
 s7J3WYkrW8Zryj9347ZFn8trsakr1xAa4Ik3s0qF9avws0vF4ktryYkFW5XFs5Zry8WF4S
 yr4UKrnrCFyFkrDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
 ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
 87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
 AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07je4EiUUUUU=
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/1 02:07, Lucas Stach wrote:
> Am Mittwoch, dem 31.05.2023 um 00:06 +0800 schrieb Sui Jingfeng:
>> Because it is also platform-dependent, there are environments where don't
>> have CLK subsystem support, for example, discreted PCI gpu. So don't rage
>> quit if there is no CLK subsystem.
>>
>> For the GPU in LS7a1000 and LS2k2000, the working frequency of the GPU is
>> tuned by configuring the PLL register directly.
>>
> Is this PLL under control of system firmware and invisible to Linux?
Yes, it is registers, both system firmware and kernel space driver can 
access it.
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 62 ++++++++++++++++++---------
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  1 +
>>   2 files changed, 42 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index 636d3f39ddcb..4937580551a5 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -1565,10 +1565,45 @@ static irqreturn_t irq_handler(int irq, void *data)
>>   	return ret;
>>   }
>>   
>> +static int etnaviv_gpu_clk_get(struct etnaviv_gpu *gpu)
>> +{
>> +	struct device *dev = gpu->dev;
>> +
>> +	if (gpu->no_clk)
>> +		return 0;
>> +
>> +	gpu->clk_reg = devm_clk_get_optional(dev, "reg");
>> +	DBG("clk_reg: %p", gpu->clk_reg);
>> +	if (IS_ERR(gpu->clk_reg))
>> +		return PTR_ERR(gpu->clk_reg);
>> +
>> +	gpu->clk_bus = devm_clk_get_optional(dev, "bus");
>> +	DBG("clk_bus: %p", gpu->clk_bus);
>> +	if (IS_ERR(gpu->clk_bus))
>> +		return PTR_ERR(gpu->clk_bus);
>> +
>> +	gpu->clk_core = devm_clk_get(dev, "core");
>> +	DBG("clk_core: %p", gpu->clk_core);
>> +	if (IS_ERR(gpu->clk_core))
>> +		return PTR_ERR(gpu->clk_core);
>> +	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
>> +
>> +	gpu->clk_shader = devm_clk_get_optional(dev, "shader");
>> +	DBG("clk_shader: %p", gpu->clk_shader);
>> +	if (IS_ERR(gpu->clk_shader))
>> +		return PTR_ERR(gpu->clk_shader);
>> +	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
>> +
>> +	return 0;
>> +}
>> +
>>   static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
>>   {
>>   	int ret;
>>   
>> +	if (gpu->no_clk)
>> +		return 0;
>> +
> I don't see why this would be needed? If your platform doesn't provide
> CONFIG_HAVE_CLK all those functions should be successful no-ops, so
> there is no need to special case this in the driver.
>
> Or does your platform in fact provide a clk subsystem, just the GPU
> clocks are managed by it?
>
> Also all those functions are fine with being called on a NULL clk,
right
> so
> shouldn't it be enough to simply avoid calling etnaviv_gpu_clk_get() in
> the PCI device case?

Yes, I just tried, your are right.

There also no need to add the 'no_clk' member into struct etnaviv_gpu

> Regards,
> Lucas
>
>>   	ret = clk_prepare_enable(gpu->clk_reg);
>>   	if (ret)
>>   		return ret;
>> @@ -1599,6 +1634,9 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
>>   
>>   static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
>>   {
>> +	if (gpu->no_clk)
>> +		return 0;
>> +
>>   	clk_disable_unprepare(gpu->clk_shader);
>>   	clk_disable_unprepare(gpu->clk_core);
>>   	clk_disable_unprepare(gpu->clk_bus);
>> @@ -1865,27 +1903,9 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>>   		return err;
>>   
>>   	/* Get Clocks: */
>> -	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
>> -	DBG("clk_reg: %p", gpu->clk_reg);
>> -	if (IS_ERR(gpu->clk_reg))
>> -		return PTR_ERR(gpu->clk_reg);
>> -
>> -	gpu->clk_bus = devm_clk_get_optional(&pdev->dev, "bus");
>> -	DBG("clk_bus: %p", gpu->clk_bus);
>> -	if (IS_ERR(gpu->clk_bus))
>> -		return PTR_ERR(gpu->clk_bus);
>> -
>> -	gpu->clk_core = devm_clk_get(&pdev->dev, "core");
>> -	DBG("clk_core: %p", gpu->clk_core);
>> -	if (IS_ERR(gpu->clk_core))
>> -		return PTR_ERR(gpu->clk_core);
>> -	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
>> -
>> -	gpu->clk_shader = devm_clk_get_optional(&pdev->dev, "shader");
>> -	DBG("clk_shader: %p", gpu->clk_shader);
>> -	if (IS_ERR(gpu->clk_shader))
>> -		return PTR_ERR(gpu->clk_shader);
>> -	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
>> +	err = etnaviv_gpu_clk_get(gpu);
>> +	if (err)
>> +		return err;
>>   
>>   	/* TODO: figure out max mapped size */
>>   	dev_set_drvdata(dev, gpu);
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> index 98c6f9c320fc..6da5209a7d64 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> @@ -148,6 +148,7 @@ struct etnaviv_gpu {
>>   	struct clk *clk_reg;
>>   	struct clk *clk_core;
>>   	struct clk *clk_shader;
>> +	bool no_clk;
>>   
>>   	unsigned int freq_scale;
>>   	unsigned long base_rate_core;

-- 
Jingfeng

