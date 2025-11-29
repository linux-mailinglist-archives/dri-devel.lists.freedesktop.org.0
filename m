Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9E6C93CE9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 12:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71A110E1D5;
	Sat, 29 Nov 2025 11:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="kfcYE8gK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D38910E038;
 Sat, 29 Nov 2025 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764416165; x=1765020965; i=w_armin@gmx.de;
 bh=TVeAHJ8A0ipbhKo8I8woniNAgBLW23pF/+Rj2PvqmqA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kfcYE8gK29BFb+7DtJN+/Fuoedrtj9ZbvqUkq10muD5uHO1+rQ6DYqgQf8p6FKgb
 hVvTaW4RNg+kToUhAYHsS/WUO2wLSS2+g7H74eZ4jmVdgtia11+DKftCS/pCc4ucY
 1JhxKhf3TMZ5LiEhixdcLG6Fm+At/O2r4TGL8cPn1rzypAdBmViEdV9KedpAYIk64
 iTVsPWYHNDUVe7ovae9I3Peko3gC4U6RiQJO0+NDooBG3KzyshF01rlT0BWOhUxJg
 LLkf6OM9lclHdavzq/wWrUKR3oaxodpRd2XFrJ3zvet+GwN5WAKCC+YF5W9HtL5EY
 sclt2HuNYV/X/OPPtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1vZSGP2odx-00UfEj; Sat, 29
 Nov 2025 12:36:05 +0100
Message-ID: <de14f2c4-e7b3-43a1-a9ee-9caba196b0f5@gmx.de>
Date: Sat, 29 Nov 2025 12:35:58 +0100
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
 <CAJZ5v0iJVV=kf-aJBx8F8dtGfaZpGVyhfi6DBWEg4j3c_nH8_A@mail.gmail.com>
 <e360b9b3-ada4-4cd1-8971-097484cf3f5f@gmx.de>
 <CAJZ5v0ij_Frdrya3=FaekbU2DFHUyBJnBq-oe9jRsB9eqXDisA@mail.gmail.com>
 <ed619280-6f25-4df6-98ca-890bdc343435@gmx.de>
 <CAJZ5v0hMPCRU_p_krX3nKzB=5TX7hGU38iyNmhSJSHO2j7K3eA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJZ5v0hMPCRU_p_krX3nKzB=5TX7hGU38iyNmhSJSHO2j7K3eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X3olh5rR/6/YCnl0YXqpHV+PCr4yh5QcDM/TSm9jiyHjW3X9d21
 RGBn9sBJnZ+21gc81o2EN5q3MtaSXijIrP81rdtIMeNOn1EPcPH4Jf2KskiH+/nfb2YytMg
 wZSWzingRx3jjIiL5g8pZib4b4MWSkJVE4GFqDb4Ey+WaGvqA5cnQjnh7jJDMnufvfToqUN
 /ogti5hpWyS72QD3EV5RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2EfzpvB2ujg=;qvn0dYFpuqhDbv8HCEf+vVkGV2B
 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
 XQA1LAOgsJCcSNgaAd++OeuhSdavw
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

Am 28.11.25 um 12:40 schrieb Rafael J. Wysocki:

> On Fri, Nov 28, 2025 at 12:50=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
>> Am 27.11.25 um 22:46 schrieb Rafael J. Wysocki:
>>
>>> On Thu, Nov 27, 2025 at 9:06=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> Am 27.11.25 um 18:41 schrieb Rafael J. Wysocki:
>>>>
>>>>> On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>>>>> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
>>>>>>
>>>>>>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de=
> wrote:
>>>>>>>> Drivers registering thermal zone/cooling devices are currently un=
able
>>>>>>>> to tell the thermal core what parent device the new thermal zone/
>>>>>>>> cooling device should have, potentially causing issues with suspe=
nd
>>>>>>>> ordering
>>>>>>> This is one potential class of problems that may arise, but I woul=
d
>>>>>>> like to see a real example of this.
>>>>>>>
>>>>>>> As it stands today, thermal_class has no PM callbacks, so there ar=
e no
>>>>>>> callback execution ordering issues with devices in that class and =
what
>>>>>>> other suspend/resume ordering issues are there?
>>>>>> Correct, that is why i said "potentially".
>>>>>>
>>>>>>> Also, the suspend and resume of thermal zones is handled via PM
>>>>>>> notifiers.  Is there a problem with this?
>>>>>> The problem with PM notifiers is that thermal zones stop working ev=
en before
>>>>>> user space is frozen. Freezing user space might take a lot of time,=
 so having
>>>>>> no thermal management during this period is less than ideal.
>>>>> This can be addressed by doing thermal zone suspend after freezing
>>>>> tasks and before starting to suspend devices.  Accordingly, thermal
>>>>> zones could be resumed after resuming devices and before thawing
>>>>> tasks.  That should not be an overly complex change to make.
>>>> AFAIK this is only possible by using dev_pm_ops,
>>> Of course it is not the case.
>>>
>>> For example, thermal_pm_notify_prepare() could be called directly from
>>> dpm_prepare() and thermal_pm_notify_complete() could be called
>>> directly from dpm_complete() (which would require switching over
>>> thermal to a non-freezable workqueue).
>>>
>>>> the PM notifier is triggered before tasks are frozen during suspend a=
nd after they are thawed during resume.
>>> I know that.
>>>
>>>> Using dev_pm_ops would also ensure that thermal zone devices are resu=
med after their
>>>> parent devices, so no additional changes inside the pm core would be =
needed.
>>> Not really.  thermal_pm_suspended needs to be set and cleared from som=
ewhere.
>> thermal_pm_suspended is only used for initializing the state of thermal=
 zone devices registered
>> during a suspend transition. This is currently needed because user spac=
e tasks are still operational
>> when the PM notifier callback is called, so we have to be prepared for =
new thermal zone devices
>> being registered in the middle of a suspend transition.
>>
>> When using dev_pm_ops, new thermal zone devices cannot appear in the mi=
ddle of a suspend transition,
>> as this would violate the restraints of the device core regarding devic=
e registrations. Because of
>> this thermal_pm_suspended can be removed once we use dev_pm_ops.
> No, we are not going to use dev_pm_ops for thermal zone suspend.  That
> would be adding complexity just for the sake of it IMV.

OK, fine. I will forget about using dev_pm_ops for the thermal subsystem.

>>>>>> This problem would not occur when using dev_pm_ops, as thermal zone=
s would be
>>>>>> suspended after user space has been frozen successfully. Additional=
ly, when using
>>>>>> dev_pm_ops we can get rid of thermal_pm_suspended, as the device co=
re already mandates
>>>>>> that no new devices (including thermal zones and cooling devices) b=
e registered during
>>>>>> a suspend/resume cycle.
>>>>>>
>>>>>> Replacing the PM notifiers with dev_pm_ops would of course be a opt=
imization with
>>>>>> its own patch series.
>>>>> Honestly, I don't see much benefit from using dev_pm_ops for thermal
>>>>> zone devices and cooling devices.  Moreover, I actually think that
>>>>> they could be "no PM" devices that are not even put on the
>>>>> suspend-resume device list.  Technically, they are just interfaces o=
n
>>>>> top of some other devices allowing the user space to interact with t=
he
>>>>> latter and combining different pieces described by the platform
>>>>> firmware.  They by themselves have no PM capabilities.
>>>> Correct, thermal zone devices are virtual devices representing therma=
l management
>>>> aspects of the underlying parent device. This however does not mean t=
hat thermal zone
>>>> devices have no PM capabilities, because they contain state. Some par=
t of this state
>>>> (namely TZ_STATE_FLAG_SUSPENDED and TZ_STATE_FLAG_RESUMING) is affect=
ed by power management,
>>>> so we should tell the device core about this by using dev_pm_ops inst=
ead of the PM notifier.
>>> Changing the zone state to anything different from TZ_STATE_READY
>>> causes __thermal_zone_device_update() to do nothing and this is the
>>> whole "suspend".  It does not need to be done from a PM callback and I
>>> see no reason why doing it from a PM callback would be desirable.
>>> Sorry.
>>>
>>> Apart from the above, TZ_STATE_FLAG_SUSPENDED and
>>> TZ_STATE_FLAG_RESUMING are only used for coordination between
>>> thermal_zone_pm_prepare(), thermal_zone_device_resume() and
>>> thermal_zone_pm_complete(), so this is not a state anything other then
>>> the specific thermal zone in question cares about.
>> AFAIK this is not completely true, once TZ_STATE_FLAG_SUSPENDED is set,
>> __thermal_zone_device_update() will stop polling said device (as you sa=
id).
>> This is not only important for the thermal zone device itself, but also=
 for
>> the underlying device driver as he has to make sure that the thermal zo=
ne
>> callbacks do not access an already suspended hardware device.
> Which callbacks in particular do you mean?  That would need to be
> something that is not called from either
> __thermal_zone_device_update() because it is going to bail out early
> or user space because it is frozen.  So what is left?
>
> Seriously, if the only problem with the existing thermal zone suspend
> and resume is that they are done from a PM notifier, I don't think
> addressing this requires involving dev_pm_ops and it will be very hard
> to convince me otherwise.

I was referring to the callbacks inside struct thermal_zone_device_ops, bu=
t
those are indeed already covered by the current approach using the PM noti=
fier.

Since you are happy with the current approach, i say that we forget about =
the
suggestion with the dev_pm_ops for now.

>>> Moreover, resuming a thermal zone before resuming any cooling devices
>>> bound to it would almost certainly break things and I'm not sure how
>>> you would make that work with dev_pm_ops.  BTW, using device links for
>>> this is not an option as far as I'm concerned.
>> We could simply resume the thermal zones inside the .complete callback.
>> The cooling devices will already be operational when said complete call=
back
>> is being called by the PM core, due to the resume phase having been com=
pleted
>> already.
> But then it would be synchronous, wouldn't it?  Or if you want to
> start async handling from a .complete callback then I don't see a
> point.
>
>>>>>>>> and making it impossible for user space applications to
>>>>>>>> associate a given thermal zone device with its parent device.
>>>>>>> Why does user space need to know the parent of a given cooling dev=
ice
>>>>>>> or thermal zone?
>>>>>> Lets say that we have two thermal zones registered by two instances=
 of the
>>>>>> Intel Wifi driver. User space is currently unable to find out which=
 thermal zone
>>>>>> belongs to which Wifi adapter, as both thermal zones have the (near=
ly) same type string ("iwlwifi[0-X]").
>>>>> But the "belong" part is not quite well defined here.  I think that
>>>>> what user space needs to know is what devices are located in a given
>>>>> thermal zone, isn't it?  Knowing the parent doesn't necessarily
>>>>> address this.
>>>> The device exposing a given thermal zone device is not always a membe=
r of the thermal zone itself.
>>>> In case of the Intel Wifi adapters, the individual Wifi adapters are =
indeed members of the thermal zone
>>>> associated with their thermal zone device. But thermal zones created =
thru a system management controller
>>>> for example might only cover devices like the CPUs and GPUs, not the =
system management controller device itself.
>>> Well, exactly.
>>>
>>>> The parent device of a child device is the upstream device of the chi=
ld device. The connection between parent
>>>> and child can be physical (SMBus controller (parent) -> i2c device (c=
hild)) or purely logical
>>>> (PCI device (parent) -> thermal zone device (child)). There exists a =
parent-child dependency between a parent
>>>> and a child device (the child device cannot function without its pare=
nt being operational), and user space
>>>> might want to be able to discover such dependencies.
>>> But this needs to be consistent.
>>>
>>> If the parent of one thermal zone represents the device affected by it
>>> and the parent of another thermal zone represents something else, user
>>> space will need platform-specific knowledge to figure this out, which
>>> is the case today.  Without consistency, this is just not useful.
>> I think there is a misunderstanding here, describing the devices affect=
ed by a given thermal zone
>> has nothing to do with the parent-child dependency between a thermal zo=
ne device and its parent device.
>> This parent-child dependency only states that:
>>
>>          "This thermal zone device is descended from this parent device=
. It might thus depend on
>>           said parent device to be operational."
> So you are postulating that the parent of a thermal zone should be the
> device providing the thermal sensor or otherwise a mechanism allowing
> temperature to be read.  That is precise enough as far as I'm
> concerned.

Correct.

>>>>>> This problem would be solved once we populate the parent device poi=
nter inside the thermal zone
>>>>>> device, as user space can simply look at the "device" symlink to de=
termine the parent device behind
>>>>>> a given thermal zone device.
>>>>> I'm not convinced about this.
>>>>>
>>>>>> Additionally, being able to access the acpi_handle of the parent de=
vice will be necessary for the
>>>>>> ACPI thermal zone driver to support cooling devices other than ACPI=
 fans and ACPI processors.
>>>>> I guess by the "parent" you mean the device represented in the ACPI
>>>>> namespace by a ThermalZone object, right?  But this is not the same =
as
>>>>> the "parent" in the Wifi driver context, is it?
>>>> In the context of a ACPI ThermalZone, the parent device of the therma=
l cooling device would currently
>>>> be the ACPI device bound to the "thermal" ACPI driver. In the context=
 of the Intel Wifi card, the parent
>>>> device would be PCI device bound to the corresponding Intel Wifi driv=
er.
>>>>
>>>> I think you misunderstood what kind of parent device i was referring =
to. You likely though that i was referring
>>>> to the parent device of the ACPI ThermalZone, right?
>>> No.  I thought that you were referring to the ACPI ThermalZone itself.
>>> Or rather, a platform device associated with the ACPI ThermalZone
>>> (that is, the device the ACPI ThermalZone in the ACPI_COMPAION() of).
>> That is correct.
>>
>>>> That however is not the case , with "parent device" i was
>>>> referring to the device responsible for creating a given struct therm=
al_zone_device instance.
>>> So I was not confused.
>>>
>>>>>>>> This patch series aims to fix this issue by extending the functio=
ns
>>>>>>>> used to register thermal zone/cooling devices to also accept a pa=
rent
>>>>>>>> device pointer. The first six patches convert all functions used =
for
>>>>>>>> registering cooling devices, while the functions used for registe=
ring
>>>>>>>> thermal zone devices are converted by the remaining two patches.
>>>>>>>>
>>>>>>>> I tested this series on various devices containing (among others)=
:
>>>>>>>> - ACPI thermal zones
>>>>>>>> - ACPI processor devices
>>>>>>>> - PCIe cooling devices
>>>>>>>> - Intel Wifi card
>>>>>>>> - Intel powerclamp
>>>>>>>> - Intel TCC cooling
>>>>>>> What exactly did you do to test it?
>>>>>> I tested:
>>>>>> - the thermal zone temperature readout
>>>>>> - correctness of the new sysfs links
>>>>>> - suspend/resume
>>>>>>
>>>>>> I also verified that ACPI thermal zones still bind with the ACPI fa=
ns.
>>>>> I see, thanks.
>>>>>
>>>>>>>> I also compile-tested the remaining affected drivers, however i w=
ould
>>>>>>>> still be happy if the relevant maintainers (especially those of t=
he
>>>>>>>> mellanox ethernet switch driver) could take a quick glance at the
>>>>>>>> code and verify that i am using the correct device as the parent
>>>>>>>> device.
>>>>>>> I think that the above paragraph is not relevant any more?
>>>>>> You are right, however i originally meant to CC the mellanox mainta=
iners as
>>>>>> i was a bit unsure about the changes i made to their driver. I will=
 rework
>>>>>> this section in the next revision and CC the mellanox maintainers.
>>>>>>
>>>>>>>> This work is also necessary for extending the ACPI thermal zone d=
river
>>>>>>>> to support the _TZD ACPI object in the future.
>>>>>>> I'm still unsure why _TZD support requires the ability to set a
>>>>>>> thermal zone parent device.
>>>>>> _TZD allows the ACPI thermal zone to bind to cooling devices other =
than ACPI fans
>>>>>> and ACPI processors, like ACPI batteries.
>>>>> No, it is not for cooling devices if my reading of the specification
>>>>> is correct.  It says:
>>>>>
>>>>> "_TZD (Thermal Zone Devices)
>>>>>
>>>>> This optional object evaluates to a package of device names. Each na=
me
>>>>> corresponds to a device in the ACPI namespace that is associated wit=
h
>>>>> the thermal zone. The temperature reported by the thermal zone is
>>>>> roughly correspondent to that of each of the devices."
>>>>>
>>>>> And then
>>>>>
>>>>> "The list of devices returned by the control method need not be a
>>>>> complete and absolute list of devices affected by the thermal zone.
>>>>> However, the package should at least contain the devices that would
>>>>> uniquely identify where this thermal zone is located in the machine.
>>>>> For example, a thermal zone in a docking station should include a
>>>>> device in the docking station, a thermal zone for the CD-ROM bay,
>>>>> should include the CD-ROM."
>>>>>
>>>>> So IIUC this is a list of devices allowing the location of the therm=
al
>>>>> zone to be figured out.  There's nothing about cooling in this
>>>>> definition.
>>>> Using _TZD to figure out the location of a given thermal zone is anot=
her usage
>>>> of this ACPI control method, but lets take a look at section 11.6:
>>>>
>>>> - If _PSV is defined then either the _PSL or _TZD objects must exist.=
 The _PSL and _TZD objects may both exist.
>>>> - If _PSV is defined and _PSL is not defined then at least one device=
 in thermal zone, as indicated by either the
>>>>      _TZD device list or devices=E2=80=99 _TZM objects, must support =
device performance states.
>>>>
>>>> So according to my understanding, _TZD can also be used to discover a=
dditional cooling devices used for passive cooling.
>>> But it doesn't actually say how those "device performance states" are
>>> supposed to be used for cooling, does it?
>> Well, ACPI specifies how passive cooling should be done using percentag=
e values between 0% and 100%,
>> so this part is actually specified.
> If you refer to Section 11.1.5, this is based on _TC1 and _TC2 and has
> limitations.  So you are saying that Section 11.1.5 should be extended
> to _TZD devices.  Is this also there in the MSFT document?

Looking at https://learn.microsoft.com/en-us/windows-hardware/design/devic=
e-experiences/design-guide
section "Thermal policy control" paragraph "Thermal manager in kernel", it=
 seems that the NT kernel
uses the passive cooling algorithm defined by the ACPI specification for a=
ll passive cooling devices.

So when using Windows, _TZD is indeed treated like an extension for _PSL.

>>>> This makes sense as _PSL is defined to only contain processor objects=
 (see section 11.4.10), so _TZD can act like an
>>>> extension of _PSL for things like ACPI control method batteries (see =
10.2.2.12).
>>> But not everything in _TZD needs to be a potential "cooling device"
>>> and how you'll decide which one is?
>> Devices in _TZD that have no cooling capability will simply never regis=
ter any cooling devices. This means that
>> the .should_bind callback of the ACPI thermal zone will never see those=
 devices. Only devices in _TZD that also
>> have the ability for (passive) cooling will register a cooling device, =
so only those devices will end up with
>> the .should_bind callback of the ACPI thermal zone.
>>
>> The ACPI thermal zone treats _TZD as a list of ACPI handles. If some of=
 those handles are unused, then this is
>> totally fine.
>>
>>>> Microsoft also follows this approach (see https://learn.microsoft.com=
/en-us/windows-hardware/design/device-experiences/design-guide
>>>> section "Thermally managed devices" paragraph "Processor aggregator")=
.
>>> Interesting.
>>>
>>> I agree that it would make sense to follow them because there will be
>>> platform dependencies on that, if there aren't already.
>> My primary goal is to improve the Linux thermal subsystem to be as powe=
rful as
>> the Windows thermal subsystem. This means that we must stop viewing _PS=
L, _ALx and _TZD
>> as something that only works with a predefined set of devices. Instead =
we must view
>> _PSL, _ALx and _TZD as something similar to the cooling-maps used for c=
onnecting
>> thermal zones and cooling devices on OF-based systems.
>>
>>>>>> This however will currently not work as
>>>>>> the ACPI thermal zone driver uses the private drvdata of the coolin=
g device to
>>>>>> determine if said cooling device should bind. This only works for A=
CPI fans and
>>>>>> processors due to the fact that those drivers store a ACPI device p=
ointer inside
>>>>>> drvdata, something the ACPI thermal zone expects.
>>>>> I'm not sure I understand the above.
>>>>>
>>>>> There is a list of ACPI device handles per trip point, as returned b=
y
>>>>> either _PSL or _ALx.  Devices whose handles are in that list will be
>>>>> bound to the thermal zone, so long as there are struct acpi_device
>>>>> objects representing them which is verified with the help of the
>>>>> devdata field in struct thermal_cooling_device.
>>>> AFAIK devdata is meant to be used by the thermal zone device callback=
s to access the state
>>>> container struct of the associated device driver instance. Assuming t=
hat a given device driver
>>>> will populate devdata with a pointer to is ACPI companion device is a=
n implementation-specific
>>>> detail that does not apply to all cooling device implementations. It =
just so happens that the
>>>> ACPI processor and fan driver do this, likely because they where desi=
gned specifically to work
>>>> with the ACPI thermal zone driver.
>>>>
>>>> The documentation of thermal_cooling_device_register() even describes=
 devdata as "device private data", so any meaning of devdata purely depend=
s on the
>>>> given device driver.
>>> Yes, and these particular drivers decide to store a pointer to struct
>>> acpi_device in it.
>>>
>>> But this is not super important, they might as well set the
>>> ACPI_COMPANION() of the cooling device to the corresponding struct
>>> acpi_device and the ACPI thermal driver might use that information.
>>>
>>> I'm not opposed to using parents for this purpose, but it doesn't
>>> change the big picture that the ACPI thermal driver will need to know
>>> the ACPI handle corresponding to each cooling device.
>>>
>>> If you want to use _TZD instead of or in addition to _PSL for this, it
>>> doesn't change much here, it's just another list of ACPI handles, so
>>> saying that parents are needed for supporting this is not exactly
>>> accurate IMV.
>> My idea was something like this:
>>
>> /* Cooling devices without a parent device cannot be referenced using A=
CPI */
>> if (!cdev->device.parent)
>>          return false;
>>
>> /* Not all devices are described inside the ACPI tables */
>> acpi_handle cdev_handle =3D ACPI_HANDLE(cdev->device.parent);
>> if (!cdev_handle)
>>          return false;
>>
>> for (i =3D 0; i < acpi_trip->devices.count; i++) {
>>          acpi_handle handle =3D acpi_trip->devices.handles[i];
>>
>>          if (handle =3D=3D cdev_handle)
>>                  return true;
>> }
>>
>> This only works if the parent device pointer of the cooling device is p=
opulated.
> Sure, but it looks reasonable to me.
>
>>>>> IOW, cooling device drivers that create struct thermal_cooling_devic=
e
>>>>> objects representing them are expected to set devdata in those objec=
ts
>>>>> to point to struct acpi_device objects corresponding to their ACPI
>>>>> handles, but in principle acpi_thermal_should_bind_cdev() might as
>>>>> well just use the handles themselves.  It just needs to know that
>>>>> there is a cooling driver on the other side of the ACPI handle.
>>>>>
>>>>> The point is that a cooling device to be bound to an ACPI thermal zo=
ne
>>>>> needs an ACPI handle in the first place to be listed in _PSL or _ALx=
.
>>>> Correct, i merely change the way the ACPI thermal zone driver retriev=
es the
>>>> ACPI handle associated with a given cooling device.
>>> Right.
>>>
>>>>>> As we cannot require all cooling devices to store an ACPI device po=
inter inside
>>>>>> their drvdata field in order to support ACPI,
>>>>> Cooling devices don't store ACPI device pointers in struct
>>>>> thermal_cooling_device objects, ACPI cooling drivers do, and there a=
re
>>>>> two reasons to do that: (1) to associate a given struct
>>>>> thermal_cooling_device with an ACPI handle and (2) to let
>>>>> acpi_thermal_should_bind_cdev() know that the cooling device is
>>>>> present and functional.
>>>>>
>>>>> This can be changed to store an ACPI handle in struct
>>>>> thermal_cooling_device and acpi_thermal_should_bind_cdev() may just
>>>>> verify that the device is there by itself.
>>>> I can of course extend thermal_cooling_device_register() to accept a =
fwnode_handle that
>>>> can be used for both ACPI and OF based cooling device identification,=
 if this is what you
>>>> prefer.
>>> I'm not sure about this ATM and see below.
>>>
>>>> This patch series would then turn into a cleanup series, focusing on =
properly adding
>>>> thermal zone devices and cooling devices into the global device hiera=
rchy.
>>> I'd prefer to do one thing at a time though.
>>>
>>> If you want cooling devices to get parents, fine.  I'm not
>>> fundamentally opposed to that idea, but let's have clear rules for
>>> device drivers on how to set those parents for the sake of
>>> consistency.
>>>
>>> As for the ACPI case, one rule that I want to be followed (as already
>>> stated multiple times) is that a struct acpi_device can only be a
>>> parent of another struct acpi_device.  This means that the parent of a
>>> cooling device needs to be a platform device or similar representing
>>> the actual device that will be used for implementing the cooling.
>> OK.
>>
>>> A separate question is how acpi_thermal_should_bind_cdev() will match
>>> cooling devices with the ACPI handles coming from _PSL, _ALx, _TZD
>>> etc. and the rule can be that it will look at the ACPI_COMPANION() of
>>> the parent of the given cooling device.
>> See the example code i pasted above, the whole matching is done using A=
CPI handles,
>> so we can completely leave ACPI_COMPANION() out of this.
> ACPI_HANDLE() is a wrapper around ACPI_COMPANION() so your code
> effectively does what I said above.

True, i forgot about that.

>>>>>> we must use a more generic approach.
>>>>> I'm not sure what use case you are talking about.
>>>>>
>>>>> Surely, devices with no representation in the ACPI namespace cannot =
be
>>>>> bound to ACPI thermal zones.  For devices that have a representation
>>>>> in the ACPI namespace, storing an ACPI handle in devdata should not =
be
>>>>> a problem.
>>>> See my above explanations for details, drvdata is defined to hold dev=
ice private data,
>>>> nothing more.
>>> This is related to the discussion below.
>>>
>>>>>> I was thinking about using the acpi_handle of the parent device ins=
tead of messing
>>>>>> with the drvdata field, but this only works if the parent device po=
inter of the
>>>>>> cooling device is populated.
>>>>>>
>>>>>> (Cooling devices without a parent device would then be ignored by t=
he ACPI thermal
>>>>>> zone driver, as such cooling devices cannot be linked to ACPI).
>>>>> It can be arranged this way, but what's the practical difference?
>>>>> Anyone who creates a struct thermal_cooling_device and can set its
>>>>> parent pointer to a device with an ACPI companion, may as well set i=
ts
>>>>> devdata to point to that companion directly - or to its ACPI handle =
if
>>>>> that's preferred.
>>>> Yes, but this would require explicit support for ACPI in every driver=
 that registers cooling devices.
>>> So you want to have generic drivers that may work on ACPI platforms
>>> and on DT platforms to be able to create cooling devices for use with
>>> ACPI thermal zones.  Well, had you started the whole discussion with
>>> this statement, it would have been much easier to understand your
>>> point.
>> Sorry for the messy discussion, i intended to have two separate patch s=
eries. This one was meant to
>> simply be a preparation, with the important changes inside the ACPI the=
rmal zone driver being implemented
>> with the second patch series.
>>
>> That was also the reason why i send this series as an RFC.
>>
>>>> Using the parent device to retrieve the acpi_handle or allowing all d=
rivers to just submit a fwnode_handle
>>>> of their choice when creating a cooling device will fix this.
>>> If you go the parents route, this is an important consideration for
>>> the rules on how to set those parents.  Namely, they would need to be
>>> set so that the fwnode_handle of the parent could be used for binding
>>> the cooling device to a thermal zone either on ACPI or on DT systems.
>>>
>>> Of course, there are also cooling devices whose parents will not have
>>> an fwnode_handle and they would still need to work in this brave new
>>> world.
>>>
>> True, i did not think of that. In this case extending thermal_of_coolin=
g_device_register() and friends to accept
>> a generic fwnode_handle instead of a OF-specific device_node would make=
 more sense. Most drivers can simply
>> pass the result of dev_fwnode() instead of dev->of_node, only those tha=
t support multiple cooling device child
>> nodes would need additional work to also support ACPI.
>>
>> Basically, thermal_of_get_cooling_spec() could handle the fwnode_handle=
 in the following manner:
>>
>> if (cooling_spec.np->fwnode !=3D cdev->fwnode)
>>          return false;
>>
>> And the ACPI thermal zone driver could then simply use ACPI_HANDLE_FWNO=
DE() to retrieve the ACPI handle from
>> the fwnode_handle (together with a NULL check of course).
>>
>> If you are OK with this approach, i will forget about the whole parent =
device stuff for now and focus on extending
>> (devm_)thermal_of_cooling_device_register(). There are some additional =
changes needed for reliably associating
>> cooling devices to ACPI trip points using fwnode handles, but those are=
 not that intrusive.
>>
>> What do you think?
> One advantage of using parents is that it will help user space to
> figure out connections between the abstract cooling devices and the
> associated hardware or firmware entities.  I think that this is an
> important one.
>
> It also doesn't prevent fwnode_handle from being used because the
> fwnode_handle may just be stored in the parent.  I like this more than
> associating fwnode_handles directly with abstract cooling devices.
>
> If the cooling device parent (that is, the provider of the cooling
> mechanism used by it) does not have an fwnode_handle, then either it
> needs to be driven directly from user space, or the driver creating a
> thermal zone device needs to provide a specific .should_bind()
> callback that will know what to look for.
>
OK. When sending the next revision of this patch series, should i also kee=
p
the patches for the thermal zone device or should i only keep the patches
concerning the cooling devices?

Thanks,
Armin Wolf

