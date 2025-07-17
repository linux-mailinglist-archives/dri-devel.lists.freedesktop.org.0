Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B06B08981
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 11:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E4610E760;
	Thu, 17 Jul 2025 09:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="S7MASgrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CAD10E3F3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:40:29 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bjSZx5dtvz9sp2;
 Thu, 17 Jul 2025 11:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752745225; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkgVYvH7oIZFOu2IWsE/V0Bvl8DaJQ8sqA+83qTpYLY=;
 b=S7MASgrPGM5cp9vfJfMAT815x2fY1AV365d2UEgQPgbX5xvyXaR6cAi0hD4FUKN8jCTTik
 wI34ADLsrXLLJFRYPfrWrQXJcNZHM815k64dk4MbNP5CCibam1aQ2O9BifXB0ULr2HHCpr
 LFdCwmS+mEoAGoLBwDdc7/duSHuviWwhrhBzGTnZAxnBPRzZYjAS7T1VHCI1nb+zjI6fP5
 ySy+7u61X5y1rG0wF+btba8OOzx7ZfEh0QjDu7sglE3SkumMd98boXnSWGbjPpu5pAq07b
 SvYZDtQ2MMJ0WUtVQs4BwSfk7skboqwGm2ezZtrWs/gRKkvfCBBMp3d79YqtGA==
Message-ID: <30a591c00e894957c079133da7ec98499ebe6606.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix a race in DRM_GPU_SCHED_STAT_NO_HANG test
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>,  Philipp Stanner <phasta@kernel.org>
Date: Thu, 17 Jul 2025 11:40:23 +0200
In-Reply-To: <20250716084817.56797-1-tvrtko.ursulin@igalia.com>
References: <20250716084817.56797-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 656575d1d6d5b582848
X-MBO-RS-META: pbptb5rynhp7t76bru48mba75zghexck
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

On Wed, 2025-07-16 at 09:48 +0100, Tvrtko Ursulin wrote:
> The "skip reset" test waits for the timeout handler to run for the
> duration of 2 * MOCK_TIMEOUT, and because the mock scheduler opted to
> remove the "skip reset" flag once it fires, this gives opportunity
> for the
> timeout handler to run twice. Second time the job will be removed
> from the
> mock scheduler job list and the drm_mock_sched_advance() call in the
> test
> will fail.
>=20
> Fix it by making the "don't reset" flag persist for the lifetime of
> the
> job and add a new flag to verify that the code path had executed as
> expected.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 1472e7549f84 ("drm/sched: Add new test for
> DRM_GPU_SCHED_STAT_NO_HANG")
> Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-next, in accordance with the DRM commiter
guidelines.


Thx
P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 2 +-
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h=C2=A0=C2=A0=C2=A0 | 7=
 ++++---
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c=C2=A0=C2=A0=C2=A0 | 4=
 ++--
> =C2=A03 files changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 65acffc3fea8..8e9ae7d980eb 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -219,7 +219,7 @@ mock_sched_timedout_job(struct drm_sched_job
> *sched_job)
> =C2=A0	unsigned long flags;
> =C2=A0
> =C2=A0	if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
> -		job->flags &=3D ~DRM_MOCK_SCHED_JOB_DONT_RESET;
> +		job->flags |=3D DRM_MOCK_SCHED_JOB_RESET_SKIPPED;
> =C2=A0		return DRM_GPU_SCHED_STAT_NO_HANG;
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 63d4f2ac7074..5b262126b776 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -95,9 +95,10 @@ struct drm_mock_sched_job {
> =C2=A0
> =C2=A0	struct completion	done;
> =C2=A0
> -#define DRM_MOCK_SCHED_JOB_DONE		0x1
> -#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
> -#define DRM_MOCK_SCHED_JOB_DONT_RESET	0x4
> +#define DRM_MOCK_SCHED_JOB_DONE			0x1
> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT		0x2
> +#define DRM_MOCK_SCHED_JOB_DONT_RESET		0x4
> +#define DRM_MOCK_SCHED_JOB_RESET_SKIPPED	0x8
> =C2=A0	unsigned long		flags;
> =C2=A0
> =C2=A0	struct list_head	link;
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 55eb142bd7c5..82a41a456b0a 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -317,8 +317,8 @@ static void drm_sched_skip_reset(struct kunit
> *test)
> =C2=A0	KUNIT_ASSERT_FALSE(test, done);
> =C2=A0
> =C2=A0	KUNIT_ASSERT_EQ(test,
> -			job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET,
> -			0);
> +			job->flags &
> DRM_MOCK_SCHED_JOB_RESET_SKIPPED,
> +			DRM_MOCK_SCHED_JOB_RESET_SKIPPED);
> =C2=A0
> =C2=A0	i =3D drm_mock_sched_advance(sched, 1);
> =C2=A0	KUNIT_ASSERT_EQ(test, i, 1);

