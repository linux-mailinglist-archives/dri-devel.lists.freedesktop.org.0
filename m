Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6CA21F0C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4553F10E801;
	Wed, 29 Jan 2025 14:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R+gZlCD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7DB10E801
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:23:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F1835C58C1;
 Wed, 29 Jan 2025 14:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9082BC4CED1;
 Wed, 29 Jan 2025 14:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738160628;
 bh=KsNO1ssj4oNEYX1+7rfNXhjSEH7ci7NSqOcxzyR707c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R+gZlCD7No1YbSDXNitF0AC4AhwG8B2x3k+a8zNA1rKiYNUXVuPkZqFd/aGPQkrtV
 W94pUBK5MlhHxlMe7U2xmXkABftQCBwnYyE78qxbCgQTBVZW3ySkXvy2tMvADuoOBr
 17VlEX6u6PDwuP8ZrZDk4qHCbS/6Gw+bxPGhQT9BFrnno22jmWxA3A3cQfEILbdQEP
 TJy/WhBCEEsypSt9ADg/Y84pFUfiJehRlLekkeacI3ADa5stqp4onwkzMVSmlWPwAl
 VZJzWHUyloQLmhxUsvmSj+4I3FToU3oaQ3Om8W00vxnu0PPyWpcnII3mwhZYNGGRgC
 9AznuCEz95piw==
Date: Wed, 29 Jan 2025 15:23:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: lockdep and ww mutex debug interactions in hdmi tests
Message-ID: <fxxwif7msh4l4weg7nl3q4azikgle52jwfaip6r546ls2q7z4t@r5u62cv2l3lg>
References: <CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com>
 <20241031-discerning-groovy-galago-6cf46f@houat>
 <CAPM=9tw0y+jHYpRDfQftpKnj5EnkLv_vyGC2bjYc9mmxBkEJqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7yiwnnk2wbqqj7it"
Content-Disposition: inline
In-Reply-To: <CAPM=9tw0y+jHYpRDfQftpKnj5EnkLv_vyGC2bjYc9mmxBkEJqg@mail.gmail.com>
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


--7yiwnnk2wbqqj7it
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: lockdep and ww mutex debug interactions in hdmi tests
MIME-Version: 1.0

On Thu, Nov 07, 2024 at 06:26:23AM +1000, Dave Airlie wrote:
> On Fri, 1 Nov 2024 at 23:57, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Wed, Oct 30, 2024 at 05:03:50AM +1000, Dave Airlie wrote:
> > > Hi,
> > >
> > > I mentioned this internally, but wanted to get it on the list,
> > >
> > > I ran the hdmi kunit tests with LOCKDEP and WW_MUTEX_SLOWPATH enabled
> > > and hit some issues.
> > >
> > > With the slowpath we get the occasional EDEADLK to test the paths are
> > > doing things right, I think you should handle EDEADLK in the tests
> > > with a retry loop.
> >
> > Thanks for the report, I've just sent a patch fixing this.
>=20
> The patch fixes the EDEADLK but not the lockdep
>=20
> [   50.785446] KTAP version 1
> [   50.785461] 1..2
> [   50.786298]     KTAP version 1
> [   50.786305]     # Subtest: drm_atomic_helper_connector_hdmi_check
> [   50.786308]     # module: drm_hdmi_state_helper_test
> [   50.786312]     1..22
>=20
> [   50.788096] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   50.788101] WARNING: possible circular locking dependency detected
> [   50.788107] 6.12.0-rc6+ #47 Tainted: G                 N
> [   50.788112] ------------------------------------------------------
> [   50.788117] kunit_try_catch/1500 is trying to acquire lock:
> [   50.788123] ffff9976410cc4f0 (&dev->mode_config.mutex){+.+.}-{3:3},
> at: drm_test_check_broadcast_rgb_auto_cea_mode+0xaf/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788141]
>                but task is already holding lock:
> [   50.788146] ffff9976be5550f0 (crtc_ww_class_acquire){+.+.}-{0:0},
> at: drm_kunit_helper_acquire_ctx_alloc+0x4d/0xc0 [drm_kunit_helpers]
> [   50.788159]
>                which lock already depends on the new lock.
>=20
> [   50.788165]
>                the existing dependency chain (in reverse order) is:
> [   50.788171]
>                -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
> [   50.788179]        drm_modeset_acquire_init+0xd7/0x110 [drm]
> [   50.788235]
> drm_helper_probe_single_connector_modes+0x4c/0x600 [drm_kms_helper]
> [   50.788266]        set_connector_edid.isra.0+0x4f/0xc0
> [drm_hdmi_state_helper_test]
> [   50.788275]
> drm_atomic_helper_connector_hdmi_init+0x240/0x400
> [drm_hdmi_state_helper_test]
> [   50.788285]
> drm_test_check_broadcast_rgb_auto_cea_mode+0x27/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788296]        kunit_try_run_case+0x62/0xd0 [kunit]
> [   50.788304]        kunit_generic_run_threadfn_adapter+0x1e/0x40 [kunit]
> [   50.788313]        kthread+0xef/0x120
> [   50.788318]        ret_from_fork+0x31/0x50
> [   50.788324]        ret_from_fork_asm+0x1a/0x30
> [   50.788329]
>                -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
> [   50.788337]        __lock_acquire+0x1391/0x2190
> [   50.788343]        lock_acquire+0xcc/0x2d0
> [   50.788348]        __mutex_lock+0x8d/0xbf0
> [   50.788353]
> drm_test_check_broadcast_rgb_auto_cea_mode+0xaf/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788363]        kunit_try_run_case+0x62/0xd0 [kunit]
> [   50.788371]        kunit_generic_run_threadfn_adapter+0x1e/0x40 [kunit]
> [   50.788380]        kthread+0xef/0x120
> [   50.788384]        ret_from_fork+0x31/0x50
> [   50.788388]        ret_from_fork_asm+0x1a/0x30
> [   50.788393]
>                other info that might help us debug this:
>=20
> [   50.788400]  Possible unsafe locking scenario:
>=20
> [   50.788405]        CPU0                    CPU1
> [   50.788409]        ----                    ----
> [   50.788413]   lock(crtc_ww_class_acquire);
> [   50.788418]                                lock(&dev->mode_config.mute=
x);
> [   50.788424]                                lock(crtc_ww_class_acquire);
> [   50.788431]   lock(&dev->mode_config.mutex);
> [   50.788435]
>                 *** DEADLOCK ***
>=20
> [   50.788441] 1 lock held by kunit_try_catch/1500:
> [   50.788445]  #0: ffff9976be5550f0
> (crtc_ww_class_acquire){+.+.}-{0:0}, at:
> drm_kunit_helper_acquire_ctx_alloc+0x4d/0xc0 [drm_kunit_helpers]
> [   50.788459]
>                stack backtrace:
> [   50.788464] CPU: 5 UID: 0 PID: 1500 Comm: kunit_try_catch Tainted:
> G                 N 6.12.0-rc6+ #47
> [   50.788473] Tainted: [N]=3DTEST
> [   50.788476] Hardware name: Gigabyte Technology Co., Ltd. Z390 I
> AORUS PRO WIFI/Z390 I AORUS PRO WIFI-CF, BIOS F8 11/05/2021
> [   50.788485] Call Trace:
> [   50.788488]  <TASK>
> [   50.788492]  dump_stack_lvl+0x6c/0xa0
> [   50.788498]  print_circular_bug.cold+0x178/0x1be
> [   50.788506]  check_noncircular+0x10f/0x120
> [   50.788511]  ? stack_trace_save+0x3e/0x50
> [   50.788520]  __lock_acquire+0x1391/0x2190
> [   50.788528]  lock_acquire+0xcc/0x2d0
> [   50.788533]  ?
> drm_test_check_broadcast_rgb_auto_cea_mode+0xaf/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788544]  ? lock_is_held_type+0xd9/0x130
> [   50.788552]  __mutex_lock+0x8d/0xbf0
> [   50.788556]  ?
> drm_test_check_broadcast_rgb_auto_cea_mode+0xaf/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788566]  ? _raw_spin_unlock_irqrestore+0x39/0x70
> [   50.788573]  ? kunit_add_action+0xd1/0x140 [kunit]
> [   50.788581]  ?
> drm_test_check_broadcast_rgb_auto_cea_mode+0xaf/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788592]  ? __pfx_action_drm_release_context+0x10/0x10 [drm_kunit_h=
elpers]
> [   50.788599]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kun=
it]
> [   50.788608]  ? kunit_add_action_or_reset+0x18/0x40 [kunit]
> [   50.788618]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kun=
it]
> [   50.788627]  ?
> drm_test_check_broadcast_rgb_auto_cea_mode+0xaf/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788637]  drm_test_check_broadcast_rgb_auto_cea_mode+0xaf/0x4c0
> [drm_hdmi_state_helper_test]
> [   50.788647]  ? lockdep_hardirqs_on+0x7c/0x100
> [   50.788654]  kunit_try_run_case+0x62/0xd0 [kunit]
> [   50.788662]  ? lockdep_hardirqs_on+0x7c/0x100
> [   50.788668]  ? _raw_spin_unlock_irqrestore+0x39/0x70
> [   50.788675]  kunit_generic_run_threadfn_adapter+0x1e/0x40 [kunit]
> [   50.788684]  kthread+0xef/0x120
> [   50.788688]  ? __pfx_kthread+0x10/0x10
> [   50.788693]  ret_from_fork+0x31/0x50
> [   50.788698]  ? __pfx_kthread+0x10/0x10
> [   50.788703]  ret_from_fork_asm+0x1a/0x30
> [   50.788711]  </TASK>

Yeah, sorry. I finally got the time to look into it a bit, and it's
(almost) fixed now:
https://lore.kernel.org/dri-devel/20250129-test-kunit-v2-0-fe59c43805d5@ker=
nel.org/

Maxime

--7yiwnnk2wbqqj7it
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5o58QAKCRAnX84Zoj2+
dmFuAYCCPwPsbkS6zdatyLCo5hY2kqqCoG/8bZY3xfwLGV2MEyEv6rKrmBTXNr2N
/OtMj/ABgKazZcnbVQ9oVBF/qc0Y/lNeT6xvkXRcu0V85C8pMO0yP4upwOUDG9UQ
clt48qKpzA==
=/FJL
-----END PGP SIGNATURE-----

--7yiwnnk2wbqqj7it--
