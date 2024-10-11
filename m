Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E774399A3A3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 14:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AE210EAD5;
	Fri, 11 Oct 2024 12:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="FUorwyPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C45810E12C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1728648876; x=1729253676; i=w_armin@gmx.de;
 bh=2Lx4BjqOxemSrgiJcPsQW8BTG3E3pVcNlidalXKGTeM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FUorwyPoauO+1cCYbWAPION23PF9d3IfcHTiJHMzkce9y3Db8CDYL4z3/f04EN4/
 TDcQZzzDGnyL4bus9bQwe3eAlFe/L6TzoTIXZtAF3xeqtIHx/iQ8mCRNK7/zE8gf/
 B5qzw6Md/zYSrXXv74OTr29SrdHa/AgjwYHv2farxLOs0+y4UFplGK8HY1WK/d98E
 tyKOkSY/tH0paNjHrDwZyKzyAkaOffed0Xd/Xo7zx0xLY+sKzhC6G/YbIeTWfdh0/
 HDn9Swpux5Gn0x5wVpj5tu7S87u1X2g4k+im9RVZFi9SdrtHnPp3Wg+SQ/gAwcvI3
 t+kcruN0JZ02a3MEJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.154.201] ([141.76.185.172]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpOT-1taUAU3uif-00dHkO; Fri, 11
 Oct 2024 14:14:36 +0200
Message-ID: <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
Date: Fri, 11 Oct 2024 14:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>,
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
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LOHS+CHWlk5R5g0WJIRAcpU4DziE7QkscDFMqDJyROhn82Qi4Sk
 B/OuZvYhdKFAsxXBu275P8ufMqEg0Dk/ajd8VYEpquFAnxUMOJ2bWpDVpi9HK1OOcn+yaSR
 UNAUuHN4z0nrPslbHjlrnA3xKPeOLqFdDLMjF53yTu68AFpt7OGCZJBMZaUsDlE/n/MDBUq
 HfxIM0sr1ehDdMmIKvnyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HfTPthU7cqU=;GG1fQbSAwJwoGB5clOYbHj/LRjA
 RMa7WsJzUWxiY01RkIjs1CcZTwGqqqApE93/2Xn93/g65Qn66jkWngD9Jaxc9cgVXIXlhtZlQ
 UerrMzYTMWwRredbTbyatBTuEEjzWplDa5/YWp7xTzr7CIDKVKP3uRftZqXMOpDQKaOWvMS/V
 GWujDjSPWWUUBddFyKgW4xubShh6jO9VlxOy3N1Ex+L1oXnbvnrkuBnvN2EcYY4LQ3NHQX0v+
 lbRRPUcrnqqeDC83t1CmYgwFScGwOuoTxuC57ZsYyZ/+vpyBEgwAhRAxDya9vPUMS/JeK2ILA
 sYL83jcIzEOM7cXeYPwUXhqVrHQsQ8rhWQAuN2sXdJJVMEpTbyKlKJYLAJfkLGojt7h54qe2t
 peUjBu3xu+EezY/hgTzCx+fFD6+IDAv+iWtFe1IhoKJ9U+ULP21stqpMWgKGykJBxkzbDrUdI
 544fa4/VDw8Zi88DC9Q9hYmJQNXVR0vxQ5EfoP7YKC9FISjwPD9FsvNgYG1aoR9tB8mcrJW/L
 SAqsGxsPWhEGnQ5pu6WCNbcxIfPsIesRQyQmfANY/WGoYb7GXUUn1q4SBEii4X8Lyw+PrssAX
 ZKwZ8JLDFfFHdBB3v8bRGcdAhqZVovT5P0xtas9SZXMvpOxWZu0tsfvPOGCEZYhnm4qhi51H4
 RLzXO1JZrgrBIV55jwZ69KsKZjAWv8FkyySkVGKOWv00uw5LxsjaVaK1F7OM6jvpwf/CpCPrU
 r9GlfBCpJoHqtPadThp86PLpembWyXneDjwAYIXgkbreidL3YAKKzAtqoEXog4x6m1qHtVURx
 QNzI9CFifHtbD24kvk1ctPp+OJVsaWO7ygR+v7l3kTuDA=
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

Am 09.10.24 um 11:55 schrieb Werner Sembach:

> Resend because HTML mail ..., but I think I now know when Thunderbird
> does it: Every time I include a link it gets converted.
>
> Hi
>
> Am 08.10.24 um 17:21 schrieb Benjamin Tissoires:
>> On Oct 08 2024, Werner Sembach wrote:
>>> [...]
>> Yeah, it just means that you can query or send the data. You can also
>> use HIDIOCGINPUT() and HIDIOCSOUTPUT() to get a current input report an=
d
>> set an output report through the hidraw ioctl...
>>
>> Internally, HIDIOCGINPUT() uses the same code path than
>> HIDIOCGFEATURE(), but with the report type being an Input instead of a
>> Feature. Same for HIDIOCSOUTPUT() and HIDIOCSFEATURE().
>
> Ok so just a difference in definition not in implementation.
>
> Then I use a get feature report for the device status function and use
> it as input and output at the same time, and use a set output report
> for the led update function (which technically has a return value but
> i think it's always 0 anyway).
>
> I scoured the old thread about exposing WMI calls to userspace,
> because I remembered that something here came up already.
>
> 1.
> https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
> -> Should be no problem? Because this is not generally exposing wmi
> calls, just mapping two explicitly with sanitized input (whitelisting
> basically).

It would be OK to expose a selected set of WMI calls to userspace and sani=
tizing the input of protect potentially buggy firmware from userspace.

>
> 2.
> https://lore.kernel.org/all/b6d79727-ae94-44b1-aa88-069416435c14@redhat.=
com/
> -> Do this concerns this apply here? The actual API to be used is
> LampArray and the HID mapped WMI calls are just an "internal"
> interface for the BPF driver, but technically UAPI.
>
I see no benefit of using BPF for creating the whole HID reports. Otherwis=
e the HID interface exported by the driver to userspace would be a HID-map=
ped IOCTL interface
with no real benefit.

I think it would make more sense for the driver to export a generic HID La=
mpArray interface, which contains placeholder values for the dimensions. T=
hose values can then
be supplied by a HID-BPF snipped for each individual machine model. This w=
ould indeed be a suitable use of HID-BPF, as this would allow us to omit h=
aving a large quirk
table inside the kernel driver.

Regarding the basic idea of having a virtual HID interface: i would prefer=
 to create a illumination subsystem instead, but i have to agree that we s=
hould be doing this
only after enough drivers are inside the kernel, so we can design a suitab=
le interface for them. For now, creating a virtual HID interface seems to =
be good enough.

Thanks,
Armin Wolf

> Also at Armin and Hans: Do you have comments on this approach?
>
>>> (well as far as I can tell the hut doesn't actual specify, if they
>>> need to
>>> be feature reports, or am I missing something?)
>> They can be both actually. The HUT is missing what's expected here :(.
>>
>> However, looking at the HUT RR 84:
>> https://www.usb.org/sites/default/files/hutrr84_-_lighting_and_illumina=
tion_page.pdf
>>
>>
>> There is an example of a report descriptor, and they are using Features=
.
>> Not Input+Output.
>>
>> And looking even further (above), in 3.5 Usage Definitions:
>> 3.5.2, 3.5.3 and 3.5.5 all of them are meant to be a feature, like:
>> LampArrayAttributesReport CL =E2=80=93 Feature -
>> LampAttributesRequestReport CL =E2=80=93 Feature =E2=80=93
>> LampAttributesResponseReport CL =E2=80=93 Feature =E2=80=93
>> LampArrayControlReport CL =E2=80=93 Feature =E2=80=93
>>
>> 3.5.4: can be either feature or output, like:
>> LampMultiUpdateReport CL =E2=80=93 Feature/Output =E2=80=93
>> LampRangeUpdateReport CL =E2=80=93 Feature/ Output =E2=80=93
>>
>> So I guess the MS implementation can handle Feature only for all but th=
e
>> update commands.
> Thanks for the link, I guess for the BPF driver I will stick to
> feature reports for the LampArray part until there is actually a hid
> descriptor spotted in the wild defining LampMultiUpdateReport and
> LampRangeUpdateReport as Output and not feature.
>>> and there is the pair with LampAttributesRequestReport and
>>> LampAttributesResponseReport.
>> Yeah, not a big deal. The bold IN and OUT are just to say that calling =
a
>> setReport on a LampAttributesResponseReport is just ignored AFAIU.
>>
>>> Sorry for my confusion over the hid spec.
>> No worries. It is definitely confusing :)
>
> On this note as I fathom:
>
> Input Report (usually always get report): Interrupts (the ioctl just
> there to repeat the last one?)
>
> Output Report (usually always set report): Async write, no return
> value (Buffer should stay untouched)
>
> Feature report set: Sync write, no return value (Buffer should stay
> untouched)
>
> Feature report get: Sync read/write (intended only for read, but not
> limited to it, uses singular buffer for both input and output)
>
> I kind of don't get why feature report set exists, but well it's the
> specs ^^.
>
> Regards,
>
> Werner
>
> [*snip*]
>
