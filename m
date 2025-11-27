Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C022C90608
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 00:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E1010E8CF;
	Thu, 27 Nov 2025 23:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="b4FpeI0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E57710E894;
 Thu, 27 Nov 2025 23:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764287573; x=1764892373; i=w_armin@gmx.de;
 bh=XH4L8vJd3Pgpkz5I5/5j7PvlshtX9zs5NurfTRvHPhc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=b4FpeI0GdvrvQyS6l8P2lezwX5ckkF2u6ginTiTt37wA7LMBOLrv99J5QRQLj1Uy
 k1kVy5Oj/I91rUSmge7JLM0p7+0n7z0nRY2slB89KPqIRcz+63YNBV35lZhUHtDLB
 B0nbHZV4srXiazlOU6gZFpZ1WpHHAuSZ4RXeQAxk8h7uY+8/nAMeMUCIGQTPClhJO
 wMYI5wzlQv37qSl4LjiG9hg+6LS1+0vOOp/LxW2pTEoJ9jrOncwKijg9H613lgbvv
 FsjHxgfNDzoUFgPlljajXeDpxQnNclRPEhc1GV2uswTdLk+EEhQVGFwyDBEoXm6j5
 Fhl5h/Gw7BO8d+uanQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1wA7ku0qHF-0156NT; Fri, 28
 Nov 2025 00:52:53 +0100
Message-ID: <a2ef1a42-6c06-4186-83ef-e13414fb818a@gmx.de>
Date: Fri, 28 Nov 2025 00:52:47 +0100
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
 <cf86344b-d9f1-4d3c-9fe9-deeb4ade9304@gmx.de>
 <CAJZ5v0iH8jkqJaSNtqaTHxt_305DeiEq0AqQCo4Eho5hMKkU4Q@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJZ5v0iH8jkqJaSNtqaTHxt_305DeiEq0AqQCo4Eho5hMKkU4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D6Q5pBOhq7j59tqn32AlaC7zNQxXY6IiWSrkHAM6P3gKJlbj6J6
 uTxSkHZHP7Jrt8LS6M31wBcEB910kNJD6DwnAUq6LpINXEEK63L9fmub3s1O8nU0ES+qChr
 O97vvWnAxbDtjA1N9QuygQJuv/Ks2U1ByUKDErVnqBHvBEKF+SSKyPhz2w1uTWQeFAg5N+n
 SOOeHBClzmSGO95ACdnBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MOyX3V+VNO8=;uFxfjrT42UHTZLKfvOt2xMNe9rm
 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
 8RvIZEcv5bZF5XQUwLjDfTq6sEgl3
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

Am 27.11.25 um 23:14 schrieb Rafael J. Wysocki:

> On Thu, Nov 27, 2025 at 9:29=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 27.11.25 um 19:22 schrieb Rafael J. Wysocki:
>>
>>> On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
>>>>
>>>>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>> [...]
>>>
>>>>>> ---
>>>>>> Armin Wolf (8):
>>>>>>          thermal: core: Allow setting the parent device of cooling =
devices
>>>>>>          thermal: core: Set parent device in thermal_of_cooling_dev=
ice_register()
>>>>>>          ACPI: processor: Stop creating "device" sysfs link
>>>>> That link is not to the cooling devices' parent, but to the ACPI
>>>>> device object (a struct acpi_device) that corresponds to the parent.
>>>>> The parent of the cooling device should be the processor device, not
>>>>> its ACPI companion, so I'm not sure why there would be a conflict.
>>>>    From the perspective of the Linux device core, a parent device doe=
s not have to be
>>>> a "physical" device. In the case of the ACPI processor driver, the AC=
PI device is used,
>>>> so the cooling device registered by said driver belongs to the ACPI d=
evice.
>>> Well, that's a problem.  A struct acpi_device should not be a parent
>>> of anything other than a struct acpi_device.
>> Understandable, in this case we should indeed use the the CPU device, e=
specially since the fwnode
>> associated with it already points to the correct ACPI processor object =
(at least on my machine).
>>
>>>> I agree that using the Linux processor device would make more sense, =
but this will require
>>>> changes inside the ACPI processor driver.
>>> So be it.
>> OK.
>>
>>>> As for the "device" symlink: The conflict would be a naming conflict,=
 as both "device" symlinks
>>>> (the one created by the ACPI processor driver and the one created by =
the device core) will
>>>> be created in the same directory (which is the directory of the cooli=
ng device).
>>> I see.
>>>
>>> But why is the new symlink needed in the first place?  If the device
>>> has a parent, it will appear under that parent in /sys/devices/, won't
>>> it?
>>>
>>> Currently, all of the thermal class devices appear under
>>> /sys/devices/virtual/thermal/ because they have no parents and they
>>> all get a class parent kobject under /sys/devices/virtual/, as that's
>>> what get_device_parent() does.
>>>
>>> If they have real parents, they will appear under those parents, so
>>> why will the parents need to be pointed to additionally?
>> The "device" smylink is a comfort feature provided by the device core i=
tself to allow user space
>> application to traverse the device tree from bottom to top, like a doub=
le-linked list. We cannot
>> disable the creation of this symlink, nor should we.
> I think you mean device_add_class_symlinks(), but that's just for
> class devices.  Of course, thermal devices are class devices, so
> they'll get those links if they get parents.  Fair enough.
>
>>> BTW, this means that the layout of /sys/devices/ will change when
>>> thermal devices get real parents.  I'm not sure if this is a problem,
>>> but certainly something to note.
>> I know, most applications likely use /sys/class/thermal/, so they are n=
ot impacted by this. I will
>> note this in the cover letter of the next revision.
>>
>>>>>>          ACPI: fan: Stop creating "device" sysfs link
>>>>>>          ACPI: video: Stop creating "device" sysfs link
>>>>> Analogously in the above two cases AFAICS.
>>>>>
>>>>> The parent of a cooling device should be a "physical" device object,
>>>>> like a platform device or a PCI device or similar, not a struct
>>>>> acpi_device (which in fact is not a device even).
>>>>    From the perspective of the Linux device core, a ACPI device is a =
perfectly valid device.
>>> The driver core is irrelevant here.
>>>
>>> As I said before, a struct acpi_device object should not be a parent
>>> of anything other than a struct acpi_device object.  Those things are
>>> not devices and they cannot be used for representing PM dependencies,
>>> for example.
>>>
>>>> I agree that using a platform device or PCI device is better, but thi=
s already happens
>>>> inside the ACPI fan driver (platform device).
>>> So it should not happen there.
>> I meant that the ACPI fan driver already uses the platform device as th=
e parent device of the
>> cooling device, so the ACPI device is only used for interacting with th=
e ACPI control methods
>> (and registering sysfs attributes i think).
> OK
>
>>>> Only the ACPI video driver created a "device" sysfs link that points =
to the ACPI device
>>>> instead of the PCI device. I just noticed that i accidentally changed=
 this by using the
>>>> PCI device as the parent device for the cooling device.
>>>>
>>>> If you want then we can keep this change.
>>> The PCI device should be its parent.
>> Alright, i will note this in the patch description.
>>
>>>>>>          thermal: core: Set parent device in thermal_cooling_device=
_register()
>>>>>>          ACPI: thermal: Stop creating "device" sysfs link
>>>>> And this link is to the struct acpi_device representing the thermal =
zone itself.
>>>> Correct, the ACPI thermal zone driver is a ACPI driver, meaning that =
he binds to
>>>> ACPI devices. Because of this all (thermal zone) devices created by a=
n instance of
>>>> said driver are descendants of the ACPI device said instance is bound=
 to.
>>>>
>>>> We can of course convert the ACPI thermal zone driver into a platform=
 driver, but
>>>> this would be a separate patch series.
>>> If you want parents, this needs to be done first, but I'm still not
>>> sure what the parent of a thermal zone would represent.
>>>
>>> In the ACPI case it is kind of easy - it would be the (platform)
>>> device corresponding to a given ThermalZone object in the ACPI
>>> namespace - but it only has a practical meaning if that device has a
>>> specific parent.  For example, if the corresponding ThermalZone object
>>> is present in the \_SB scope, the presence of the thermal zone parent
>>> won't provide any additional information.
>> To the device core it will, as the platform device will need to be susp=
ended
>> after the thermal zone device has been suspended, among other things.
> Let's set suspend aside for now, I think I've explained my viewpoint
> on this enough elsewhere.
>
Agreed.

>>> Unfortunately, the language in the specification isn't particularly
>>> helpful here: "Thermal zone objects should appear in the namespace
>>> under the portion of the system that comprises the thermal zone. For
>>> example, a thermal zone that is isolated to a docking station should
>>> be defined within the scope of the docking station device."  To me
>>> "the portion of the system" is not too meaningful unless it is just
>>> one device without children.  That's why _TZD has been added AFAICS.
>> I think you are confusing the parent device of the ThermalZone ACPI dev=
ice
>> with the parent device of the struct thermal_zone_device.
> No, I'm not.
>
>> I begin to wonder if mentioning the ACPI ThermalZone device together wi=
th the
>> struct thermal_zone_device was a bad idea on my side xd.
> Maybe.
>
>>>>>>          thermal: core: Allow setting the parent device of thermal =
zone devices
>>>>> I'm not sure if this is a good idea, at least until it is clear what
>>>>> the role of a thermal zone parent device should be.
>>>> Take a look at my explanation with the Intel Wifi driver.
>>> I did and I think that you want the parent to be a device somehow
>>> associated with the thermal zone, but how exactly?  What should that
>>> be in the Wifi driver case, the PCI device or something else?
>>>
>>> And what if the thermal zone affects multiple devices?  Which of them
>>> (if any) would be its parent?  And would it be consistent with the
>>> ACPI case described above?
>>>
>>> All of that needs consideration IMV.
>> I agree, but there is a difference between "this struct thermal_zone_de=
vice depends on
>> device X to be operational" and "this thermal zone affects device X, de=
vice Y and device Z".
> Yes, there is.
>
>> This patch series exclusively deals with telling the driver core that "=
this struct thermal_zone_device
>> depends on device X to be operational".
> Maybe let's take care of cooling devices first and get back to this late=
r?
>
Agreed.

