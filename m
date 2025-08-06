Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7FAB1C415
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 12:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFA710E2E4;
	Wed,  6 Aug 2025 10:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FF810E2E4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 10:15:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ujbAy-0002kc-Ip; Wed, 06 Aug 2025 12:15:16 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1ujbAx-00CBzX-0r;
 Wed, 06 Aug 2025 12:15:15 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1ujbAx-0009Bg-0a;
 Wed, 06 Aug 2025 12:15:15 +0200
Message-ID: <41b37595c42e4f492704a31970936d52b96dae97.camel@pengutronix.de>
Subject: Re: [PATCH RFC 0/6] amdgpu: Avoid powering on the dGPU on
 vkEnumeratePhysicalDevices()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Zabel <philipp.zabel@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 06 Aug 2025 12:15:15 +0200
In-Reply-To: <601a40fd-e508-4e9d-8dd3-14329f3a637b@amd.com>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
 <601a40fd-e508-4e9d-8dd3-14329f3a637b@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Mi, 2025-08-06 at 10:58 +0200, Christian K=C3=B6nig wrote:
> On 31.07.25 07:36, Philipp Zabel wrote:
> > This is an attempt at fixing amd#2295 [1]:
> >=20
> >   On an AMD Rembrandt laptop with 680M iGPU and 6700S dGPU, calling
> >   vkEnumeratePhysicalDevices() wakes up the sleeping dGPU, even if all
> >   the application wants is to find and use the iGPU. This causes a dela=
y
> >   of about 2 seconds on this system, followed by a few seconds of
> >   increased power draw until runtime PM turns the dGPU back off again.
> >=20
> > [1] https://gitlab.freedesktop.org/drm/amd/-/issues/2295
> >=20
> > Patch 1 avoids power up on some ioctls that don't need it.
> > Patch 2 avoids power up on open() by postponing fpriv initialization to
> > the first ioctl() that wakes up the dGPU.
> > Patches 3 and 4 add AMDGPU_INFO to the list of non-waking ioctls,
> > returning cached values for some queries.
> > Patch 5 works around an explicit register access from libdrm.
> > Patch 6 shorts out the syncobj ioctls while fpriv is still
> > uninitialized. This avoids waking up the dGPU during Vulkan syncobj
> > feature detection.
>=20
> This idea came up multiple times now but was never completed.
>=20
> IIRC Pierre-Eric last worked on it, it would probably be a good idea to d=
ig up his patches from the mailing list.

Thank you, I wasn't aware of those patches [1]. Pierre-Eric did mention
them in https://gitlab.freedesktop.org/mesa/mesa/-/issues/13001, but I
didn't pick up on that back then.

[1] https://lore.kernel.org/all/20240618153003.146168-1-pierre-eric.pelloux=
-prayer@amd.com/

Is that the latest version? It looks to me like the review stalled out
on a disagreement whether the GB_ADDR_CONFIG query should be a separate
ioctl or whether it should be added to drm_amdgpu_info_device. The
discussion was later continued at
https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/368,
seemingly coming to the conclusion that keeping the register read (but
cached) is the way to go? I didn't find a newer series with that
implemented.

> >=20
> > regards
> > Philipp
> >=20
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Alex Deucher (1):
> >       drm/amdgpu: don't wake up the GPU for some IOCTLs
> >=20
> > Philipp Zabel (5):
> >       drm/amdgpu: don't wake up the GPU when opening the device
> >       drm/amdgpu: don't query xclk in AMDGPU_INFO_DEV_INFO
> >       drm/amdgpu: don't wake up the GPU for some AMDGPU_INFO queries
> >       drm/amdgpu: don't wake up the GPU for mmGB_ADDR_CONFIG register r=
ead
>=20
> That is both unnecessary an insufficient. Unnecessary because we already =
have a mechanism to cache register values and insufficient because IIRC you=
 need to add a bunch of more registers to the cached list.

This series was (just barely) sufficient for my purpose, which was only
to make vkEnumeratePhysicalDevices() not wake the dGPU on my Laptop.
I didn't realize there already was a caching mechanism in the lower
layers.

> See Pierre-Erics latest patch set, I think we already solved that but I'm=
 not 100% sure.

If I found the correct version, it seems Sima's suggestion of pushing
runtime pm handling down from amdgpu_drm_ioctl into the amdgpu ioctl
callbacks [2] would be the best first next step?

[2] https://lore.kernel.org/amd-gfx/ZnvJHwnNAvDrRMVG@phenom.ffwll.local/

regards
Philipp
