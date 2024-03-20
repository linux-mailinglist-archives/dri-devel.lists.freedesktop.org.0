Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CAD88199F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 23:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3228310FFC4;
	Wed, 20 Mar 2024 22:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="QSEhV8ON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9355210FFD0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710974933; x=1711579733; i=deller@gmx.de;
 bh=3CJUGRiLft1RVnawiUIsuSDglEUpPDsyNzOM15MSS5k=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=QSEhV8ONaS6oHkRsdkAQipk66hTrN3gbB6ms3YBI8o8UbUHWsGujy7pQ+mA6pPtv
 FPSBf3inOKgo4FixtoYVW/6l05bqRP3ONHW3sPMGkufSwGV8Y2K/1OeKZ51xLPxo5
 PfYSnHOYoi3fpNTkepdVjThpBzU8mnGG/1tR0pRSSMkmza+s79Lk71JAwIgWF0yjd
 zbLW1vcUud3kNCRAU4kAZHgdgpuhRLLTAFRWHditiH1N998TKtm/bPWRupcAjsRoY
 iHB88YDdE8dW3DFb/xYxFapd0uvXm4jK8BpIlaOIB3wNOVv4QmBk/htffytKDSnj1
 uquhl3njbkxB3v0DKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.145.175]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUjC-1qvnKY3QUk-00rZeL; Wed, 20
 Mar 2024 23:48:52 +0100
Message-ID: <49ba1e7d-d256-4644-beb9-c84b9feb0052@gmx.de>
Date: Wed, 20 Mar 2024 23:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: au1200fb: replace deprecated strncpy with
 strscpy
Content-Language: en-US
To: Justin Stitt <justinstitt@google.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
References: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
 <53670007-edbc-4762-9e57-0b3c29220d9e@gmx.de>
 <CAFhGd8ppVq9aGbfFLeL30jQ15KHS=FoLh0c1udXo=Z+pCfXL1g@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAFhGd8ppVq9aGbfFLeL30jQ15KHS=FoLh0c1udXo=Z+pCfXL1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kgmHypMzAwAtxFRQDJkQB7kMzEJKysT3Hkiuf/eetUOw6R7ltDd
 AwnC1b2e0nWV6oNg6Nxy/Mc85oQ+/mP2Y+mvN0Wyr+7c9Q+HraJDTpo+tI77NSHj4NkjvCt
 V7RUujZdyQGJUOTKNwRdInqIgQ1+RsTSy5Xa+aq4JLTA7jfN83cl37Z/uQh4WBKWRVri8Kp
 YzRlC1K74W0ksW3aDAm7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l9UZQg9+1oI=;bHwAX/wZyhzG8DIIHq3sQE952kW
 1OLjVe+KK6/eNIMKIRwSpdheF4LRdgEmMJDFJljgKzT69usgD0Cq/Lf93B3rVnOmw+0lTJj+3
 RYpJF0klvCjcAezX0aFqF5PSw0NudVWHaqa6rTeP3lwhWuxDW04R8L4SbOTXTO729QByj7eo/
 VVrxYwoeX0jKvoyMBVC22WlvLXcJzqXZ0VsrbI5rDQk7MvPoy1OhLI2pxFzSx0OVMJtxWRcmC
 ElgqwteYzBm9Nfe4NIvGG6f7LI+fhdA29clS+lvW3KUPYNa7M8zOCOObIjI5+XBzlejS6u8Pv
 PXFCYb+cOSrPhasADdWJLPCLJeq5AGwpwuIrVjLCph6ai/izWf/ghyx7jF4i8+tBDYj2+RqPn
 PhCpSWHwJEoLnFzFXn1F4DtnoIUVMtvqCbCMZuGrvDwMihNMg5/skGF7AD3Kprt+jdxpCeQ2p
 +ZDyFbXtmboMvdH+7/BKoh+cVkbcCH6MUJ8v4okQOKIJHj2n9i0D6iaDQaCY9rTOxZxkaXnNL
 GKFG88pTKaP88hrQXoD5FNGjmEJkQAQiuXlJpFUKbP7+FBI8X/INwQYONE3pEYG9/vMH13nTA
 jgCfk6PQxX3OqJxGktzfd0ycou20sw/j0R3fg3nUY4BUeSGl1U4aSYvajHR+5ibi8O+6XCQpc
 e+4IVSw+QmoZDzmEi6B1p0H5FwliKYNejubpfp1yJhXC9paGrHJgJosAGF1VD0ZBCxwPwZNk7
 AogzoBhgzPZ/1WpMi/VZEukhlJiruCg6eBCxXDvXPMyiig20Xnx6yfAcHGyGBongjl8JOazW1
 BA/0HGVS8qldlPoxKSj4G6i9Bdu+5zoe2iXqIOBfM27lU=
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

On 3/20/24 23:35, Justin Stitt wrote:
> Hi,
>
> On Wed, Mar 20, 2024 at 12:56=E2=80=AFAM Helge Deller <deller@gmx.de> wr=
ote:
>>
>> On 3/19/24 00:46, Justin Stitt wrote:
>>> strncpy() is deprecated for use on NUL-terminated destination strings
>>> [1] and as such we should prefer more robust and less ambiguous string
>>> interfaces.
>>>
>>> Let's use the new 2-argument strscpy() which guarantees NUL-terminatio=
n
>>> on the destination buffer while also simplifying the syntax. Note that
>>> strscpy() will not NUL-pad the destination buffer like strncpy() does.
>>>
>>> However, the NUL-padding behavior of strncpy() is not required since
>>> fbdev is already NUL-allocated from au1200fb_drv_probe() ->
>>> frameuffer_alloc(), rendering any additional NUL-padding redundant.
>>> |     p =3D kzalloc(fb_info_size + size, GFP_KERNEL);
>>>
>>> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#s=
trncpy-on-nul-terminated-strings [1]
>>> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.e=
n.html [2]
>>> Link: https://github.com/KSPP/linux/issues/90
>>> Cc: linux-hardening@vger.kernel.org
>>> Signed-off-by: Justin Stitt <justinstitt@google.com>
>>> ---
>>> Note: build-tested only.
>>>
>>> Found with: $ rg "strncpy\("
>>> ---
>>>    drivers/video/fbdev/au1200fb.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au12=
00fb.c
>>> index 6f20efc663d7..e718fea63662 100644
>>> --- a/drivers/video/fbdev/au1200fb.c
>>> +++ b/drivers/video/fbdev/au1200fb.c
>>> @@ -1557,7 +1557,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_=
device *fbdev)
>>>                return ret;
>>>        }
>>>
>>> -     strncpy(fbi->fix.id, "AU1200", sizeof(fbi->fix.id));
>>> +     strscpy(fbi->fix.id, "AU1200");
>>
>> I wonder if you really build-tested this, as this driver is for the mip=
s architecture...
>> And I don't see a strscpy() function which takes just 2 arguments.
>> But I might be wrong....
>
> I did build successfully :thumbs_up:
>
> Commit e6584c3964f2f ("string: Allow 2-argument strscpy()") introduced
> this new strscpy() form; it is present in string.h on Linus' tree.

Interesting patch.
Might give compile problems if patches like yours gets automatically
picked up to stable series as long as Kees patch hasn't been backported ye=
t...
Anyway, thanks for the pointer!
I'll apply your patch in the next round for fbdev.

Helge
