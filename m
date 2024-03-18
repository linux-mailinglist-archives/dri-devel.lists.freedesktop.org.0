Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E203D87F048
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4E010FDA5;
	Mon, 18 Mar 2024 19:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="PJs0KaCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBD410FDA5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710789357; x=1711394157; i=deller@gmx.de;
 bh=baNEB8GwgHQTWX0dtW4C8L51C1M0pt/c+uwolfOihag=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=PJs0KaCdSY4gxFQzbmTkX48JPB5Ilna3KUFW5PnMFF3lGZi4gp12J15ANrnrJtjp
 R9wQjANPzWoHxykVUL9YIyeC5GXdyTbUhRa5sR5UY4GWQVSw2T4dXS7Go3ADS64mx
 kQCRQ+f3bsorFP+DgLr1JJqvplWpHLXjLfTkM5xjtsrhh2IbybUTcYn2dWaKVVty5
 ecgugewfAua8EQYLB95wT8rRbL62Sw3vOTeR6eebBqfI8VMnk3U3Q1T7YWtDma9p0
 M2JKOQiAG2mSjXXnExneS0nEDaJzwTbU6r0PgQkzJDGRpe9Aqtc+UqT76/oYKd7CG
 tYXgkfvq2tmtmaQt/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.155.237]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9uU-1rVJXj1Nze-00ICpH; Mon, 18
 Mar 2024 20:15:57 +0100
Message-ID: <b5d52c4c-534f-4897-ab96-351f09bee89a@gmx.de>
Date: Mon, 18 Mar 2024 20:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbmon: prevent division by zero in
 fb_videomode_from_videomode()
Content-Language: en-US
To: Roman Smirnov <r.smirnov@omp.ru>, Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Karina Yankevich <k.yankevich@omp.ru>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20240305135150.23240-1-r.smirnov@omp.ru>
 <64bbc4dd-b617-4f3d-809e-763bedf37fb7@gmx.de>
 <9688d1d453b0472cb90f5e2151cbd2f8@omp.ru>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <9688d1d453b0472cb90f5e2151cbd2f8@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NnQfhbMNZELSCjyQL7cE+HwHocTPewlUjySjoVafeSmg9ynZy6j
 9dy4WxvW7OQ2d38bmbjwhU4mTS7K65Ln+6K6hikc1UErCN89hbkPDP2WaXt9DG1hUUaN84Q
 DoNAa3URYlNTULC9PqmDklQFacJ0qN+GKkERLdRFZHRCyjM5Nfhc2lfi0VGMoq1gAg0xMUr
 mtHi7d7VoYRuzF6BhCxHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XiJPDnatA9U=;U2lyn5St5sMr/uzFfxS4Q768t0W
 YVOK0cegzBads0UbO9CVJz+sFsmpK/QB20kIH9M/PZv43uNGESKcWzFv65FC81zRbtGG7Pq8F
 dcMWWShyO3Gijvzm+vCfBSvVFwU7h3p9KZtRJv9a0ejpneADjuwLxqif5/jpdEDfR5krl/CqT
 MPOmoU1RTzmNQy3/U7lx8Y2bw2iUrwkGfSW/dTC89ZGwqlszjEp07AGBssPFXeS/YzIN3t+V0
 DeaHsz/1PbEJOazWIPV/X376BldMmWNdHWh7JwtAXR50YGr/C0zUu4HHUiEbJsE1+HB45V2VW
 kzgtAmADuhxddTsASknMf20L1dxypCdGddqlMp3q2D3i9ICmK4CRPsCmZOL3Lh0f3LrtxxSJ8
 51LvDJYy8CGJZn6Ih6tSlK7OsyXjHk41qLfQRhQ8yrI7X1K3nOTqzsuU4J9U/K7D56rDNu+bs
 FsI9PsBriyrvkU/mAQFNWnOyxx9U5dBaz/ldh+2zuRg2U2bxLLjXmB54fg7203NaYoqkUqIpG
 PPPKtuwm9V6+DwVhnYQZ1Oe+1521JpP27BiKAfC85z9LzPvPRNoDfCnI623+xraAkfwNEVXru
 TMll/NlIfd1ByKocsmOor7eG4PEzhCGme0u7Ew2AHsKIxyALHEXXtE8dLSq/fmMGtPFWP21MG
 4qMvBgG6vLcErEY+Z6oafl36JxlWIA45tSWAzhZTlUQIFkNouskUneHnIo8LXdT0EUZabppmj
 H4moEXp9+HI+myFzyc9Iz51gUweeIALd7/eSXQ9/BW2zkyvgKWFW25BGZKMd5rWRrd2D1HsvH
 S2NnskRQndlc25xbk1wfRfhRE4ZmWOXfK3xNebVK4MWG4=
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

On 3/18/24 09:11, Roman Smirnov wrote:
> On Fri, 15 Mar 2024 09:44:08 +0100 Helge Deller wrote:
>> On 3/5/24 14:51, Roman Smirnov wrote:
>>> The expression htotal * vtotal can have a zero value on
>>> overflow.
>>
>> I'm not sure if those always results in zero in kernel on overflow.
>> Might be architecture-depended too, but let's assume it
>> can become zero, ....
>>
>>> It is necessary to prevent division by zero like in
>>> fb_var_to_videomode().
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with Svace.
>>>
>>> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
>>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>> ---
>>>    V1 -> V2: Replaced the code of the first version with a check.
>>>
>>>    drivers/video/fbdev/core/fbmon.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/co=
re/fbmon.c
>>> index 79e5bfbdd34c..b137590386da 100644
>>> --- a/drivers/video/fbdev/core/fbmon.c
>>> +++ b/drivers/video/fbdev/core/fbmon.c
>>> @@ -1344,7 +1344,7 @@ int fb_videomode_from_videomode(const struct vid=
eomode *vm,
>>>         vtotal =3D vm->vactive + vm->vfront_porch + vm->vback_porch +
>>>                  vm->vsync_len;
>>>         /* prevent division by zero */
>>> -     if (htotal && vtotal) {
>>> +     if (htotal && vtotal && (vm->pixelclock / htotal >=3D vtotal)) {
>>
>> why don't you then simply check for
>>          if .. ((htotal * vtotal) =3D=3D 0) ...
>> instead?
>>
>> Helge
>
> Thomas Zimmermann from the previous discussion said:
>
> On Tue, 5 Mar 2024 11:18:05 +0100 Thomas Zimmerman wrote:
>> Maybe use
>>
>>     if (htotal && vtotal && (vm->pixelclock / htotal >=3D vtotal))
>>
>> for the test. That rules out overflowing multiplication and sets
>> refresh to 0 in such cases.
>
> This prevents overflow, which is also a problematic case.

I don't like adding another division here and I doubt we have
a problem with possible overflow.
So, I suggest to keep it simple, something like:
	...
	total =3D htotal * vtotal;
	if (total)
		fbmode->refresh =3D vm->pixelclock / total;
	else...
Helge
