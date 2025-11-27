Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB836C9046D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 23:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732A710E86B;
	Thu, 27 Nov 2025 22:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mxXJsiNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC11510E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 22:14:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5B2C44008
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 22:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E538C16AAE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 22:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764281680;
 bh=eBS0CUizpUI0IUV5eENk604ryPB8tzKxAgoT6Iv/rNI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mxXJsiNxhN1S4+aaL4NbV6VQmJPpBrqirZIT11lmoiHRFXWYqOdHgLT8nO/dex4lu
 b7GrvOOExqharqQdAnDFbOwJ2/6KIKAoGI8Ov0Jz1/eH7uCa4i3sUatetNWNmLla/b
 gmKseYf9lrbt/ekwpRBQ+j5p9AvkGXK0MueOr/uY+Bcmk8YsZ3jw+EmPr5EM9Xyyal
 w1SmZZ/DOWEfb+N8J8aZQSBGaoJh/eg6OzG5nfJN1KPSC3nC0ViYIRVVicAehr2FDP
 LCDRlTMMeoJ5ENTrtfXzS6KAU7rPSkbbhwwkQO9+40ZZb5aHdlQzERXU+RPoNg/4Gr
 IufmTo+X4LXXQ==
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-65791c35134so551976eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX1gV2iojcOr6RsJy2nwttpOkDknvf96kDR1Zsid+O1lNQz1Z33kwznKv8IrrwPMfKJRf7XqNlx4SA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQLHSZ0itz9iFxEG8z+um2TDPkEhZKGPo/WTpy0WQViP9wgURr
 3YB0yFmEuM45T/hTfhP0zvOBwmukmT1rQnhoDrdx0eCkdpzeKRn1vIoRDkNhp7HnzlpvEYsKUcE
 UDaJRaScbyEYE7Eifym6eNWSm+iEx1bk=
X-Google-Smtp-Source: AGHT+IFwPll0f82sEFyAgxPzXsJ3Sz08LKmddouqPj3T99a8UMq1Mqm0U4kLPk1yoT7JDPl2CGsyiJV/R33trqfiRI4=
X-Received: by 2002:a05:6820:2982:b0:657:60b8:b07c with SMTP id
 006d021491bc7-657bdae7b8bmr3877565eaf.2.1764281679535; Thu, 27 Nov 2025
 14:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
 <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
 <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de>
 <CAJZ5v0hdqY-=O5Ai6c5qjMr_pRFc+SDyV1QruM=ZeHH9Z=guSg@mail.gmail.com>
 <cf86344b-d9f1-4d3c-9fe9-deeb4ade9304@gmx.de>
In-Reply-To: <cf86344b-d9f1-4d3c-9fe9-deeb4ade9304@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Nov 2025 23:14:27 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iH8jkqJaSNtqaTHxt_305DeiEq0AqQCo4Eho5hMKkU4Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnDEMFFW397UhskjKnrkd8ZW685Q6DyeE8xXCdq63xxksrcXk6fCdtHXQ8
Message-ID: <CAJZ5v0iH8jkqJaSNtqaTHxt_305DeiEq0AqQCo4Eho5hMKkU4Q@mail.gmail.com>
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

On Thu, Nov 27, 2025 at 9:29=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 27.11.25 um 19:22 schrieb Rafael J. Wysocki:
>
> > On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
> >> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
> >>
> >>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> w=
rote:
> > [...]
> >
> >>>> ---
> >>>> Armin Wolf (8):
> >>>>         thermal: core: Allow setting the parent device of cooling de=
vices
> >>>>         thermal: core: Set parent device in thermal_of_cooling_devic=
e_register()
> >>>>         ACPI: processor: Stop creating "device" sysfs link
> >>> That link is not to the cooling devices' parent, but to the ACPI
> >>> device object (a struct acpi_device) that corresponds to the parent.
> >>> The parent of the cooling device should be the processor device, not
> >>> its ACPI companion, so I'm not sure why there would be a conflict.
> >>   From the perspective of the Linux device core, a parent device does =
not have to be
> >> a "physical" device. In the case of the ACPI processor driver, the ACP=
I device is used,
> >> so the cooling device registered by said driver belongs to the ACPI de=
vice.
> > Well, that's a problem.  A struct acpi_device should not be a parent
> > of anything other than a struct acpi_device.
>
> Understandable, in this case we should indeed use the the CPU device, esp=
ecially since the fwnode
> associated with it already points to the correct ACPI processor object (a=
t least on my machine).
>
> >> I agree that using the Linux processor device would make more sense, b=
ut this will require
> >> changes inside the ACPI processor driver.
> > So be it.
>
> OK.
>
> >> As for the "device" symlink: The conflict would be a naming conflict, =
as both "device" symlinks
> >> (the one created by the ACPI processor driver and the one created by t=
he device core) will
> >> be created in the same directory (which is the directory of the coolin=
g device).
> > I see.
> >
> > But why is the new symlink needed in the first place?  If the device
> > has a parent, it will appear under that parent in /sys/devices/, won't
> > it?
> >
> > Currently, all of the thermal class devices appear under
> > /sys/devices/virtual/thermal/ because they have no parents and they
> > all get a class parent kobject under /sys/devices/virtual/, as that's
> > what get_device_parent() does.
> >
> > If they have real parents, they will appear under those parents, so
> > why will the parents need to be pointed to additionally?
>
> The "device" smylink is a comfort feature provided by the device core its=
elf to allow user space
> application to traverse the device tree from bottom to top, like a double=
-linked list. We cannot
> disable the creation of this symlink, nor should we.

I think you mean device_add_class_symlinks(), but that's just for
class devices.  Of course, thermal devices are class devices, so
they'll get those links if they get parents.  Fair enough.

> > BTW, this means that the layout of /sys/devices/ will change when
> > thermal devices get real parents.  I'm not sure if this is a problem,
> > but certainly something to note.
>
> I know, most applications likely use /sys/class/thermal/, so they are not=
 impacted by this. I will
> note this in the cover letter of the next revision.
>
> >>>>         ACPI: fan: Stop creating "device" sysfs link
> >>>>         ACPI: video: Stop creating "device" sysfs link
> >>> Analogously in the above two cases AFAICS.
> >>>
> >>> The parent of a cooling device should be a "physical" device object,
> >>> like a platform device or a PCI device or similar, not a struct
> >>> acpi_device (which in fact is not a device even).
> >>   From the perspective of the Linux device core, a ACPI device is a pe=
rfectly valid device.
> > The driver core is irrelevant here.
> >
> > As I said before, a struct acpi_device object should not be a parent
> > of anything other than a struct acpi_device object.  Those things are
> > not devices and they cannot be used for representing PM dependencies,
> > for example.
> >
> >> I agree that using a platform device or PCI device is better, but this=
 already happens
> >> inside the ACPI fan driver (platform device).
> > So it should not happen there.
>
> I meant that the ACPI fan driver already uses the platform device as the =
parent device of the
> cooling device, so the ACPI device is only used for interacting with the =
ACPI control methods
> (and registering sysfs attributes i think).

OK

> >> Only the ACPI video driver created a "device" sysfs link that points t=
o the ACPI device
> >> instead of the PCI device. I just noticed that i accidentally changed =
this by using the
> >> PCI device as the parent device for the cooling device.
> >>
> >> If you want then we can keep this change.
> > The PCI device should be its parent.
>
> Alright, i will note this in the patch description.
>
> >>>>         thermal: core: Set parent device in thermal_cooling_device_r=
egister()
> >>>>         ACPI: thermal: Stop creating "device" sysfs link
> >>> And this link is to the struct acpi_device representing the thermal z=
one itself.
> >> Correct, the ACPI thermal zone driver is a ACPI driver, meaning that h=
e binds to
> >> ACPI devices. Because of this all (thermal zone) devices created by an=
 instance of
> >> said driver are descendants of the ACPI device said instance is bound =
to.
> >>
> >> We can of course convert the ACPI thermal zone driver into a platform =
driver, but
> >> this would be a separate patch series.
> > If you want parents, this needs to be done first, but I'm still not
> > sure what the parent of a thermal zone would represent.
> >
> > In the ACPI case it is kind of easy - it would be the (platform)
> > device corresponding to a given ThermalZone object in the ACPI
> > namespace - but it only has a practical meaning if that device has a
> > specific parent.  For example, if the corresponding ThermalZone object
> > is present in the \_SB scope, the presence of the thermal zone parent
> > won't provide any additional information.
>
> To the device core it will, as the platform device will need to be suspen=
ded
> after the thermal zone device has been suspended, among other things.

Let's set suspend aside for now, I think I've explained my viewpoint
on this enough elsewhere.

> > Unfortunately, the language in the specification isn't particularly
> > helpful here: "Thermal zone objects should appear in the namespace
> > under the portion of the system that comprises the thermal zone. For
> > example, a thermal zone that is isolated to a docking station should
> > be defined within the scope of the docking station device."  To me
> > "the portion of the system" is not too meaningful unless it is just
> > one device without children.  That's why _TZD has been added AFAICS.
>
> I think you are confusing the parent device of the ThermalZone ACPI devic=
e
> with the parent device of the struct thermal_zone_device.

No, I'm not.

> I begin to wonder if mentioning the ACPI ThermalZone device together with=
 the
> struct thermal_zone_device was a bad idea on my side xd.

Maybe.

> >>>>         thermal: core: Allow setting the parent device of thermal zo=
ne devices
> >>> I'm not sure if this is a good idea, at least until it is clear what
> >>> the role of a thermal zone parent device should be.
> >> Take a look at my explanation with the Intel Wifi driver.
> > I did and I think that you want the parent to be a device somehow
> > associated with the thermal zone, but how exactly?  What should that
> > be in the Wifi driver case, the PCI device or something else?
> >
> > And what if the thermal zone affects multiple devices?  Which of them
> > (if any) would be its parent?  And would it be consistent with the
> > ACPI case described above?
> >
> > All of that needs consideration IMV.
>
> I agree, but there is a difference between "this struct thermal_zone_devi=
ce depends on
> device X to be operational" and "this thermal zone affects device X, devi=
ce Y and device Z".

Yes, there is.

> This patch series exclusively deals with telling the driver core that "th=
is struct thermal_zone_device
> depends on device X to be operational".

Maybe let's take care of cooling devices first and get back to this later?
