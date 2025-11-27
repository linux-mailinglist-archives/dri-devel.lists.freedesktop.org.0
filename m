Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A224FC903D5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 22:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFD310E04F;
	Thu, 27 Nov 2025 21:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iq+L3smq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8F610E8E0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:47:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9CD2C442C9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D01FC16AAE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764280029;
 bh=0hbwTH5W/JlWKv9bNMjq36XQT6ojFwR3MpjzfawHYAo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iq+L3smqUYdeNudiBtdYdT2RzYy3Np9HmKuBwTHMb1oosvKvcQ0ozV9ftXBCSeAEL
 IfV+Rj2P4WVx2i1yREbklfsDBYCjUY+VFSOLu8Wiy8IKr9O48AR+Z8FJLzTwG3s6ca
 0HtEWWtVVtEUppn+fgwqRkmmlnNKus+WLA4/3KrfimZoBIv09hrbkI25NUeH1YlolV
 8UM5kZVv86d1KGXEnlCBZzTAXWnfjY8aG40zhSQ2aNc0z0+ESVU5Hdpf20zvM0IpkV
 cBTzGT1RXEjAXiy8WBwH3VdstalR5W7zlFj950ohYJpoy5LQfDSIJFzj+JjlQlrf+j
 iVGjWYXCD2oxg==
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-450063be247so433726b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 13:47:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoSOwpPQlcKgf5rVnIpzQu0wayuhuM2fvvB584EHnCAhgewHbh9AX/oUxOvRHvHS77+UsVlShlItA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBT5A1lKFJYYVM1VZlMwwL7O25gMT3mVIwn1wX+5AsICUUNggq
 CEUYqlvwDWislspOzr8oeQtcAvvUBxX9A4Cmw9uLstQ1bsVeFxjUQZeFdGUWpp7ybZcUrjSRaZw
 +ciwKAzIyTcLTEA9/0WYZcQO8mW5FlYY=
X-Google-Smtp-Source: AGHT+IFmxxeOGUZ3As3e5BufQf4xNzGTm7a385xAZ3Y0cZ1X4zoOX5pvKGR4+1mZPCbutdUHj673OdSkeTXc9RZYPJo=
X-Received: by 2002:a05:6808:1507:b0:44f:fc93:f612 with SMTP id
 5614622812f47-4514e79dd05mr4974594b6e.32.1764280028352; Thu, 27 Nov 2025
 13:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
 <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
 <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de>
 <CAJZ5v0iJVV=kf-aJBx8F8dtGfaZpGVyhfi6DBWEg4j3c_nH8_A@mail.gmail.com>
 <e360b9b3-ada4-4cd1-8971-097484cf3f5f@gmx.de>
In-Reply-To: <e360b9b3-ada4-4cd1-8971-097484cf3f5f@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Nov 2025 22:46:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ij_Frdrya3=FaekbU2DFHUyBJnBq-oe9jRsB9eqXDisA@mail.gmail.com>
X-Gm-Features: AWmQ_bnaSW9x-ggzFC_V23fXty6wAm5053FuGqaNQc77lPfLojGlov-ebGjIlT8
Message-ID: <CAJZ5v0ij_Frdrya3=FaekbU2DFHUyBJnBq-oe9jRsB9eqXDisA@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Nov 27, 2025 at 9:06=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 27.11.25 um 18:41 schrieb Rafael J. Wysocki:
>
> > On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
> >> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
> >>
> >>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> w=
rote:
> >>>> Drivers registering thermal zone/cooling devices are currently unabl=
e
> >>>> to tell the thermal core what parent device the new thermal zone/
> >>>> cooling device should have, potentially causing issues with suspend
> >>>> ordering
> >>> This is one potential class of problems that may arise, but I would
> >>> like to see a real example of this.
> >>>
> >>> As it stands today, thermal_class has no PM callbacks, so there are n=
o
> >>> callback execution ordering issues with devices in that class and wha=
t
> >>> other suspend/resume ordering issues are there?
> >> Correct, that is why i said "potentially".
> >>
> >>> Also, the suspend and resume of thermal zones is handled via PM
> >>> notifiers.  Is there a problem with this?
> >> The problem with PM notifiers is that thermal zones stop working even =
before
> >> user space is frozen. Freezing user space might take a lot of time, so=
 having
> >> no thermal management during this period is less than ideal.
> > This can be addressed by doing thermal zone suspend after freezing
> > tasks and before starting to suspend devices.  Accordingly, thermal
> > zones could be resumed after resuming devices and before thawing
> > tasks.  That should not be an overly complex change to make.
>
> AFAIK this is only possible by using dev_pm_ops,

Of course it is not the case.

For example, thermal_pm_notify_prepare() could be called directly from
dpm_prepare() and thermal_pm_notify_complete() could be called
directly from dpm_complete() (which would require switching over
thermal to a non-freezable workqueue).

> the PM notifier is triggered before tasks are frozen during suspend and a=
fter they are thawed during resume.

I know that.

> Using dev_pm_ops would also ensure that thermal zone devices are resumed =
after their
> parent devices, so no additional changes inside the pm core would be need=
ed.

Not really.  thermal_pm_suspended needs to be set and cleared from somewher=
e.

> >> This problem would not occur when using dev_pm_ops, as thermal zones w=
ould be
> >> suspended after user space has been frozen successfully. Additionally,=
 when using
> >> dev_pm_ops we can get rid of thermal_pm_suspended, as the device core =
already mandates
> >> that no new devices (including thermal zones and cooling devices) be r=
egistered during
> >> a suspend/resume cycle.
> >>
> >> Replacing the PM notifiers with dev_pm_ops would of course be a optimi=
zation with
> >> its own patch series.
> >
> > Honestly, I don't see much benefit from using dev_pm_ops for thermal
> > zone devices and cooling devices.  Moreover, I actually think that
> > they could be "no PM" devices that are not even put on the
> > suspend-resume device list.  Technically, they are just interfaces on
> > top of some other devices allowing the user space to interact with the
> > latter and combining different pieces described by the platform
> > firmware.  They by themselves have no PM capabilities.
>
> Correct, thermal zone devices are virtual devices representing thermal ma=
nagement
> aspects of the underlying parent device. This however does not mean that =
thermal zone
> devices have no PM capabilities, because they contain state. Some part of=
 this state
> (namely TZ_STATE_FLAG_SUSPENDED and TZ_STATE_FLAG_RESUMING) is affected b=
y power management,
> so we should tell the device core about this by using dev_pm_ops instead =
of the PM notifier.

Changing the zone state to anything different from TZ_STATE_READY
causes __thermal_zone_device_update() to do nothing and this is the
whole "suspend".  It does not need to be done from a PM callback and I
see no reason why doing it from a PM callback would be desirable.
Sorry.

Apart from the above, TZ_STATE_FLAG_SUSPENDED and
TZ_STATE_FLAG_RESUMING are only used for coordination between
thermal_zone_pm_prepare(), thermal_zone_device_resume() and
thermal_zone_pm_complete(), so this is not a state anything other then
the specific thermal zone in question cares about.

Moreover, resuming a thermal zone before resuming any cooling devices
bound to it would almost certainly break things and I'm not sure how
you would make that work with dev_pm_ops.  BTW, using device links for
this is not an option as far as I'm concerned.

> >>>> and making it impossible for user space applications to
> >>>> associate a given thermal zone device with its parent device.
> >>> Why does user space need to know the parent of a given cooling device
> >>> or thermal zone?
> >> Lets say that we have two thermal zones registered by two instances of=
 the
> >> Intel Wifi driver. User space is currently unable to find out which th=
ermal zone
> >> belongs to which Wifi adapter, as both thermal zones have the (nearly)=
 same type string ("iwlwifi[0-X]").
> > But the "belong" part is not quite well defined here.  I think that
> > what user space needs to know is what devices are located in a given
> > thermal zone, isn't it?  Knowing the parent doesn't necessarily
> > address this.
>
> The device exposing a given thermal zone device is not always a member of=
 the thermal zone itself.
> In case of the Intel Wifi adapters, the individual Wifi adapters are inde=
ed members of the thermal zone
> associated with their thermal zone device. But thermal zones created thru=
 a system management controller
> for example might only cover devices like the CPUs and GPUs, not the syst=
em management controller device itself.

Well, exactly.

> The parent device of a child device is the upstream device of the child d=
evice. The connection between parent
> and child can be physical (SMBus controller (parent) -> i2c device (child=
)) or purely logical
> (PCI device (parent) -> thermal zone device (child)). There exists a pare=
nt-child dependency between a parent
> and a child device (the child device cannot function without its parent b=
eing operational), and user space
> might want to be able to discover such dependencies.

But this needs to be consistent.

If the parent of one thermal zone represents the device affected by it
and the parent of another thermal zone represents something else, user
space will need platform-specific knowledge to figure this out, which
is the case today.  Without consistency, this is just not useful.

> >> This problem would be solved once we populate the parent device pointe=
r inside the thermal zone
> >> device, as user space can simply look at the "device" symlink to deter=
mine the parent device behind
> >> a given thermal zone device.
> > I'm not convinced about this.
> >
> >> Additionally, being able to access the acpi_handle of the parent devic=
e will be necessary for the
> >> ACPI thermal zone driver to support cooling devices other than ACPI fa=
ns and ACPI processors.
> > I guess by the "parent" you mean the device represented in the ACPI
> > namespace by a ThermalZone object, right?  But this is not the same as
> > the "parent" in the Wifi driver context, is it?
>
> In the context of a ACPI ThermalZone, the parent device of the thermal co=
oling device would currently
> be the ACPI device bound to the "thermal" ACPI driver. In the context of =
the Intel Wifi card, the parent
> device would be PCI device bound to the corresponding Intel Wifi driver.
>
> I think you misunderstood what kind of parent device i was referring to. =
You likely though that i was referring
> to the parent device of the ACPI ThermalZone, right?

No.  I thought that you were referring to the ACPI ThermalZone itself.
Or rather, a platform device associated with the ACPI ThermalZone
(that is, the device the ACPI ThermalZone in the ACPI_COMPAION() of).

> That however is not the case , with "parent device" i was
> referring to the device responsible for creating a given struct thermal_z=
one_device instance.

So I was not confused.

> >>>> This patch series aims to fix this issue by extending the functions
> >>>> used to register thermal zone/cooling devices to also accept a paren=
t
> >>>> device pointer. The first six patches convert all functions used for
> >>>> registering cooling devices, while the functions used for registerin=
g
> >>>> thermal zone devices are converted by the remaining two patches.
> >>>>
> >>>> I tested this series on various devices containing (among others):
> >>>> - ACPI thermal zones
> >>>> - ACPI processor devices
> >>>> - PCIe cooling devices
> >>>> - Intel Wifi card
> >>>> - Intel powerclamp
> >>>> - Intel TCC cooling
> >>> What exactly did you do to test it?
> >> I tested:
> >> - the thermal zone temperature readout
> >> - correctness of the new sysfs links
> >> - suspend/resume
> >>
> >> I also verified that ACPI thermal zones still bind with the ACPI fans.
> > I see, thanks.
> >
> >>>> I also compile-tested the remaining affected drivers, however i woul=
d
> >>>> still be happy if the relevant maintainers (especially those of the
> >>>> mellanox ethernet switch driver) could take a quick glance at the
> >>>> code and verify that i am using the correct device as the parent
> >>>> device.
> >>> I think that the above paragraph is not relevant any more?
> >> You are right, however i originally meant to CC the mellanox maintaine=
rs as
> >> i was a bit unsure about the changes i made to their driver. I will re=
work
> >> this section in the next revision and CC the mellanox maintainers.
> >>
> >>>> This work is also necessary for extending the ACPI thermal zone driv=
er
> >>>> to support the _TZD ACPI object in the future.
> >>> I'm still unsure why _TZD support requires the ability to set a
> >>> thermal zone parent device.
> >> _TZD allows the ACPI thermal zone to bind to cooling devices other tha=
n ACPI fans
> >> and ACPI processors, like ACPI batteries.
> > No, it is not for cooling devices if my reading of the specification
> > is correct.  It says:
> >
> > "_TZD (Thermal Zone Devices)
> >
> > This optional object evaluates to a package of device names. Each name
> > corresponds to a device in the ACPI namespace that is associated with
> > the thermal zone. The temperature reported by the thermal zone is
> > roughly correspondent to that of each of the devices."
> >
> > And then
> >
> > "The list of devices returned by the control method need not be a
> > complete and absolute list of devices affected by the thermal zone.
> > However, the package should at least contain the devices that would
> > uniquely identify where this thermal zone is located in the machine.
> > For example, a thermal zone in a docking station should include a
> > device in the docking station, a thermal zone for the CD-ROM bay,
> > should include the CD-ROM."
> >
> > So IIUC this is a list of devices allowing the location of the thermal
> > zone to be figured out.  There's nothing about cooling in this
> > definition.
>
> Using _TZD to figure out the location of a given thermal zone is another =
usage
> of this ACPI control method, but lets take a look at section 11.6:
>
> - If _PSV is defined then either the _PSL or _TZD objects must exist. The=
 _PSL and _TZD objects may both exist.
> - If _PSV is defined and _PSL is not defined then at least one device in =
thermal zone, as indicated by either the
>    _TZD device list or devices=E2=80=99 _TZM objects, must support device=
 performance states.
>
> So according to my understanding, _TZD can also be used to discover addit=
ional cooling devices used for passive cooling.

But it doesn't actually say how those "device performance states" are
supposed to be used for cooling, does it?

> This makes sense as _PSL is defined to only contain processor objects (se=
e section 11.4.10), so _TZD can act like an
> extension of _PSL for things like ACPI control method batteries (see 10.2=
.2.12).

But not everything in _TZD needs to be a potential "cooling device"
and how you'll decide which one is?

> Microsoft also follows this approach (see https://learn.microsoft.com/en-=
us/windows-hardware/design/device-experiences/design-guide
> section "Thermally managed devices" paragraph "Processor aggregator").

Interesting.

I agree that it would make sense to follow them because there will be
platform dependencies on that, if there aren't already.

> >> This however will currently not work as
> >> the ACPI thermal zone driver uses the private drvdata of the cooling d=
evice to
> >> determine if said cooling device should bind. This only works for ACPI=
 fans and
> >> processors due to the fact that those drivers store a ACPI device poin=
ter inside
> >> drvdata, something the ACPI thermal zone expects.
> > I'm not sure I understand the above.
> >
> > There is a list of ACPI device handles per trip point, as returned by
> > either _PSL or _ALx.  Devices whose handles are in that list will be
> > bound to the thermal zone, so long as there are struct acpi_device
> > objects representing them which is verified with the help of the
> > devdata field in struct thermal_cooling_device.
>
> AFAIK devdata is meant to be used by the thermal zone device callbacks to=
 access the state
> container struct of the associated device driver instance. Assuming that =
a given device driver
> will populate devdata with a pointer to is ACPI companion device is an im=
plementation-specific
> detail that does not apply to all cooling device implementations. It just=
 so happens that the
> ACPI processor and fan driver do this, likely because they where designed=
 specifically to work
> with the ACPI thermal zone driver.
>
> The documentation of thermal_cooling_device_register() even describes dev=
data as "device private data", so any meaning of devdata purely depends on =
the
> given device driver.

Yes, and these particular drivers decide to store a pointer to struct
acpi_device in it.

But this is not super important, they might as well set the
ACPI_COMPANION() of the cooling device to the corresponding struct
acpi_device and the ACPI thermal driver might use that information.

I'm not opposed to using parents for this purpose, but it doesn't
change the big picture that the ACPI thermal driver will need to know
the ACPI handle corresponding to each cooling device.

If you want to use _TZD instead of or in addition to _PSL for this, it
doesn't change much here, it's just another list of ACPI handles, so
saying that parents are needed for supporting this is not exactly
accurate IMV.

> > IOW, cooling device drivers that create struct thermal_cooling_device
> > objects representing them are expected to set devdata in those objects
> > to point to struct acpi_device objects corresponding to their ACPI
> > handles, but in principle acpi_thermal_should_bind_cdev() might as
> > well just use the handles themselves.  It just needs to know that
> > there is a cooling driver on the other side of the ACPI handle.
> >
> > The point is that a cooling device to be bound to an ACPI thermal zone
> > needs an ACPI handle in the first place to be listed in _PSL or _ALx.
>
> Correct, i merely change the way the ACPI thermal zone driver retrieves t=
he
> ACPI handle associated with a given cooling device.

Right.

> >> As we cannot require all cooling devices to store an ACPI device point=
er inside
> >> their drvdata field in order to support ACPI,
> > Cooling devices don't store ACPI device pointers in struct
> > thermal_cooling_device objects, ACPI cooling drivers do, and there are
> > two reasons to do that: (1) to associate a given struct
> > thermal_cooling_device with an ACPI handle and (2) to let
> > acpi_thermal_should_bind_cdev() know that the cooling device is
> > present and functional.
> >
> > This can be changed to store an ACPI handle in struct
> > thermal_cooling_device and acpi_thermal_should_bind_cdev() may just
> > verify that the device is there by itself.
>
> I can of course extend thermal_cooling_device_register() to accept a fwno=
de_handle that
> can be used for both ACPI and OF based cooling device identification, if =
this is what you
> prefer.

I'm not sure about this ATM and see below.

> This patch series would then turn into a cleanup series, focusing on prop=
erly adding
> thermal zone devices and cooling devices into the global device hierarchy=
.

I'd prefer to do one thing at a time though.

If you want cooling devices to get parents, fine.  I'm not
fundamentally opposed to that idea, but let's have clear rules for
device drivers on how to set those parents for the sake of
consistency.

As for the ACPI case, one rule that I want to be followed (as already
stated multiple times) is that a struct acpi_device can only be a
parent of another struct acpi_device.  This means that the parent of a
cooling device needs to be a platform device or similar representing
the actual device that will be used for implementing the cooling.

A separate question is how acpi_thermal_should_bind_cdev() will match
cooling devices with the ACPI handles coming from _PSL, _ALx, _TZD
etc. and the rule can be that it will look at the ACPI_COMPANION() of
the parent of the given cooling device.

> >> we must use a more generic approach.
> > I'm not sure what use case you are talking about.
> >
> > Surely, devices with no representation in the ACPI namespace cannot be
> > bound to ACPI thermal zones.  For devices that have a representation
> > in the ACPI namespace, storing an ACPI handle in devdata should not be
> > a problem.
>
> See my above explanations for details, drvdata is defined to hold device =
private data,
> nothing more.

This is related to the discussion below.

> >> I was thinking about using the acpi_handle of the parent device instea=
d of messing
> >> with the drvdata field, but this only works if the parent device point=
er of the
> >> cooling device is populated.
> >>
> >> (Cooling devices without a parent device would then be ignored by the =
ACPI thermal
> >> zone driver, as such cooling devices cannot be linked to ACPI).
> > It can be arranged this way, but what's the practical difference?
> > Anyone who creates a struct thermal_cooling_device and can set its
> > parent pointer to a device with an ACPI companion, may as well set its
> > devdata to point to that companion directly - or to its ACPI handle if
> > that's preferred.
>
> Yes, but this would require explicit support for ACPI in every driver tha=
t registers cooling devices.

So you want to have generic drivers that may work on ACPI platforms
and on DT platforms to be able to create cooling devices for use with
ACPI thermal zones.  Well, had you started the whole discussion with
this statement, it would have been much easier to understand your
point.

> Using the parent device to retrieve the acpi_handle or allowing all drive=
rs to just submit a fwnode_handle
> of their choice when creating a cooling device will fix this.

If you go the parents route, this is an important consideration for
the rules on how to set those parents.  Namely, they would need to be
set so that the fwnode_handle of the parent could be used for binding
the cooling device to a thermal zone either on ACPI or on DT systems.

Of course, there are also cooling devices whose parents will not have
an fwnode_handle and they would still need to work in this brave new
world.
