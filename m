Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FFB00616
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B510E8F0;
	Thu, 10 Jul 2025 15:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="seWBBlm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EC010E8F0;
 Thu, 10 Jul 2025 15:12:08 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bdJGr6fcCz9t3p;
 Thu, 10 Jul 2025 17:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752160325; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8a6CBOKhPIyH24xt7AaX6qplNBfoOrI4hf0FBujJDRw=;
 b=seWBBlm9HM/1XHghbgmmDne+xfaEPW/l2j5x0R8cfMi8T57g7nxCyH4cqJhlEa/+Zlvcul
 eCobsslJoDrTn200xlNSccbSrkB83lZFfh8IVc4Nckq5Sr4bErNGC3HA4887PPZTzWZYSe
 SHlpLKwOneUezNU7NHmTv9qfBp45OBZclmfJ6/GpnSJ8c8YK4otGSGjJZRBK/Fcr5QiJN1
 V4GIPXF16cq4n0d3l2EWqNv8QIawIRtc0j6av5hZAqwSw/15uW9Oe2atuKnFkDFakXfH4Z
 Jjzpy+iikc0986YoinAoUMndgaQdG+6TbLtqWcFAgpYi1l0sh5pHB0SXpXoaiA==
Message-ID: <18f514ef3a61c877bc80f403db67a2106f4bdd44.camel@mailbox.org>
Subject: Re: [PATCH v4 0/8] drm/sched: Fix memory leaks with cancel_job()
 callback
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew
 Brost <matthew.brost@intel.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 10 Jul 2025 17:11:58 +0200
In-Reply-To: <20250710125412.128476-2-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5c40c1a7c2a9a3dbc09
X-MBO-RS-META: 1nps9qp9r8sikmsso7bmcbxeyzd9bro1
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

On Thu, 2025-07-10 at 14:54 +0200, Philipp Stanner wrote:
> Changes in v4:
> =C2=A0 - Change dev_err() to dev_warn() in pending_list emptyness check.
>=20
> Changes in v3:
> =C2=A0 - Remove forgotten copy-past artifacts. (Tvrtko)
> =C2=A0 - Remove forgotten done_list struct member. (Tvrtko)
> =C2=A0 - Slightly adjust commit message of patch 7.
> =C2=A0 - Add RBs. (Maira, Danilo, Tvrtko)
>=20
> Changes in v2:
> =C2=A0 - Add new unit test to test cancel_job()'s behavior. (Tvrtko)
> =C2=A0 - Add RB from Ma=C3=ADra
>=20
> Changes since the RFC:
> =C2=A0 - Rename helper function for drm_sched_fini(). (Tvrtko)
> =C2=A0 - Add Link to Tvrtko's RFC patch to patch 1.
>=20
>=20
> Since a long time, drm_sched_fini() can leak jobs that are still in
> drm_sched.pending_list.
>=20
> This series solves the leaks in a backwards-compatible manner by
> adding
> a new, optional callback. If that callback is implemented, the
> scheduler
> uses it to cancel all jobs from pending_list and then frees them.
>=20
> Philipp Stanner (8):
> =C2=A0 drm/panfrost: Fix scheduler workqueue bug
> =C2=A0 drm/sched: Avoid memory leaks with cancel_job() callback
> =C2=A0 drm/sched/tests: Implement cancel_job() callback
> =C2=A0 drm/sched/tests: Add unit test for cancel_job()
> =C2=A0 drm/sched: Warn if pending_list is not empty
> =C2=A0 drm/nouveau: Make fence container helper usable driver-wide
> =C2=A0 drm/nouveau: Add new callback for scheduler teardown
> =C2=A0 drm/nouveau: Remove waitque for sched teardown
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 35 ++++++----
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 7 ++
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 35 ++++++----
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 +--
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 8 +--
> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 37 ++++++----
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 68 +++++++----=
------
> --
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h |=C2=A0 1 -
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 42 ++++++++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 =
+++++
> =C2=A011 files changed, 167 insertions(+), 95 deletions(-)
>=20


Pushed to drm-misc-next, with an RB from Tvrtko I had forgot, and
without the misplaced panfrost patch.

Thanks guys. Good to see that we finally solved this issue. Had been
around for quite some time. We celebrate that with a beer or sth at XDC
:)


P.

