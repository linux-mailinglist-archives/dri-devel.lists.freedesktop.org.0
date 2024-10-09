Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9799661D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 11:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E249210E292;
	Wed,  9 Oct 2024 09:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="fGD4vuFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C42D10E6BB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 09:55:51 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 791582FC006B;
 Wed,  9 Oct 2024 11:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1728467749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=matgur0Yk2xRSfUdO/KN7BzP8ABPQVByoZncuZXXpKU=;
 b=fGD4vuFSyVqogi3FuCBaxbDfT8vnbX24Gm5Q9RwoeIcrDEexIWKIlzytxkIKzhTd/Wnz8N
 IESUM+t4PrLqL+RxBGAP+mFBAmLu8y4Jm6Cnc2jUkcAwOq7D1kQbfiznGJ5a/sUU+JXXyi
 cTr5zbTa0d6Z37oD1wCqnh8wf7rgXT4=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
Date: Wed, 9 Oct 2024 11:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Werner Sembach <wse@tuxedocomputers.com>
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
References: <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
 <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
Content-Language: en-US
In-Reply-To: <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
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

Resend because HTML mail ..., but I think I now know when Thunderbird does it: 
Every time I include a link it gets converted.

Hi

Am 08.10.24 um 17:21 schrieb Benjamin Tissoires:
> On Oct 08 2024, Werner Sembach wrote:
>> [...]
> Yeah, it just means that you can query or send the data. You can also
> use HIDIOCGINPUT() and HIDIOCSOUTPUT() to get a current input report and
> set an output report through the hidraw ioctl...
>
> Internally, HIDIOCGINPUT() uses the same code path than
> HIDIOCGFEATURE(), but with the report type being an Input instead of a
> Feature. Same for HIDIOCSOUTPUT() and HIDIOCSFEATURE().

Ok so just a difference in definition not in implementation.

Then I use a get feature report for the device status function and use it as 
input and output at the same time, and use a set output report for the led 
update function (which technically has a return value but i think it's always 0 
anyway).

I scoured the old thread about exposing WMI calls to userspace, because I 
remembered that something here came up already.

1. https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/ -> 
Should be no problem? Because this is not generally exposing wmi calls, just 
mapping two explicitly with sanitized input (whitelisting basically).

2. https://lore.kernel.org/all/b6d79727-ae94-44b1-aa88-069416435c14@redhat.com/ 
-> Do this concerns this apply here? The actual API to be used is LampArray and 
the HID mapped WMI calls are just an "internal" interface for the BPF driver, 
but technically UAPI.

Also at Armin and Hans: Do you have comments on this approach?

>> (well as far as I can tell the hut doesn't actual specify, if they need to
>> be feature reports, or am I missing something?)
> They can be both actually. The HUT is missing what's expected here :(.
>
> However, looking at the HUT RR 84:
> https://www.usb.org/sites/default/files/hutrr84_-_lighting_and_illumination_page.pdf
>
> There is an example of a report descriptor, and they are using Features.
> Not Input+Output.
>
> And looking even further (above), in 3.5 Usage Definitions:
> 3.5.2, 3.5.3 and 3.5.5 all of them are meant to be a feature, like:
> LampArrayAttributesReport CL – Feature -
> LampAttributesRequestReport CL – Feature –
> LampAttributesResponseReport CL – Feature –
> LampArrayControlReport CL – Feature –
>
> 3.5.4: can be either feature or output, like:
> LampMultiUpdateReport CL – Feature/Output –
> LampRangeUpdateReport CL – Feature/ Output –
>
> So I guess the MS implementation can handle Feature only for all but the
> update commands.
Thanks for the link, I guess for the BPF driver I will stick to feature reports 
for the LampArray part until there is actually a hid descriptor spotted in the 
wild defining LampMultiUpdateReport and LampRangeUpdateReport as Output and not 
feature.
>> and there is the pair with LampAttributesRequestReport and
>> LampAttributesResponseReport.
> Yeah, not a big deal. The bold IN and OUT are just to say that calling a
> setReport on a LampAttributesResponseReport is just ignored AFAIU.
>
>> Sorry for my confusion over the hid spec.
> No worries. It is definitely confusing :)

On this note as I fathom:

Input Report (usually always get report): Interrupts (the ioctl just there to 
repeat the last one?)

Output Report (usually always set report): Async write, no return value (Buffer 
should stay untouched)

Feature report set: Sync write, no return value (Buffer should stay untouched)

Feature report get: Sync read/write (intended only for read, but not limited to 
it, uses singular buffer for both input and output)

I kind of don't get why feature report set exists, but well it's the specs ^^.

Regards,

Werner

[*snip*]
