Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD9FACC7AE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8610E631;
	Tue,  3 Jun 2025 13:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hvdmvmCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B7310E631;
 Tue,  3 Jun 2025 13:23:48 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bBWcs5tVRz9tKm;
 Tue,  3 Jun 2025 15:23:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748957021; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rC9wfImtJeRRZMvS7a471KH44YhZ50t9581jq7fj9c=;
 b=hvdmvmCCcNvGJiQxq49aEEttREH4Kcrp00Q7oSW5mNn41hphEgaWVBESxXsuO5aLcOxeI4
 kBM4mKnPCkCpILWBTpCb6PSo3UGOA+WYMyTD//w0wKhPFbYt1rm2rqPCM7fePX1e77+jeK
 kv5IJ7Ownc7Dgpvx8uJo+/FcwWZmxQxZ+QK9mNCUhxYGb7VbR2kDeUM77ay0lrytJaqx4R
 4SCb4ZpTWKItU4FjMCurdR/mZNHHzUKq2NzhZwWbMNcyepX4SgeUKnkMq9GlypG6hp6kIo
 B9BjVXFnlWUpYZE2CKHcoYfQpuLKVrbvXTmLo6RyC2AdjTwFneDRnaIzGGX+Ug==
Message-ID: <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>
Subject: Re: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling
 job-by-job
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 03 Jun 2025 15:23:36 +0200
In-Reply-To: <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
References: <20250603093130.100159-2-phasta@kernel.org>
 <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: cdf397ce994b2e274e3
X-MBO-RS-META: oepr7uqp6e6ppxxyqmaoqq5ms8qeqiiz
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

On Tue, 2025-06-03 at 13:27 +0100, Tvrtko Ursulin wrote:
>=20
> On 03/06/2025 10:31, Philipp Stanner wrote:
> > An alternative version to [1], based on Tvrtko's suggestion from
> > [2].
> >=20
> > I tested this for Nouveau. Works.
> >=20
> > I'm having, however, bigger problems properly porting the unit
> > tests and
> > have seen various explosions. In the process I noticed that some
> > things
> > in the unit tests aren't right and a bit of a larger rework will be
> > necessary (for example, the timedout job callback must signal the
> > timedout fence, remove it from the list and so on).
>=20
> General approach I follow when implementing any mock component is to=20
> implement only as much is needed for a test to pass. Only add more
> and=20
> rework when a test/functionality is added which requires it.
>=20
> Specifically for timedout callback signaling I see that I had exactly
> that added in the patch you linked as [2].
> =C2=A0 > Anyways. Please comment on the general idea.
>=20
> I am obviously okay with it. :) Especially now that you verified it=20
> works well for nouveau.
>=20
> What I am not that ecstatic about is only getting the Suggested-by=20
> credit in 1/6. Given it is basically my patch with some cosmetic
> changes=20
> like the kernel doc and the cancel loop extracted to a helper.

Sign the patch off and I give you the authorship if you want.

>=20
> > @Tvrtko: As briefly brainstormed about on IRC, if you'd be willing
> > to
> > take care of the unit tests patch, I could remove that one (and,
> > maaaaybe, the warning print patch) from the series and we could
> > merge
> > this RFC's successor version %N once it's ready. What do you think?
>=20
> Okay in principle but the first thing I would suggest you could try
> is=20
> to take my unit tests adaptations from [2] verbatim. Benefit of
> keeping=20
> everything in one series is more confidence we are merging a solid=20
> thing. But I can take it on myself as a follow up too if you want.
>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > P.
> >=20
> > [1]
> > https://lore.kernel.org/dri-devel/20250522082742.148191-2-phasta@kernel=
.org/
> > [2]
> > https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin=
@igalia.com/
> >=20
> > Philipp Stanner (6):
> > =C2=A0=C2=A0 drm/sched: Avoid memory leaks with cancel_job() callback
> > =C2=A0=C2=A0 drm/sched/tests: Implement cancel_job()
> > =C2=A0=C2=A0 drm/sched: Warn if pending list is not empty
> > =C2=A0=C2=A0 drm/nouveau: Make fence container helper usable driver-wid=
e
> > =C2=A0=C2=A0 drm/nouveau: Add new callback for scheduler teardown
> > =C2=A0=C2=A0 drm/nouveau: Remove waitque for sched teardown
> >=20
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 35 +++++----
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_fence.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 7 ++
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 35 +++++----
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 9 +--
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_uvmm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +--
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 37 ++++++----
> > =C2=A0 .../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 71 +++++++-=
------
> > -----
> > =C2=A0 drivers/gpu/drm/scheduler/tests/sched_tests.h |=C2=A0 4 +-
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 9 +++
> > =C2=A0 9 files changed, 115 insertions(+), 100 deletions(-)
> >=20
>=20

