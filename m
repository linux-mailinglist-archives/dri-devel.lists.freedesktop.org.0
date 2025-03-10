Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50036A593CA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920EE10E409;
	Mon, 10 Mar 2025 12:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sRsn1XEo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31DF10E409
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:11:49 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZBG362TqBz9t2Y;
 Mon, 10 Mar 2025 13:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741608706; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KQeJP11TRsGnnF9TEWR0bRSiGYKMMWItDUAR+7anCI=;
 b=sRsn1XEoXCcyYaP7paUfvZOOVPklB8u+QbTvZOsREmB8E/dsUaKSgPucRPf9fYCAT1hR0J
 rtzdV8frPEwiRXvf2POHaB3F3uNHEkVmpajY1tyF06itefQZCcVRbK4QA2NlUdwmHCtnzN
 Re9tkzM745VUEMnTgEn5iZCglwLCF4S5M1ypzTekXVB2iiox0AnTNATuQuhfEy5uz6updC
 2AR3Uvob8LFkwPV9zSfmZB0JOwpmr52krmSXMFBpsBrYYBXk1xH++JWa4lTRoAEeUfAXav
 W222yx8MJmIG2kGS5B5d01IytzH82gP2Av3ZtBzO8tKNjmnGqNo6KwQUns+AcQ==
Message-ID: <564be70f7d64c04c1ad77499522d99c64ea4d4d3.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct
 false doc"
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com, dakr@kernel.org, phasta@kernel.org, 
 tvrtko.ursulin@igalia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Mon, 10 Mar 2025 13:11:42 +0100
In-Reply-To: <20250310074414.2129157-1-christian.koenig@amd.com>
References: <20250310074414.2129157-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 740eeb2eb4d9f368cbb
X-MBO-RS-META: ti7n3cbhidtzec16mz4bdwaqw3ficnr7
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

On Mon, 2025-03-10 at 08:44 +0100, Christian K=C3=B6nig wrote:
> This reverts commit 44d2f310f008613c1dbe5e234c2cf2be90cbbfab.

OK, your arguments with fence ordering are strong. Please update the
commit message according to our discussion:

>=20
> Sorry for the delayed response, I only stumbled over this now while
> going
> over old mails and then re-thinking my reviewed by for this change.

Your RB hadn't even been applied (I merged before you gave it), so you
can remove this first paragraph from the commit message

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
> The correct approach for error handling in this situation is to set
> the
> error on the fences and then push to the entity anyway. We can
> certainly
> improve the documentation, but removing the warning is clearly not a
> good
> idea.

This last paragraph, as per our discussion, seems invalid. We shouldn't
have that in the commit log, so that it won't give later hackers
browsing it wrong ideas and we end up with someone actually mengling
with those fences.

Thx
P.

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
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

