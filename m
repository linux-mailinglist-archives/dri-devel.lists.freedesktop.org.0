Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6953EC901C5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 21:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F07710E81D;
	Thu, 27 Nov 2025 20:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="rTJnv/Na";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE3110E81D;
 Thu, 27 Nov 2025 20:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764275362; x=1764880162; i=w_armin@gmx.de;
 bh=Yd13Nfp4oksgRJLK18sDWP0myaxbW5mj/m/FYQoCxqg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rTJnv/NaVpg2R5keG7D8J5cSpYaN4U9bOtgfHX5mvkcguQlWmQdQuqk6dfU6AhNG
 59FQWFhB4NyrAnwcmeQwN7v21qAWh1574dK0+dyVi/OO7sPniSXY4ao7Vu71Kwa6k
 jUNJpd1xWwJ6vtDEmUrQnWr0+02OA/mD1F0QcHTUyGCW9iTeukWzQJcZ0jrkIQof4
 Ob0jgbiHF77i2HkIIP1RNgUYS5r/B8bsUeA84OCG4FMbTM/YpvoDFwJoi9v3DdwTH
 HsUojQr/3+8iVuK/XCUg8fRt1HEaler3P0++tFQqXAuwyKEvVnM3c4K3KSzSWKtEU
 zvzTVbwOHe8nLm1tWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KYb-1w950F1mY5-00s55S; Thu, 27
 Nov 2025 21:29:22 +0100
Message-ID: <cf86344b-d9f1-4d3c-9fe9-deeb4ade9304@gmx.de>
Date: Thu, 27 Nov 2025 21:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-pci@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
 <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
 <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de>
 <CAJZ5v0hdqY-=O5Ai6c5qjMr_pRFc+SDyV1QruM=ZeHH9Z=guSg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJZ5v0hdqY-=O5Ai6c5qjMr_pRFc+SDyV1QruM=ZeHH9Z=guSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ze+2vo8ED78xoOrvJ36miC1oEQfJjNTUlWuWjASXtJHjsrUA405
 YZDMIbIrWzGit90P9Czhl0GttAUpo1b392W4Ymvc5mXeA8zW+l1CJc6HzQ+E3iBdUMok7pZ
 QDWa0aCmsN6V1X7AxbYNlL/KNIB46dtMpZQ7sakxcltUWF7mpHpZ5XlckY+5ozbWDBX1v4H
 4rvQFhr2LYkgKymN5+Ucg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F6q/9h+YC/0=;971bq6CGsSOcPgES6YNWNdeOwg+
 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
 0gcrLdnv8iX/IozjTfxNPakm5wgdn
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

Am 27.11.25 um 19:22 schrieb Rafael J. Wysocki:

> On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
>>
>>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wr=
ote:
> [...]
>
>>>> ---
>>>> Armin Wolf (8):
>>>>         thermal: core: Allow setting the parent device of cooling dev=
ices
>>>>         thermal: core: Set parent device in thermal_of_cooling_device=
_register()
>>>>         ACPI: processor: Stop creating "device" sysfs link
>>> That link is not to the cooling devices' parent, but to the ACPI
>>> device object (a struct acpi_device) that corresponds to the parent.
>>> The parent of the cooling device should be the processor device, not
>>> its ACPI companion, so I'm not sure why there would be a conflict.
>>   From the perspective of the Linux device core, a parent device does n=
ot have to be
>> a "physical" device. In the case of the ACPI processor driver, the ACPI=
 device is used,
>> so the cooling device registered by said driver belongs to the ACPI dev=
ice.
> Well, that's a problem.  A struct acpi_device should not be a parent
> of anything other than a struct acpi_device.

Understandable, in this case we should indeed use the the CPU device, espe=
cially since the fwnode
associated with it already points to the correct ACPI processor object (at=
 least on my machine).

>> I agree that using the Linux processor device would make more sense, bu=
t this will require
>> changes inside the ACPI processor driver.
> So be it.

OK.

>> As for the "device" symlink: The conflict would be a naming conflict, a=
s both "device" symlinks
>> (the one created by the ACPI processor driver and the one created by th=
e device core) will
>> be created in the same directory (which is the directory of the cooling=
 device).
> I see.
>
> But why is the new symlink needed in the first place?  If the device
> has a parent, it will appear under that parent in /sys/devices/, won't
> it?
>
> Currently, all of the thermal class devices appear under
> /sys/devices/virtual/thermal/ because they have no parents and they
> all get a class parent kobject under /sys/devices/virtual/, as that's
> what get_device_parent() does.
>
> If they have real parents, they will appear under those parents, so
> why will the parents need to be pointed to additionally?

The "device" smylink is a comfort feature provided by the device core itse=
lf to allow user space
application to traverse the device tree from bottom to top, like a double-=
linked list. We cannot
disable the creation of this symlink, nor should we.

> BTW, this means that the layout of /sys/devices/ will change when
> thermal devices get real parents.  I'm not sure if this is a problem,
> but certainly something to note.

I know, most applications likely use /sys/class/thermal/, so they are not =
impacted by this. I will
note this in the cover letter of the next revision.

>>>>         ACPI: fan: Stop creating "device" sysfs link
>>>>         ACPI: video: Stop creating "device" sysfs link
>>> Analogously in the above two cases AFAICS.
>>>
>>> The parent of a cooling device should be a "physical" device object,
>>> like a platform device or a PCI device or similar, not a struct
>>> acpi_device (which in fact is not a device even).
>>   From the perspective of the Linux device core, a ACPI device is a per=
fectly valid device.
> The driver core is irrelevant here.
>
> As I said before, a struct acpi_device object should not be a parent
> of anything other than a struct acpi_device object.  Those things are
> not devices and they cannot be used for representing PM dependencies,
> for example.
>
>> I agree that using a platform device or PCI device is better, but this =
already happens
>> inside the ACPI fan driver (platform device).
> So it should not happen there.

I meant that the ACPI fan driver already uses the platform device as the p=
arent device of the
cooling device, so the ACPI device is only used for interacting with the A=
CPI control methods
(and registering sysfs attributes i think).

>> Only the ACPI video driver created a "device" sysfs link that points to=
 the ACPI device
>> instead of the PCI device. I just noticed that i accidentally changed t=
his by using the
>> PCI device as the parent device for the cooling device.
>>
>> If you want then we can keep this change.
> The PCI device should be its parent.

Alright, i will note this in the patch description.

>>>>         thermal: core: Set parent device in thermal_cooling_device_re=
gister()
>>>>         ACPI: thermal: Stop creating "device" sysfs link
>>> And this link is to the struct acpi_device representing the thermal zo=
ne itself.
>> Correct, the ACPI thermal zone driver is a ACPI driver, meaning that he=
 binds to
>> ACPI devices. Because of this all (thermal zone) devices created by an =
instance of
>> said driver are descendants of the ACPI device said instance is bound t=
o.
>>
>> We can of course convert the ACPI thermal zone driver into a platform d=
river, but
>> this would be a separate patch series.
> If you want parents, this needs to be done first, but I'm still not
> sure what the parent of a thermal zone would represent.
>
> In the ACPI case it is kind of easy - it would be the (platform)
> device corresponding to a given ThermalZone object in the ACPI
> namespace - but it only has a practical meaning if that device has a
> specific parent.  For example, if the corresponding ThermalZone object
> is present in the \_SB scope, the presence of the thermal zone parent
> won't provide any additional information.

To the device core it will, as the platform device will need to be suspend=
ed
after the thermal zone device has been suspended, among other things.

> Unfortunately, the language in the specification isn't particularly
> helpful here: "Thermal zone objects should appear in the namespace
> under the portion of the system that comprises the thermal zone. For
> example, a thermal zone that is isolated to a docking station should
> be defined within the scope of the docking station device."  To me
> "the portion of the system" is not too meaningful unless it is just
> one device without children.  That's why _TZD has been added AFAICS.

I think you are confusing the parent device of the ThermalZone ACPI device
with the parent device of the struct thermal_zone_device.

I begin to wonder if mentioning the ACPI ThermalZone device together with =
the
struct thermal_zone_device was a bad idea on my side xd.

>>>>         thermal: core: Allow setting the parent device of thermal zon=
e devices
>>> I'm not sure if this is a good idea, at least until it is clear what
>>> the role of a thermal zone parent device should be.
>> Take a look at my explanation with the Intel Wifi driver.
> I did and I think that you want the parent to be a device somehow
> associated with the thermal zone, but how exactly?  What should that
> be in the Wifi driver case, the PCI device or something else?
>
> And what if the thermal zone affects multiple devices?  Which of them
> (if any) would be its parent?  And would it be consistent with the
> ACPI case described above?
>
> All of that needs consideration IMV.

I agree, but there is a difference between "this struct thermal_zone_devic=
e depends on
device X to be operational" and "this thermal zone affects device X, devic=
e Y and device Z".

This patch series exclusively deals with telling the driver core that "thi=
s struct thermal_zone_device
depends on device X to be operational".

Thanks,
Armin Wolf

