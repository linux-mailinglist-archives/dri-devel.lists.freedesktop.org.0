Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D9FAE46B5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB7510E1EB;
	Mon, 23 Jun 2025 14:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HFXsnp3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10A10E1E7;
 Mon, 23 Jun 2025 14:28:41 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bQr6Y6ynbz9sr5;
 Mon, 23 Jun 2025 16:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1750688918; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOEQG/MVnD4dMaWYCPkdxKhpyc6LKjTjie4SPoHZoTI=;
 b=HFXsnp3LEc6Qu272/yGaq4yLpzgWnclYcza8mx1AuKZvwctJA1j9YkXY6qKNKNA+xGadJy
 OhuPo/4Jq5ZJ/acQNFeS4ABip5XrjaLAeLegCrPrSarD1KeP8izfUqmx4CdMxH7Thv1il8
 Z3C+9yhQ9gvCrQEGDn6kHeDFeu8G+G29CqYGq03GnXiSCVfwnMelMkP+KSlYApeL+CJ7Nh
 5Uy+9lWaEfJ4eJOtqGfgLDye6bEvnZ82OciwuJ9tO2ZHd4FRmwKlBXoiSpWD238SVbWX1e
 E/zkeSTX9QuNwoTggtMuSEjt7A9WFueSX4oJD+yxz8iRFhHqZ7fAPGj1mjpGJQ==
Message-ID: <066b0328ff184b42a666a94c9ac61eebc5b65083.camel@mailbox.org>
Subject: Re: [PATCH v3 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
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
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 23 Jun 2025 16:28:29 +0200
In-Reply-To: <20250618-sched-skip-reset-v3-7-8be5cca2725d@igalia.com>
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-7-8be5cca2725d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 7smptmyxwq6ybttot1ch8kfpjub7sz6p
X-MBO-RS-ID: 12fc29333fa89c418c3
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

On Wed, 2025-06-18 at 11:47 -0300, Ma=C3=ADra Canal wrote:
> Xe can skip the reset if TDR has fired before the free job worker and
> can
> also re-arm the timeout timer in some scenarios. Instead of
> manipulating
> scheduler's internals, inform the scheduler that the job did not
> actually
> timeout and no reset was performed through the new status code
> DRM_GPU_SCHED_STAT_NO_HANG.
>=20
> Note that, in the first case, there is no need to restart submission
> if it
> hasn't been stopped.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Did you have the opportunity to test that one?

If not, at least a RB from one of the Intel folks is likely a desirable
thing, since the changes are non-trivial.

P.

> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
> =C2=A01 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index
> 9c7e445b9ea7ce7e3610eadca023e6d810e683e9..f6289eeffd852e40b33d0e455d9
> bcc21a4fb1467 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1078,12 +1078,8 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0	 * list so job can be freed and kick scheduler ensuring free
> job is not
> =C2=A0	 * lost.
> =C2=A0	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> >flags)) {
> -		xe_sched_add_pending_job(sched, job);
> -		xe_sched_submission_start(sched);
> -
> -		return DRM_GPU_SCHED_STAT_RESET;
> -	}
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> >flags))
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> =C2=A0
> =C2=A0	/* Kill the run_job entry point */
> =C2=A0	xe_sched_submission_stop(sched);
> @@ -1261,10 +1257,8 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0	 * but there is not currently an easy way to do in DRM
> scheduler. With
> =C2=A0	 * some thought, do this in a follow up.
> =C2=A0	 */
> -	xe_sched_add_pending_job(sched, job);
> =C2=A0	xe_sched_submission_start(sched);
> -
> -	return DRM_GPU_SCHED_STAT_RESET;
> +	return DRM_GPU_SCHED_STAT_NO_HANG;
> =C2=A0}
> =C2=A0
> =C2=A0static void __guc_exec_queue_fini_async(struct work_struct *w)
>=20

