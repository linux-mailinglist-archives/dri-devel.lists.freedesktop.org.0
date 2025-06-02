Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDDACA9C0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC1D10E1D6;
	Mon,  2 Jun 2025 07:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Lu2UMz40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE36D10E1C9;
 Mon,  2 Jun 2025 07:13:47 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b9lSS2nrpz9tX0;
 Mon,  2 Jun 2025 09:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748848424; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvhppmyhyICdwplZYutmaZL5qmaJdZkSh6zxnqcq8gs=;
 b=Lu2UMz40Uaxdgu45tQWbLRfKYxXvZrc2bKkrKJq5vJbmhdsUvrQadbXZTt3qxgg/+rHr81
 IcbZLUhua3nyev+q1fD8p6TSCphKXdilVNyNUaMFWCifROVOuCghxGO5NFMesI1zivvFSK
 7x9o1iMqwSNpbbjq2IHlU3JZgJ7gh24AFCpa7W2xnaHY3JrNG9+8KMIhaH0sia2kc/DeLN
 /ZKVdbwaDNUnVrJyzXBdeDPZmvkt19Ew0/MhXr9M/4fEM7iwsRV+qFiuOtqlSKhkfHlIML
 6umVayUivJ0/i+51Vl+zhF0I7qNh2BDOSqGPbog9NmYbZun1Vz34+JEVbKJBVQ==
Message-ID: <b25c1cabe52436c83cb570a5d65ede2fc548fc0b.camel@mailbox.org>
Subject: Re: [PATCH v2 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
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
Date: Mon, 02 Jun 2025 09:13:34 +0200
In-Reply-To: <20250530-sched-skip-reset-v2-5-c40a8d2d8daa@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-5-c40a8d2d8daa@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: nwwk7zrhtdbczu8hebu1gxxgu8musq7f
X-MBO-RS-ID: ba8a497f0f63299ba83
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
> When a CL/CSD job times out, we check if the GPU has made any
> progress
> since the last timeout. If so, instead of resetting the hardware, we
> skip
> the reset and allow the timer to be rearmed. This gives long-running
> jobs
> a chance to complete.
>=20
> Use the DRM_GPU_SCHED_STAT_NO_HANG status to skip the reset and re-
> arm
> the timer.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index
> e1997387831541fb053e472672004cf511c25558..fbb09a8aff3740b5cd59573b5f2
> e26b2ee352dfb 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -761,7 +761,7 @@ v3d_cl_job_timedout(struct drm_sched_job
> *sched_job, enum v3d_queue q,
> =C2=A0	if (*timedout_ctca !=3D ctca || *timedout_ctra !=3D ctra) {
> =C2=A0		*timedout_ctca =3D ctca;
> =C2=A0		*timedout_ctra =3D ctra;
> -		return DRM_GPU_SCHED_STAT_RESET;
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> =C2=A0	}
> =C2=A0
> =C2=A0	return v3d_gpu_reset_for_timeout(v3d, sched_job);
> @@ -805,7 +805,7 @@ v3d_csd_job_timedout(struct drm_sched_job
> *sched_job)
> =C2=A0	 */
> =C2=A0	if (job->timedout_batches !=3D batches) {
> =C2=A0		job->timedout_batches =3D batches;
> -		return DRM_GPU_SCHED_STAT_RESET;
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> =C2=A0	}

Wait a second, help me out here quickly. You already added workaround
stuff where you manipulate the scheduler's pending_list, as you state
in the cover letter. That code here [1].

Don't you have to remove the very same code in this series again to
still have correct behavior in your driver?

As I see it, all drm branches end up in Linus's tree ultimately. So I'd
think about potential branch-races in case you didn't already.


P.



[1] https://lore.kernel.org/dri-devel/20250430210643.57924-1-mcanal@igalia.=
com/T/



> =C2=A0
> =C2=A0	return v3d_gpu_reset_for_timeout(v3d, sched_job);
>=20

