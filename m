Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C7376241
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 10:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089F66E81A;
	Fri,  7 May 2021 08:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 by gabe.freedesktop.org (Postfix) with ESMTP id B31716EDA8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 07:18:53 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.172.93]) by mwinf5d51 with ME
 id 1jBK2500L21Fzsu03jBKw6; Fri, 07 May 2021 09:11:21 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 May 2021 09:11:21 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] video: fbdev: imxfb: Fix an error message
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <d7b25026f82659da3c6f7159eea480faa9d738be.1620327302.git.christophe.jaillet@wanadoo.fr>
 <20210507050503.iwrcis2xzhjjthmp@pengutronix.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <5cd9c8de-acd9-9594-38a0-62ecf5734c10@wanadoo.fr>
Date: Fri, 7 May 2021 09:11:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210507050503.iwrcis2xzhjjthmp@pengutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 May 2021 08:40:50 +0000
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
Cc: linux-fbdev@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel-janitors@vger.kernel.org, krzysztof.h1@poczta.fm,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 j.beisert@pengutronix.de, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 07/05/2021 à 07:05, Uwe Kleine-König a écrit :
> Hello Christophe,
> 
> On Thu, May 06, 2021 at 08:57:05PM +0200, Christophe JAILLET wrote:
>> 'ret' is known to be 0 here.
>> No error code is available, so just remove it from the error message.
>>
>> Fixes: 72330b0eeefc ("i.MX Framebuffer: Use readl/writel instead of direct pointer deref")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/video/fbdev/imxfb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
>> index 7f8debd2da06..ad598257ab38 100644
>> --- a/drivers/video/fbdev/imxfb.c
>> +++ b/drivers/video/fbdev/imxfb.c
>> @@ -992,7 +992,7 @@ static int imxfb_probe(struct platform_device *pdev)
>>   	info->screen_buffer = dma_alloc_wc(&pdev->dev, fbi->map_size,
>>   					   &fbi->map_dma, GFP_KERNEL);
>>   	if (!info->screen_buffer) {
>> -		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
>> +		dev_err(&pdev->dev, "Failed to allocate video RAM\n");
>>   		ret = -ENOMEM;
>>   		goto failed_map;
>>   	}
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Are you using this driver, or did you find that problem using some
> static checker?
> 

No, I'm not using this driver AFAIK.

It has been spotted by coccinelle with a hand-made script which tries to 
find places where error code is used before being initialized.

The script in it-self is not really interesting. It is easy to write and 
my own version trigger way to much false positives.

CJ

> Best regards
> Uwe
> 

