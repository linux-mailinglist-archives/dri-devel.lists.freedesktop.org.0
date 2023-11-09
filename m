Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 734117E72E0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 21:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46F910E02E;
	Thu,  9 Nov 2023 20:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB35B10E02E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 20:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699561869; x=1700166669; i=deller@gmx.de;
 bh=3jA2O5flvizCABXx4ttgZeVpGLkt76gxErJWerUzBgQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=r5M9CiZqN/jtz/zCrhg/fSrcWrivR453BKh8+aUf3OMuz52XcD78AaRdJcuO2CNU
 UImOYdQbY+OQaBrITrvw72QdqzYMSBuGQt3bPapTlMVfuBlx2yBrCL66nBG7V99Fu
 U1xNeHewRw9nQY432/zRLyDCIwg6tf0RkL4v4E/ou5zFoCdnRp9modn6p9gKjrHXP
 jA9ir3NKDF+G81qF8ezJK8Czr0Hua3xnEdaK1XYfZgL+IxrKC0MvHSlqmSgMFiNDz
 uv0AuiF4as7Xa3APEnl/+krkELUyUUahhUY9a/7WEWgRMJbimGP5mXiPuoftflOtx
 F5StcTecgbnh2VwXVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.156]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1qs4tQ1rhh-00QhHh; Thu, 09
 Nov 2023 21:31:09 +0100
Message-ID: <e2f7ef76-7c03-40d6-a985-141dc1a191c2@gmx.de>
Date: Thu, 9 Nov 2023 21:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] fb: amifb: Stop using platform_driver_probe()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-2-u.kleine-koenig@pengutronix.de>
 <CAMuHMdVaaH_ZJT+jAyxZxnVYT3L=b4B-LEMTP4PqQH2TE0nH6g@mail.gmail.com>
 <9559f1d6-f68e-4c14-83b0-e5a545039124@gmx.de>
 <CAMuHMdVsHHPAE5JXjC5rS86H=nDgBMePGU8b1y_wcQYrWZHuTA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAMuHMdVsHHPAE5JXjC5rS86H=nDgBMePGU8b1y_wcQYrWZHuTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wix2lv0/0/bdXp9mIyXaOBLlu/03xgjvPuZko6JduTHlbRKrm5m
 UH5TJyL/vUXuyfieMNLHTHW1aB72Bvw7Mq+M90okobX74Dh1RIw2GZHgX3u19vqo1aFgO5y
 pj3AwP1hGq80f5gHW6ZRo1KRELcsxIcMR8h52x3vyZKqDnYxuCyZZoEqeTAoEZX9vpb2fYF
 XpY0dtkOoxckH99RYrp/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X629G8/7wx4=;9OQbjKko2DnTNSzDf8Epesze6tK
 lnfDlEQjsTFVlSeMec/XiCLA86QwtlJnETZYqAdxGCw+u3Wo9/mzqX7v9EYttmAzfN20T9SAS
 7q0yG19xfC88U944ZlHsiNp6YhpDKU6gLom0u6ynmjS5TGyOHhAAByMfbfLJwYg/1/FrSpLOI
 fTd8x8SMYUi06Rp5HE7yQebKr89J2EohMzv2yZC4EFEahW08kvit/POAJCWKlwdHYrhqWveUU
 WTZiuYFGqYeXZ/o3JQuglGBgB14jGj5jSm0U5kj3HWAXtTvMaBm+C38YSDyetJF0u4vuDuPCU
 hI562qnyuzOtiAP7hpNifpvhv9U9wESJ5Xdoz+Aa0ChlwE2Ood1r9tWJreSO4jKu8OVTcyubU
 fCbLdhI0g+bFZlD/AY0LANh/4UkSVE+R3GR7TwX4ES2mVa6FvvNoMbAaIX1OVCQbcQWBqDw61
 Cp+OIi+9hldefpuDWeFfW9mi8aaEQ13r0WUvbawe9y35DFxZlTqP97NcAmJoUBanT11QX+uz4
 1Makdz0X49SKu4eiSuBpe1lDS71L4TSQv8qpTXwIiIc5MHMOG51ilM15VBkcwM9KYCGOr6TP9
 hRoj1dQ3xR0sUeM3SLRClbEK/dv9U2W0lIIIjQjZTqHDkbVnqLUVg8fFYTnQRKzMi/u2tvjq5
 ej7SOSge75quvu7lBlNYmuCNlWfjE/9Myuai7vFkMN6+IS31W5BtOzHc7uLH6CrJmQ4zV3IlT
 iTGucv6YSIivG82IJtVTbwGkCE1/grvULxaxQ92hzvfnyTszoGG31qErYN0WPjT7pPTl31or5
 FE5/KJ1VodEU5W9y2vqS0Hxi35GOFqB2YhTuA6x6T6goKzUu6bi97mOOYtVYrhm9+9OtUIgU4
 4eKQdrbI+VHr1uwaQAoxJhE6qauqibSlMeiyLORvxo6j/846XKApQgv0cqR7MrU6goJ467I0v
 nf6j9A==
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Atul Raut <rauji.raut@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 22:34, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Wed, Nov 8, 2023 at 10:32=E2=80=AFPM Helge Deller <deller@gmx.de> wro=
te:
>> On 11/8/23 22:06, Geert Uytterhoeven wrote:
>>> On Tue, Nov 7, 2023 at 10:20=E2=80=AFAM Uwe Kleine-K=C3=B6nig
>>> <u.kleine-koenig@pengutronix.de> wrote:
>>>> On today's platforms the benefit of platform_driver_probe() isn't tha=
t
>>>> relevant any more. It allows to drop some code after booting (or modu=
le
>>>> loading) for .probe() and discard the .remove() function completely i=
f
>>>> the driver is built-in. This typically saves a few 100k.
>>>
>>> Which is a lot on platforms with only a few MiBs of RAM...
>>
>> True.
>> Given the warnings below, what is your suggestion?
>> Better to drop the amifb patch ?
>
> I think so. There is a reason these drivers use platform_driver_probe().

Ok, I've dropped both amifb patches.

Helge

