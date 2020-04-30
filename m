Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C61C0EC3
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11536EC35;
	Fri,  1 May 2020 07:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C816E1F8;
 Thu, 30 Apr 2020 15:31:40 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 by skedge03.snt-world.com (Postfix) with ESMTP id 2B4B167A90D;
 Thu, 30 Apr 2020 17:31:38 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 30 Apr
 2020 17:31:37 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.007; Thu, 30 Apr 2020 17:31:37 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Lucas Stach <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Fabio
 Estevam" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "Li
 Jun" <jun.li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Peng Fan
 <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "Russell
 King" <linux+etnaviv@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH 1/4] drm/etnaviv: Prevent IRQ triggering at probe time
 on i.MX8MM
Thread-Topic: [RFC PATCH 1/4] drm/etnaviv: Prevent IRQ triggering at probe
 time on i.MX8MM
Thread-Index: AQHWHu1RaS/QCZFEh0aIMChy0QTuwqiRmPWAgAAQiIA=
Date: Thu, 30 Apr 2020 15:31:37 +0000
Message-ID: <6a5fbb8a-bf28-9c8e-53c7-7a3e5f338a2c@kontron.de>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-2-frieder.schrempf@kontron.de>
 <5e1f804c4c27927d10b2283747c1cae6606abe7c.camel@pengutronix.de>
In-Reply-To: <5e1f804c4c27927d10b2283747c1cae6606abe7c.camel@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <BA4382012F57B34A874DFB7B14B0BD99@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 2B4B167A90D.A1282
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: aford173@gmail.com, anson.huang@nxp.com,
 christian.gmeiner@gmail.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, festevam@gmail.com, jun.li@nxp.com,
 kernel@pengutronix.de, l.stach@pengutronix.de,
 leonard.crestez@nxp.com, linux+etnaviv@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@nxp.com
X-Spam-Status: No
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On 30.04.20 16:32, Lucas Stach wrote:
> Hi Frieder,
> 
> Am Donnerstag, den 30.04.2020, 12:46 +0000 schrieb Schrempf Frieder:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> On i.MX8MM there is an interrupt getting triggered immediately after
>> requesting the IRQ, which leads to a stall as the handler accesses
>> the GPU registers whithout the clock being enabled.
>>
>> Enabling the clocks briefly seems to clear the IRQ state, so we do
>> this before requesting the IRQ.
> 
> This is most likely caused by improper power-up sequencing. Normally
> the GPC will trigger a hardware reset of the modules inside a power
> domain when the domain is powered on. This requires the clocks to be
> running at this point, as those resets are synchronous, so need clock
> pulses to propagate through the hardware.

Ok, I was suspecting something like that and your explanation makes 
total sense to me.

> 
>  From what I see the i.MX8MM is still missing the power domain
> controller integration, but I'm pretty confident that this problem
> should be solved in the power domain code, instead of the GPU driver.

Ok. I was hoping that GPU support could be added without power domain 
control, but I now see that this is probably not reasonable at all.
So I will keep on hoping that NXP comes up with an upstreamable solution 
for the power domain handling.

Thanks,
Frieder

> 
> Regards,
> Lucas
> 
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 29 ++++++++++++++++++++-----
>> --
>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index a31eeff2b297..23877c1f150a 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -1775,13 +1775,6 @@ static int etnaviv_gpu_platform_probe(struct
>> platform_device *pdev)
>>   		return gpu->irq;
>>   	}
>>   
>> -	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
>> -			       dev_name(gpu->dev), gpu);
>> -	if (err) {
>> -		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq,
>> err);
>> -		return err;
>> -	}
>> -
>>   	/* Get Clocks: */
>>   	gpu->clk_reg = devm_clk_get(&pdev->dev, "reg");
>>   	DBG("clk_reg: %p", gpu->clk_reg);
>> @@ -1805,6 +1798,28 @@ static int etnaviv_gpu_platform_probe(struct
>> platform_device *pdev)
>>   		gpu->clk_shader = NULL;
>>   	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
>>   
>> +	/*
>> +	 * On i.MX8MM there is an interrupt getting triggered
>> immediately
>> +	 * after requesting the IRQ, which leads to a stall as the
>> handler
>> +	 * accesses the GPU registers whithout the clock being enabled.
>> +	 * Enabling the clocks briefly seems to clear the IRQ state, so
>> we do
>> +	 * this here before requesting the IRQ.
>> +	 */
>> +	err = etnaviv_gpu_clk_enable(gpu);
>> +	if (err)
>> +		return err;
>> +
>> +	err = etnaviv_gpu_clk_disable(gpu);
>> +	if (err)
>> +		return err;
>> +
>> +	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
>> +			       dev_name(gpu->dev), gpu);
>> +	if (err) {
>> +		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq,
>> err);
>> +		return err;
>> +	}
>> +
>>   	/* TODO: figure out max mapped size */
>>   	dev_set_drvdata(dev, gpu);
>>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
