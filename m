Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B856571127D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B0B10E6FF;
	Thu, 25 May 2023 17:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596810E6FF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 17:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1685036357; i=deller@gmx.de;
 bh=dGkmEijQeyVfl8qKQ3M1K+a+v3j8D4UMsrjdQ/Ss0sI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UUDeXFx3knYs5BBPJ7mK/9QTOWMigsc9rLrbXHiPKKK4lZjFJy92EccdvOlBmY+Wq
 /lslfThyMM1zDqzv1QKijxR3M1qe9rIHA8VeOsI5vEqkdAiQAZLwdw2ExG2BfSKJH7
 MhenVry1VBe3m221xFPq33sXarDMtYUk+7WiZZ522hDHtF2PDReJfSINvsizXEkQNS
 /h82rsQQfTMAobTUVIJoWfLocCOeueonp4njpvSHotrnxkXsrndvDKCp+mpKTbciK9
 pTNVFSr4d+mgYyAUuQSEFnXsbCXMDryJTWeLl8tJd9jhddTWDw9lnxzouA+0JiusfA
 ASiQse66rKqmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.173]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFvj-1ps5vV3Y2v-00AGSS; Thu, 25
 May 2023 19:39:16 +0200
Message-ID: <446a2a2a-155b-1fe3-44f3-89033b80ad34@gmx.de>
Date: Thu, 25 May 2023 19:39:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] fbdev: imsttfb: Fix error handling in init_imstt()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <c551c670-7458-ed50-eb2f-5a2b7ba421a8@web.de>
 <7e5643de-5d64-272e-cb36-bbe1e5c187ec@gmx.de>
 <1d7228fb-f1f8-364c-aa29-5719a9da1fc6@web.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <1d7228fb-f1f8-364c-aa29-5719a9da1fc6@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TZV0p5eR83WJ51IM6S8Z0c5/DcY/szlYHtkBeYayMx+sEbjb6My
 DV/Q6f9kG5eqKkBd9sUxpzbN8Z806wMD/0i3mQRazFtVl67vWNEc6TCWQBG+n6F2R3jSNin
 stzbyz/uP15JcKuo6tAaXbEL6KAQ+vMGV54I6eRafI8+Tq+ozR0BX/Rn/aQfAMID6K/0UgK
 ROMzh1r+oUXPU/Sqi+qqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nLsrtoL4Elw=;2eCOJwl1hLmLBmRzJDNX32Y+1pA
 nJumhqLPU7a5u3RK7xtr0K2hWRICnR8tP1oMYJj746mNJw6et4VQsWPLTLFUCZt3BRE8vP7c5
 +ESNogAvyRrZR15Y2BCoAlD6DTYzyCoyQSZ1bosqWJUcFNRYiK76XSWRaOt7vNwVHk3tr/IHb
 xED8Aw/zs7SCQmPJpLRlbYpwyUIIX7ENEySVci7bV+tUAwgPJLyuNTQM6iV5owc9xBFgVnXwX
 2dpCQoI5WaFhS5fYeGW0FsyS3Qb/e2COrRcU8M0M/CguPH8+ZlQkrNBV+/10sItEXYItccRRR
 D4Cw1aVVBN5pIvdnNvRA2FP/7hwn9g4kcUTM37kkI+WoZ9mR8yE3KgBXBrtPvlYkL7xlVCu96
 RcWWn7FFxuiDeRnqBLvvIwINRhUcjdEcqr0roxg20v/oh22fvIQCnD4rWI5XcatE/RSdqagXW
 wdC7K0Xfueiypc1xNrotZjPHyUuSMChfaHfpy9Ze/8QZiiXsgaDXs8U7KJHDjxE8vOosOAGS+
 dXKPYbHbN1oRM77y0uy8LxJPsIMwmTmrSOxoschKt19IVg3N9HZsDNJKvJrFthv8TRZqzZ2Pr
 lpbwpiyhPbQATVWJQWZonCF06M3HYfG8l3SRaC8o+v4O7LvXmpVMHBPQzUO40qXciCysQuMde
 fluTUS3aEhQcSYT5lUVMmI9Ro9OJkPggEsdz6uaLZHgSKs4+5tLYeOxP7Q9U0zTK0RnxQxamz
 qBPYFtP7+Ji0Cd/M7LeMlLtRp8ZFTpaW7K1vMozvHiamtX8sAv9yzWqko6H1c2jIaKeSr9GwJ
 OsB8yP5+3hAQdG5bhUyuxEVG1r90TaudaHY07f0dNU9BMixje0JmgVXr9wu4KxefkN5y/CUgv
 eGgInMNBhkI25Gd2NdQYrtRB+k6PLM6K45NMIah2bMm3ZJ7GMcd/bjUljtpmTZ/gGnXYU6D7U
 EyL+tTRolD2Y/d++riwdRp3eS90=
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/23 07:33, Markus Elfring wrote:
>>> The return value was overlooked from a call of
>>> the function =E2=80=9Cfb_alloc_cmap=E2=80=9D.
>>>
>>> * Thus use a corresponding error check.
>>>
>>> * Add two jump targets so that a bit of exception handling
>>>  =C2=A0=C2=A0 can be better reused at the end of this function.
> =E2=80=A6
>>> +++ b/drivers/video/fbdev/imsttfb.c
> =E2=80=A6
>>> @@ -1452,17 +1452,25 @@ static int init_imstt(struct fb_info *info)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FBINFO_HWACCEL_FILLRECT |
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FBINFO_HWACCEL_YPAN;
>>>
>>> -=C2=A0=C2=A0=C2=A0 fb_alloc_cmap(&info->cmap, 0, 0);
>>> +=C2=A0=C2=A0=C2=A0 ret =3D fb_alloc_cmap(&info->cmap, 0, 0);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto release_framebuffer;
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (register_framebuffer(info) < 0) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 framebuffer_release(info);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_dealloc_cmap(&info->cma=
p);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto e_nodev;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D (read_reg_le32(par->dc_regs, S=
STATUS) & 0x0f00) >> 8;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_info(info, "%s frame buffer; %uMB v=
ram; chip version %u\n",
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->fix.id, =
info->fix.smem_len >> 20, tmp);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +e_nodev:
>>> +=C2=A0=C2=A0=C2=A0 ret =3D -ENODEV;
>>
>> I think the return value isn't checked at all, so you could
>> simply return below "-ENODEV" for all cases (instead of "return ret").
>> Then you don't need the e_nodev label and can simplify the flow.
>
> Can it be helpful to distinguish involved error codes better?

No.

Helge
