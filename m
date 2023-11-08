Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106A57E5FEB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BE110E1A4;
	Wed,  8 Nov 2023 21:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A6A10E1A4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699478650; x=1700083450; i=deller@gmx.de;
 bh=8Z5rOdhJ+964nxGc4A1TZZpBIfOPY/3aNR720qqmPvI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=ahg/Ph+Tz1pJsdC3xoWLa5BFQ6e3SsfyUNoPw3YRT/Ia4HqGiIheMTPB3P0Jftu3
 OwcsrBo0Bd1Awv+rfRNRc9Xa8rsozpqp53LMecbS7sKVrigjqTDyHq28VWbB74D5z
 ANR1W2zJdymTXNcv5Ln8orerFhV59RAm2AC8Q5DXK0ZzhZmTFLIb86HvgV8hXyt9f
 GpGNzzpbmmOY8DmlACxBVWpdPyBNPyCoMBYzsD3IluAmS4k51wZwn8lopdn3SVg1x
 FK7DqKgKNOf/rSm9MXqjj/wjsqO8+neBvSYWXvfvi6Che3e1/Vy85j6H5eu5xoMdv
 RQwpf/wnxibiicfZew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.7]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9Q6-1rJKJy0wK4-00s6EW; Wed, 08
 Nov 2023 22:24:10 +0100
Message-ID: <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
Date: Wed, 8 Nov 2023 22:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
 <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p41QMsghAkhOnmy/DMjWgtNmHWlN2HYxytf+BkZ7Ex3DEaU34p1
 ytD/AU5IKBPFYt/V98Non/34Xf3av0Ky45UVGgVyFjjSJxcW2xvfrOOaqmUzVivGmhOAjrI
 jFMsYzTJloxfXz1eqxDotKcOK7hOrX6fsfUecgHrXCxqA8UhoRWE3O6XKPCzDa4lHofgkJd
 oMlvyu7HxO1lbP7mQdfKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5GbnGJEf6cM=;H8zPtOjzOmo1j2eJ3F+3dggmIrm
 sNisWPpIsaHp82XtKGrapd5ZIs7yi6661c1y8Zcj4zu6KSYjRd3FYZkiGGfzsYKJpINkfUHxF
 ZeQjirVabSoyI7MdFEZP59WUw3SFSBoRAR4QZXdANNU+LcDuaPumYAoz5if62mQ97tGS6QNTk
 uccpIMarNZPxNPbWQSpY3vbhSlzqxVArAx2ZsfByAfRqGa2bCVNM+P8gPaJ81Xpi3kBDPYmpo
 Cc+kFIH5hovgbX8njGkInp/P91O4RhYEXZXTWNaeKXQk1xyTvNM9exRSthEzgud2NpJD3HIKk
 YO0yl47tUnLndg+bRqi8AQVf+O/qtH5NdH50s/jMAWj1BoPEdtVLuxTVdvlkiO2B3OKKGyagO
 UFVfLLdVkxD3QP/eMNIZmOn1O3IUTETIITU9bDZulEOgp4qwdGZEGeq8Bdsmjrs8tiw5G3VaP
 L9f/JSeqx1OLWvAFJgCU5zrT2ZELm+TTjphzH5ecfpmm3gFd2uxySpHA/z3Dzlr8TNoV5tn4R
 J8kzecmvmDVBNY8H0ef6PRJSoMn441jFmobOL017gvFULJ/9ZMXgVy60GIikRQkuBzIRiTJDE
 FbjD4UHsm7LTYioxla2jAdq9PKv1pl9o9H+uokKN+YoHCrH4y3v+8YO2xPyVqlCnbvi/vFxa2
 0SIQCA2O7TGN2tjV03AT3qrMP6nH7QUIWvbaItXzstwc7XgXLCG2SL0kGC2gmSaMO88SXlTmB
 +LJISottxb438HDnHHrdJAWkP47rxn8LTKl8mhyGV8P/PFoZoPTZvAAFyrSiV3LVdGdIGG+N6
 xVWyA/fU4P3lvCt+gp5iZV8sM244wYvdnHzmoU66/dGq9rZZELK0qJZ9FSmkgr1h0xYEe3Ahx
 JNbOcVaNw0ysAbGomASt2rpCSwxGSZLgqpxzN/1FkVGeakAs6GB//ccqdVaOaZTls0aLue9IB
 9XE7+w==
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
Cc: linux-fbdev@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, llvm@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 22:00, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Nov 08, 2023 at 11:48:05AM -0700, Nathan Chancellor wrote:
>> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/at=
mel_lcdfb.c
>> index 88c75ae7d315..9e391e5eaf9d 100644
>> --- a/drivers/video/fbdev/atmel_lcdfb.c
>> +++ b/drivers/video/fbdev/atmel_lcdfb.c
>> @@ -220,7 +220,7 @@ static inline void atmel_lcdfb_power_control(struct=
 atmel_lcdfb_info *sinfo, int
>>   	}
>>   }
>>
>> -static const struct fb_fix_screeninfo atmel_lcdfb_fix __initconst =3D =
{
>> +static const struct fb_fix_screeninfo atmel_lcdfb_fix =3D {
>>   	.type		=3D FB_TYPE_PACKED_PIXELS,
>>   	.visual		=3D FB_VISUAL_TRUECOLOR,
>>   	.xpanstep	=3D 0,
>
> I wonder if this was broken already before my patch. atmel_lcdfb_probe()
> does
>
> 	info->fix =3D atmel_lcdfb_fix;
>
> and unless I miss something (this is well possible) that is used e.g. in
> atmel_lcdfb_set_par() -> atmel_lcdfb_update_dma(). So atmel_lcdfb_fix
> should better not live in .init memory?! Someone with more knowledge
> about fbdev might want to take a look and decide if this justifies a
> separate fix that should then be backported to stable, too?!

I don't think a backport this is necessary.
The "__initconst" atmel_lcdfb_fix struct was only copied in the
"__init" atmel_lcdfb_probe() function.
So, both were dropped at the same time in older kernels.

Since your patch dropped the "__init" from atmel_lcdfb_probe(),
the __initconst from atmel_lcdfb_fix has to be removed too.

So, I believe folding in Nathan's patch is OK and we don't need
a seperate (or backport) patch.

Helge
