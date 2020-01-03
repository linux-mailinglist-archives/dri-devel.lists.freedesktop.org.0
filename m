Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC612F7E4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53248914D;
	Fri,  3 Jan 2020 12:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C658914D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:00:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103120025euoutp01d5b8deac82814fa0c33c81ee8796b473~mXq8KONYq2748427484euoutp01S
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:00:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200103120025euoutp01d5b8deac82814fa0c33c81ee8796b473~mXq8KONYq2748427484euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578052825;
 bh=Nml4FDopp8Lof2IWO413DHUK8c3U5jKvH/nyKhNvprQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=EEwn0zB6+kd5BnaZ+N6mVf0+VDSbFS1PjVq7Bb+MOOOdOAA6KGh3UpUVm+vlhDjBJ
 KwzWxA0J6KmrcAQhe8RIyROXleoyNXdBT9HOEpbS5dbx3wrf8yDMoNbHuCTPkzY/4v
 T8/WkY/UsxvzxbMlkXHNQYlsdKIUtL9m1cm3cAMQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103120025eucas1p10bb3252f431a1fbe3d364b01c4efaee6~mXq8EUUbJ0406604066eucas1p1B;
 Fri,  3 Jan 2020 12:00:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.C7.60698.9DC2F0E5; Fri,  3
 Jan 2020 12:00:25 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200103120024eucas1p167363029c80159dc57e02b7fcba04da3~mXq70BEwD0404704047eucas1p1B;
 Fri,  3 Jan 2020 12:00:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200103120024eusmtrp1f6ddcd1048267ad0d764b595b70e81ac~mXq7yfkCS1619416194eusmtrp1H;
 Fri,  3 Jan 2020 12:00:24 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-4b-5e0f2cd9a253
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D1.82.07950.8DC2F0E5; Fri,  3
 Jan 2020 12:00:24 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103120024eusmtip14bae2f131f4163bd69d1fda15052b2d1~mXq7ay2dK2450524505eusmtip12;
 Fri,  3 Jan 2020 12:00:24 +0000 (GMT)
Subject: Re: [PATCH] pxa168fb: Fix the function used to release some memory
 in an error handling path
To: Lubomir Rintel <lkundrak@v3.sk>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <1700b70d-7766-bd6b-10ad-149c73e3998e@samsung.com>
Date: Fri, 3 Jan 2020 13:00:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ca0213fd439a2b569e0d3bdb000712ee62ff4836.camel@v3.sk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87o3dfjjDFY3c1psPTiX1eLK1/ds
 FltvSVuc6PvAanF51xw2i3svZ7NY3Pn6nMWB3aPlyFtWj/vdx5k8lhxczujxeZOcx+e761kD
 WKO4bFJSczLLUov07RK4Mj5Me8tW0CdUsWXbG8YGxk7+LkZODgkBE4nT/c+Zuhi5OIQEVjBK
 nNy8hBXC+cIoseX1ZWaQKiGBz4wSLS+tYDrOvzsGVbScUaL9RTczhPOWUWLytPXsIFXCAukS
 x5Z2M4LYIgKRErO/tzGCFDELzGKUeLz+IxNIgk3ASmJi+yqwIl4BO4nJG5pZQWwWARWJSWcO
 gK0WFYiQ+PTgMCtEjaDEyZlPWEBsTgFniVedt8DizALiEreezGeCsOUltr+dA3aRhMA2dom9
 nzqYIe52kXj97i4jhC0s8er4FnYIW0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfG0SVtcSdc7+A
 bA6gFZoS63fpQ4QdJfZuOsQMEpYQ4JO48VYQ4gg+iUnbpkOFeSU62oQgqtUkNizbwAaztmvn
 SuYJjEqzkLw2C8k7s5C8Mwth7wJGllWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBSej0
 v+NfdzDu+5N0iFGAg1GJhzdBmT9OiDWxrLgy9xCjBAezkghveSBvnBBvSmJlVWpRfnxRaU5q
 8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2Mt2cxz8zovBjLnPn99GvDZ662Fv+3
 PJ8Sv5HvcVv6z5+BzlIzsmvXTVpll7Zh8wdN9U6Omkcbrhl6KrKfsp18Tu6PaWia/atNX9bO
 sHg0VTB07oH1ylP2dFt1W7vrnPp57oZ/XEdL0roopucR4X/mTV/T9DPefZF8RuqM5S0L1pZf
 DJEJb9yxSomlOCPRUIu5qDgRANPMJrc+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xu7o3dPjjDJb+M7PYenAuq8WVr+/Z
 LLbekrY40feB1eLyrjlsFvdezmaxuPP1OYsDu0fLkbesHve7jzN5LDm4nNHj8yY5j89317MG
 sEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZXyY
 9patoE+oYsu2N4wNjJ38XYycHBICJhLn3x1j7WLk4hASWMoo8fLPVaYuRg6ghIzE8fVlEDXC
 En+udbFB1LxmlGg+8oARJCEskC4x/dVGdhBbRCBS4kL7V3aQImaBWYwS/TduMUJ0nGOUWHLr
 CFgVm4CVxMT2VWDdvAJ2EpM3NLOC2CwCKhKTzhxgBrFFBSIkDu+YBVUjKHFy5hMWEJtTwFni
 VectsHpmAXWJP/MuMUPY4hK3nsxngrDlJba/ncM8gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS
 4tz03GIjveLE3OLSvHS95PzcTYzAqNt27OeWHYxd74IPMQpwMCrx8HIo8scJsSaWFVfmHmKU
 4GBWEuEtD+SNE+JNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YELIK4k3NDU0t7A0NDc2Nzaz
 UBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA6Ct5bKeAjI7i72MSkTLqe9snN986vchW6H1Z
 1if5C9cV4plkdzzd02mwc1lNm9KXxtUyaZvnxaXpah3vYelZteudwh3Xk23zuGe675opnsNz
 b/O2z6cVCx9uEPz/7Mmc4+V3AlV25sc/jhDaWmrtOSFxpuukn5sPBXy+/D9V/JeDzxeJgDUp
 J5RYijMSDbWYi4oTAVWbtj7QAgAA
X-CMS-MailID: 20200103120024eucas1p167363029c80159dc57e02b7fcba04da3
X-Msg-Generator: CA
X-RootMTR: 20190902091106epcas2p3519910dfea9c3515cdbe08263a1bcada
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190902091106epcas2p3519910dfea9c3515cdbe08263a1bcada
References: <20190831100024.3248-1-christophe.jaillet@wanadoo.fr>
 <CGME20190902091106epcas2p3519910dfea9c3515cdbe08263a1bcada@epcas2p3.samsung.com>
 <ca0213fd439a2b569e0d3bdb000712ee62ff4836.camel@v3.sk>
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
Cc: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/2/19 11:10 AM, Lubomir Rintel wrote:
> On Sat, 2019-08-31 at 12:00 +0200, Christophe JAILLET wrote:
>> In the probe function, some resources are allocated using 'dma_alloc_wc()',
>> they should be released with 'dma_free_wc()', not 'dma_free_coherent()'.
>>
>> We already use 'dma_free_wc()' in the remove function, but not in the
>> error handling path of the probe function.
>>
>> Also, remove a useless 'PAGE_ALIGN()'. 'info->fix.smem_len' is already
>> PAGE_ALIGNed.
>>
>> Fixes: 638772c7553f ("fb: add support of LCD display controller on pxa168/910 (base layer)")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>

Thanks, patch queued for v5.6 (also sorry for the delay).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Thanks,
> Lubo
> 
>> ---
>> The change about PAGE_ALIGN should probably be part of a separate commit.
>> However, git history for this driver is really quiet. If you think it
>> REALLY deserves a separate patch, either split it by yourself or axe this
>> part of the patch. I won't bother resubmitting for this lonely cleanup.
>> Hoping for your understanding.
>> ---
>>  drivers/video/fbdev/pxa168fb.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
>> index 1410f476e135..1fc50fc0694b 100644
>> --- a/drivers/video/fbdev/pxa168fb.c
>> +++ b/drivers/video/fbdev/pxa168fb.c
>> @@ -766,8 +766,8 @@ static int pxa168fb_probe(struct platform_device *pdev)
>>  failed_free_clk:
>>  	clk_disable_unprepare(fbi->clk);
>>  failed_free_fbmem:
>> -	dma_free_coherent(fbi->dev, info->fix.smem_len,
>> -			info->screen_base, fbi->fb_start_dma);
>> +	dma_free_wc(fbi->dev, info->fix.smem_len,
>> +		    info->screen_base, fbi->fb_start_dma);
>>  failed_free_info:
>>  	kfree(info);
>>  
>> @@ -801,7 +801,7 @@ static int pxa168fb_remove(struct platform_device *pdev)
>>  
>>  	irq = platform_get_irq(pdev, 0);
>>  
>> -	dma_free_wc(fbi->dev, PAGE_ALIGN(info->fix.smem_len),
>> +	dma_free_wc(fbi->dev, info->fix.smem_len,
>>  		    info->screen_base, info->fix.smem_start);
>>  
>>  	clk_disable_unprepare(fbi->clk);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
