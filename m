Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092765B3935
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 15:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D572810ED5F;
	Fri,  9 Sep 2022 13:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C61210ED5F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 13:39:49 +0000 (UTC)
Date: Fri, 09 Sep 2022 13:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1662730787; x=1662989987;
 bh=833cI8CjmcibguYXC0Mlik54slcxWtd96EiiQZ2Jc5Q=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=hpsJtAoMSOPFrGSch3xVRzs4XUTrr2CSfKqncYslQXAfspziKLik2PUqu9CM0KrXz
 eLIC9UOdaBq6LdwC6TfWPInOwLal5BXECIlqCaoHlTTMdBCz4Qjd1a8c439YEBBXLb
 nUg1SI42QTHCdiv3VDJNaLi7DIGIpBAQAAQ8rDyXF2OYuhSML29eFDWt5HEXKvIlFK
 AYUHUqT92gvlPZooBFByFDJFS/mMiRle43x91l77V09PcuIlD3c02TsenKs/rm9NBB
 waTxBx98k/Y/C4Nx8rBmABuLE7oVDNVKuExMTyuxVo/ViSs2dvjfcFgx21OL/Ly/Rt
 BeJ18YO4rqVUg==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <KBKl__LKqWb8-i0ErjSYiqJRJOf2AK48SVFIvyOYM-aGG_uZOal8BAm3VbkFJHc6Vquz1mFNugZkoFyz490r6N5UIM1a8JthAgFyDnQBtqk=@emersion.fr>
In-Reply-To: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, September 9th, 2022 at 12:12, Hans de Goede <hdegoede@redhat.com=
> wrote:

> Phase 3: Deprecate /sys/class/backlight uAPI
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Once most userspace has moved over to using the new drm_connector
> brightness props, a Kconfig option can be added to stop exporting
> the backlight-devices under /sys/class/backlight. The plan is to
> just disable the sysfs interface and keep the existing backlight-device
> internal kernel abstraction as is, since some abstraction for (non GPU
> native) backlight devices will be necessary regardless.
>=20
> It is unsure if we will ever be able to do this. For example people using
> non fully integrated desktop environments like e.g. sway often use custom
> scripts binded to hotkeys to get functionality like the brightness
> up/down keyboard hotkeys changing the brightness. This typically involves
> e.g. the xbacklight utility.
>=20
> Even if the xbacklight utility is ported to use kms with the new connecto=
r
> object brightness properties then this still will not work because
> changing the properties will require drm-master rights and e.g. sway will
> already hold those.

I replied to this here in another thread [1].

tl;dr I think it would be fine even for Sway-like compositors.

(Also note the utilities used right now are not xbacklight, but
brightnessctl/light/brillo/etc [2])

[1]: https://lore.kernel.org/dri-devel/bZJU9OkYWFyaLHVa4XUE4d5iBTPFXBRyPe1w=
Md_ztKh5VBMu-EDNGoUDpvwtFn_u9-JMvN8QmIZVS3pzMZM_hZTkTCA9gOBnCGXc5HFmsnc=3D@=
emersion.fr/
[2]: https://github.com/swaywm/sway/wiki#xbacklight

> The drm_connector brightness properties
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The new uAPI for this consists of 2 properties:
>=20
> 1. "display brightness": rw 0-int32_max property controlling the brightne=
ss setting
> of the connected display. The actual maximum of this will be less then
> int32_max and is given in "display brightness max".
>=20
> Unlike the /sys/class/backlight/foo/brightness this brightness property
> has a clear definition for the value 0. The kernel must ensure that 0
> means minimum brightness (so 0 should never turn the backlight off).
> If necessary the kernel must enforce a minimum value by adding
> an offset to the value seen in the property to ensure this behavior.
>=20
> For example if necessary the driver must clamp 0-255 to 10-255, which the=
n
> becomes 0-245 on the brightness property, adding 10 internally to writes
> done to the brightness property. This adding of an extra offset when
> necessary must only be done on the brightness property,
> the /sys/class/backlight interface should be left unchanged to not break
> userspace which may rely on 0 =3D off on some systems.
>=20
> Note amdgpu already does something like this even for /sys/class/backligh=
t,
> see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
>=20
> Also whenever possible the kernel must ensure that the brightness range
> is in perceived brightness, but this cannot always be guaranteed.
>=20
>=20
> 2. "display brightness max": ro 0-int32_max property giving the actual ma=
ximum
> of the display's brightness setting. This will report 0 when brightness
> control is not available.
>=20
> The value of "display brightness max" may change at runtime, either by
> a legacy drivers/platform/x86 backlight driver loading after the drm
> driver has loaded; or when plugging in a monitor which allows brightness
> control over DDC/CI. In both these cases the max value will change from 0
> to the actual max value, indicating backlight control has become availabl=
e
> on this connector.

The kernel will need to ensure that a hotplug uevent is sent to
user-space at this point. Otherwise user-space has no way to figure out
that the prop has changed.

Overall this all looks very solid to me!

Simon
