Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16617E5F20
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 21:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0E10E192;
	Wed,  8 Nov 2023 20:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EE310E192
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699475225; x=1700080025; i=deller@gmx.de;
 bh=PzL58AvbtGcfgsxkUOdqNMeZ4PUfsR0txvD+3v5FfNI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=C6zBKMmxuuTMoebTDSsTjPm0RQE3rZm4TPQnAiy/6U+OYVijFCkgodfu+nb39uhw
 Vx9J1GL0tl2LYt3Jy8Ng9sbTXhdxweCJJb8JcIamQPxQWBsGpAosn8HBGuMIBPAuu
 OP7AvfmvhoX+xvAVrkqebrPPiYcOTxyt6GRxjMgPcxlrT3f1xtcuyPzp+WOCDKaPC
 wA573MvI0iDon4jX83dFEz1Zm4F0EjuygBULbOfa1pNiPV+5n2ctvUf8Afp8Gw0Hi
 qQnmnSe+ChAgMhCZ22fTv7/WNyT1jV6pDQSovqhcaDeZQR2O98DNURQoH+bvLvtBI
 FU54a8MDWIA20eAoqA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.7]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1rkJ2R19J4-00pOdk; Wed, 08
 Nov 2023 21:27:05 +0100
Message-ID: <2b607150-f1ae-4765-8f95-e82b6b8f2467@gmx.de>
Date: Wed, 8 Nov 2023 21:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231108184805.GA1579138@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o1TZe9edV5UGjLIvjztNu2/MEbACddG2j2pG6dgZ5oAPV+Dvi6L
 SvWaPrmv6tqItUlXLWSKU/1DrZpFTnfVtVRoKtlbuXmI1N+llyN0w7EhcR8/whkHVwYN2P8
 D85Q1mBoN9B6EPoen8u3zVxsUi0WEAuJ2M0V8Z6BQZH4RJU0dh58e0a+12/QMusVclazyb+
 Bo2s4cUfxKS2694VVRnLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x17SUxG+Sq0=;2g2XxxZ6tyzifWyNZ9csMk5Dlrz
 w6RLbhFiEZcqtuq+7TvIUTRHAk6kLVIfFxN8RxS68TpyxF7D7/qrTvV1bmkThpXJoQT01eHUd
 lzojrkriUVnLihUuBp9PLeWHPC0pLlZSM5/qatbG2F+FgetKe1aMTW3TLBqSza91OS3xRejUc
 dNnigs/vIsOavGX2zyuHPeFlK2el4EV7goZO5IgTxwq8Qyvms0zJETrCSHvvJToxR1KkwiIei
 4IDXldZKE9iInWjR0HLMlKcERFcmm5diNwhMw1sWFlkWuA8V/I98VWqV0CQG3nHisFG+c26/e
 QygjYaOBeqyskM4NZQGOdClg+KgjLM+VO1FHJOz/ICtWLw++3u5PZ/DeBzmu7yqkykuSlJ7Al
 LXuNHepPH0fUIchAYtpuy7Q+G9gtWCV4gB/nwf92NMma+pKWGsENcl1r453F6ANWUeC/38ggD
 cgqyI6330vcbIQqvz9L3GWcL4KeH7hK4mGurcqR8p0mmLJ2mDGRclIBhWXLF62yAlsDRIxdm9
 1hOSNPtMwdrJxPxlT5YPMaBGLrpD5Lp9a9MFXyy4DPHhMbEEy/ex+cm7HLHcMGLNn//8BV3Dr
 hQm1iKIp/PUlPslgwGfZPV5XYtLZC7V4nBRTthQ+aHQyP8ecuLIKN9hjdj8G8B7nIBoOqniQi
 x07Pcc331eTFe0dTnmVlkYwt8FixOjm78uCE0vpoOc2H/h04qjgDim87P2hIygK+wXn5+I020
 tSpAvMZZSXAlgwON3TAiPu4AOItdrQ69WDCdqKb98n90KsS3gLj8oDWg6SLFTyxTANwkh2cIV
 ze0hptQcSj3aU9WE3Fu3Z9cQjoIJzUxNyDm4TnVta4u6WSKF6oOUcrHl8AUdMJHxCiP/++hMn
 thYCjopcicySkr309gvfEfEtqE5uMEiv1zYRVIiEqovltMSsGn9ng0eCDVXllPePXaZ8CJBCv
 sL812/GkwnHiBgmZpftxgatZ4Ss=
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel@pengutronix.de,
 llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>,
 dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 19:48, Nathan Chancellor wrote:
> On Tue, Nov 07, 2023 at 10:17:43AM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> On today's platforms the benefit of platform_driver_probe() isn't that
>> relevant any more. It allows to drop some code after booting (or module
>> loading) for .probe() and discard the .remove() function completely if
>> the driver is built-in. This typically saves a few 100k.
>>
>> The downside of platform_driver_probe() is that the driver cannot be
>> bound and unbound at runtime which is ancient and also slightly
>> complicates testing. There are also thoughts to deprecate
>> platform_driver_probe() because it adds some complexity in the driver
>> core for little gain. Also many drivers don't use it correctly. This
>> driver for example misses to mark the driver struct with __refdata whic=
h
>> is needed to suppress a (W=3D1) modpost warning:
>>
>> 	WARNING: modpost: drivers/video/fbdev/atmel_lcdfb: section mismatch in=
 reference: atmel_lcdfb_driver+0x4 (section: .data) -> atmel_lcdfb_remove =
(section: .exit.text)
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>>   drivers/video/fbdev/atmel_lcdfb.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/at=
mel_lcdfb.c
>> index a908db233409..b218731ef732 100644
>> --- a/drivers/video/fbdev/atmel_lcdfb.c
>> +++ b/drivers/video/fbdev/atmel_lcdfb.c
>> @@ -1017,7 +1017,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb=
_info *sinfo)
>>   	return ret;
>>   }
>>
>> -static int __init atmel_lcdfb_probe(struct platform_device *pdev)
>> +static int atmel_lcdfb_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev =3D &pdev->dev;
>>   	struct fb_info *info;
>> @@ -1223,7 +1223,7 @@ static int __init atmel_lcdfb_probe(struct platfo=
rm_device *pdev)
>>   	return ret;
>>   }
>>
>> -static int __exit atmel_lcdfb_remove(struct platform_device *pdev)
>> +static int atmel_lcdfb_remove(struct platform_device *pdev)
>>   {
>>   	struct device *dev =3D &pdev->dev;
>>   	struct fb_info *info =3D dev_get_drvdata(dev);
>> @@ -1301,7 +1301,8 @@ static int atmel_lcdfb_resume(struct platform_dev=
ice *pdev)
>>   #endif
>>
>>   static struct platform_driver atmel_lcdfb_driver =3D {
>> -	.remove		=3D __exit_p(atmel_lcdfb_remove),
>> +	.probe		=3D atmel_lcdfb_probe,
>> +	.remove		=3D atmel_lcdfb_remove,
>>   	.suspend	=3D atmel_lcdfb_suspend,
>>   	.resume		=3D atmel_lcdfb_resume,
>>   	.driver		=3D {
>> @@ -1310,7 +1311,7 @@ static struct platform_driver atmel_lcdfb_driver =
=3D {
>>   	},
>>   };
>>
>> -module_platform_driver_probe(atmel_lcdfb_driver, atmel_lcdfb_probe);
>> +module_platform_driver(atmel_lcdfb_driver, );
>>
>>   MODULE_DESCRIPTION("AT91 LCD Controller framebuffer driver");
>>   MODULE_AUTHOR("Nicolas Ferre <nicolas.ferre@atmel.com>");
>> --
>> 2.42.0
>>
>
> For what it's worth, this introduces a warning when building certain
> configurations (such as ARCH=3Darm multi_v5_defconfig) with clang:
>
>    WARNING: modpost: vmlinux: section mismatch in reference: atmel_lcdfb=
_probe+0x6c4 (section: .text) -> atmel_lcdfb_init_fbinfo (section: .init.t=
ext)
>    WARNING: modpost: vmlinux: section mismatch in reference: atmel_lcdfb=
_probe+0x858 (section: .text) -> atmel_lcdfb_fix (section: .init.rodata)
>
> This appears to be legitimate to me? GCC did not warn but I assume that
> is due to differences in inlining. The following clears it up for me,
> should I send a standalone patch or should this be squashed in?

I've squashed it into the original patch.

Thank you!
Helge


> Cheers,
> Nathan
>
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atm=
el_lcdfb.c
> index 88c75ae7d315..9e391e5eaf9d 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -220,7 +220,7 @@ static inline void atmel_lcdfb_power_control(struct =
atmel_lcdfb_info *sinfo, int
>   	}
>   }
>
> -static const struct fb_fix_screeninfo atmel_lcdfb_fix __initconst =3D {
> +static const struct fb_fix_screeninfo atmel_lcdfb_fix =3D {
>   	.type		=3D FB_TYPE_PACKED_PIXELS,
>   	.visual		=3D FB_VISUAL_TRUECOLOR,
>   	.xpanstep	=3D 0,
> @@ -841,7 +841,7 @@ static void atmel_lcdfb_task(struct work_struct *wor=
k)
>   	atmel_lcdfb_reset(sinfo);
>   }
>
> -static int __init atmel_lcdfb_init_fbinfo(struct atmel_lcdfb_info *sinf=
o)
> +static int atmel_lcdfb_init_fbinfo(struct atmel_lcdfb_info *sinfo)
>   {
>   	struct fb_info *info =3D sinfo->info;
>   	int ret =3D 0;

