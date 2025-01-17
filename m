Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3490CA1616C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 12:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF12010E04E;
	Sun, 19 Jan 2025 11:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vPK1yIuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EC310E23F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 12:12:26 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YZJWm20dQz9shW;
 Fri, 17 Jan 2025 13:12:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1737115940; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=217NDkwQcNCgz3jm/X/qFAjQplUR+04KofLENm6+Ifs=;
 b=vPK1yIuOY79AGfGAzoN/lh6Yg/ozjG9QUnuqbJ04mzhjF/BGt1suV+yLykVw5zRCJvDbq+
 Xy2kOefrcvXXfAzmgPyglvdKQ9wFZOHIc1wRvBePr/L4C4TZGjMB6FAQkQG26iwckKPbxH
 e945+uEhrBOL5zVixQ2S17rLQakBSCGunQ5On7rfSQLjpQGr9v4sJaRkYXc2e5g9Wcnnyj
 SrcNR+Chhysl8F3EDMg03r/EejvqgPTJNU8CI+e89kngu1b4hhiLEfYRRdGdyFZA38UwU0
 jwhC58lNGIydJcbnCIT1eH4XEpe4bk9XEYL9DWCP7Y4eQe3ITEzSBPyl17b6Tw==
Message-ID: <d490aa8d847d2bdebd893301047d256081e2a911.camel@mailbox.org>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 17 Jan 2025 13:12:17 +0100
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: ffaeb783f1d56455153
X-MBO-RS-META: m4h9tmqaydsiufpag83yhnafpumo8n7p
X-Mailman-Approved-At: Sun, 19 Jan 2025 11:46:42 +0000
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

On Mon, 2024-12-30 at 16:52 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> <tldr>
> Replacing FIFO with a flavour of deadline driven scheduling and
> removing round-
> robin. Connecting the scheduler with dma-fence deadlines. First draft
> and
> testing by different drivers and feedback would be nice. I was only
> able to test
> it with amdgpu. Other drivers may not even compile.
> </tldr>
>=20
> If I remember correctly Christian mentioned recently (give or take)
> that maybe
> round-robin could be removed. That got me thinking how and what could
> be
> improved and simplified. So I played a bit in the scheduler code and
> came up
> with something which appears to not crash at least. Whether or not
> there are
> significant advantages apart from maybe code consolidation and
> reduction is the
> main thing to be determined.
>=20
> One big question is whether round-robin can really be removed. Does
> anyone use
> it, rely on it, or what are even use cases where it is much better
> than FIFO.
>=20
> See "drm/sched: Add deadline policy" commit message for a short
> description on
> what flavour of deadline scheduling it is. But in essence it should a
> more fair
> FIFO where higher priority can not forever starve lower priorities.
>=20
> "drm/sched: Connect with dma-fence deadlines" wires up dma-fence
> deadlines to
> the scheduler because it is easy and makes logical sense with this.
> And I
> noticed userspace already uses it so why not wire it up fully.
>=20
> Otherwise the series is a bit of progression from consolidating RR
> into FIFO
> code paths and going from there to deadline and then to a change in
> how
> dependencies are handled. And code simplification to 1:1 run queue to
> scheduler
> relationship, because deadline does not need per priority run queues.
>=20
> There is quite a bit of code to go throught here so I think it could
> be even
> better if other drivers could give it a spin as is and see if some
> improvements
> can be detected. Or at least no regressions.

Soooo =E2=80=93 I have thought about this series a bit more and also read a=
 bit
about the issues Michel recently mentioned.

As Danilo also pointed out, going for an experiment like that at the
current time is not a good idea. Not with the scheduler being in that
shape still and not without having powerful tools for regression
testing.

That said, we are slowly moving into the right direction. I think one
of the things we're lacking is good testing infrastructure. In fact,
it's on my list for a while now to write kunit tests for the scheduler
(beginning with the basics, submit a number of jobs and all that), so
that we get a better mechanism for detecting regressions.

Once we have more infrastructure for systematic testing, we could
consequently also slowly become more open to looking into more daring
changes.

I unfortunately so far couldn't manage to free up some time to dedicate
to that effort. In case you, Tvrtko, should have capacity for that, I
of course wouldn't mind at all; that could help greatly


Regards,
Philipp


>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
>=20
> Tvrtko Ursulin (14):
> =C2=A0 drm/sched: Delete unused update_job_credits
> =C2=A0 drm/sched: Remove idle entity from tree
> =C2=A0 drm/sched: Implement RR via FIFO
> =C2=A0 drm/sched: Consolidate entity run queue management
> =C2=A0 drm/sched: Move run queue related code into a separate file
> =C2=A0 drm/sched: Ignore own fence earlier
> =C2=A0 drm/sched: Resolve same scheduler dependencies earlier
> =C2=A0 drm/sched: Add deadline policy
> =C2=A0 drm/sched: Remove FIFO and RR and simplify to a single run queue
> =C2=A0 drm/sched: Queue all free credits in one worker invocation
> =C2=A0 drm/sched: Connect with dma-fence deadlines
> =C2=A0 drm/sched: Embed run queue singleton into the scheduler
> =C2=A0 dma-fence: Add helper for custom fence context when merging fences
> =C2=A0 drm/sched: Resolve all job dependencies in one go
>=20
> =C2=A0drivers/dma-buf/dma-fence-unwrap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 27 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0 |=C2=A0=C2=A0=
 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0 | 316 ++=
++++-----
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 587 +++++-------------
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 199 +++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++-
> =C2=A0include/linux/dma-fence-unwrap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 31 +-
> =C2=A014 files changed, 606 insertions(+), 678 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>=20

