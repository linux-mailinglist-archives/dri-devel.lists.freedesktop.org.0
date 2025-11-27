Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE1C8FBA0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 18:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19710E839;
	Thu, 27 Nov 2025 17:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GQo4zWhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F56510E772
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 17:41:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D415A442C0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 17:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95162C2BCAF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764265282;
 bh=YRwpnmivmIGfSil+ZD1aGlxCYo+UU/QzrOBg9t1fcoE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GQo4zWhWFwuM7yaQm/G6MoYrO1sGCe63LiivwvpbJXTuD4bpwtx7vVrjJq/jO3yNT
 /glPNOmTyEyuQgFnjW09IwIDuzYIhIp82Bq5tDcMxZ2FYvQimg6WzJuHjpMmBtLdRC
 7UHkgkhDXiAZGbYaljkVGuyQaHao2d5pJkHVYaTTRtcd/n5x9+u6+lZm+cbLEo/yUI
 r91c8vZQfOXME3t0aQ3s8j0vLUmV7g0L5ZqU6BMJPCG7P1VcW7pspVtnA3oNfQZt9a
 wFzr4/a6G8flzMAgfLEhY9Cq1WfAqIZxQ26MOBUnGa6tT8wSG9PPUc+wOdGDq10Lp1
 5jvmWmWflox3A==
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-6574de1cda1so401240eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:41:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVArHWM4QvhETup9nRlJA2Xteg6Eli4vYr2bvgWj72TNwTuPzGfHZyS0rvCQQ8IKtKRyHyREk0FFhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyABvhn+S6sf2wwJQ24Vx81UEOxpHrYWCUeNgJcat8X+1XuekMB
 17q6IMcj3+j8pJ8uKtaV3qQJ/PameMIGrUQPcaAvGusWQRnqXNl1/FhB/2kbmkHBv8G7dhTFRIV
 Q7Uz9wpiphZWcJVe2l+BMNkeId0EACi4=
X-Google-Smtp-Source: AGHT+IHbfQ5CxJ+BeKUIRbyKYrpAVhmzQHngDVOs0E2Nv7PPmdkB/EPrjv3dEJtB2ATSYwuHhVrLlp/6B/DbEuYhyUY=
X-Received: by 2002:a05:6808:14d3:b0:450:d7fb:85c2 with SMTP id
 5614622812f47-4514e6e1593mr4705868b6e.19.1764265281611; Thu, 27 Nov 2025
 09:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
 <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
 <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de>
In-Reply-To: <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Nov 2025 18:41:10 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iJVV=kf-aJBx8F8dtGfaZpGVyhfi6DBWEg4j3c_nH8_A@mail.gmail.com>
X-Gm-Features: AWmQ_bnNFzjNLr4ZD-k1rd8sHstOmmRzRHvS_v-U6yiSpHx7MBaeEIqIodGMGBQ
Message-ID: <CAJZ5v0iJVV=kf-aJBx8F8dtGfaZpGVyhfi6DBWEg4j3c_nH8_A@mail.gmail.com>
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

On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
>
> > On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
> >> Drivers registering thermal zone/cooling devices are currently unable
> >> to tell the thermal core what parent device the new thermal zone/
> >> cooling device should have, potentially causing issues with suspend
> >> ordering
> > This is one potential class of problems that may arise, but I would
> > like to see a real example of this.
> >
> > As it stands today, thermal_class has no PM callbacks, so there are no
> > callback execution ordering issues with devices in that class and what
> > other suspend/resume ordering issues are there?
>
> Correct, that is why i said "potentially".
>
> >
> > Also, the suspend and resume of thermal zones is handled via PM
> > notifiers.  Is there a problem with this?
>
> The problem with PM notifiers is that thermal zones stop working even bef=
ore
> user space is frozen. Freezing user space might take a lot of time, so ha=
ving
> no thermal management during this period is less than ideal.

This can be addressed by doing thermal zone suspend after freezing
tasks and before starting to suspend devices.  Accordingly, thermal
zones could be resumed after resuming devices and before thawing
tasks.  That should not be an overly complex change to make.

> This problem would not occur when using dev_pm_ops, as thermal zones woul=
d be
> suspended after user space has been frozen successfully. Additionally, wh=
en using
> dev_pm_ops we can get rid of thermal_pm_suspended, as the device core alr=
eady mandates
> that no new devices (including thermal zones and cooling devices) be regi=
stered during
> a suspend/resume cycle.
>
> Replacing the PM notifiers with dev_pm_ops would of course be a optimizat=
ion with
> its own patch series.

Honestly, I don't see much benefit from using dev_pm_ops for thermal
zone devices and cooling devices.  Moreover, I actually think that
they could be "no PM" devices that are not even put on the
suspend-resume device list.  Technically, they are just interfaces on
top of some other devices allowing the user space to interact with the
latter and combining different pieces described by the platform
firmware.  They by themselves have no PM capabilities.

> >> and making it impossible for user space applications to
> >> associate a given thermal zone device with its parent device.
> > Why does user space need to know the parent of a given cooling device
> > or thermal zone?
>
> Lets say that we have two thermal zones registered by two instances of th=
e
> Intel Wifi driver. User space is currently unable to find out which therm=
al zone
> belongs to which Wifi adapter, as both thermal zones have the (nearly) sa=
me type string ("iwlwifi[0-X]").

But the "belong" part is not quite well defined here.  I think that
what user space needs to know is what devices are located in a given
thermal zone, isn't it?  Knowing the parent doesn't necessarily
address this.

> This problem would be solved once we populate the parent device pointer i=
nside the thermal zone
> device, as user space can simply look at the "device" symlink to determin=
e the parent device behind
> a given thermal zone device.

I'm not convinced about this.

> Additionally, being able to access the acpi_handle of the parent device w=
ill be necessary for the
> ACPI thermal zone driver to support cooling devices other than ACPI fans =
and ACPI processors.

I guess by the "parent" you mean the device represented in the ACPI
namespace by a ThermalZone object, right?  But this is not the same as
the "parent" in the Wifi driver context, is it?

> >> This patch series aims to fix this issue by extending the functions
> >> used to register thermal zone/cooling devices to also accept a parent
> >> device pointer. The first six patches convert all functions used for
> >> registering cooling devices, while the functions used for registering
> >> thermal zone devices are converted by the remaining two patches.
> >>
> >> I tested this series on various devices containing (among others):
> >> - ACPI thermal zones
> >> - ACPI processor devices
> >> - PCIe cooling devices
> >> - Intel Wifi card
> >> - Intel powerclamp
> >> - Intel TCC cooling
> > What exactly did you do to test it?
>
> I tested:
> - the thermal zone temperature readout
> - correctness of the new sysfs links
> - suspend/resume
>
> I also verified that ACPI thermal zones still bind with the ACPI fans.

I see, thanks.

> >> I also compile-tested the remaining affected drivers, however i would
> >> still be happy if the relevant maintainers (especially those of the
> >> mellanox ethernet switch driver) could take a quick glance at the
> >> code and verify that i am using the correct device as the parent
> >> device.
> > I think that the above paragraph is not relevant any more?
>
> You are right, however i originally meant to CC the mellanox maintainers =
as
> i was a bit unsure about the changes i made to their driver. I will rewor=
k
> this section in the next revision and CC the mellanox maintainers.
>
> >
> >> This work is also necessary for extending the ACPI thermal zone driver
> >> to support the _TZD ACPI object in the future.
> > I'm still unsure why _TZD support requires the ability to set a
> > thermal zone parent device.
>
> _TZD allows the ACPI thermal zone to bind to cooling devices other than A=
CPI fans
> and ACPI processors, like ACPI batteries.

No, it is not for cooling devices if my reading of the specification
is correct.  It says:

"_TZD (Thermal Zone Devices)

This optional object evaluates to a package of device names. Each name
corresponds to a device in the ACPI namespace that is associated with
the thermal zone. The temperature reported by the thermal zone is
roughly correspondent to that of each of the devices."

And then

"The list of devices returned by the control method need not be a
complete and absolute list of devices affected by the thermal zone.
However, the package should at least contain the devices that would
uniquely identify where this thermal zone is located in the machine.
For example, a thermal zone in a docking station should include a
device in the docking station, a thermal zone for the CD-ROM bay,
should include the CD-ROM."

So IIUC this is a list of devices allowing the location of the thermal
zone to be figured out.  There's nothing about cooling in this
definition.

> This however will currently not work as
> the ACPI thermal zone driver uses the private drvdata of the cooling devi=
ce to
> determine if said cooling device should bind. This only works for ACPI fa=
ns and
> processors due to the fact that those drivers store a ACPI device pointer=
 inside
> drvdata, something the ACPI thermal zone expects.

I'm not sure I understand the above.

There is a list of ACPI device handles per trip point, as returned by
either _PSL or _ALx.  Devices whose handles are in that list will be
bound to the thermal zone, so long as there are struct acpi_device
objects representing them which is verified with the help of the
devdata field in struct thermal_cooling_device.

IOW, cooling device drivers that create struct thermal_cooling_device
objects representing them are expected to set devdata in those objects
to point to struct acpi_device objects corresponding to their ACPI
handles, but in principle acpi_thermal_should_bind_cdev() might as
well just use the handles themselves.  It just needs to know that
there is a cooling driver on the other side of the ACPI handle.

The point is that a cooling device to be bound to an ACPI thermal zone
needs an ACPI handle in the first place to be listed in _PSL or _ALx.

> As we cannot require all cooling devices to store an ACPI device pointer =
inside
> their drvdata field in order to support ACPI,

Cooling devices don't store ACPI device pointers in struct
thermal_cooling_device objects, ACPI cooling drivers do, and there are
two reasons to do that: (1) to associate a given struct
thermal_cooling_device with an ACPI handle and (2) to let
acpi_thermal_should_bind_cdev() know that the cooling device is
present and functional.

This can be changed to store an ACPI handle in struct
thermal_cooling_device and acpi_thermal_should_bind_cdev() may just
verify that the device is there by itself.

> we must use a more generic approach.

I'm not sure what use case you are talking about.

Surely, devices with no representation in the ACPI namespace cannot be
bound to ACPI thermal zones.  For devices that have a representation
in the ACPI namespace, storing an ACPI handle in devdata should not be
a problem.

> I was thinking about using the acpi_handle of the parent device instead o=
f messing
> with the drvdata field, but this only works if the parent device pointer =
of the
> cooling device is populated.
>
> (Cooling devices without a parent device would then be ignored by the ACP=
I thermal
> zone driver, as such cooling devices cannot be linked to ACPI).

It can be arranged this way, but what's the practical difference?
Anyone who creates a struct thermal_cooling_device and can set its
parent pointer to a device with an ACPI companion, may as well set its
devdata to point to that companion directly - or to its ACPI handle if
that's preferred.
