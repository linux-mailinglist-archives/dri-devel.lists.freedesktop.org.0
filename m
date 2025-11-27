Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB76C90160
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 21:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BE510E889;
	Thu, 27 Nov 2025 20:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="MC9NUiiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0010E81D;
 Thu, 27 Nov 2025 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764274009; x=1764878809; i=w_armin@gmx.de;
 bh=WUU4mZbFVrnnf2LiPJ1TJXYw/lX0h1Ny7ZDtLDeojvI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MC9NUiiwcmT6gTK3GZXM5pUNHJ9QsxL4kNixBRuaA2WDsHhKEJeLzA5R/UPjHFgi
 CEoAKdYSliF82rA5vJI6ycV7vvU+r4rh2g+6r0mRQpZOj7PkIp3NLfGk1O/UoTCma
 1XgI2z7UbCEp0YVGRaOSIB4ADLoVaZbnJ3bI3ybI7bDUqMnS1FUieCoWzNiTd5Bfx
 PQfN41Xsa+h1Mbao7DiI8Kxid0oCU3DPpiQbxgNjxRQg3ROgK8WF9JBpJuBfPanyT
 eJGXLPL3YTel6aIyV45PwxwWlj+pYuuHSQSG4wXlUCfo2TFRfbnJFZ2qD/SiPqU7n
 5Wm7DMlbKA6lewgAUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1vfobm3ICs-00VeXg; Thu, 27
 Nov 2025 21:06:49 +0100
Message-ID: <e360b9b3-ada4-4cd1-8971-097484cf3f5f@gmx.de>
Date: Thu, 27 Nov 2025 21:06:44 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJZ5v0iJVV=kf-aJBx8F8dtGfaZpGVyhfi6DBWEg4j3c_nH8_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qrki6SOqEIGLFWPBMhPwnNJPJELXsbzR7Mzi70IAb7Hal0cIpzD
 86osgu5I5WgLE9eEK5yTzGT6IrUhTR33bDmHS28/7MzijGxJgwNlSLE2vnSoJaTCXZnFQ3+
 tTM2X8QdFOEHbNO1cWBfDkuu6uOwwUAp0Uan56yjcEO5W8xK9JmFKqyr6CMz+zZ3jiePJtS
 Nk4ECuwZE0m4704Ww5xjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OkEAKy+/qnQ=;/CjZRdJUeTV5qr5KByOdmRF/uS1
 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
 N1Pk3q0vecj2iKehtXK7HNcJhJV1o
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

Am 27.11.25 um 18:41 schrieb Rafael J. Wysocki:

> On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
>>
>>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> Drivers registering thermal zone/cooling devices are currently unable
>>>> to tell the thermal core what parent device the new thermal zone/
>>>> cooling device should have, potentially causing issues with suspend
>>>> ordering
>>> This is one potential class of problems that may arise, but I would
>>> like to see a real example of this.
>>>
>>> As it stands today, thermal_class has no PM callbacks, so there are no
>>> callback execution ordering issues with devices in that class and what
>>> other suspend/resume ordering issues are there?
>> Correct, that is why i said "potentially".
>>
>>> Also, the suspend and resume of thermal zones is handled via PM
>>> notifiers.  Is there a problem with this?
>> The problem with PM notifiers is that thermal zones stop working even b=
efore
>> user space is frozen. Freezing user space might take a lot of time, so =
having
>> no thermal management during this period is less than ideal.
> This can be addressed by doing thermal zone suspend after freezing
> tasks and before starting to suspend devices.  Accordingly, thermal
> zones could be resumed after resuming devices and before thawing
> tasks.  That should not be an overly complex change to make.

AFAIK this is only possible by using dev_pm_ops, the PM notifier is trigge=
red before
tasks are frozen during suspend and after they are thawed during resume.

Using dev_pm_ops would also ensure that thermal zone devices are resumed a=
fter their
parent devices, so no additional changes inside the pm core would be neede=
d.

>> This problem would not occur when using dev_pm_ops, as thermal zones wo=
uld be
>> suspended after user space has been frozen successfully. Additionally, =
when using
>> dev_pm_ops we can get rid of thermal_pm_suspended, as the device core a=
lready mandates
>> that no new devices (including thermal zones and cooling devices) be re=
gistered during
>> a suspend/resume cycle.
>>
>> Replacing the PM notifiers with dev_pm_ops would of course be a optimiz=
ation with
>> its own patch series.
> Honestly, I don't see much benefit from using dev_pm_ops for thermal
> zone devices and cooling devices.  Moreover, I actually think that
> they could be "no PM" devices that are not even put on the
> suspend-resume device list.  Technically, they are just interfaces on
> top of some other devices allowing the user space to interact with the
> latter and combining different pieces described by the platform
> firmware.  They by themselves have no PM capabilities.

Correct, thermal zone devices are virtual devices representing thermal man=
agement
aspects of the underlying parent device. This however does not mean that t=
hermal zone
devices have no PM capabilities, because they contain state. Some part of =
this state
(namely TZ_STATE_FLAG_SUSPENDED and TZ_STATE_FLAG_RESUMING) is affected by=
 power management,
so we should tell the device core about this by using dev_pm_ops instead o=
f the PM notifier.

>>>> and making it impossible for user space applications to
>>>> associate a given thermal zone device with its parent device.
>>> Why does user space need to know the parent of a given cooling device
>>> or thermal zone?
>> Lets say that we have two thermal zones registered by two instances of =
the
>> Intel Wifi driver. User space is currently unable to find out which the=
rmal zone
>> belongs to which Wifi adapter, as both thermal zones have the (nearly) =
same type string ("iwlwifi[0-X]").
> But the "belong" part is not quite well defined here.  I think that
> what user space needs to know is what devices are located in a given
> thermal zone, isn't it?  Knowing the parent doesn't necessarily
> address this.

The device exposing a given thermal zone device is not always a member of =
the thermal zone itself.
In case of the Intel Wifi adapters, the individual Wifi adapters are indee=
d members of the thermal zone
associated with their thermal zone device. But thermal zones created thru =
a system management controller
for example might only cover devices like the CPUs and GPUs, not the syste=
m management controller device itself.

The parent device of a child device is the upstream device of the child de=
vice. The connection between parent
and child can be physical (SMBus controller (parent) -> i2c device (child)=
) or purely logical
(PCI device (parent) -> thermal zone device (child)). There exists a paren=
t-child dependency between a parent
and a child device (the child device cannot function without its parent be=
ing operational), and user space
might want to be able to discover such dependencies.

>> This problem would be solved once we populate the parent device pointer=
 inside the thermal zone
>> device, as user space can simply look at the "device" symlink to determ=
ine the parent device behind
>> a given thermal zone device.
> I'm not convinced about this.
>
>> Additionally, being able to access the acpi_handle of the parent device=
 will be necessary for the
>> ACPI thermal zone driver to support cooling devices other than ACPI fan=
s and ACPI processors.
> I guess by the "parent" you mean the device represented in the ACPI
> namespace by a ThermalZone object, right?  But this is not the same as
> the "parent" in the Wifi driver context, is it?

In the context of a ACPI ThermalZone, the parent device of the thermal coo=
ling device would currently
be the ACPI device bound to the "thermal" ACPI driver. In the context of t=
he Intel Wifi card, the parent
device would be PCI device bound to the corresponding Intel Wifi driver.

I think you misunderstood what kind of parent device i was referring to. Y=
ou likely though that i was referring
to the parent device of the ACPI ThermalZone, right? That however is not t=
he case , with "parent device" i was
referring to the device responsible for creating a given struct thermal_zo=
ne_device instance.

>>>> This patch series aims to fix this issue by extending the functions
>>>> used to register thermal zone/cooling devices to also accept a parent
>>>> device pointer. The first six patches convert all functions used for
>>>> registering cooling devices, while the functions used for registering
>>>> thermal zone devices are converted by the remaining two patches.
>>>>
>>>> I tested this series on various devices containing (among others):
>>>> - ACPI thermal zones
>>>> - ACPI processor devices
>>>> - PCIe cooling devices
>>>> - Intel Wifi card
>>>> - Intel powerclamp
>>>> - Intel TCC cooling
>>> What exactly did you do to test it?
>> I tested:
>> - the thermal zone temperature readout
>> - correctness of the new sysfs links
>> - suspend/resume
>>
>> I also verified that ACPI thermal zones still bind with the ACPI fans.
> I see, thanks.
>
>>>> I also compile-tested the remaining affected drivers, however i would
>>>> still be happy if the relevant maintainers (especially those of the
>>>> mellanox ethernet switch driver) could take a quick glance at the
>>>> code and verify that i am using the correct device as the parent
>>>> device.
>>> I think that the above paragraph is not relevant any more?
>> You are right, however i originally meant to CC the mellanox maintainer=
s as
>> i was a bit unsure about the changes i made to their driver. I will rew=
ork
>> this section in the next revision and CC the mellanox maintainers.
>>
>>>> This work is also necessary for extending the ACPI thermal zone drive=
r
>>>> to support the _TZD ACPI object in the future.
>>> I'm still unsure why _TZD support requires the ability to set a
>>> thermal zone parent device.
>> _TZD allows the ACPI thermal zone to bind to cooling devices other than=
 ACPI fans
>> and ACPI processors, like ACPI batteries.
> No, it is not for cooling devices if my reading of the specification
> is correct.  It says:
>
> "_TZD (Thermal Zone Devices)
>
> This optional object evaluates to a package of device names. Each name
> corresponds to a device in the ACPI namespace that is associated with
> the thermal zone. The temperature reported by the thermal zone is
> roughly correspondent to that of each of the devices."
>
> And then
>
> "The list of devices returned by the control method need not be a
> complete and absolute list of devices affected by the thermal zone.
> However, the package should at least contain the devices that would
> uniquely identify where this thermal zone is located in the machine.
> For example, a thermal zone in a docking station should include a
> device in the docking station, a thermal zone for the CD-ROM bay,
> should include the CD-ROM."
>
> So IIUC this is a list of devices allowing the location of the thermal
> zone to be figured out.  There's nothing about cooling in this
> definition.

Using _TZD to figure out the location of a given thermal zone is another u=
sage
of this ACPI control method, but lets take a look at section 11.6:

- If _PSV is defined then either the _PSL or _TZD objects must exist. The =
_PSL and _TZD objects may both exist.
- If _PSV is defined and _PSL is not defined then at least one device in t=
hermal zone, as indicated by either the
   _TZD device list or devices=E2=80=99 _TZM objects, must support device =
performance states.

So according to my understanding, _TZD can also be used to discover additi=
onal cooling devices used for passive cooling.
This makes sense as _PSL is defined to only contain processor objects (see=
 section 11.4.10), so _TZD can act like an
extension of _PSL for things like ACPI control method batteries (see 10.2.=
2.12).

Microsoft also follows this approach (see https://learn.microsoft.com/en-u=
s/windows-hardware/design/device-experiences/design-guide
section "Thermally managed devices" paragraph "Processor aggregator").

>> This however will currently not work as
>> the ACPI thermal zone driver uses the private drvdata of the cooling de=
vice to
>> determine if said cooling device should bind. This only works for ACPI =
fans and
>> processors due to the fact that those drivers store a ACPI device point=
er inside
>> drvdata, something the ACPI thermal zone expects.
> I'm not sure I understand the above.
>
> There is a list of ACPI device handles per trip point, as returned by
> either _PSL or _ALx.  Devices whose handles are in that list will be
> bound to the thermal zone, so long as there are struct acpi_device
> objects representing them which is verified with the help of the
> devdata field in struct thermal_cooling_device.

AFAIK devdata is meant to be used by the thermal zone device callbacks to =
access the state
container struct of the associated device driver instance. Assuming that a=
 given device driver
will populate devdata with a pointer to is ACPI companion device is an imp=
lementation-specific
detail that does not apply to all cooling device implementations. It just =
so happens that the
ACPI processor and fan driver do this, likely because they where designed =
specifically to work
with the ACPI thermal zone driver.

The documentation of thermal_cooling_device_register() even describes devd=
ata as "device private data", so any meaning of devdata purely depends on =
the=20
given device driver.

> IOW, cooling device drivers that create struct thermal_cooling_device
> objects representing them are expected to set devdata in those objects
> to point to struct acpi_device objects corresponding to their ACPI
> handles, but in principle acpi_thermal_should_bind_cdev() might as
> well just use the handles themselves.  It just needs to know that
> there is a cooling driver on the other side of the ACPI handle.
>
> The point is that a cooling device to be bound to an ACPI thermal zone
> needs an ACPI handle in the first place to be listed in _PSL or _ALx.

Correct, i merely change the way the ACPI thermal zone driver retrieves th=
e
ACPI handle associated with a given cooling device.

>> As we cannot require all cooling devices to store an ACPI device pointe=
r inside
>> their drvdata field in order to support ACPI,
> Cooling devices don't store ACPI device pointers in struct
> thermal_cooling_device objects, ACPI cooling drivers do, and there are
> two reasons to do that: (1) to associate a given struct
> thermal_cooling_device with an ACPI handle and (2) to let
> acpi_thermal_should_bind_cdev() know that the cooling device is
> present and functional.
>
> This can be changed to store an ACPI handle in struct
> thermal_cooling_device and acpi_thermal_should_bind_cdev() may just
> verify that the device is there by itself.

I can of course extend thermal_cooling_device_register() to accept a fwnod=
e_handle that
can be used for both ACPI and OF based cooling device identification, if t=
his is what you
prefer.

This patch series would then turn into a cleanup series, focusing on prope=
rly adding
thermal zone devices and cooling devices into the global device hierarchy.

>> we must use a more generic approach.
> I'm not sure what use case you are talking about.
>
> Surely, devices with no representation in the ACPI namespace cannot be
> bound to ACPI thermal zones.  For devices that have a representation
> in the ACPI namespace, storing an ACPI handle in devdata should not be
> a problem.

See my above explanations for details, drvdata is defined to hold device p=
rivate data,
nothing more.

>> I was thinking about using the acpi_handle of the parent device instead=
 of messing
>> with the drvdata field, but this only works if the parent device pointe=
r of the
>> cooling device is populated.
>>
>> (Cooling devices without a parent device would then be ignored by the A=
CPI thermal
>> zone driver, as such cooling devices cannot be linked to ACPI).
> It can be arranged this way, but what's the practical difference?
> Anyone who creates a struct thermal_cooling_device and can set its
> parent pointer to a device with an ACPI companion, may as well set its
> devdata to point to that companion directly - or to its ACPI handle if
> that's preferred.

Yes, but this would require explicit support for ACPI in every driver that=
 registers cooling devices.
Using the parent device to retrieve the acpi_handle or allowing all driver=
s to just submit a fwnode_handle
of their choice when creating a cooling device will fix this.

Thanks,
Armin Wolf

