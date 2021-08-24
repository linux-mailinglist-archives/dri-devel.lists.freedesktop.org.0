Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61503F6A14
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 21:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDEA898CE;
	Tue, 24 Aug 2021 19:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp12.smtpout.orange.fr
 [80.12.242.134])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3AB1898CE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 19:46:44 +0000 (UTC)
Received: from [192.168.1.18] ([90.126.253.178]) by mwinf5d35 with ME
 id lXfC2500Q3riaq203XfC8y; Tue, 24 Aug 2021 21:39:13 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 24 Aug 2021 21:39:13 +0200
X-ME-IP: 90.126.253.178
Subject: Re: [PATCH] parisc/parport_gsc: switch from 'pci_' to 'dma_' API
To: Robin Murphy <robin.murphy@arm.com>,
 James.Bottomley@HansenPartnership.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-parisc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <93b21629db55629ec3d384e8184c4a9dd0270c11.1629754126.git.christophe.jaillet@wanadoo.fr>
 <1a6f5b12-7cf2-cdb8-7a60-20c2d2ee38f3@arm.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <c9d650ba-686a-7813-b0a1-eaef4eef612e@wanadoo.fr>
Date: Tue, 24 Aug 2021 21:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1a6f5b12-7cf2-cdb8-7a60-20c2d2ee38f3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Le 24/08/2021 à 12:24, Robin Murphy a écrit :
> On 2021-08-23 22:30, Christophe JAILLET wrote:
>> The wrappers in include/linux/pci-dma-compat.h should go away.
>>
>> The patch has been generated with the coccinelle script below.
>>
>> @@
>> expression e1, e2, e3, e4;
>> @@
>> -    pci_free_consistent(e1, e2, e3, e4)
>> +    dma_free_coherent(&e1->dev, e2, e3, e4)
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>>     https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
>>
>> This has *NOT* been compile tested because I don't have the needed
>> configuration.
>> ssdfs
>> ---
>>   drivers/parport/parport_gsc.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/parport/parport_gsc.c 
>> b/drivers/parport/parport_gsc.c
>> index 1e43b3f399a8..db912fa6b6df 100644
>> --- a/drivers/parport/parport_gsc.c
>> +++ b/drivers/parport/parport_gsc.c
>> @@ -390,9 +390,8 @@ static int __exit parport_remove_chip(struct 
>> parisc_device *dev)
>>           if (p->irq != PARPORT_IRQ_NONE)
>>               free_irq(p->irq, p);
>>           if (priv->dma_buf)
>> -            pci_free_consistent(priv->dev, PAGE_SIZE,
>> -                        priv->dma_buf,
>> -                        priv->dma_handle);
>> +            dma_free_coherent(&priv->dev->dev, PAGE_SIZE,
>> +                      priv->dma_buf, priv->dma_handle);
> 
> Hmm, seeing a free on its own made me wonder where the corresponding 
> alloc was, but on closer inspection it seems there isn't one. AFAICS 
> priv->dma_buf is only ever assigned with NULL (and priv->dev doesn't 
> seem to be assigned at all), so this could likely just be removed. In 
> fact it looks like all the references to DMA in this driver are just 
> copy-paste from parport_pc and unused.
> 
> Robin.
> 

Agreed. I had the same reaction, but as the patch should basically be a 
no-op, it looked safe, even if non-optimal.

Looking at parport_gsc_private, pword, readIntrThreshold and 
writeIntrThreshold also look unused.

My own goal is to remove the 'pci_free_consistent()' call in order to 
remove a deprecated API.

As said, I can not compile this driver.
I could send a blind fix that axes 'pci_free_consistent()' and remove 
some fields in parport_gsc_private, but I'm not sure that it is the best 
way to go.

Do you prefer to look at it by yourself or do you prefer to compile test 
my trials?


CJ



>>           kfree (p->private_data);
>>           parport_put_port(p);
>>           kfree (ops); /* hope no-one cached it */
>>
> 

