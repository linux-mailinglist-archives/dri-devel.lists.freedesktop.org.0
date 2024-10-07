Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B8993578
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D6210E3F2;
	Mon,  7 Oct 2024 17:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="QUBNoX/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB7110E3F2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 17:57:07 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B54F52FC004D;
 Mon,  7 Oct 2024 19:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1728323826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdldwIyeD16eXrXCJmmOPyc0Ld6j2ynds8Z6PNLTWsE=;
 b=QUBNoX/2cClS6EjpLosxp8Jv29RatROr1BsQQOBVfzg81bezfTWJ/hq5mgL1SYSAAePAAz
 Pmgx2dISHwr74NocOwWEJ8TdgxNZz6WMiY1/YKZ46zkTm1wvo33eGZDpYXeQLqhhFwX8we
 BzGaH1A6DV40AemSLQ7S5m3Bvz7hAJo=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
Date: Mon, 7 Oct 2024 19:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

Am 02.10.24 um 10:31 schrieb Benjamin Tissoires:
> On Oct 01 2024, Werner Sembach wrote:
>> Hi Benjamin,
>>
>> Am 01.10.24 um 15:41 schrieb Benjamin Tissoires:
>>> [...]
>>> PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
>>> all of the requirements here:
>>> - need to be dynamic
>>> - still unsure of the userspace implementation, meaning that userspace
>>>     might do something wrong, which might require kernel changes
>> Well the reference implementetion for the arduiono macropad from microsoft
>> ignores the intensity (brightness) channel on rgb leds contrary to the HID
>> spec, soo yeah you have a point here ...
> Heh :)
>
>>> - possibility to extend later the kernel API
>>> - lots of fun :)
>> You advertise it good ;). More work for me now but maybe less work for me
>> later, I will look into it.
> Again, I'm pushing this because I see the benefits and because I can
> probably reuse the same code on my Corsair and Logitech keyboards. But
> also, keep in mind that it's not mandatory because you can actually
> attach the BPF code on top of your existing driver to change the way it
> behaves. It'll be slightly more complex if you don't let a couple of
> vendor passthrough reports that we can use to directly talk to the
> device without any tampering, but that's doable. But if you want to keep
> the current implementation and have a different layout, this can easily
> be done in BPF on top.
>
> Cheers,
> Benjamin
>
>
> [0] https://lore.kernel.org/linux-input/20241001-hid-bpf-hid-generic-v3-0-2ef1019468df@kernel.org/T/#t

Thinking about the minimal WMI to HID today, but found a problem: a HID feature 
report is either strictly input or output afaik, but the WMI interface has both 
in some functions.

How would I map that?

If I split everything in input and output the new interface wouldn't actually be 
much smaller.

Also what would I write for the usage for the reserved padding in the report 
descriptor. Usage: 0x00?

best regards,

Werner

