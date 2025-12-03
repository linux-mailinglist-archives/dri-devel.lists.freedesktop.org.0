Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798BC9E3B0
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B2F10E737;
	Wed,  3 Dec 2025 08:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XF2eNXUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE5510E737;
 Wed,  3 Dec 2025 08:33:16 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLrWF28kWz9tYh;
 Wed,  3 Dec 2025 09:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764750793; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCkaH4RkyOCE68iBUM9HTYufTJgIeQQADoO1GMbHwZs=;
 b=XF2eNXUaWFr1NH1jVo2fD8pVFgkYHxq/kXdwQ39uATx1gpZTpY3h/RLmx8UqR5mVFWcvad
 FZWkzxc0nkQhODaMyCARhKQUBZOlv8uP3xz+vXGHPyZwlZXZJy34aTDNdqTfrkuGqYtDJs
 JofdVvVVdEeecHOOsqoP/rDedke4/aE12+8z1s8V2N6xmao+sA/e3LJWCxoTRH6eRygC4W
 MSefBL/F3yjS4armWDd7RzKygN8HJukJuqylo7rXE7m7fgE/iVHcRRgmuwKCDNK/GsHPDB
 fzUXbDQVF2MU1k1GFov9NHq2wgU9SQVW+y9ow9o1Mi651MU/KgI6ix0t0ixyXg==
Message-ID: <591842211d77122faec79530c3d4d805cf09fe02.camel@mailbox.org>
Subject: Re: [PATCH v7 0/9] Fix DRM scheduler layering violations in Xe
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, phasta@kernel.org, 
 christian.koenig@amd.com, dakr@kernel.org
Date: Wed, 03 Dec 2025 09:33:09 +0100
In-Reply-To: <aS+RIfD3mb7dAHRV@lstrano-desk.jf.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <aS+RIfD3mb7dAHRV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c5da3f4f369238331ba
X-MBO-RS-META: azaubu513z5mudz1yjfz1q85j1kubzwh
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

On Tue, 2025-12-02 at 17:23 -0800, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 10:39:45AM -0800, Matthew Brost wrote:
>=20
> Fellow DRM sched maintainers - going to merge the first two patches in
> this series to drm-misc-next two days from now unless I hear an
> objection.

Fellow maintainer Matt, it seems that none of us has ever been on Cc
for this series or patch? I can't find it in my inbox. Did you forget
to add us for 7 revisions, or did you omit us on purpose?

I look occasionally at dri-devel, but you know how huge the list is.

P.


>=20
> Matt=20
>=20
> > At XDC, we discussed that drivers should avoid accessing DRM scheduler
> > internals, misusing DRM scheduler locks, and adopt a well-defined
> > pending job list iterator. This series proposes the necessary changes t=
o
> > the DRM scheduler to bring Xe in line with that agreement and updates X=
e
> > to use the new DRM scheduler API.
> >=20
> > While here, cleanup LR queue handling and simplify GuC state machine in
> > Xe too. Also rework LRC timestamp sampling to avoid scheduling toggle.
> >=20
> > v2:
> > =C2=A0- Fix checkpatch / naming issues
> > v3:
> > =C2=A0- Only allow pending job list iterator to be called on stopped sc=
hedulers
> > =C2=A0- Cleanup LR queue handling / fix a few misselanous Xe scheduler =
issues
> > v4:
> > =C2=A0- Address Niranjana's feedback
> > =C2=A0- Add patch to avoid toggling scheduler state in the TDR
> > v5:
> > =C2=A0- Rebase
> > =C2=A0- Fixup LRC timeout check (Umesh)
> > v6:
> > =C2=A0- Fix VF bugs (Testing)
> > v7:
> > =C2=A0- Disable timestamp WA on VF
> >=20
> > Matt
> >=20
> > Matthew Brost (9):
> > =C2=A0 drm/sched: Add several job helpers to avoid drivers touching sch=
eduler
> > =C2=A0=C2=A0=C2=A0 state
> > =C2=A0 drm/sched: Add pending job list iterator
> > =C2=A0 drm/xe: Add dedicated message lock
> > =C2=A0 drm/xe: Stop abusing DRM scheduler internals
> > =C2=A0 drm/xe: Only toggle scheduling in TDR if GuC is running
> > =C2=A0 drm/xe: Do not deregister queues in TDR
> > =C2=A0 drm/xe: Remove special casing for LR queues in submission
> > =C2=A0 drm/xe: Disable timestamp WA on VFs
> > =C2=A0 drm/xe: Avoid toggling schedule state to check LRC timestamp in =
TDR
> >=20
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 37 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler_types.h=C2=A0 |=C2=A0=C2=A0 2=
 +
> > =C2=A0drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |=C2=A0=C2=A0 2 -
> > =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 362 +++----------------
> > =C2=A0drivers/gpu/drm/xe/xe_guc_submit_types.h=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 11 -
> > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 -
> > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 -
> > =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
45 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_lrc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 +-
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 -
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
82 +++++
> > =C2=A016 files changed, 211 insertions(+), 397 deletions(-)
> >=20
> > --=20
> > 2.34.1
> >=20

