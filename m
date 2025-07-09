Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B1AFE9CA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987D10E025;
	Wed,  9 Jul 2025 13:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="r7EpsMOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA8810E025;
 Wed,  9 Jul 2025 13:14:46 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bcdjv00c7z9tFN;
 Wed,  9 Jul 2025 15:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752066883; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LPZeb2LDepotqSAS+avuO7N+J86N2hbkSz1+a9RkXqI=;
 b=r7EpsMOb7LNDsXj/Zaecu277sq1jXbiMm8CU2N4Izotw9uUnMIDdrmI0Qwg26UYRPpMsgp
 mQ0i0pF6lB9Z+pAd07fkJQEfRd/R18S2XaaYRaQ9O/orswjM1miLzZWqDn7vscfYsNJkKN
 21lw/87GPzKsiA7wL19bbgqgFLdefwlf8REX2xma2isX6UylfpW4BJ2SopAYqK+KDExfs2
 MSxjKQYDI7BYM5GFhwtsswZ8ve3OfKiNvYi3hxq61DGSfzcAblEoB3+vjlf9c6dDIScV1B
 wn9/jSmXdxZusAB2d5FlIJcDYCMblQQh34kSRD767wtclo38i+s01LwvQ+0ebg==
Message-ID: <71d67f799ccadb2858747cac516e04cff53e9234.camel@mailbox.org>
Subject: Re: [PATCH v5 0/8] drm/sched: Allow drivers to skip the reset with
 DRM_GPU_SCHED_STAT_NO_HANG
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Min Ma
 <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>,  Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>,  Lyude Paul
 <lyude@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Wed, 09 Jul 2025 15:14:33 +0200
In-Reply-To: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e1051f2d337af71f0b1
X-MBO-RS-META: nnsz8mjda5bqc7dizxz9ycr335znbgh8
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-07-08 at 10:25 -0300, Ma=C3=ADra Canal wrote:
> TL;DR: The only two patches that are lacking R-b's are:
>=20
> [PATCH 2/8] drm/sched: Allow drivers to skip the reset and keep on runnin=
g
> [PATCH 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
> =C2=A0 -> If Intel CI succeeds, it's Reviewed-by: Matthew Brost <matthew.=
brost@intel.com>
>=20
> For those two patches, it would be great to gather feedback and/or R-b's,
> particularly from the Intel folks.
>=20
> Thanks for all the reviews so far!
>=20
> ---
> When the DRM scheduler times out, it's possible that the GPU isn't hung;
> instead, a job may still be running, and there may be no valid reason to
> reset the hardware. This can occur in two situations:
>=20
> =C2=A0 1. The GPU exposes some mechanism that ensures the GPU is still ma=
king
> =C2=A0=C2=A0=C2=A0=C2=A0 progress. By checking this mechanism, the driver=
 can safely skip the
> =C2=A0=C2=A0=C2=A0=C2=A0 reset, re-arm the timeout, and allow the job to =
continue running until
> =C2=A0=C2=A0=C2=A0=C2=A0 completion. This is the case for v3d, Etnaviv, a=
nd Xe.
>=20
> =C2=A0 2. Timeout has fired before the free-job worker. Consequently, the
> =C2=A0=C2=A0=C2=A0=C2=A0 scheduler calls `timedout_job()` for a job that =
isn't timed out.
>=20
> These two scenarios are problematic because the job was removed from the
> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
> means that when the job finishes, it won't be freed by the scheduler
> though `sched->ops->free_job()`. As a result, the job and its resources
> won't be freed, leading to a memory leak.
>=20
> For v3d specifically, we have observed that these memory leaks can be
> significant in certain scenarios, as reported by users in [1][2]. To
> address this situation, I submitted a patch similar to commit 704d3d60fec=
4
> ("drm/etnaviv: don't block scheduler when GPU is still active") for v3d [=
3].
> This patch has already landed in drm-misc-fixes and successfully resolved
> the users' issues.
>=20
> However, as I mentioned in [3], exposing the scheduler's internals within
> the drivers isn't ideal and I believe this specific situation can be
> addressed within the DRM scheduler framework.
>=20
> This series aims to resolve this issue by adding a new DRM sched status
> that allows a driver to skip the reset. This new status will indicate tha=
t
> the job should be reinserted into the pending list, and the driver will
> still signal its completion.
>=20
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/12227
> [2] https://github.com/raspberrypi/linux/issues/6817
> [3] https://lore.kernel.org/dri-devel/20250430210643.57924-1-mcanal@igali=
a.com/T/
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> ---
> v1 -> v2:
>=20
> - Fix several grammar nits across the documentation and commit messages.
> - Drop "drm/sched: Always free the job after the timeout" (Tvrtko Ursulin=
)
> - [1/8] NEW PATCH: Rename DRM_GPU_SCHED_STAT_NOMINAL to a more semantic
> 	name (Tvrtko Ursulin, Philipp Stanner)
> - [2/8] Rename DRM_GPU_SCHED_STAT_RUNNING to DRM_GPU_SCHED_STAT_NO_HANG (=
Tvrtko Ursulin, Philipp Stanner)
> - [2/8] Requeue free-job work after reinserting the job to the pending li=
st (Matthew Brost)
> - [2/8] Create a helper function to reinsert the job (Philipp Stanner)
> - [2/8] Rewrite the commit message (Philipp Stanner)
> - [2/8] Add a comment to `drm_sched_start()` documentation, similar to wh=
at
> 	was commented in `drm_sched_stop()` (Philipp Stanner)
> - [3/8] Keep HZ as timeout for `drm_mock_sched_job_wait_scheduled()` (Tvr=
tko Ursulin)
> - [4/8] Use a job flag to indicate that `timedout_job()` should skip the
> 	reset (Tvrtko Ursulin)
> - [7/8] Use DRM_GPU_SCHED_STAT_NO_HANG to re-arm the timer in other cases
> 	as well (Matthew Brost)
> - Link to v1: https://lore.kernel.org/r/20250503-sched-skip-reset-v1-0-ed=
0d6701a3fe@igalia.com
>=20
> v2 -> v3:
>=20
> - [2/8] Address comments about the commit message (Philipp Stanner)
> - [2/8] Improve comments and documentation style (Philipp Stanner)
> - [3/8] Rename the commit title to "drm/sched: Make timeout KUnit tests f=
aster" (Philipp Stanner)
> - [3/8] Add Tvrtko's R-b (Tvrtko Ursulin)
> - [4/8] Instead of setting up a job duration, advance it manually (Tvrtko=
 Ursulin)
> - [4/8] Wait for 2 * MOCK_TIMEOUT instead of MOCK_TIMEOUT (Tvrtko Ursulin=
)
> - [5/8, 6/8, 7/8, 8/8] Use Philipp's suggestion to improve the commit mes=
sages (Philipp Stanner)
> - Link to v2: https://lore.kernel.org/r/20250530-sched-skip-reset-v2-0-c4=
0a8d2d8daa@igalia.com
>=20
> v3 -> v4:
>=20
> - [1/8] s/betters/better and Philipp's R-b (Philipp Stanner)
> - [2/8] Apply some documentation nits (Philipp Stanner)
> - [3/8] Add Philipp's A-b=C2=A0 (Philipp Stanner)
> - [4/8, 5/8] Add Tvrtko's R-b (Tvrtko Ursulin)
> - [6/8] Add Lucas' R-b (Lucas Stach)
> - Link to v3: https://lore.kernel.org/r/20250618-sched-skip-reset-v3-0-8b=
e5cca2725d@igalia.com
>=20
> v4 -> v5:
>=20
> - Rebased on top of drm-tip (for Intel CI)
> - [2/8] Reword the commit message (Philipp Stanner)
> - [2/8] Reword several comments (Philipp Stanner)
> - [4/8] Add Philipp's R-b (Philipp Stanner)
> - Link to v4: https://lore.kernel.org/r/20250707-sched-skip-reset-v4-0-03=
6c0f0f584f@igalia.com
>=20
> ---
> Ma=C3=ADra Canal (8):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/sched: Rename DRM_GPU_SCHED_STAT_NOMIN=
AL to DRM_GPU_SCHED_STAT_RESET
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/sched: Allow drivers to skip the reset=
 and keep on running
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/sched: Make timeout KUnit tests faster
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/sched: Add new test for DRM_GPU_SCHED_=
STAT_NO_HANG
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to=
 skip the reset
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HAN=
G to skip the reset
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to =
skip the reset
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HA=
NG to skip the reset
>=20
> =C2=A0drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++----
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +--
> =C2=A0drivers/gpu/drm/nouveau/nouveau_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++---
> =C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 48 +++++++++++++++++++--
> =C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c |=C2=A0 7 ++-
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c=C2=A0=C2=A0=C2=A0 | 5=
5 ++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 ++-=
-----
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++----
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 7 ++-
> =C2=A017 files changed, 137 insertions(+), 61 deletions(-)

Does not apply to drm-misc-next:

Applying: drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STA=
T_RESET
error: patch failed: drivers/gpu/drm/etnaviv/etnaviv_sched.c:87
error: drivers/gpu/drm/etnaviv/etnaviv_sched.c: patch does not apply
Patch failed at 0001 drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GP=
U_SCHED_STAT_RESET

Awkward. That file has last been touched months ago. On what branch is
your series based?

Can you rebase?

From my POV you could also apply it yourself. Looks all good.

P.



> ---
> base-commit: 8b32b5509128873da8ecfc06beefcb58927eb50b
> change-id: 20250502-sched-skip-reset-bf7c163233da
>=20

