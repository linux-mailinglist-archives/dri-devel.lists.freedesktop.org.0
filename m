Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A296131D2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 09:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C7810E15A;
	Mon, 31 Oct 2022 08:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F4610E157;
 Mon, 31 Oct 2022 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667205607; x=1698741607;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=pHqhML5efohtqgNb7+dHGJE5mcWVlZrNvGh0lsvaScQ=;
 b=gs+8ASN7pJ5r9RXMut5SRdFYS1AtDlHhS3aZZ7RuLV6ru4MMKW0r1gMg
 iYNZvO5ZW90RhTeJpUOjURyT0JYOLnKclTguyZKLI2kunejEZzjUVU2P8
 Qf0FONbLQP9tut4ALwnWzTAqgKA7YUuVbVVJEkjJyC6Kw0RI1kkjP5h1A
 jMulgpjRbnx/tKtslBIMBbhDHrvJupye9uoa39Crc48iQGJWmHbTCImN9
 0TKawu+vHO7Bnz1hIDgt68phSFK0dLyblASPOD0j8Xpkdsf3dPxfUSskr
 fg0vNgu2H/yicLIpDj/I/pmUX1x4k8dTAPBf9DGbfH8PN5vHKLmE1GBX9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="309936808"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="309936808"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 01:40:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="878658561"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="878658561"
Received: from ffarrell-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.13.132])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 01:40:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Aur=C3=A9lien?= <aurelien.intel@ap2c.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Hans de Goede <hdegoede@redhat.com>, Lyude
 <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] Developing a new backlight driver for specific OLED
 screen
In-Reply-To: <e168e993071e55404dfa91387cf4db97@ap2c.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87zgf556dm.fsf@intel.com> <878rms7emr.fsf@intel.com>
 <183219aab00.2890.be34037ad6564a4fe81285fd91a8f407@ap2c.com>
 <YxsMcH37rRkt0cfj@intel.com> <115b5a5ebddcd268ee5f7688400448a2@ap2c.com>
 <e168e993071e55404dfa91387cf4db97@ap2c.com>
Date: Mon, 31 Oct 2022 10:40:00 +0200
Message-ID: <87wn8g8jz3.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Oct 2022, "Aur=C3=A9lien" <aurelien.intel@ap2c.com> wrote:
> Hi,=20
>
> I come back on my problem regarding the development of a specific driver =
which controls the brightness of my OLED device.
>
>> If it's eDP and uses some proprietary DPCD brightness control mechanism,
>> I think in practice it usually is somewhat dependent on the GPU.
>>=20
>> (OTOH I realize you don't mention eDP. If it's not eDP, DDC/CI is the
>> more likely way to control brightness than DPCD.)
>
> I succeed to control the brightness through the /dev/drm_dp_aux0 device.
> Since I only need access to the DP AUX channel, I would like to develop a=
n independant (from the GPU) driver. Unfortunately I don't know how to get =
access to the DP AUX channel from this independant driver.. Do you have som=
e ideas?
>
> I am totally agree with the fact that this display might only be used wit=
h an intel gfx card but I'm not sure that this code (which only use DP AUX =
read/write access) must be in the intel gfx driver code.=20

With the information provided, I basically see two options:

1) Just make it part of i915 anyway, or

2) Make it library code in drm that i915 calls.

Observe that it's fairly easy to do 1 first, and, if necessary, turn it
into 2 later. This is actually exactly how the current DP AUX brightness
code evolved.

IMO there's no point in trying to add a framework to make this an
independent driver you could probe separately. It's an unnecessary
complication, overengineering.

>
>>> Unfortunately I guess the mechanism is not shared with many OLED
>>> displays...
>>=20
>> Do you have a spec for it? How does it differ from the VESA eDP DPCD
>> brightness control?
>
> I don't have any specs but as far as I understood it configures some scre=
en registers to scale the PWM of all OLED pixels depending on the display s=
tate. It uses its own vendor's ports and registers. And values sent on the =
display registers to set the desired brightness are computed with complex f=
ormulaes (and the calculation needs static tables of values and display inf=
ormation got from the display at startup).

What's the source of the information?

Pretty soon we're going to need something more concrete to discuss this
further. Spec or implementation or something.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
