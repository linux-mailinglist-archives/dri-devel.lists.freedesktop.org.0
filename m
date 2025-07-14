Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78271B03BBA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ECE10E43F;
	Mon, 14 Jul 2025 10:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="J88xIkoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C6589B30;
 Mon, 14 Jul 2025 10:16:21 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bgdWk4wQwz9tX6;
 Mon, 14 Jul 2025 12:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752488178; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OS4v+GYqQIPhyGti1HFtA75TWW8p1sEs4i8qun5i2Vk=;
 b=J88xIkooQ7OSSz0i1UlgAO7iMfGvvuRqb8yBG3BZNKqEoOVUNdawXsGPtygenZjbtmlPN4
 ILKhopfNSD4bUHhtWg9v9AVIzdjaiP3jET5SNtIRJCpHroF+DLMciJ6qG0c353GGKO1ZRu
 bfJegxBF9LHQTwtYSE2MR4YWLuMalXXLLlldE/SFCaBYFAm3fbUx6QG68zXaYeKdPkuhby
 dQkW0lhr+gMXKs/hNLQ1uUaivVv6OtD5TOM+Yjm373jhktW8Ldd3LANIlAcrWyTG1lchM4
 LXazUzuSEYDZmNvLeA7chCiWlcEaEDVLfV7xz/7NgZUcoqtOBPrP4IXs6z4esg==
Message-ID: <9dbf93987a0d302506247f17985aa08f948c062d.camel@mailbox.org>
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, phasta@kernel.org,
 Matthew Brost <matthew.brost@intel.com>,  Danilo Krummrich
 <dakr@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona
 Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, Melissa Wen
 <mwen@igalia.com>,  Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>,  Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 14 Jul 2025 12:16:07 +0200
In-Reply-To: <2818cf80-4dac-4628-9079-2dd6311b48ae@amd.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
 <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
 <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
 <2347cd33-5289-4e6f-8296-b34bc05eff8b@igalia.com>
 <2818cf80-4dac-4628-9079-2dd6311b48ae@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: o4b78z5h8ef7knny6u47g1mwj4rrysoh
X-MBO-RS-ID: 25f97a9caf60d4e01d2
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

On Mon, 2025-07-14 at 11:23 +0200, Christian K=C3=B6nig wrote:
> On 13.07.25 21:03, Ma=C3=ADra Canal wrote:
> > Hi Christian,
> >=20
> > On 11/07/25 12:20, Christian K=C3=B6nig wrote:
> > > On 11.07.25 15:37, Philipp Stanner wrote:
> > > > On Fri, 2025-07-11 at 15:22 +0200, Christian K=C3=B6nig wrote:
> > > > >=20
> > > > >=20
> > > > > On 08.07.25 15:25, Ma=C3=ADra Canal wrote:
> > > > > > When the DRM scheduler times out, it's possible that the
> > > > > > GPU isn't hung;
> > > > > > instead, a job just took unusually long (longer than the
> > > > > > timeout) but is
> > > > > > still running, and there is, thus, no reason to reset the
> > > > > > hardware. This
> > > > > > can occur in two scenarios:
> > > > > >=20
> > > > > > =C2=A0=C2=A0 1. The job is taking longer than the timeout, but =
the
> > > > > > driver determined
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 through a GPU-specific mechanism=
 that the hardware is
> > > > > > still making
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 progress. Hence, the driver woul=
d like the scheduler
> > > > > > to skip the
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeout and treat the job as sti=
ll pending from then
> > > > > > onward. This
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 happens in v3d, Etnaviv, and Xe.
> > > > > > =C2=A0=C2=A0 2. Timeout has fired before the free-job worker.
> > > > > > Consequently, the
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scheduler calls `sched->ops->tim=
edout_job()` for a
> > > > > > job that isn't
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timed out.
> > > > > >=20
> > > > > > These two scenarios are problematic because the job was
> > > > > > removed from the
> > > > > > `sched->pending_list` before calling `sched->ops-
> > > > > > >timedout_job()`, which
> > > > > > means that when the job finishes, it won't be freed by the
> > > > > > scheduler
> > > > > > though `sched->ops->free_job()` - leading to a memory leak.
> > > > >=20
> > > > > Yeah, that is unfortunately intentional.
> > > > >=20
> > > > > > To solve these problems, create a new `drm_gpu_sched_stat`,
> > > > > > called
> > > > > > DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip
> > > > > > the reset. The
> > > > > > new status will indicate that the job must be reinserted
> > > > > > into
> > > > > > `sched->pending_list`, and the hardware / driver will still
> > > > > > complete that
> > > > > > job.
> > > > >=20
> > > > > Well long story short we have already tried this and the
> > > > > whole approach doesn't work correctly in all cases. See the
> > > > > git history around how we used to destroy the jobs.
> > > > >=20
> > > > > The basic problem is that you can always race between timing
> > > > > out and Signaling/destroying the job. This is the long
> > > > > lasting job lifetime issue we already discussed more than
> > > > > once.
> > > >=20
> > > > The scheduler destroys the job, through free_job().
> > > > I think we have agreed that for now the scheduler is the party
> > > > responsible for the job lifetime.
> > >=20
> > > That's what I strongly disagree on. The job is just a state bag
> > > between the submission and scheduling state of a submission.
> > >=20
> > > For the scheduler the control starts when it is pushed into the
> > > entity and ends when run_job is called.
> > >=20
> > > The real representation of the submission is the scheduler fence
> > > and that object has a perfectly defined lifetime, state and error
> > > handling.
> > >=20
> > > > >=20
> > > > > If you want to fix this I think the correct approach is to
> > > > > completely drop tracking jobs in the scheduler at all.
> > > >=20
> > > > I don't see how this series introduces a problem?
> > > >=20
> > > > The fact is that drivers are abusing the API by just firing
> > > > jobs back
> > > > into the scheduler's job list. This series legalizes the abuse
> > > > by
> > > > providing scheduler functionality for that.
> > > >=20
> > > > IOW, the series improves the situation but does not add a *new*
> > > > problem. Even less so as driver's aren't forced to use the new
> > > > status
> > > > code, but can continue having job completion race with timeout
> > > > handlers.
> > >=20
> > > Maybe yes, but I'm really not sure about it.
> > >=20
> > > Take a look at the git history or job destruction, we already had
> > > exactly that approach, removed it and said that leaking memory is
> > > at least better than an use after free issue.
> > >=20
> >=20
> > If the job was removed from the pending list in the beginning of
> > the
> > timeout and drm_sched_get_finished_job() fetches jobs from the
> > pending
> > list, how can we end up with an use-after-free issue?
>=20
> By adding it back into the list after the timeout handling completed.
>=20
> We had exactly that before we came up with the horrible design to add
> it back to the pending list in drm_sched_stop() and the free_guilty
> flag.
>=20
> Could be that your approach now works better, but I'm really not sure
> about that.

This isn't Ma=C3=ADra's approach; this is an approach that is already
established practice in DRM. Have you looked at the code? There isn't
that much magic happening there.

The job gets added back to pending_list. For the scheduler, this is
like a completely new job, with the timeout handler running again and
the other work items picking the job up when appropriate.

Ma=C3=ADra ports several drivers which have been (illegally, outside our
API) doing that and it worked for them.

Now there's a centralized solution; one which is only active for the
drivers which choose to use it. Other driver's aren't affected.

IOW, my main argument still stands: this series doesn't add a new bug,
but improves the overall situation in DRM.


P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Best Regards,
> > - Ma=C3=ADra
> >=20
>=20

