Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25D4F8539
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78F810EBB0;
	Thu,  7 Apr 2022 16:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5525C10EBA9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 16:51:22 +0000 (UTC)
Date: Thu, 07 Apr 2022 16:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649350279;
 bh=CIhE/kwMfhimpbQ5nn3P/sVHmLzHnMgi9uGqRaUb9pM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=wQKtylWdjFCc8zx7+K2Q8YJdfzhN5aiGL6jV4zQRmiZCURn4yeD152eBTSNTMuumz
 zLeXj8fwRMjcAJy9pR4VDNctNWZt3oudokxs5Kb3SDaWzcnkmT56xnQ6WYCfhKxAyD
 q+mZ6uEdO0+zOb6dtebyCuJFtiSkwIsml6oWHAX8/exnOvhB3iXmvp/dfEV8wn7SWE
 4/86sAv7YXNTJ+OpaP20EzUy5us1se2OLO5NhvtSSfqgsw4HSyQMNEVpEyWSwOOWra
 xzb4adi5NjX7BkyTO0uimVbf6q2TduIyVY+KTUtarGxJHlmcbPbgyNMz71hZhzjKR3
 5a8oMgZWwVOHw==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
In-Reply-To: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
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

Very nice plan! Big +1 for the overall approach.

On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> =
wrote:

> The drm_connector brightness properties
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> bl_brightness: rw 0-int32_max property controlling the brightness setting
> of the connected display. The actual maximum of this will be less then
> int32_max and is given in bl_brightness_max.

Do we need to split this up into two props for sw/hw state? The privacy scr=
een
stuff needed this, but you're pretty familiar with that. :)

> bl_brightness_max: ro 0-int32_max property giving the actual maximum
> of the display's brightness setting. This will report 0 when brightness
> control is not available (yet).

I don't think we actually need that one. Integer KMS props all have a
range which can be fetched via drmModeGetProperty. The max can be
exposed via this range. Example with the existing alpha prop:

    "alpha": range [0, UINT16_MAX] =3D 65535

> bl_brightness_0_is_min_brightness: ro, boolean
> When this is set to true then it is safe to set brightness to 0
> without worrying that this completely turns the backlight off causing
> the screen to become unreadable. When this is false setting brightness
> to 0 may turn the backlight off, but this is not guaranteed.
> This will e.g. be true when directly driving a PWM and the video-BIOS
> has provided a minimum (non 0) duty-cycle below which the driver will
> never go.

Hm. It's quite unfortunate that it's impossible to have strong guarantees
here.

Is there any way we can avoid this prop?

For instance if we can guarantee that the min level won't turn the screen
completely off we could make the range start from 1 instead of 0.
Or allow -1 to mean "minimum value, maybe completely off".

> bl_brightness_control_method: ro, enum, possible values:
> none: The GPU driver expects brightness control to be provided by another
> driver and that driver has not loaded yet.
> unknown: The underlying control mechanism is unknown.
> pwm: The brightness property directly controls the duty-cycle of a PWM
> output.
> firmware: The brightness is controlled through firmware calls.
> DDC/CI: The brightness is controlled through the DDC/CI protocol.
> gmux: The brightness is controlled by the GMUX.
> Note this enum may be extended in the future, so other values may
> be read, these should be treated as "unknown".
>
> When brightness control becomes available after being reported
> as not available before (bl_brightness_control_method=3D=3D"none")
> a uevent with CONNECTOR=3D<connector-id> and
>
> PROPERTY=3D<bl_brightness_control_method-id> will be generated
>
> at this point all the properties must be re-read.
>
> When/once brightness control is available then all the read-only
> properties are fixed and will never change.
>
> Besides the "none" value for no driver having loaded yet,
> the different bl_brightness_control_method values are intended for
> (userspace) heuristics for such things as the brightness setting
> linearly controlling electrical power or setting perceived brightness.

Can you elaborate? I don't know enough about brightness control to
understand all of the implications here.
