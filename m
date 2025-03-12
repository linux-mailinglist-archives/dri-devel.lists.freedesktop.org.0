Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8BA5DE97
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA83910E08C;
	Wed, 12 Mar 2025 14:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="SzuBcC4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641B610E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 14:04:17 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZCXRx6z74z9t7b;
 Wed, 12 Mar 2025 15:04:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741788254; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KX3LHfXVmCItUukBscQZts+eV96AYZm/YvKIDyflbc=;
 b=SzuBcC4Flk4sHvGgBNPrXZLj7PZD4x6LMrvdIqUzFYMzGgSOZnjpswTweRw+mkwiXKVF/d
 LP8ghT5APEyUbDPtN7paFERsqCIXeBV48HN350I2JLphi8YxmUlH3YC/EgfzZmvr47ai1B
 i8nZ+qFhN7aqsqLaVOHoIMSWLnLFVt9SDH61Q4z5qfdNvbx6FCkkTheyqXiFkewkDonYg5
 nYdipiBLJNupv8GvjGC24TZknzXVdHkvvAURah4GB6IKrmCkA+4tY2XPc1Ki4ddxw+Q6lb
 nxbI5mKfYvK/F4BNrFdqQ4hcsZrIn2vwfwA+k1hpXZDZQCao0207O11F0xqDFw==
Message-ID: <54ea7483ab8905baa28077ee4523b5dbaa88d693.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct
 false doc"
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Wed, 12 Mar 2025 15:04:11 +0100
In-Reply-To: <20250312134400.2176393-1-christian.koenig@amd.com>
References: <20250312134400.2176393-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: nf7wqczrern3t1qdxjtwxrkz6418engy
X-MBO-RS-ID: 72f811ebee421f46825
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

On Wed, 2025-03-12 at 14:44 +0100, Christian K=C3=B6nig wrote:
> This reverts commit 44d2f310f008613c1dbe5e234c2cf2be90cbbfab.
>=20
> The function drm_sched_job_arm() is indeed the point of no return.
> The
> background is that it is nearly impossible for the driver to
> correctly
> retract the fence and signal it in the order enforced by the
> dma_fence
> framework.
>=20
> The code in drm_sched_job_cleanup() is for the purpose to cleanup
> after
> the job was armed through drm_sched_job_arm() *and* processed by the
> scheduler.
>=20
> We can certainly improve the documentation, but removing the warning
> is
> clearly not a good idea.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Applied to drm-misc-next, thx

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 12 +++++-------
> =C2=A01 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 53e6aec37b46..4d4219fbe49d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1015,13 +1015,11 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
> =C2=A0 * Cleans up the resources allocated with drm_sched_job_init().
> =C2=A0 *
> =C2=A0 * Drivers should call this from their error unwind code if @job is
> aborted
> - * before it was submitted to an entity with
> drm_sched_entity_push_job().
> + * before drm_sched_job_arm() is called.
> =C2=A0 *
> - * Since calling drm_sched_job_arm() causes the job's fences to be
> initialized,
> - * it is up to the driver to ensure that fences that were exposed to
> external
> - * parties get signaled. drm_sched_job_cleanup() does not ensure
> this.
> - *
> - * This function must also be called in &struct
> drm_sched_backend_ops.free_job
> + * After that point of no return @job is committed to be executed by
> the
> + * scheduler, and this function should be called from the
> + * &drm_sched_backend_ops.free_job callback.
> =C2=A0 */
> =C2=A0void drm_sched_job_cleanup(struct drm_sched_job *job)
> =C2=A0{
> @@ -1032,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job
> *job)
> =C2=A0		/* drm_sched_job_arm() has been called */
> =C2=A0		dma_fence_put(&job->s_fence->finished);
> =C2=A0	} else {
> -		/* aborted job before arming */
> +		/* aborted job before committing to run it */
> =C2=A0		drm_sched_fence_free(job->s_fence);
> =C2=A0	}
> =C2=A0

