Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B5190FD4E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 09:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6D510E6D8;
	Thu, 20 Jun 2024 07:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rNWMyGMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41FA10E2D2;
 Thu, 20 Jun 2024 07:10:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1CA31CE1BD9;
 Thu, 20 Jun 2024 07:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAA1C2BD10;
 Thu, 20 Jun 2024 07:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718867410;
 bh=2Ff/LkmSQ5tLozU97TSef5Klt3x3WrXJR+SGqQA5zC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rNWMyGMaUX0LeFyi3egq2gghepLADg/33Nlb6Po3Q/IC0y90S/4ZdgGJ1N8b2nAHO
 UIvjVnJQrVgOFdxzNWAsKyAsGOrTsEZWyyidX3Daj/ZFnPoNbbyAxoEEaqUrcvNJ+/
 5xIvYTkpsT3IbdZROimHBR5qvurnp9+12Vrq0213ZS3s0VEtm+TIVTBfDd5L1mOQkB
 2OrbOMERXW2MynuX3tQA/AFelp4jnbbrRz82ttnWdS16QP+18j0EiZVLo0Qs3ajcwy
 dkD9WmwDSwSOQEogUXxpTIJQQn9uYospmsJ3s8kwPVIof7LKHY1iRuOcUtyp6ZGmWM
 3RqpHjx3JHL0A==
Date: Thu, 20 Jun 2024 09:10:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Candice Li <candice.li@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Ma Jun <Jun.Ma2@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Victor Lu <victorchengchi.lu@amd.com>,
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Call drm_atomic_helper_shutdown() at
 shutdown time
Message-ID: <20240620-puzzling-hopping-griffin-e43ba6@houat>
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
 <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
 <CADnq5_M+H_h1Me_O3u=R3q52PgYcCwwY9Mr8_R1eX0G7HvBp2w@mail.gmail.com>
 <CAD=FV=X=9PV+zbmd2S-TBBxq+yQZ2D+-cCHjFX-gm-f+DyXXiQ@mail.gmail.com>
 <CADnq5_OXUKj=bfK0NOAhOzmhYCSnQXbxHbwLOaBQ6wFX033Wgw@mail.gmail.com>
 <CADnq5_O1EGj-_xx7LuiXSVY7MSmfS7_1-hqShFk6Deu1wsBwOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5zm3i7b3ypywjs3y"
Content-Disposition: inline
In-Reply-To: <CADnq5_O1EGj-_xx7LuiXSVY7MSmfS7_1-hqShFk6Deu1wsBwOA@mail.gmail.com>
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


--5zm3i7b3ypywjs3y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 19, 2024 at 09:53:12AM GMT, Alex Deucher wrote:
> On Wed, Jun 19, 2024 at 9:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Tue, Jun 18, 2024 at 7:53=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Jun 18, 2024 at 3:00=E2=80=AFPM Alex Deucher <alexdeucher@gma=
il.com> wrote:
> > > >
> > > > On Tue, Jun 18, 2024 at 5:40=E2=80=AFPM Doug Anderson <dianders@chr=
omium.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > >
> > > > > On Mon, Jun 17, 2024 at 8:01=E2=80=AFAM Alex Deucher <alexdeucher=
@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <diand=
ers@chromium.org> wrote:
> > > > > > >
> > > > > > > Based on grepping through the source code this driver appears=
 to be
> > > > > > > missing a call to drm_atomic_helper_shutdown() at system shut=
down
> > > > > > > time. Among other things, this means that if a panel is in us=
e that it
> > > > > > > won't be cleanly powered off at system shutdown time.
> > > > > > >
> > > > > > > The fact that we should call drm_atomic_helper_shutdown() in =
the case
> > > > > > > of OS shutdown/restart comes straight out of the kernel doc "=
driver
> > > > > > > instance overview" in drm_drv.c.
> > > > > > >
> > > > > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > > ---
> > > > > > > This commit is only compile-time tested.
> > > > > > >
> > > > > > > ...and further, I'd say that this patch is more of a plea for=
 help
> > > > > > > than a patch I think is actually right. I'm _fairly_ certain =
that
> > > > > > > drm/amdgpu needs this call at shutdown time but the logic is =
a bit
> > > > > > > hard for me to follow. I'd appreciate if anyone who actually =
knows
> > > > > > > what this should look like could illuminate me, or perhaps ev=
en just
> > > > > > > post a patch themselves!
> > > > > >
> > > > > > I'm not sure this patch makes sense or not.  The driver doesn't=
 really
> > > > > > do a formal tear down in its shutdown routine, it just quiesces=
 the
> > > > > > hardware.  What are the actual requirements of the shutdown fun=
ction?
> > > > > > In the past when we did a full driver tear down in shutdown, it
> > > > > > delayed the shutdown sequence and users complained.
> > > > >
> > > > > The "inspiration" for this patch is to handle panels properly.
> > > > > Specifically, panels often have several power/enable signals goin=
g to
> > > > > them and often have requirements that these signals are powered o=
ff in
> > > > > the proper order with the proper delays between them. While we ca=
n't
> > > > > always do so when the system crashes / reboots in an uncontrolled=
 way,
> > > > > panel manufacturers / HW Engineers get upset if we don't power th=
ings
> > > > > off properly during an orderly shutdown/reboot. When panels are
> > > > > powered off badly it can cause garbage on the screen and, so I've=
 been
> > > > > told, can even cause long term damage to the panels over time.
> > > > >
> > > > > In Linux, some panel drivers have tried to ensure a proper powero=
ff of
> > > > > the panel by handling the shutdown() call themselves. However, th=
is is
> > > > > ugly and panel maintainers want panel drivers to stop doing it. We
> > > > > have removed the code doing this from most panels now [1]. Instea=
d the
> > > > > assumption is that the DRM modeset drivers should be calling
> > > > > drm_atomic_helper_shutdown() which will make sure panels get an
> > > > > orderly shutdown.
> > > > >
> > > > > For a lot more details, see the cover letter [2] which then conta=
ins
> > > > > links to even more discussions about the topic.
> > > > >
> > > > > [1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders@c=
hromium.org
> > > > > [2] https://lore.kernel.org/r/20240612222435.3188234-1-dianders@c=
hromium.org
> > > >
> > > > I don't think it's an issue.  We quiesce the hardware as if we were
> > > > about to suspend the system (e.g., S3).  For the display hardware we
> > > > call drm_atomic_helper_suspend() as part of that sequence.
> > >
> > > OK. It's no skin off my teeth and we can drop this patch if you're
> > > convinced it's not needed. From the point of view of someone who has
> > > no experience with this driver it seems weird to me that it would use
> > > drm_atomic_helper_suspend() at shutdown time instead of the documented
> > > drm_atomic_helper_shutdown(), but if it works for everyone then I'm
> > > not gonna complain.
> >
> > I think the problem is that it is not clear exactly what the
> > expectations are around the PCI shutdown callback.  The documentation
> > says:
> >
> > "Hook into reboot_notifier_list (kernel/sys.c). Intended to stop any
> > idling DMA operations. Useful for enabling wake-on-lan (NIC) or
> > changing the power state of a device before reboot. e.g.
> > drivers/net/e100.c."
>=20
> Arguably, there is no requirement to even touch the display hardware
> at all.  In theory you could just leave the display hardware as is in
> the current state.  The system will either be rebooting or powering
> down anyway.

I think it mostly boils down to a cultural mismatch :)

Doug works on panel for ARM systems, where devices need (and need to
handle) much more resources than what's typical on a system with an AMD
GPU.

So, for the kind of hardware Doug usually deals with, we definitely need
the shutdown hook to make sure the regulators, GPIOs, etc. supplying the
panel are properly shutdown.

And panels usually tied to AMD GPUs probably don't need any of that.

Maxime

--5zm3i7b3ypywjs3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnPVzgAKCRDj7w1vZxhR
xatmAQCxIuSyfE/6gCBy03ufm42cua6jpAe7fceE+XP+nm37xgD/ScbAgBJv1X6N
OAWdu910OMi2rUYbSfex6EB62dbo4ws=
=uVU2
-----END PGP SIGNATURE-----

--5zm3i7b3ypywjs3y--
