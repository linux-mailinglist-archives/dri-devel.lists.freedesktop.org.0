Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EBBCF249
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 07:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362B16E053;
	Tue,  8 Oct 2019 05:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203726E053
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 05:57:28 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 880C7206BB;
 Tue,  8 Oct 2019 05:57:26 +0000 (UTC)
Date: Tue, 8 Oct 2019 07:57:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 1/3] drm/sun4i: dsi: Fix video start delay computation
Message-ID: <20191008055723.2r3mrg27useqhsei@gilmour>
References: <20191006160303.24413-1-icenowy@aosc.io>
 <20191006160303.24413-2-icenowy@aosc.io>
 <20191007115148.vlu2ptmrfyng4p3r@gilmour>
 <8B137D6E-74C5-4A9B-A8FE-84F3D38A1AD0@aosc.io>
MIME-Version: 1.0
In-Reply-To: <8B137D6E-74C5-4A9B-A8FE-84F3D38A1AD0@aosc.io>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570514247;
 bh=VQS1Z5YEyjcEb+iO3gDcHE+LVm6TY7h8zQi8r993+Ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHz8GCrpCarWXWXK7D/0N22WNfkg+gWyn5+1sJRb3wmEMxfqxJICsd/mw0uXd0++j
 tGWOePoz7oRKYkE8fRMl0ImgYNOtPNtVM5sifVmzGzKg7RJYMrfAkht5JRYHcM8Lrn
 8hwfv+5LGqsFrjC9wajGk2BxaZP1uh8yhW1Zzsvo=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Merlijn Wajer <merlijn@wizzup.org>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0567629266=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0567629266==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dnkdjwd3j4e57axu"
Content-Disposition: inline


--dnkdjwd3j4e57axu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 11:06:07AM +0800, Icenowy Zheng wrote:
> =E4=BA=8E 2019=E5=B9=B410=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
7:51:48, Maxime Ripard <mripard@kernel.org> =E5=86=99=E5=88=B0:
> >On Mon, Oct 07, 2019 at 12:03:00AM +0800, Icenowy Zheng wrote:
> >> From: Jagan Teki <jagan@amarulasolutions.com>
> >>
> >> The LCD timing definitions between Linux DRM vs Allwinner are
> >different,
> >> below diagram shows this clear differences.
> >>
> >>            Active                 Front           Sync           Back
> >>            Region                 Porch
> >Porch
> >>
> ><-----------------------><----------------><--------------><------------=
-->
> >>   //////////////////////|
> >>  ////////////////////// |
> >> //////////////////////  |..................
> >................
> >>                                            ________________
> >> <----- [hv]display ----->
> >> <------------- [hv]sync_start ------------>
> >> <--------------------- [hv]sync_end ---------------------->
> >> <-------------------------------- [hv]total
> >------------------------------>
> >>
> >> <----- lcd_[xy] -------->		  <- lcd_[hv]spw ->
> >> 					  <---------- lcd_[hv]bp --------->
> >> <-------------------------------- lcd_[hv]t
> >------------------------------>
> >>
> >> The DSI driver misinterpreted the vbp term from the BSP code to refer
> >> only to the backporch, when in fact it was backporch + sync. Thus the
> >> driver incorrectly used the vertical front porch plus sync in its
> >> calculation of the DRQ set bit value, when it should not have
> >included
> >> the sync timing.
> >>
> >> Including additional sync timings leads to flip_done timed out as:
> >>
> >> WARNING: CPU: 0 PID: 31 at drivers/gpu/drm/drm_atomic_helper.c:1429
> >drm_atomic_helper_wait_for_vblanks.part.1+0x298/0x2a0
> >> [CRTC:46:crtc-0] vblank wait timed out
> >> Modules linked in:
> >> CPU: 0 PID: 31 Comm: kworker/0:1 Not tainted
> >5.1.0-next-20190514-00029-g09e5b0ed0a58 #18
> >> Hardware name: Allwinner sun8i Family
> >> Workqueue: events deferred_probe_work_func
> >> [<c010ed54>] (unwind_backtrace) from [<c010b76c>]
> >(show_stack+0x10/0x14)
> >> [<c010b76c>] (show_stack) from [<c0688c70>] (dump_stack+0x84/0x98)
> >> [<c0688c70>] (dump_stack) from [<c011d9e4>] (__warn+0xfc/0x114)
> >> [<c011d9e4>] (__warn) from [<c011da40>] (warn_slowpath_fmt+0x44/0x68)
> >> [<c011da40>] (warn_slowpath_fmt) from [<c040cd50>]
> >(drm_atomic_helper_wait_for_vblanks.part.1+0x298/0x2a0)
> >> [<c040cd50>] (drm_atomic_helper_wait_for_vblanks.part.1) from
> >[<c040e694>] (drm_atomic_helper_commit_tail_rpm+0x5c/0x6c)
> >> [<c040e694>] (drm_atomic_helper_commit_tail_rpm) from [<c040e4dc>]
> >(commit_tail+0x40/0x6c)
> >> [<c040e4dc>] (commit_tail) from [<c040e5cc>]
> >(drm_atomic_helper_commit+0xbc/0x128)
> >> [<c040e5cc>] (drm_atomic_helper_commit) from [<c0411b64>]
> >(restore_fbdev_mode_atomic+0x1cc/0x1dc)
> >> [<c0411b64>] (restore_fbdev_mode_atomic) from [<c04156f8>]
> >(drm_fb_helper_restore_fbdev_mode_unlocked+0x54/0xa0)
> >> [<c04156f8>] (drm_fb_helper_restore_fbdev_mode_unlocked) from
> >[<c0415774>] (drm_fb_helper_set_par+0x30/0x54)
> >> [<c0415774>] (drm_fb_helper_set_par) from [<c03ad450>]
> >(fbcon_init+0x560/0x5ac)
> >> [<c03ad450>] (fbcon_init) from [<c03eb8a0>] (visual_init+0xbc/0x104)
> >> [<c03eb8a0>] (visual_init) from [<c03ed1b8>]
> >(do_bind_con_driver+0x1b0/0x390)
> >> [<c03ed1b8>] (do_bind_con_driver) from [<c03ed780>]
> >(do_take_over_console+0x13c/0x1c4)
> >> [<c03ed780>] (do_take_over_console) from [<c03ad800>]
> >(do_fbcon_takeover+0x74/0xcc)
> >> [<c03ad800>] (do_fbcon_takeover) from [<c013c9c8>]
> >(notifier_call_chain+0x44/0x84)
> >> [<c013c9c8>] (notifier_call_chain) from [<c013cd20>]
> >(__blocking_notifier_call_chain+0x48/0x60)
> >> [<c013cd20>] (__blocking_notifier_call_chain) from [<c013cd50>]
> >(blocking_notifier_call_chain+0x18/0x20)
> >> [<c013cd50>] (blocking_notifier_call_chain) from [<c03a6e44>]
> >(register_framebuffer+0x1e0/0x2f8)
> >> [<c03a6e44>] (register_framebuffer) from [<c04153c0>]
> >(__drm_fb_helper_initial_config_and_unlock+0x2fc/0x50c)
> >> [<c04153c0>] (__drm_fb_helper_initial_config_and_unlock) from
> >[<c04158c8>] (drm_fbdev_client_hotplug+0xe8/0x1b8)
> >> [<c04158c8>] (drm_fbdev_client_hotplug) from [<c0415a20>]
> >(drm_fbdev_generic_setup+0x88/0x118)
> >> [<c0415a20>] (drm_fbdev_generic_setup) from [<c043f060>]
> >(sun4i_drv_bind+0x128/0x160)
> >> [<c043f060>] (sun4i_drv_bind) from [<c044b598>]
> >(try_to_bring_up_master+0x164/0x1a0)
> >> [<c044b598>] (try_to_bring_up_master) from [<c044b668>]
> >(__component_add+0x94/0x140)
> >> [<c044b668>] (__component_add) from [<c0445e1c>]
> >(sun6i_dsi_probe+0x144/0x234)
> >> [<c0445e1c>] (sun6i_dsi_probe) from [<c0452ef4>]
> >(platform_drv_probe+0x48/0x9c)
> >> [<c0452ef4>] (platform_drv_probe) from [<c04512cc>]
> >(really_probe+0x1dc/0x2c8)
> >> [<c04512cc>] (really_probe) from [<c0451518>]
> >(driver_probe_device+0x60/0x160)
> >> [<c0451518>] (driver_probe_device) from [<c044f7a4>]
> >(bus_for_each_drv+0x74/0xb8)
> >> [<c044f7a4>] (bus_for_each_drv) from [<c045107c>]
> >(__device_attach+0xd0/0x13c)
> >> [<c045107c>] (__device_attach) from [<c0450474>]
> >(bus_probe_device+0x84/0x8c)
> >> [<c0450474>] (bus_probe_device) from [<c0450900>]
> >(deferred_probe_work_func+0x64/0x90)
> >> [<c0450900>] (deferred_probe_work_func) from [<c0135970>]
> >(process_one_work+0x204/0x420)
> >> [<c0135970>] (process_one_work) from [<c013690c>]
> >(worker_thread+0x274/0x5a0)
> >> [<c013690c>] (worker_thread) from [<c013b3d8>] (kthread+0x11c/0x14c)
> >> [<c013b3d8>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> >> Exception stack(0xde539fb0 to 0xde539ff8)
> >> 9fa0:                                     00000000 00000000 00000000
> >00000000
> >> 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> >00000000
> >> 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> ---[ end trace 495200a78b24980e ]---
> >> random: fast init done
> >> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> >[CRTC:46:crtc-0] flip_done timed out
> >> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> >[CONNECTOR:48:DSI-1] flip_done timed out
> >> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
> >[PLANE:30:plane-0] flip_done timed out
> >>
> >> With the terms(as described in above diagram) fixed, the panel
> >> displays correctly without any timeouts.
> >>
> >> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> >you should have your SoB here.
> >
> >All the patches look fine, so there's no need to resend a new
> >version. I'll add it if you can give it.
>
> Sorry, I forgot it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

I've added it, thanks!
Maxime

--dnkdjwd3j4e57axu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZwlQwAKCRDj7w1vZxhR
xdm4AQDZ6B6LbA9bHrGtPKnKTUahItTfY5X2KySWzxVx2TTmtwEAhtK537tOvQ4p
lnirCOMxOFdFdZE0G1regEvis82XyQc=
=dnxX
-----END PGP SIGNATURE-----

--dnkdjwd3j4e57axu--

--===============0567629266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0567629266==--
