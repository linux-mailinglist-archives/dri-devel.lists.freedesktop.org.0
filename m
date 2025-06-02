Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB1CACAA13
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEC810E0B7;
	Mon,  2 Jun 2025 07:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WXuGXTqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B0C10E0B7;
 Mon,  2 Jun 2025 07:47:57 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b9mCr0fc6z9sp8;
 Mon,  2 Jun 2025 09:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748850472; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hejt7sYJc8Ownw56oeoTeIt/sZiijhclsSfRWFWApL0=;
 b=WXuGXTqJug0dj4yMg/P/Qhxpfss+b63jVyhi3fO8krVRSHKnM1VEKw1nEqeQ+pKOOvIF9T
 s6f8ESDihH2IkD8b7DV13UNYQ+pyuJOusNj/0+tAR72zflWyFNsAtwDOcX3BA5L2DWsIw8
 oM1YVDbbGRus4OVEqr3R3y06/uAZseBcCFey5axgvZLdieZlmcPiYxopGyh11jecTwe76j
 N1xu9LrTB96Xs5iDuniQNwbS7Ut+AKk7JBWE5+aFisbYzdbDr++VpNAlKQ5sC4hkQLOTJ4
 D16HPbCT0GUsHPrT4vaug/izpW2N8XSGuP8xPpNB1YnRRhZ4N7eVnYf1yCyQpQ==
Message-ID: <ab293f2f435287d46c6fca38d554fda0790dfe3f.camel@mailbox.org>
Subject: Re: [PATCH v2 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
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
Date: Mon, 02 Jun 2025 09:47:44 +0200
In-Reply-To: <20250530-sched-skip-reset-v2-7-c40a8d2d8daa@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-7-c40a8d2d8daa@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 67bdxuhmgntkdgh18tykp5zn3ixomcup
X-MBO-RS-ID: 2ce5eb5acf6937cdf73
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

On Fri, 2025-05-30 at 11:01 -0300, Ma=C3=ADra Canal wrote:
> Xe can skip the reset if TDR has fired before the free job worker and
> can
> also re-arm the timeout timer in some scenarios. Instead of using the
> scheduler internals to add the job to the pending list, use the
> DRM_GPU_SCHED_STAT_NO_HANG status to skip the reset and re-arm the
> timer.
>=20
> Note that, in the first case, there is no need to restart submission
> if it
> hasn't been stopped.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
> =C2=A01 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index
> 98363d688cbbf884e17e6610366202a3372f5fe0..0149c85aa1a85b2b2e739774310
> d7b3265e33228 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1067,12 +1067,8 @@ guc_exec_queue_timedout_job(struct
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
> @@ -1247,10 +1243,8 @@ guc_exec_queue_timedout_job(struct
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

This patch removes two of three uses of xe_sched_add_pending_job().
There's now only one left, in the same function, slightly above.

@Matthew, can that call be removed, too? Should that be done in this
patch or seperately?

P.

> =C2=A0
> =C2=A0static void __guc_exec_queue_fini_async(struct work_struct *w)
>=20

