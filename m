Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8340C905C7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 00:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21DE10E83E;
	Thu, 27 Nov 2025 23:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="YTpIXR/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6F10E83E;
 Thu, 27 Nov 2025 23:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764287395; x=1764892195; i=w_armin@gmx.de;
 bh=hK8LvF5Y3zgz3uFe++ejIpqTqc53KL6EHK66jN1vocg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YTpIXR/FKBoG1wDFpnhRpouL8aJUlZiC85XOS+D8pV8Y6NxFS6TnXx5h8NHDMnkg
 SHlUWdooLC2NkKmSAWvaOVPjoKHs7c/YaGZ8eq60lV4T6KuNZX1CMRq4hib2X/uez
 jdWYvlw6VGCzjdhJ7/1jgzilMFxmlM4lXsu0jfcMukPsazHYSqJyvtdPDssveA6ts
 N+RRwZ2UVR94EHVsPoODy5aQhvAuy4W3RPgT21pIZbpF+UDXY3VXWRzq3wY2i2mO5
 696lPcj1FjhrhA8qvmANUmSeYnhTwVd0FXfKcRRUij2+8PQ7ZAGhITz/mn6Culjlu
 fMtsMRj30dj3Hy4VBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGz1V-1vLAq80W2t-00FteR; Fri, 28
 Nov 2025 00:49:55 +0100
Message-ID: <ed619280-6f25-4df6-98ca-890bdc343435@gmx.de>
Date: Fri, 28 Nov 2025 00:49:47 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJZ5v0ij_Frdrya3=FaekbU2DFHUyBJnBq-oe9jRsB9eqXDisA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PzeYcwe9jeakTqDtHXkXCiEtL+//TwcLgoQ08yJeg39H7fCWJ6I
 vKsxHgf3SF8gcrb/2Y5CWXTNrz7WGAgZqVNOVwifWOQi+yqO4Pv8bwX+HeAwb7Nk7qtHnNb
 3MO9ijRyw62Y/5JiCz54OaHXQAsgp4rHtf/rLLcXWjGNWkUhlQSTzamfcZ/mlVpd8ioH5ij
 h+GPDeLD4iYS8Zi7fCbBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oWrkrSQzoEs=;sRb9k2PrpRW6+FU4tzM0F1VMUkf
 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
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

Am 27.11.25 um 22:46 schrieb Rafael J. Wysocki:

> On Thu, Nov 27, 2025 at 9:06=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 27.11.25 um 18:41 schrieb Rafael J. Wysocki:
>>
>>> On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
>>>>
>>>>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>>>>> Drivers registering thermal zone/cooling devices are currently unab=
le
>>>>>> to tell the thermal core what parent device the new thermal zone/
>>>>>> cooling device should have, potentially causing issues with suspend
>>>>>> ordering
>>>>> This is one potential class of problems that may arise, but I would
>>>>> like to see a real example of this.
>>>>>
>>>>> As it stands today, thermal_class has no PM callbacks, so there are =
no
>>>>> callback execution ordering issues with devices in that class and wh=
at
>>>>> other suspend/resume ordering issues are there?
>>>> Correct, that is why i said "potentially".
>>>>
>>>>> Also, the suspend and resume of thermal zones is handled via PM
>>>>> notifiers.  Is there a problem with this?
>>>> The problem with PM notifiers is that thermal zones stop working even=
 before
>>>> user space is frozen. Freezing user space might take a lot of time, s=
o having
>>>> no thermal management during this period is less than ideal.
>>> This can be addressed by doing thermal zone suspend after freezing
>>> tasks and before starting to suspend devices.  Accordingly, thermal
>>> zones could be resumed after resuming devices and before thawing
>>> tasks.  That should not be an overly complex change to make.
>> AFAIK this is only possible by using dev_pm_ops,
> Of course it is not the case.
>
> For example, thermal_pm_notify_prepare() could be called directly from
> dpm_prepare() and thermal_pm_notify_complete() could be called
> directly from dpm_complete() (which would require switching over
> thermal to a non-freezable workqueue).
>
>> the PM notifier is triggered before tasks are frozen during suspend and=
 after they are thawed during resume.
> I know that.
>
>> Using dev_pm_ops would also ensure that thermal zone devices are resume=
d after their
>> parent devices, so no additional changes inside the pm core would be ne=
eded.
> Not really.  thermal_pm_suspended needs to be set and cleared from somew=
here.

thermal_pm_suspended is only used for initializing the state of thermal zo=
ne devices registered
during a suspend transition. This is currently needed because user space t=
asks are still operational
when the PM notifier callback is called, so we have to be prepared for new=
 thermal zone devices
being registered in the middle of a suspend transition.

When using dev_pm_ops, new thermal zone devices cannot appear in the middl=
e of a suspend transition,
as this would violate the restraints of the device core regarding device r=
egistrations. Because of
this thermal_pm_suspended can be removed once we use dev_pm_ops.

>>>> This problem would not occur when using dev_pm_ops, as thermal zones =
would be
>>>> suspended after user space has been frozen successfully. Additionally=
, when using
>>>> dev_pm_ops we can get rid of thermal_pm_suspended, as the device core=
 already mandates
>>>> that no new devices (including thermal zones and cooling devices) be =
registered during
>>>> a suspend/resume cycle.
>>>>
>>>> Replacing the PM notifiers with dev_pm_ops would of course be a optim=
ization with
>>>> its own patch series.
>>> Honestly, I don't see much benefit from using dev_pm_ops for thermal
>>> zone devices and cooling devices.  Moreover, I actually think that
>>> they could be "no PM" devices that are not even put on the
>>> suspend-resume device list.  Technically, they are just interfaces on
>>> top of some other devices allowing the user space to interact with the
>>> latter and combining different pieces described by the platform
>>> firmware.  They by themselves have no PM capabilities.
>> Correct, thermal zone devices are virtual devices representing thermal =
management
>> aspects of the underlying parent device. This however does not mean tha=
t thermal zone
>> devices have no PM capabilities, because they contain state. Some part =
of this state
>> (namely TZ_STATE_FLAG_SUSPENDED and TZ_STATE_FLAG_RESUMING) is affected=
 by power management,
>> so we should tell the device core about this by using dev_pm_ops instea=
d of the PM notifier.
> Changing the zone state to anything different from TZ_STATE_READY
> causes __thermal_zone_device_update() to do nothing and this is the
> whole "suspend".  It does not need to be done from a PM callback and I
> see no reason why doing it from a PM callback would be desirable.
> Sorry.
>
> Apart from the above, TZ_STATE_FLAG_SUSPENDED and
> TZ_STATE_FLAG_RESUMING are only used for coordination between
> thermal_zone_pm_prepare(), thermal_zone_device_resume() and
> thermal_zone_pm_complete(), so this is not a state anything other then
> the specific thermal zone in question cares about.

AFAIK this is not completely true, once TZ_STATE_FLAG_SUSPENDED is set,
__thermal_zone_device_update() will stop polling said device (as you said)=
.
This is not only important for the thermal zone device itself, but also fo=
r
the underlying device driver as he has to make sure that the thermal zone
callbacks do not access an already suspended hardware device.

> Moreover, resuming a thermal zone before resuming any cooling devices
> bound to it would almost certainly break things and I'm not sure how
> you would make that work with dev_pm_ops.  BTW, using device links for
> this is not an option as far as I'm concerned.

We could simply resume the thermal zones inside the .complete callback.
The cooling devices will already be operational when said complete callbac=
k
is being called by the PM core, due to the resume phase having been comple=
ted
already.

>>>>>> and making it impossible for user space applications to
>>>>>> associate a given thermal zone device with its parent device.
>>>>> Why does user space need to know the parent of a given cooling devic=
e
>>>>> or thermal zone?
>>>> Lets say that we have two thermal zones registered by two instances o=
f the
>>>> Intel Wifi driver. User space is currently unable to find out which t=
hermal zone
>>>> belongs to which Wifi adapter, as both thermal zones have the (nearly=
) same type string ("iwlwifi[0-X]").
>>> But the "belong" part is not quite well defined here.  I think that
>>> what user space needs to know is what devices are located in a given
>>> thermal zone, isn't it?  Knowing the parent doesn't necessarily
>>> address this.
>> The device exposing a given thermal zone device is not always a member =
of the thermal zone itself.
>> In case of the Intel Wifi adapters, the individual Wifi adapters are in=
deed members of the thermal zone
>> associated with their thermal zone device. But thermal zones created th=
ru a system management controller
>> for example might only cover devices like the CPUs and GPUs, not the sy=
stem management controller device itself.
> Well, exactly.
>
>> The parent device of a child device is the upstream device of the child=
 device. The connection between parent
>> and child can be physical (SMBus controller (parent) -> i2c device (chi=
ld)) or purely logical
>> (PCI device (parent) -> thermal zone device (child)). There exists a pa=
rent-child dependency between a parent
>> and a child device (the child device cannot function without its parent=
 being operational), and user space
>> might want to be able to discover such dependencies.
> But this needs to be consistent.
>
> If the parent of one thermal zone represents the device affected by it
> and the parent of another thermal zone represents something else, user
> space will need platform-specific knowledge to figure this out, which
> is the case today.  Without consistency, this is just not useful.

I think there is a misunderstanding here, describing the devices affected =
by a given thermal zone
has nothing to do with the parent-child dependency between a thermal zone =
device and its parent device.
This parent-child dependency only states that:

	"This thermal zone device is descended from this parent device. It might =
thus depend on
	 said parent device to be operational."

>>>> This problem would be solved once we populate the parent device point=
er inside the thermal zone
>>>> device, as user space can simply look at the "device" symlink to dete=
rmine the parent device behind
>>>> a given thermal zone device.
>>> I'm not convinced about this.
>>>
>>>> Additionally, being able to access the acpi_handle of the parent devi=
ce will be necessary for the
>>>> ACPI thermal zone driver to support cooling devices other than ACPI f=
ans and ACPI processors.
>>> I guess by the "parent" you mean the device represented in the ACPI
>>> namespace by a ThermalZone object, right?  But this is not the same as
>>> the "parent" in the Wifi driver context, is it?
>> In the context of a ACPI ThermalZone, the parent device of the thermal =
cooling device would currently
>> be the ACPI device bound to the "thermal" ACPI driver. In the context o=
f the Intel Wifi card, the parent
>> device would be PCI device bound to the corresponding Intel Wifi driver=
.
>>
>> I think you misunderstood what kind of parent device i was referring to=
. You likely though that i was referring
>> to the parent device of the ACPI ThermalZone, right?
> No.  I thought that you were referring to the ACPI ThermalZone itself.
> Or rather, a platform device associated with the ACPI ThermalZone
> (that is, the device the ACPI ThermalZone in the ACPI_COMPAION() of).

That is correct.

>> That however is not the case , with "parent device" i was
>> referring to the device responsible for creating a given struct thermal=
_zone_device instance.
> So I was not confused.
>
>>>>>> This patch series aims to fix this issue by extending the functions
>>>>>> used to register thermal zone/cooling devices to also accept a pare=
nt
>>>>>> device pointer. The first six patches convert all functions used fo=
r
>>>>>> registering cooling devices, while the functions used for registeri=
ng
>>>>>> thermal zone devices are converted by the remaining two patches.
>>>>>>
>>>>>> I tested this series on various devices containing (among others):
>>>>>> - ACPI thermal zones
>>>>>> - ACPI processor devices
>>>>>> - PCIe cooling devices
>>>>>> - Intel Wifi card
>>>>>> - Intel powerclamp
>>>>>> - Intel TCC cooling
>>>>> What exactly did you do to test it?
>>>> I tested:
>>>> - the thermal zone temperature readout
>>>> - correctness of the new sysfs links
>>>> - suspend/resume
>>>>
>>>> I also verified that ACPI thermal zones still bind with the ACPI fans=
.
>>> I see, thanks.
>>>
>>>>>> I also compile-tested the remaining affected drivers, however i wou=
ld
>>>>>> still be happy if the relevant maintainers (especially those of the
>>>>>> mellanox ethernet switch driver) could take a quick glance at the
>>>>>> code and verify that i am using the correct device as the parent
>>>>>> device.
>>>>> I think that the above paragraph is not relevant any more?
>>>> You are right, however i originally meant to CC the mellanox maintain=
ers as
>>>> i was a bit unsure about the changes i made to their driver. I will r=
ework
>>>> this section in the next revision and CC the mellanox maintainers.
>>>>
>>>>>> This work is also necessary for extending the ACPI thermal zone dri=
ver
>>>>>> to support the _TZD ACPI object in the future.
>>>>> I'm still unsure why _TZD support requires the ability to set a
>>>>> thermal zone parent device.
>>>> _TZD allows the ACPI thermal zone to bind to cooling devices other th=
an ACPI fans
>>>> and ACPI processors, like ACPI batteries.
>>> No, it is not for cooling devices if my reading of the specification
>>> is correct.  It says:
>>>
>>> "_TZD (Thermal Zone Devices)
>>>
>>> This optional object evaluates to a package of device names. Each name
>>> corresponds to a device in the ACPI namespace that is associated with
>>> the thermal zone. The temperature reported by the thermal zone is
>>> roughly correspondent to that of each of the devices."
>>>
>>> And then
>>>
>>> "The list of devices returned by the control method need not be a
>>> complete and absolute list of devices affected by the thermal zone.
>>> However, the package should at least contain the devices that would
>>> uniquely identify where this thermal zone is located in the machine.
>>> For example, a thermal zone in a docking station should include a
>>> device in the docking station, a thermal zone for the CD-ROM bay,
>>> should include the CD-ROM."
>>>
>>> So IIUC this is a list of devices allowing the location of the thermal
>>> zone to be figured out.  There's nothing about cooling in this
>>> definition.
>> Using _TZD to figure out the location of a given thermal zone is anothe=
r usage
>> of this ACPI control method, but lets take a look at section 11.6:
>>
>> - If _PSV is defined then either the _PSL or _TZD objects must exist. T=
he _PSL and _TZD objects may both exist.
>> - If _PSV is defined and _PSL is not defined then at least one device i=
n thermal zone, as indicated by either the
>>     _TZD device list or devices=E2=80=99 _TZM objects, must support dev=
ice performance states.
>>
>> So according to my understanding, _TZD can also be used to discover add=
itional cooling devices used for passive cooling.
> But it doesn't actually say how those "device performance states" are
> supposed to be used for cooling, does it?

Well, ACPI specifies how passive cooling should be done using percentage v=
alues between 0% and 100%,
so this part is actually specified.

>> This makes sense as _PSL is defined to only contain processor objects (=
see section 11.4.10), so _TZD can act like an
>> extension of _PSL for things like ACPI control method batteries (see 10=
.2.2.12).
> But not everything in _TZD needs to be a potential "cooling device"
> and how you'll decide which one is?

Devices in _TZD that have no cooling capability will simply never register=
 any cooling devices. This means that
the .should_bind callback of the ACPI thermal zone will never see those de=
vices. Only devices in _TZD that also
have the ability for (passive) cooling will register a cooling device, so =
only those devices will end up with
the .should_bind callback of the ACPI thermal zone.

The ACPI thermal zone treats _TZD as a list of ACPI handles. If some of th=
ose handles are unused, then this is
totally fine.

>> Microsoft also follows this approach (see https://learn.microsoft.com/e=
n-us/windows-hardware/design/device-experiences/design-guide
>> section "Thermally managed devices" paragraph "Processor aggregator").
> Interesting.
>
> I agree that it would make sense to follow them because there will be
> platform dependencies on that, if there aren't already.

My primary goal is to improve the Linux thermal subsystem to be as powerfu=
l as
the Windows thermal subsystem. This means that we must stop viewing _PSL, =
_ALx and _TZD
as something that only works with a predefined set of devices. Instead we =
must view
_PSL, _ALx and _TZD as something similar to the cooling-maps used for conn=
ecting
thermal zones and cooling devices on OF-based systems.

>>>> This however will currently not work as
>>>> the ACPI thermal zone driver uses the private drvdata of the cooling =
device to
>>>> determine if said cooling device should bind. This only works for ACP=
I fans and
>>>> processors due to the fact that those drivers store a ACPI device poi=
nter inside
>>>> drvdata, something the ACPI thermal zone expects.
>>> I'm not sure I understand the above.
>>>
>>> There is a list of ACPI device handles per trip point, as returned by
>>> either _PSL or _ALx.  Devices whose handles are in that list will be
>>> bound to the thermal zone, so long as there are struct acpi_device
>>> objects representing them which is verified with the help of the
>>> devdata field in struct thermal_cooling_device.
>> AFAIK devdata is meant to be used by the thermal zone device callbacks =
to access the state
>> container struct of the associated device driver instance. Assuming tha=
t a given device driver
>> will populate devdata with a pointer to is ACPI companion device is an =
implementation-specific
>> detail that does not apply to all cooling device implementations. It ju=
st so happens that the
>> ACPI processor and fan driver do this, likely because they where design=
ed specifically to work
>> with the ACPI thermal zone driver.
>>
>> The documentation of thermal_cooling_device_register() even describes d=
evdata as "device private data", so any meaning of devdata purely depends =
on the
>> given device driver.
> Yes, and these particular drivers decide to store a pointer to struct
> acpi_device in it.
>
> But this is not super important, they might as well set the
> ACPI_COMPANION() of the cooling device to the corresponding struct
> acpi_device and the ACPI thermal driver might use that information.
>
> I'm not opposed to using parents for this purpose, but it doesn't
> change the big picture that the ACPI thermal driver will need to know
> the ACPI handle corresponding to each cooling device.
>
> If you want to use _TZD instead of or in addition to _PSL for this, it
> doesn't change much here, it's just another list of ACPI handles, so
> saying that parents are needed for supporting this is not exactly
> accurate IMV.

My idea was something like this:

/* Cooling devices without a parent device cannot be referenced using ACPI=
 */
if (!cdev->device.parent)
	return false;

/* Not all devices are described inside the ACPI tables */
acpi_handle cdev_handle =3D ACPI_HANDLE(cdev->device.parent);
if (!cdev_handle)
	return false;

for (i =3D 0; i < acpi_trip->devices.count; i++) {
	acpi_handle handle =3D acpi_trip->devices.handles[i];

	if (handle =3D=3D cdev_handle)
		return true;
}

This only works if the parent device pointer of the cooling device is popu=
lated.

>>> IOW, cooling device drivers that create struct thermal_cooling_device
>>> objects representing them are expected to set devdata in those objects
>>> to point to struct acpi_device objects corresponding to their ACPI
>>> handles, but in principle acpi_thermal_should_bind_cdev() might as
>>> well just use the handles themselves.  It just needs to know that
>>> there is a cooling driver on the other side of the ACPI handle.
>>>
>>> The point is that a cooling device to be bound to an ACPI thermal zone
>>> needs an ACPI handle in the first place to be listed in _PSL or _ALx.
>> Correct, i merely change the way the ACPI thermal zone driver retrieves=
 the
>> ACPI handle associated with a given cooling device.
> Right.
>
>>>> As we cannot require all cooling devices to store an ACPI device poin=
ter inside
>>>> their drvdata field in order to support ACPI,
>>> Cooling devices don't store ACPI device pointers in struct
>>> thermal_cooling_device objects, ACPI cooling drivers do, and there are
>>> two reasons to do that: (1) to associate a given struct
>>> thermal_cooling_device with an ACPI handle and (2) to let
>>> acpi_thermal_should_bind_cdev() know that the cooling device is
>>> present and functional.
>>>
>>> This can be changed to store an ACPI handle in struct
>>> thermal_cooling_device and acpi_thermal_should_bind_cdev() may just
>>> verify that the device is there by itself.
>> I can of course extend thermal_cooling_device_register() to accept a fw=
node_handle that
>> can be used for both ACPI and OF based cooling device identification, i=
f this is what you
>> prefer.
> I'm not sure about this ATM and see below.
>
>> This patch series would then turn into a cleanup series, focusing on pr=
operly adding
>> thermal zone devices and cooling devices into the global device hierarc=
hy.
> I'd prefer to do one thing at a time though.
>
> If you want cooling devices to get parents, fine.  I'm not
> fundamentally opposed to that idea, but let's have clear rules for
> device drivers on how to set those parents for the sake of
> consistency.
>
> As for the ACPI case, one rule that I want to be followed (as already
> stated multiple times) is that a struct acpi_device can only be a
> parent of another struct acpi_device.  This means that the parent of a
> cooling device needs to be a platform device or similar representing
> the actual device that will be used for implementing the cooling.

OK.

> A separate question is how acpi_thermal_should_bind_cdev() will match
> cooling devices with the ACPI handles coming from _PSL, _ALx, _TZD
> etc. and the rule can be that it will look at the ACPI_COMPANION() of
> the parent of the given cooling device.

See the example code i pasted above, the whole matching is done using ACPI=
 handles,
so we can completely leave ACPI_COMPANION() out of this.

>>>> we must use a more generic approach.
>>> I'm not sure what use case you are talking about.
>>>
>>> Surely, devices with no representation in the ACPI namespace cannot be
>>> bound to ACPI thermal zones.  For devices that have a representation
>>> in the ACPI namespace, storing an ACPI handle in devdata should not be
>>> a problem.
>> See my above explanations for details, drvdata is defined to hold devic=
e private data,
>> nothing more.
> This is related to the discussion below.
>
>>>> I was thinking about using the acpi_handle of the parent device inste=
ad of messing
>>>> with the drvdata field, but this only works if the parent device poin=
ter of the
>>>> cooling device is populated.
>>>>
>>>> (Cooling devices without a parent device would then be ignored by the=
 ACPI thermal
>>>> zone driver, as such cooling devices cannot be linked to ACPI).
>>> It can be arranged this way, but what's the practical difference?
>>> Anyone who creates a struct thermal_cooling_device and can set its
>>> parent pointer to a device with an ACPI companion, may as well set its
>>> devdata to point to that companion directly - or to its ACPI handle if
>>> that's preferred.
>> Yes, but this would require explicit support for ACPI in every driver t=
hat registers cooling devices.
> So you want to have generic drivers that may work on ACPI platforms
> and on DT platforms to be able to create cooling devices for use with
> ACPI thermal zones.  Well, had you started the whole discussion with
> this statement, it would have been much easier to understand your
> point.

Sorry for the messy discussion, i intended to have two separate patch seri=
es. This one was meant to
simply be a preparation, with the important changes inside the ACPI therma=
l zone driver being implemented
with the second patch series.

That was also the reason why i send this series as an RFC.

>> Using the parent device to retrieve the acpi_handle or allowing all dri=
vers to just submit a fwnode_handle
>> of their choice when creating a cooling device will fix this.
> If you go the parents route, this is an important consideration for
> the rules on how to set those parents.  Namely, they would need to be
> set so that the fwnode_handle of the parent could be used for binding
> the cooling device to a thermal zone either on ACPI or on DT systems.
>
> Of course, there are also cooling devices whose parents will not have
> an fwnode_handle and they would still need to work in this brave new
> world.
>
True, i did not think of that. In this case extending thermal_of_cooling_d=
evice_register() and friends to accept
a generic fwnode_handle instead of a OF-specific device_node would make mo=
re sense. Most drivers can simply
pass the result of dev_fwnode() instead of dev->of_node, only those that s=
upport multiple cooling device child
nodes would need additional work to also support ACPI.

Basically, thermal_of_get_cooling_spec() could handle the fwnode_handle in=
 the following manner:

if (cooling_spec.np->fwnode !=3D cdev->fwnode)
	return false;

And the ACPI thermal zone driver could then simply use ACPI_HANDLE_FWNODE(=
) to retrieve the ACPI handle from
the fwnode_handle (together with a NULL check of course).

If you are OK with this approach, i will forget about the whole parent dev=
ice stuff for now and focus on extending
(devm_)thermal_of_cooling_device_register(). There are some additional cha=
nges needed for reliably associating
cooling devices to ACPI trip points using fwnode handles, but those are no=
t that intrusive.

What do you think?

Thanks,
Armin Wolf

