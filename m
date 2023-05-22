Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE5270C4D9
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 20:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2F10E19B;
	Mon, 22 May 2023 18:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F20D10E19F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684778548; i=deller@gmx.de;
 bh=XYc624rp14uGmFw7V+RpipNyamXCae8xWBesq8Wzch0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=DWELf+f1QYUtiGgVl5LdIGZNeQtZw/3/B/ta4721hkXhpkgxodim8XgtQu7P4omRO
 iVyF1ZAfkgQ2walLIawUlQao+VouRtOkfXNqtP3Mx4wKjdM7JpU4VPfuAlayiEe6Cz
 TFGdsYLaRnW0Pwqo0QShTphJutAYcVh02ZtWfoma4SpBCa261bC0SQadFQQxk8/4Ur
 YKij4AdNhChzXXZ7ZzUinkDTe1dTrt/5pG2QGwD4t3jhDZ2P/8kExrIte9Kb/JrSRU
 oEjtkKGMqaTN4Qb0nnITvW1pmGlro6zoYyHqrkpQ+7rmIyF73N0HKlxO5EhcdBjAoB
 iLLHhvNUYtKhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.144.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQXH-1qJVj72W5V-00sJVb; Mon, 22
 May 2023 20:02:28 +0200
Message-ID: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
Date: Mon, 22 May 2023 20:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] video: imsttfb: Fix use after free bug in
 imsttfb_probe due to lack of error-handling of init_imstt
Content-Language: en-US
To: =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Zheng Wang <zyytlz.wz@163.com>
References: <20230427030841.2384157-1-zyytlz.wz@163.com>
 <34gbv2k3lc5dl4nbivslizfuor6qc34j63idiiuc35qkk3iohs@7bshmqu2ue7a>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <34gbv2k3lc5dl4nbivslizfuor6qc34j63idiiuc35qkk3iohs@7bshmqu2ue7a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PfUYXpvWMuOOsXD6z6hDlW4zxrijkqWNQR241XhkbgwSYYR5Exs
 vrMLbqYn9c07gDe+BfLpK2gCSZS7DmcraMknMA/rUrhNqJtJN2o1tWSIdTXmMqdtye1G7B7
 cSuZie+oPXJKuG1OJTM8gF4898l9XlKuOme30KDYWJU//wQItJGL7P3mKmVLJ8TaTQOmduF
 0F9E2t038ndH4jxFPkLeg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u/iktjswmR0=;QcgsMcSYN+1sr1fnL/z4Bk3Ctn5
 9f9SghE3HCO1+MHOIOchWMM4GzgxwChhr0Drb3ZsSMP0Ker/pbbSSXiIkTrFDumbYXegUcOW1
 J46ZMmEzpo0Z1UBqtDGvs3iy7y6XfLZNq4IeIl5WNLh+R83gdMGmCYcLEng5ixVSxukwv2FFQ
 VCsbf/O430+FerLasWH0a+O3ufcBF7DvhMMrSAxg75J9izRDV54DZf6AJ05aDOakd5aBspkWb
 sVDEYNZQUTkkOz/EyP/Gdk9Casuws2/LpOYfWyrwADGSwYnNP6wuqgOsVQv/Hk3BIXnPP7EtN
 i0c1QWm/tSlRSzv1ZfutOJ7PfhxFH9C9uojSM2xsiA1e37s3UqQXfT56zxxgK0hCB5fCLWdFV
 3eDiK5oT1W3cCVQ2uSZwDVh2FHNuMj5qPeZrPFscPSFJypjfCjohoFi/FL+AlXO+3TAW7/Sri
 pdiZa+h+Q24UTBmW/3KmZ/S3NhOcdWpcZT/Zx9RFj5RXkmLQOIRWknlj14C3POpRftz0rQ1Kc
 s9XeBdsLQVmxTNOSU/Ash1t17GhucMmpMm4HUI4mOONAU3CaMRWw3f3ScOYfexojrPg2C/SZ3
 SQS838AT8msUxN+Y3JCtz6vr3rESONTp0PpPfa0HgHF5Ne3DUE2UQkXFOrvB1a+o6DQPQFc47
 PU3PhMh60ygwDe5OB118et7FKXZb+/UDIsVjiJnEYDeK9uWiQpoiu5sO5k6eJWY7iMs36OJFH
 t59wldh+YPiV9FSzXtQMklufhpOxh5RsYVA2CjEy/0PDqpS5kAMFEyLY4CvwOBjscRAroph6i
 RniI9PwpC4JS8ZlmMu66ulrhAyraP1zYRCWLpnv1cfwfk8OAumJ4zPk9+ALULDohE5FbqJMTr
 rG0XxMu6RhxFdeNw/7YSrncx4WbjFc8HVT/msNy++JobkWKLZhWx8wbQztnqZMDhhrBfO7/XJ
 hdbNHA==
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
Cc: alex000young@gmail.com, linux-fbdev@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 1395428693sheep@gmail.com, hackerzheng666@gmail.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michal,

On 5/22/23 17:36, Michal Koutn=C3=BD wrote:
> On Thu, Apr 27, 2023 at 11:08:41AM +0800, Zheng Wang <zyytlz.wz@163.com>=
 wrote:
>>   static int imsttfb_probe(struct pci_dev *pdev, const struct pci_devic=
e_id *ent)
>> @@ -1529,10 +1530,10 @@ static int imsttfb_probe(struct pci_dev *pdev, =
const struct pci_device_id *ent)
>>   	if (!par->cmap_regs)
>>   		goto error;
>>   	info->pseudo_palette =3D par->palette;
>> -	init_imstt(info);
>> -
>> -	pci_set_drvdata(pdev, info);
>> -	return 0;
>> +	ret =3D init_imstt(info);
>> +	if (!ret)
>> +		pci_set_drvdata(pdev, info);
>> +	return ret;
>>
>>   error:
>>   	if (par->dc_regs)
>
> This part caught my eye -- shouldn't the -ENODEV from init_imstt go
> through the standard error with proper cleanup? (It seems like a leak
> from my 30000 ft view, i.e. not sure about imsttfb_{probe,remove}
> pairing.)

Yes, you seem to be right.

> Shouldn't there be something like the diff below on top of the existing =
code?

Yes, but ....


> Regards,
> Michal
>
> diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb=
.c
> index 975dd682fae4..a116ac8ca020 100644
> --- a/drivers/video/fbdev/imsttfb.c
> +++ b/drivers/video/fbdev/imsttfb.c
> @@ -1419,7 +1419,6 @@ static int init_imstt(struct fb_info *info)
>   	if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> =
3) > info->fix.smem_len
>   	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres)))=
 {
>   		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->va=
r.yres, info->var.bits_per_pixel);
> -		framebuffer_release(info);
>   		return -ENODEV;
>   	}
>
> @@ -1455,7 +1454,6 @@ static int init_imstt(struct fb_info *info)
>   	fb_alloc_cmap(&info->cmap, 0, 0);
>
>   	if (register_framebuffer(info) < 0) {
> -		framebuffer_release(info);

That's ^^^  ok, but I think a
	fb_dealloc_cmap()
is missing here ...

... and in the error path of imsttfb_probe() ....

>   		return -ENODEV;
>   	}
>
> @@ -1531,8 +1529,10 @@ static int imsttfb_probe(struct pci_dev *pdev, co=
nst struct pci_device_id *ent)
>   		goto error;
>   	info->pseudo_palette =3D par->palette;
>   	ret =3D init_imstt(info);
> -	if (!ret)
> -		pci_set_drvdata(pdev, info);
> +	if (ret)
> +		goto error;
> +
> +	pci_set_drvdata(pdev, info);
>   	return ret;
>
>   error:

Would you mind sending a proper patch?

Thanks for noticing!
Helge
