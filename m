Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DEA5002A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D1D10E80A;
	Wed,  5 Mar 2025 13:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fS4XQQaj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8A410E7FE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:17:27 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z7Cl44XZDz9snt;
 Wed,  5 Mar 2025 14:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741180640; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUzKOWOCIhPnb+TETbrLF5OWTM2YthK9kRDKkAN5Rvc=;
 b=fS4XQQajnG1J3xe+bh4mdgY/H1BNgZf+UWH2R/iyRZTio1jo4jwko/6pYSZ9ESXL3lpEvN
 YBt64pZInW6ZVxKJ3xK5rxHNvefaSfsfgKQDDphddOC/w9gYlCFlVSEtItGJLvAB+zuyBo
 TzdRPQs2dmjQoAlPe6YDk74tKnPM2c26oRQ7l9W0lWAVB35vSy7E/yuFPcQmQEyqzA35ZP
 ZO28tbMWFxuaQn5wUPa3tz/UZgvDiEQiZz/BSRwhxLVFb1r0+S19LmiSRwmBks7sXEMyS7
 iuUHwyYav6rdNDa58gWRDWAzN1fZq+xW+xWCzf9MRh6zBmvJ5YNGN89QRgJfgg==
Message-ID: <5d645ef9fa26c0de82135755d4fa573ec409e3ef.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: drm_sched_job_cleanup(): correct false doc
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 05 Mar 2025 14:17:15 +0100
In-Reply-To: <20250304141346.102683-2-phasta@kernel.org>
References: <20250304141346.102683-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a47c344584a60e8564b
X-MBO-RS-META: km497d9y37qnoo9aj9huetitu4zpkfgd
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

On Tue, 2025-03-04 at 15:13 +0100, Philipp Stanner wrote:
> drm_sched_job_cleanup()'s documentation claims that calling
> drm_sched_job_arm() is a "point of no return", implying that
> afterwards
> a job cannot be cancelled anymore.
>=20
> This is not correct, as proven by the function's code itself, which
> takes a previous call to drm_sched_job_arm() into account. In truth,
> the
> decisive factors are whether fences have been shared (e.g., with
> other
> processes) and if the job has been submitted to an entity already.
>=20
> Correct the wrong docstring.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Applied to drm-misc-next.

P.

> ---
> Changes in v2:
> =C2=A0 - Also adjust comment about arm inside function's body. (Tvrtko)
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 12 +++++++-----
> =C2=A01 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index c634993f1346..7e71e89cea89 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1013,11 +1013,13 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
> =C2=A0 * Cleans up the resources allocated with drm_sched_job_init().
> =C2=A0 *
> =C2=A0 * Drivers should call this from their error unwind code if @job is
> aborted
> - * before drm_sched_job_arm() is called.
> + * before it was submitted to an entity with
> drm_sched_entity_push_job().
> =C2=A0 *
> - * After that point of no return @job is committed to be executed by
> the
> - * scheduler, and this function should be called from the
> - * &drm_sched_backend_ops.free_job callback.
> + * Since calling drm_sched_job_arm() causes the job's fences to be
> initialized,
> + * it is up to the driver to ensure that fences that were exposed to
> external
> + * parties get signaled. drm_sched_job_cleanup() does not ensure
> this.
> + *
> + * This function must also be called in &struct
> drm_sched_backend_ops.free_job
> =C2=A0 */
> =C2=A0void drm_sched_job_cleanup(struct drm_sched_job *job)
> =C2=A0{
> @@ -1028,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job
> *job)
> =C2=A0		/* drm_sched_job_arm() has been called */
> =C2=A0		dma_fence_put(&job->s_fence->finished);
> =C2=A0	} else {
> -		/* aborted job before committing to run it */
> +		/* aborted job before arming */
> =C2=A0		drm_sched_fence_free(job->s_fence);
> =C2=A0	}
> =C2=A0

