Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E109C611663
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 17:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CA310E867;
	Fri, 28 Oct 2022 15:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAEA10E866;
 Fri, 28 Oct 2022 15:53:52 +0000 (UTC)
Received: from 82-65-29-218.subs.proxad.net (unknown
 [IPv6:2a01:e0a:5ef:1450:250:fcff:fe42:7bed])
 by smtp5-g21.free.fr (Postfix) with ESMTP id AA5C35FFA2;
 Fri, 28 Oct 2022 17:53:44 +0200 (CEST)
Received: from berkelium.ap2c.org (localhost [127.0.0.1])
 by 82-65-29-218.subs.proxad.net (Postfix) with ESMTP id 3AA7913A12;
 Fri, 28 Oct 2022 17:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
 t=1666972424; bh=Ze83u/vbpDgVnztKhUw0Bm4HMBUEZYpM7VlfzfxZxxk=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=TYPH2oiNFP8/gfeQlERCSk1vb2ROssyhKDbkjGI9vaBetXpVkNA6uJrYe7iE2qk5L
 oeCPAKMXLWPhbjRQCkrc3U1j0zzKRwFlViGoFGOWSRRV2WTG/BU6CJg60JxCyo9+eE
 EWTCZl01r8C1VInTUlrNAU2xKpfCmtjS8+EVK6qo=
X-Virus-Scanned: amavisd-new at ap2c.org
Received: from 82-65-29-218.subs.proxad.net ([127.0.0.1])
 by berkelium.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id bXK91FCAxc97; Fri, 28 Oct 2022 17:53:43 +0200 (CEST)
Received: from drive.ap2c.org (imap.ap2c.org [10.8.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by 82-65-29-218.subs.proxad.net (Postfix) with ESMTPSA;
 Fri, 28 Oct 2022 17:53:43 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 28 Oct 2022 15:53:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.16.0
From: "=?utf-8?B?QXVyw6lsaWVu?=" <aurelien.intel@ap2c.com>
Message-ID: <e168e993071e55404dfa91387cf4db97@ap2c.com>
Subject: Re: [Intel-gfx] Developing a new backlight driver for specific
 OLED screen
To: "Jani Nikula" <jani.nikula@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Hans de Goede" <hdegoede@redhat.com>, "Lyude"
 <lyude@redhat.com>, dri-devel@lists.freedesktop.org
In-Reply-To: <87zgf556dm.fsf@intel.com>
References: <87zgf556dm.fsf@intel.com> <878rms7emr.fsf@intel.com>
 <183219aab00.2890.be34037ad6564a4fe81285fd91a8f407@ap2c.com>
 <YxsMcH37rRkt0cfj@intel.com> <115b5a5ebddcd268ee5f7688400448a2@ap2c.com>
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

Hi,=20

I=20come back on my problem regarding the development of a specific drive=
r which controls the brightness of my OLED device.

> If it's eDP and uses some proprietary DPCD brightness control mechanism=
,
> I think in practice it usually is somewhat dependent on the GPU.
>=20
>=20(OTOH I realize you don't mention eDP. If it's not eDP, DDC/CI is the
> more likely way to control brightness than DPCD.)

I succeed to control the brightness through the /dev/drm_dp_aux0 device.
Since I only need access to the DP AUX channel, I would like to develop a=
n independant (from the GPU) driver. Unfortunately I don't know how to ge=
t access to the DP AUX channel from this independant driver.. Do you have=
 some ideas?

I am totally agree with the fact that this display might only be used wit=
h an intel gfx card but I'm not sure that this code (which only use DP AU=
X read/write access) must be in the intel gfx driver code.=20

>>=20Unfortunately I guess the mechanism is not shared with many OLED
>> displays...
>=20
>=20Do you have a spec for it? How does it differ from the VESA eDP DPCD
> brightness control?

I don't have any specs but as far as I understood it configures some scre=
en registers to scale the PWM of all OLED pixels depending on the display=
 state. It uses its own vendor's ports and registers. And values sent on =
the display registers to set the desired brightness are computed with com=
plex formulaes (and the calculation needs static tables of values and dis=
play information got from the display at startup).
