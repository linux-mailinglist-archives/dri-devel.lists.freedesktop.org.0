Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84568BFC616
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD03410E7A8;
	Wed, 22 Oct 2025 14:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mAPm7D+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E118A10E7A8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:06:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A247604D9;
 Wed, 22 Oct 2025 14:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45357C4CEE7;
 Wed, 22 Oct 2025 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761141986;
 bh=u6pKPv1bs2F42lJLD1X+kTmhrAvZkYh64kL/QaicVF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAPm7D+zTZ37BG2tR89Zux5zdzTcuzRoRSbGw3jUy5Ezjj3P9AhsUFpPC2qw4yo+n
 xrEeK2zusgNTNkcte3h03v6CR+ZjzxNPTiOYUMu/4rcJfRt+BqesUX0ndFy0nJcSpc
 k+gziTRx8bze2TstkW0PNE9meweRG/LozMpTxZOd19AgX5S3VSMnJixtbzO2N9uSsc
 v4bgfUvvY/gwnZeySsD/805wLj0IcEXKCkU1gNTvWyz7PCTnFlSt5iu8wJ6JHlGzkh
 YP65z5smSDC9qnbgtKI+pghAQdI83vtMxd60X4xGg5ixZ3A0Oj6rShEmG/PAnfBcqF
 PoU/to6pdi9Qw==
Date: Wed, 22 Oct 2025 16:06:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/tidss: Add some support for splash-screen
Message-ID: <qljdrluxqi3abg7opwvp24ki7255jxrpowf47rpumzlcbnlnon@pccj5wm2kbxt>
References: <20250908-tidss-splash-v2-1-e388b0581dfa@ideasonboard.com>
 <348086ac-b5bc-4ca9-9e5b-82106d319eeb@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="otc7oe2kf2v4rfy7"
Content-Disposition: inline
In-Reply-To: <348086ac-b5bc-4ca9-9e5b-82106d319eeb@ti.com>
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


--otc7oe2kf2v4rfy7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/tidss: Add some support for splash-screen
MIME-Version: 1.0

Hi,

On Wed, Oct 22, 2025 at 07:25:10PM +0530, Devarsh Thakkar wrote:
> On 08/09/25 14:43, Tomi Valkeinen wrote:
> > Currently when the driver's probe is called, we do a full DSS reset. If
> > the bootloader has set up a splash-screen, the reset will disable the
> > video output, and after that it may still take time until the display is
> > usable (all the kernel modules have been loaded) and even more time
> > until the userspace is able to use the display.
> >=20
> > If fbdev is enabled, in a perfect case tidss would take over the fb
> > memory set up by the bootloader, and use that memory for tidss's fbdev,
> > thus retaining the splash-screen. However, we're not there yet.
> >=20
> > As a partial solution, this patch changes the driver so that the driver
> > will not reset (or change) the DSS registers until tidss_runtime_get()
> > is called when the display is being set up (because of fbdev modesetting
> > or modesetting from the userspace).
> >=20
> > This is achieved in two parts:
> >=20
> > 1. Probe
> >=20
> > At probe time, in dispc_init_hw(), we check if the DSS is idle
> > (videoports disabled). If yes, do a reset and continue as before. If
> > not, we know that there's a splash-screen, and we set the
> > 'tidss->boot_enabled_vp_mask' field to reflect the enabled VPs.
> >=20
> > We then enable the corresponding VP clocks (to ensure they stay on), set
> > the IRQENABLE to 0 to make sure we won't get any interrupts, and then
> > exit leaving the fclk and VP clocks enabled, and the runtime PM status
> > active.
> >=20
> > 2. Runtime get
> >=20
> > Later, when the tidss_runtime_get() is called the first time, we check
> > the 'boot_enabled_vp_mask'. If set, we know that we have the
> > splash-screen showing on the screen, and thus the clocks are enabled and
> > runtime PM status is active. This indicates that
> > pm_runtime_resume_and_get() call just before in tidss_runtime_get() did
> > not cause a runtime_resume callback to get called, so we need to do that
> > manually.
> >=20
> > We call dispc_splash_fini() which essentially returns the DSS into the
> > state where it would be in a non-splash-screen case: dispc_splash_fini()
> > will do a DSS reset, manually call the runtime_resume callback, and then
> > call clk_disable_unprepare() and pm_runtime_put_noidle() to counter the
> > actions at probe time.
> >=20
> > Finally 'boot_enabled_vp_mask' is set to zero to mark that we're no
> > longer in the "splash-screen mode".
> >=20
> > A note about fbdev emulation:
> >=20
> > If fbdev emulation is enabled in the DRM, tidss will set up an fbdev.
> > This will cause a modeset, and the blank framebuffer from tidss's fbdev
> > will be shown instead of the splash-screen.
> >=20
> > I see two improvements to this: either we should memcpy the pixel data
> > from the bootloader's splash-screen to the new fbdev buffer, or the
> > fbdev could use the splash-screen directly as its buffer. I have done
> > some hacks for the former, but I'm not sure how to implement either of
> > these properly.

I still think it's not the kind of driver-specific driver behaviour we
want to have.

Even more so when we have a generic solution to this problem in the
works.

Maxime

--otc7oe2kf2v4rfy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaPjk3wAKCRAnX84Zoj2+
drn7AX4y9RoHwDywUQwCeiG/iWB6AcTZKVzVZBh+cjEnZmheIEUsxGDajgkBshI7
3JePT/YBf3vp+kUuqIDHbnYREFsQzqchsP1pfxfMHFzylPoUyj+IrCoj17BItgbZ
cmmDsIF6Ag==
=s4U9
-----END PGP SIGNATURE-----

--otc7oe2kf2v4rfy7--
