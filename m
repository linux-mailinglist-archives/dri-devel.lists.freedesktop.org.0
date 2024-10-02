Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8CA98D01D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF32810E6D9;
	Wed,  2 Oct 2024 09:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="kpbDFUYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CB910E6D9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727861246; x=1728466046; i=w_armin@gmx.de;
 bh=4CbXb7tuTYBuSWujcKMKEGXAo7Ryqa79AVB23k+1DCQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kpbDFUYE7l29r312cllodXrLYfuu8T2D/e5XjkHZipm6dGK+iKk5kzIHMCd0fHM5
 /UR9wfRzxTYm1U35GdUnYqngisVM8843w2sDvFtg7xXVQI/1vpWEZUqJjTbmPA0Qb
 k4emRazOY+zITgfnl24P3+g6kba+dQe27tn4E690g7Z2X9Rpn2+XUL6wbM8dCmgYI
 IHZuxCyqh9FGn1NRxri1FzEMB6t14W2scwzWytuLB++c/RZXgkMJAnQuamau8z7WX
 Qc1xdq9L3xHs+6a+1bHm5+FDAbxd3ZIdaLhUiBdnvPvDmuWsTlSKvoWzuZ+x077LO
 i97bEbvAL/2SVDkNVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1sPZpc1vEw-00WC5H; Wed, 02
 Oct 2024 11:27:26 +0200
Message-ID: <f2f013b9-6891-4aa0-9124-95775580f84e@gmx.de>
Date: Wed, 2 Oct 2024 11:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Benjamin Tissoires <bentiss@kernel.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Cc: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <c4e0beb6-acd1-45fa-ad47-f5cf9df89b11@gmx.de>
 <74f8bd23-d85a-4f12-b8db-ebde59f3abe3@tuxedocomputers.com>
 <swb45gt3vvctsmwgevo3ay6vkwoksasc64poj3tnaxsapxlsbg@kkmactexmclj>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <swb45gt3vvctsmwgevo3ay6vkwoksasc64poj3tnaxsapxlsbg@kkmactexmclj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+ZnFb33iWoELopt9RjiayQFakYYuGWpXsCCyV2VwKph5/U29w1Y
 5cp6Hf+FSEOat1OAgPAb2EjjlGaUedjvIvjJRjw6lvG0Mkwo5ETAhY/P/K82W1nDVulja/j
 oyJJDMY31EIqFb56/t+KRdE0mTjsSaIgAtdcLwI3ZMsLRMBaWCSLH9+Tb27ypEk1rs7aiw+
 oSBIwT8GwgZWkppIn4PEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9ig3QZMLYfc=;4aFsh86gSsI3xJG251g5udDPKsz
 ZwDF+fC10BFfImOmmi6icHe+yQy7U3Omej+ihfvOrxJRlUJrtKjtOo9tz8/G1hA0k7uGX5cn8
 C0nGMj5L3X98qmYke7S/xyBiFD0pFY2mh4SJ5xp1YHj182fLkf+8UgUPz1hiw/vuN+rdj8NMU
 bpCUvns650zqS0qId4Wd4JP8OYzN4Vo+CVYmq4r3CpZKcvvaQFI+X858x+AaiI+wNH9LoIkRy
 bMy5WTmeDhMTEcqM606Z/5ZIAc6N57R6+Hdfou/NGj8IhLjVDNuamedL8S+Cd3oorJjumFnF9
 23DqXl4CMPbfLMia5PjtWtfqeidZ1lyBKmRpSuNHbaCr7CZ3hKEisXq7x1E7qDs9jPDbUHQeE
 uAXZHua8uteii80MVFYWUeIEcbHbHVdGAS2BnUmg1DgVEFyipom7HXj+G3r080ylYIORElVA3
 C4qFXwiXR5jzBaJAwJgC8trjwxwWiSIuojIT5azFPQ/0sFxzh20m3guMgb4K4IkiCOCV2+eCD
 ElDcR7myVBKz356T+/WhROPIMeNQtYN4sFmyU5IxQUhNJFkBtVgGQYN5vZnbh+bn2cofyy3SN
 aUmKB6HLlkV1NS41PfI5LdS5tX3mx3GE6UsHz/mzeBhnGo+UMIzMdlj1VGSo9Qs1GdE11b+4r
 HcVlz6cHXQFmW2E/fbc57ygY7+D5J3F/LXZakJiebrGoGJczn9yILCID8sO2mfHsdRzWpc3r4
 7MpqVtO5nfWH+syZ0cC0cX53gwb0fskApVcF3/W/FSqHGp0kuzSRW2DNgv6CXz03uWfLaHFYy
 oeRnkYBq1tDt6000z2demSGzX3ENIZ6iUDlY0XIYCJwLo=
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

Am 02.10.24 um 10:42 schrieb Benjamin Tissoires:

> On Oct 01 2024, Werner Sembach wrote:
>> Hi Armin,
>>
>> Am 01.10.24 um 18:45 schrieb Armin Wolf:
> [...snipped...]
>>> Why not having a simple led driver for HID LampArray devices which exposes the
>>> whole LampArray as a single LED?
>> Yes that is my plan, but see my last reply to Benjamin, it might not be
>> trivial as different leds in the same LampArray might have different max
>> values for red, green, blue, and intensity. And the LampArray spec even
>> allows to mix RGB and non-RGB leds.
>>> If userspace wants to have direct control over the underlying LampArray device,
>>> it just needs to unbind the default driver (maybe udev can be useful here?).
>> There was something in the last discussion why this might not work, but i
>> can't put my finger on it.
> We recently have the exact same problem, so it's still fresh in my
> memory. And here are what is happening:
> - you can unbind the driver with a sysfs command for sure
> - but then the device is not attached to a driver so HID core doesn't
>    expose the hidraw node
> - you'd think "we can just rebind it to hid-generic", but that doesn't
>    work because hid-generic sees that there is already a loaded driver
>    that can handle the device and it'll reject itself because it gives
>    priority over the other driver
> - what works is that you might be able to unload the other driver, but
>    if it's already used by something else (like hid-multitouch), you
>    don't want to do that. And also if you unload that driver, whenever
>    the driver gets re-inserted, hid-generic will unbind itself, so back
>    to square one
>
> So unless we find a way to forward the "manual" binding to hid-generic,
> and/or we can also quirk the device with
> HID_QUIRK_IGNORE_SPECIAL_DRIVER[0] just unbinding the device doesn't
> work.
>
> Cheers,
> Benjamin

I see, maybe we can add support for the driver_override mechanism to the HID bus?
Basically userspace could use the driver_override mechanism to forcefully bind hid-generic
to a given HID device even if a compatible HID driver already exists.

Thanks,
Armin Wolf

> PS: brain fart:
> if HID LampArray support (whatever the implementation, through Pavel's
> new API or simple LED emulation) is in hid-input, we can also simply add
> a new HID quirk to enable this or not, and use that quirk dynamically
> (yes, with BPF :-P ) to rebind the device...
>
> [0] https://lore.kernel.org/linux-input/20241001-hid-bpf-hid-generic-v3-0-2ef1019468df@kernel.org/T/#t
