Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19100A4214B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932EC10E475;
	Mon, 24 Feb 2025 13:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="m/GsV69S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF1E10E13B;
 Mon, 24 Feb 2025 09:24:37 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z1b0f2mGpz9t7b;
 Mon, 24 Feb 2025 10:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1740389074; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+wd6PCEHlLx+eHYqGrwFyvoAFA7r97pOl/4RtvgfrU=;
 b=m/GsV69SJ013QcS9h3uDFy8n3n3ZzybbgVHEjPSX7O0kVHBoNVM4cQPp9FvqFeNbOu6fKI
 CPF8MH73GZbZX1FOK5nuOe2D5hRkLUGQRihNcw8Nh+eV4Vr8KEk5v7vv4bIkLB3UA0S+eZ
 6cJwxdmYba9m7vtYGrSTKIxH5yCFiU+3/XEwm6jculmXOzglnVkkyB01EMZ7Emw1CXX7v+
 1pm1+qldo94lsFb8d44GYo9vI/imtP/e2Qza8kabQ9YP9IxhjKAAvvLUBaH9epsYLFfnMv
 mBuHL0HGZpMLs5E53++1kVPuLhRR9MqdG+p6icSIzvzUP4SUwRzhWU3r2dThNw==
Message-ID: <639b986bd819a9ba50183b89f4687dc38450ee83.camel@mailbox.org>
Subject: Re: [PATCH v6 0/6] drm/sched: Job queue peek/pop helpers and struct
 job re-order
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Date: Mon, 24 Feb 2025 10:24:30 +0100
In-Reply-To: <20250221105038.79665-1-tvrtko.ursulin@igalia.com>
References: <20250221105038.79665-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: x5cog6dmnzkfden71u9febn8676s8jwb
X-MBO-RS-ID: 066b92eec6641381c60
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

On Fri, 2025-02-21 at 10:50 +0000, Tvrtko Ursulin wrote:
> Lets add some helpers for peeking and popping from the job queue
> which allows us
> to re-order the fields in struct drm_sched_job and remove one hole.
>=20
> As in the process we have added a header file for scheduler internal
> prototypes,
> lets also use it more and cleanup the "exported" header a bit.
>=20
> v2:
> =C2=A0* Add header file for internal scheduler API.
> =C2=A0* Add helper for peeking too. (Danilo)
> =C2=A0* Add (temporary?) drm_sched_cancel_all_jobs() helper to replace
> amdgpu
> =C2=A0=C2=A0 amdgpu_job_stop_all_jobs_on_sched().
>=20
> v3:
> =C2=A0* Settle for a copy of __drm_sched_entity_queue_pop in amdgpu for
> now.
>=20
> v4:
> =C2=A0* Expand the series with some more header file cleanup.
>=20
> v5:
> =C2=A0* Rebase for drm_sched_init changes.
> =C2=A0* Tweak kerneldoc format.
>=20
> v6:
> =C2=A0* Added SPDX to the new header file.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
>=20
> Tvrtko Ursulin (6):
> =C2=A0 drm/sched: Add internal job peek/pop API
> =C2=A0 drm/amdgpu: Pop jobs from the queue more robustly
> =C2=A0 drm/sched: Remove a hole from struct drm_sched_job
> =C2=A0 drm/sched: Move drm_sched_entity_is_ready to internal header
> =C2=A0 drm/sched: Move internal prototypes to internal header
> =C2=A0 drm/sched: Group exported prototypes by object type
>=20
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2=
2 +++-
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 |=C2=A0 23 +--=
-
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0 91 +++++++++++++=
++
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 7 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 122 +++++++++--------=
--
> --
> =C2=A06 files changed, 171 insertions(+), 96 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h
>=20

Applied to drm-misc-next.

Thanks, Tvrtko
