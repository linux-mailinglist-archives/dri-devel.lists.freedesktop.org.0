Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FF93EFBA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 10:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E9E10E27F;
	Mon, 29 Jul 2024 08:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="GrJVq4wX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jul 2024 08:18:31 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BEE10E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1722241110; x=1722845910; i=deller@gmx.de;
 bh=ol9UZCxeHIf9f+MQNbkJKRWQS3R5GYHvb0r5duyqsWs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GrJVq4wXDLfw/qQ7dgNgRtvmn0Mli1zYWz078zmFI77KmFQVuuSPm1vZZnCjMQCm
 jO99j/U58R4r4TblkmxvgO5uH9b3H5H0+MSZ9Xs9cuB5g0JowR95r7DmUBWpNpfO+
 +v3aZEXVZwXB6wY8/NoeXpXeyIp3w6TYVyZQWlKBBWkWp+ZkWOC+eBKC70EIdQVdl
 Pf7B+YDyebZoQIb7woMbtllTcclCDsalYqk/VeGudpBHmZlRjBDVhcICwMXpxev+X
 anJojHcpmEq8L44WzfAMqgYhhtOUSFYeYvurHDyGDTN4IulFZSAw0Z+ttWv5+VZz3
 prU8JZeZONPjDeer7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHG8m-1sTzvK31Y8-000jXx; Mon, 29
 Jul 2024 10:13:18 +0200
Message-ID: <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>
Date: Mon, 29 Jul 2024 10:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/hpfb: Fix an error handling path in hpfb_dio_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t2/FUf63T9cgYV7pKIZRxjc0By4VPKPy92SJsak9wiECptn++hi
 siIigicAFccj9cQwiItNundUMH0nK60z55pnEhDSlmpLwnXfaFuWIwENC1WBy9WML3O3Srl
 4n3H06ndFRmzX5OGqJXDUxFJm2Fm+O6r6Z1f211yDCRvRz8RMUJPeD2VI9o99L/bg08oQjC
 5KgintPUV5sVb0ez5AoKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qtpGZfmPzjU=;AhYK+J68gUH3lXSP+IiTC+mvS50
 fFFCd5H+RcIbrMN2Wr5bBaPB9oj5Kd+7x4PMSRMgREKN5EvW+vtPMnBBR9W/FxkkauwHVkbCa
 YbokDCZ8dRPTP5BqP8kGCFMLNKTAr4NbbrXLNEY9n/QYFSBaaXogoeA/8kFxMaFoWwz7X0PIS
 2Cisw6tKxHZEuYw6zeXgGeu9LTflOLyBjz7xt1RTF6snru65EmKZOZxVLw7+pMq3EGdikbdpH
 ibLc4ul0UKfs9fpl6yZBZmutbKauSDPdc8D1k3LmNAfVD7fNJ6+vcOSMHci9GDujEeQACsC2M
 7uv7HtZCzdcCxZcZR2nNU+PWDmYS7h1u0noL3UTT4xTFAQ7s9YWU/JswQn7fNg4E9jite3s4g
 4M1IDoYALnqUokDicSCuFKuWvDAYdrTKioj0Qy4Scy7hWeG0dW6pyKTmC8FwXq3Ysbv/qo4xY
 ZJfDrbHTei3ZJTuAz/xeBGXmsIHAh1f5fimM3GrF4oC3ExjUhujvAYW/fU2fHhklAe0exRO1N
 mJXWEdDwXTj4EkxzeOAFSDA3UPejs2ULXPp8hSnhF720g9ksEPuBUWOe1vPujlh1sXdaAAryN
 88Z1wIOp16pLGYYTE30D8Wq5MIgSbwU2qmLKvywBNqAiGkV+i/jf7m6AGI5clw5gBMEUW1jZ+
 CBFtaEP+mpf6jNKCYUP6cVPkQVhMbNzN5E2zFvok1DNe5DW0Qbf0GN/BajxomwS1coB3a0g1n
 vEfeMueiRV/zF+q+jX6QEDpKOPTZckHDvoQbKGDV6Mnk/99JpiO0cXl/pBouOnpMCs0w2HADT
 pqmm2n7E2CHMvw0fI0UPdijQ==
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

On 7/28/24 20:29, Christophe JAILLET wrote:
> If an error occurs after request_mem_region(), a corresponding
> release_mem_region() should be called, as already done in the remove
> function.

True.

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

I think we can drop this "Fixes" tag, as it gives no real info.

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> *Not* even compile tested only.

Ok.

> I don't know on what architecture it relies on.

HP300 are old HP machines with an m68k CPU.
Not sure if someone still has such a machine :-)

> So it is provided as-is
> ---
>   drivers/video/fbdev/hpfb.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
> index 66fac8e5393e..87b8dcdc1cf3 100644
> --- a/drivers/video/fbdev/hpfb.c
> +++ b/drivers/video/fbdev/hpfb.c
> @@ -342,12 +342,17 @@ static int hpfb_dio_probe(struct dio_dev *d, const=
 struct dio_device_id *ent)
>   	}
>   	printk(KERN_INFO "Topcat found at DIO select code %d "
>   	       "(secondary id %02x)\n", d->scode, (d->id >> 8) & 0xff);
> -	if (hpfb_init_one(paddr, vaddr)) {
> -		if (d->scode >=3D DIOII_SCBASE)
> -			iounmap((void *)vaddr);

This driver hasn't changed in years, and I don't expect we will
have many other changes, so in this case I think simply adding the one lin=
e:
+	release_mem_region(d->resource.start, resource_size(&d->resource));
here is sufficient without adding additional jump targets.

I can fix it up here, or please send a new patch.

Helge


> -		return -ENOMEM;
> -	}
> +	if (hpfb_init_one(paddr, vaddr))
> +		goto err_unmap;
> +
>   	return 0;
> +
> +err_unmap:
> +	if (d->scode >=3D DIOII_SCBASE)
> +		iounmap((void *)vaddr);
> +	release_mem_region(d->resource.start, resource_size(&d->resource));
> +
> +	return -ENOMEM;
>   }
>
>   static void hpfb_remove_one(struct dio_dev *d)

