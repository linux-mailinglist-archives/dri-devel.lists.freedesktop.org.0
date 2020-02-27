Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405B170D3A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5856EBE6;
	Thu, 27 Feb 2020 00:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6136EBE6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:28:46 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48C6521D7E;
 Thu, 27 Feb 2020 00:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582763326;
 bh=BLDNweZa4XLR3Jexr+qfyUpfZnlcYHo2Os3v5UHZzhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NrwwengND71qT3HpHcnyYJcbNhL9ZR0PKb5Ud9oKQf51xPRhBson+teHrXNPzmYqM
 8uGeGf8aVfSn8jWxfiiWb0VeZqFTHH5XOrpuKaNwVxgt6BUvwVB7QJbQyhuS9rDgG5
 JD31xpCQRvSds0m6FZMJhPnbMSrehjSS2iUzN7ok=
Received: by earth.universe (Postfix, from userid 1000)
 id D3F343C0C83; Thu, 27 Feb 2020 01:28:43 +0100 (CET)
Date: Thu, 27 Feb 2020 01:28:43 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200227002843.7ea73mewcr4rmzli@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <74217b2c-a6cf-4a85-c18a-62ca892b7a0d@ti.com>
MIME-Version: 1.0
In-Reply-To: <74217b2c-a6cf-4a85-c18a-62ca892b7a0d@ti.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1195399333=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1195399333==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5pomv55ucfpod6lu"
Content-Disposition: inline


--5pomv55ucfpod6lu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 26, 2020 at 02:28:23PM +0200, Tomi Valkeinen wrote:
> On 25/02/2020 01:20, Sebastian Reichel wrote:
> > This updates the existing omapdrm DSI code, so that it uses
> > common drm_mipi_dsi API and drm_panel.
> >=20
> > The patchset has been tested with Droid 4 using Linux console, X.org and
> > Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> > and removes the last custom panel driver, so quite a few cleanups on the
> > omapdrm codebase were possible.
>=20
> I haven't done any reviews yet, but applied these (and the one
> v2.1 patch) on top of Laurent's. I booted up AM5 EVM and loaded
> the modules:
>=20
> [   17.261560] WARNING: CPU: 0 PID: 419 at drivers/base/component.c:636 c=
omponent_bind_all+0x1f4/0x258

I did not see that warning for some reason. I guess I was always
lucky, since its a race condition introduced by "drm/omap: bind
components with drm_device argument". That patch moves
component_bind_all from dss_bind() to omapdrm's probe() to get
access to drm_dev. Currently omapdrm is the only DRM driver not
supplying that as parameter and its required to move encoder init
into the DSS output drivers. I assumed that it would be ok, since
it just postpones the call a little bit. Unfortunately it also
moves it out of the lock protection from dss_bind().

The only fix, that I see is to register the drm_dev is dss_bind
and then supply it to omapdrm via pdata. But I think we could
actually get rid of the omapdrm platform device completly and
just use its parent "omapdss_dss". I suppose a follow-up patchset
could merge the code into one module and do this merge.

Probably it's the best to drop that patch for now. It's not yet
used in the patches, that I sent.

> [   17.270811] Modules linked in: omapdrm(+) omapdss omapdss_base panel_o=
sd_osd101t2587_53ts panel_simple simple_bridge ti_tpd12s015 display_connec
> tor tc358767 tc358768 sii902x ti_tfp410 drm_kms_helper drm drm_panel_orie=
ntation_quirks cfbfillrect cfbimgblt cfbcopyarea cec
> [   17.295521] CPU: 0 PID: 419 Comm: insmod Not tainted 5.6.0-rc2-00375-g=
66c4203ed9d4 #2
> [   17.303387] Hardware name: Generic DRA74X (Flattened Device Tree)
> [   17.309520] [<c011431c>] (unwind_backtrace) from [<c010dc20>] (show_st=
ack+0x10/0x14)
> [   17.317306] [<c010dc20>] (show_stack) from [<c09acca4>] (dump_stack+0x=
b4/0xd0)
> [   17.324567] [<c09acca4>] (dump_stack) from [<c013a33c>] (__warn+0xc0/0=
xf8)
> [   17.331477] [<c013a33c>] (__warn) from [<c013a700>] (warn_slowpath_fmt=
+0x58/0xb8)
> [   17.338998] [<c013a700>] (warn_slowpath_fmt) from [<c0630698>] (compon=
ent_bind_all+0x1f4/0x258)
> [   17.347768] [<c0630698>] (component_bind_all) from [<bf11b52c>] (pdev_=
probe+0xe0/0x7a0 [omapdrm])
> [   17.356709] [<bf11b52c>] (pdev_probe [omapdrm]) from [<c063a198>] (pla=
tform_drv_probe+0x48/0x98)
> [   17.365537] [<c063a198>] (platform_drv_probe) from [<c0637c1c>] (reall=
y_probe+0x200/0x478)
> [   17.373841] [<c0637c1c>] (really_probe) from [<c0638060>] (driver_prob=
e_device+0x6c/0x1b4)
> [   17.382145] [<c0638060>] (driver_probe_device) from [<c06383f0>] (devi=
ce_driver_attach+0x58/0x60)
> [   17.391060] [<c06383f0>] (device_driver_attach) from [<c063849c>] (__d=
river_attach+0xa4/0x148)
> [   17.399713] [<c063849c>] (__driver_attach) from [<c0635af8>] (bus_for_=
each_dev+0x70/0xb4)
> [   17.407930] [<c0635af8>] (bus_for_each_dev) from [<c0636d60>] (bus_add=
_driver+0x100/0x204)
> [   17.416233] [<c0636d60>] (bus_add_driver) from [<c0639078>] (driver_re=
gister+0x74/0x108)
> [   17.424361] [<c0639078>] (driver_register) from [<c063a2a8>] (__platfo=
rm_register_drivers+0x58/0x150)
> [   17.433628] [<c063a2a8>] (__platform_register_drivers) from [<c0102ff8=
>] (do_one_initcall+0x48/0x2a0)
> [   17.442893] [<c0102ff8>] (do_one_initcall) from [<c01e2efc>] (do_init_=
module+0x5c/0x234)
> [   17.451022] [<c01e2efc>] (do_init_module) from [<c01e5668>] (load_modu=
le+0x250c/0x28a4)
> [   17.459064] [<c01e5668>] (load_module) from [<c01e5cb8>] (sys_finit_mo=
dule+0xcc/0x110)
> [   17.467020] [<c01e5cb8>] (sys_finit_module) from [<c0101000>] (ret_fas=
t_syscall+0x0/0x54)
> [   17.475233] Exception stack(0xea84bfa8 to 0xea84bff0)
> [   17.480307] bfa0:                   00000002 00000000 00000003 0002a89=
4 00000000 bebd2d74
> [   17.488524] bfc0: 00000002 00000000 00028424 0000017b 0003eeb0 0000000=
2 b6ffe000 00000000
> [   17.496738] bfe0: bebd2bb8 bebd2ba8 00020d7c b6edb0b0
> [   17.502365] ---[ end trace c20802296d6b2775 ]---
> [   17.508567] omapdss_dss 58000000.dss: bound 58001000.dispc (ops dsi_fr=
amedone_timeout_work_callback [omapdss])
> [   17.520358] omapdss_dss 58000000.dss: bound 58040000.encoder (ops dsi_=
framedone_timeout_work_callback [omapdss])
> [   17.559728] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [   17.574544] [drm] Enabling DMM ywrap scrolling
> [   17.580606] omapdrm omapdrm.0: fb0: omapdrmdrmfb frame buffer device
> [   17.625099] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on =
minor 0
>=20
> Similar warning on module unload. The display works, though.

same problem, with dss_unbind() and omapdrm's remove function.

-- Sebastian

--5pomv55ucfpod6lu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5XDTgACgkQ2O7X88g7
+prWhw//UTrXUWRGqZYDv4bEnQhzIELiZLR/WbqECIvAP/RXpvAPACy9eiMe54Tk
/RI+7XkPLlKKUGSI+EoYQd/FUUIICz4lXhYxqxoIEjNLavFsB3YIUnWa5M2seju8
d4Ol9Q/dWe2UU954j6DaWW+Dn95RF0UJpTg3onH/Do/e7cEQwN0Wu3p0ZFQ/Dakb
euIKgOUq8t5tYFdSFe7zVFrAE91a8zTYfGPx1OU6gOuvs3o4e8h+TsePz2xN7W9M
mBZh7ag6aayvbAQvPznani0s+gy7S/f5TE7vbsp47Hnh4RWrelZObOLJWq53WmeI
Yp2j/fPbLwEPWDW6N3f+LGrtcuTt5SlCBor/BVi8mewf8GExO+71eV0o16UztCp9
FBXcl3UkxoLi8FmAbbdGmEZbCxKwEXEhzODXwbqJAki3kQWjNwRrFOn+okEvkMoi
14pSm8Z5VCLFjO4v7qeyVw/VZh2fCRj2df0kLNaELtDe8YZXu721/oBNUFWQMBKh
ECF9TAvfe4fDQoLTDixStL0SZg97vhrUEG5wbTPJ45wgpd6tSo2Yqlf0BIEHWg39
sgADYnjMZrj5HrPOl5AHHUjyYGZEyJAT6abp1D0xAAiINdoaOP1a03NIvFY/5EOT
W+CnFPZ88Xod0TH0AKhp3Yawo+2andluHE4AsqTmIgjeNIs02CI=
=NLga
-----END PGP SIGNATURE-----

--5pomv55ucfpod6lu--

--===============1195399333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1195399333==--
