Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F44A5E8E9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 01:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15A410E1CB;
	Thu, 13 Mar 2025 00:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="JP9c4+NI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1596F10E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:10:39 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52D09Gjf2730497
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 12 Mar 2025 17:09:16 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52D09Gjf2730497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1741824561;
 bh=pOuTjU0DLlw9muSdV/bvRsUk/zEVswSeTDmcSBtrmzk=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=JP9c4+NI9BKncKU+1PsEB9cZeQpNxCxpJ0LmRuYoHNmwWD/IZKSycv5sN9IICpIEz
 fR/hn+rQhnfZM1uUiHFsG6gUoBL9neiS+JGil7wI30UkDhHcG1QRaLCxVEOb8Avej8
 KQCseXzhw1xoqlckAoMQLS0jGXtjlqSg5eaOuTyA+VT8jx0ImUcERkYzUzACSp2jWz
 iveP8ZtK+pI4qfkTCfKTJm+BI905HMMN61AY3/MbPJkw2r62IkxWg6XH1CtdvGTrlr
 6CALlw7rm8dk1ZxjmoEuThEn4j6+yLh7OqapigzBfq/66ixFRWdc3P5KvqHGfpwwnf
 wFX8jsnXRMF2A==
Date: Wed, 12 Mar 2025 17:09:16 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
 David Laight <david.laight.linux@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
User-Agent: K-9 Mail for Android
In-Reply-To: <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
 <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
Message-ID: <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob=2Ee=2Ekeller@intel=2E=
com> wrote:
>
>
>On 3/7/2025 11:36 AM, David Laight wrote:
>> On Fri, 7 Mar 2025 12:42:41 +0100
>> Jiri Slaby <jirislaby@kernel=2Eorg> wrote:
>>=20
>>> On 07=2E 03=2E 25, 12:38, Ingo Molnar wrote:
>>>>
>>>> * Jiri Slaby <jirislaby@kernel=2Eorg> wrote:
>>>>  =20
>>>>> On 06=2E 03=2E 25, 17:25, Kuan-Wei Chiu wrote: =20
>>>>>> Change return type to bool for better clarity=2E Update the kernel =
doc
>>>>>> comment accordingly, including fixing "@value" to "@val" and adjust=
ing
>>>>>> examples=2E Also mark the function with __attribute_const__ to allo=
w
>>>>>> potential compiler optimizations=2E
>>>>>>
>>>>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>>>>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>>>>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail=2Ecom>
>>>>>> ---
>>>>>>    include/linux/bitops=2Eh | 10 +++++-----
>>>>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/bitops=2Eh b/include/linux/bitops=2Eh
>>>>>> index c1cb53cf2f0f=2E=2E44e5765b8bec 100644
>>>>>> --- a/include/linux/bitops=2Eh
>>>>>> +++ b/include/linux/bitops=2Eh
>>>>>> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsign=
ed long l)
>>>>>>    /**
>>>>>>     * parity8 - get the parity of an u8 value
>>>>>> - * @value: the value to be examined
>>>>>> + * @val: the value to be examined
>>>>>>     *
>>>>>>     * Determine the parity of the u8 argument=2E
>>>>>>     *
>>>>>>     * Returns:
>>>>>> - * 0 for even parity, 1 for odd parity
>>>>>> + * false for even parity, true for odd parity =20
>>>>>
>>>>> This occurs somehow inverted to me=2E When something is in parity me=
ans that
>>>>> it has equal number of 1s and 0s=2E I=2Ee=2E return true for even di=
stribution=2E
>>>>> Dunno what others think? Or perhaps this should be dubbed odd_parity=
() when
>>>>> bool is returned? Then you'd return true for odd=2E =20
>>>>
>>>> OTOH:
>>>>
>>>>   - '0' is an even number and is returned for even parity,
>>>>   - '1' is an odd  number and is returned for odd  parity=2E =20
>>>
>>> Yes, that used to make sense for me=2E For bool/true/false, it no long=
er=20
>>> does=2E But as I wrote, it might be only me=2E=2E=2E
>>=20
>> No me as well, I've made the same comment before=2E
>> When reading code I don't want to have to look up a function definition=
=2E
>> There is even scope for having parity_odd() and parity_even()=2E
>> And, with the version that shifts a constant right you want to invert
>> the constant!
>>=20
>> 	David
>
>This is really a question of whether you expect odd or even parity as
>the "true" value=2E I think that would depend on context, and we may not
>reach a good consensus=2E
>
>I do agree that my brain would jump to "true is even, false is odd"=2E
>However, I also agree returning the value as 0 for even and 1 for odd
>kind of made sense before, and updating this to be a bool and then
>requiring to switch all the callers is a bit obnoxious=2E=2E=2E

Odd =3D 1 =3D true is the only same definition=2E It is a bitwise XOR, or =
sum mod 1=2E
