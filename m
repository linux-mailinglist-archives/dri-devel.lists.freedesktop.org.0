Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B0594E755
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9C10E0EF;
	Mon, 12 Aug 2024 07:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XCuv485T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C609210E0EF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ggdJ0mM/9gQfKqWhAcmkJrWQ6YpDukiW4wJjjHrscJo=; b=XCuv485TaGdpvS6Ds3j/NmUPo2
 Ayl8SCiYgFZAUek8fi/wiw9Mvu1L0jv41Og4/pm2aFr2IuI2A0F+IogxVeJWM+pgG3e7ZHWd2+3Wa
 sFCTzZ3PrRKF/XIPVaWpID3vmHTqbqKfDQLfyH6MFWN2RxNDyg6DVunTdN18xHiRJCG0aObg6W4gb
 Wbw38wcWS5MBp1A3S8lEn0RRcJCkA4fazkH5qxN5xb+OCHJOg1r+H4++RgCtrs2cnYTM2rS2xIhCQ
 mPqPFYrihUXju7ZnShH97RoFZH9Lhens589FAl3keIErWQ39KndBSWSVd08U5FM5fxx+g4QYwPja0
 C+BG+cTw==;
Received: from [159.147.169.95] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sdP3o-00BNfD-Vp; Mon, 12 Aug 2024 09:01:45 +0200
Message-ID: <55db35d72c6da92572e09334dad1382846222892.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Fix out-of-bounds read in `v3d_csd_job_run()`
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Daniel Vetter
 <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Date: Mon, 12 Aug 2024 09:01:44 +0200
In-Reply-To: <20240809152001.668314-1-mcanal@igalia.com>
References: <20240809152001.668314-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El vie, 09-08-2024 a las 12:18 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> When enabling UBSAN on Raspberry Pi 5, we get the following warning:
>=20
> [=C2=A0 387.894977] UBSAN: array-index-out-of-bounds in
> drivers/gpu/drm/v3d/v3d_sched.c:320:3
> [=C2=A0 387.903868] index 7 is out of range for type '__u32 [7]'
> [=C2=A0 387.909692] CPU: 0 PID: 1207 Comm: kworker/u16:2 Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> WC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.10.3-v8-16k-numa #15=
1
> [=C2=A0 387.919166] Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
> [=C2=A0 387.925961] Workqueue: v3d_csd drm_sched_run_job_work [gpu_sched]
> [=C2=A0 387.932525] Call trace:
> [=C2=A0 387.935296]=C2=A0 dump_backtrace+0x170/0x1b8
> [=C2=A0 387.939403]=C2=A0 show_stack+0x20/0x38
> [=C2=A0 387.942907]=C2=A0 dump_stack_lvl+0x90/0xd0
> [=C2=A0 387.946785]=C2=A0 dump_stack+0x18/0x28
> [=C2=A0 387.950301]=C2=A0 __ubsan_handle_out_of_bounds+0x98/0xd0
> [=C2=A0 387.955383]=C2=A0 v3d_csd_job_run+0x3a8/0x438 [v3d]
> [=C2=A0 387.960707]=C2=A0 drm_sched_run_job_work+0x520/0x6d0 [gpu_sched]
> [=C2=A0 387.966862]=C2=A0 process_one_work+0x62c/0xb48
> [=C2=A0 387.971296]=C2=A0 worker_thread+0x468/0x5b0
> [=C2=A0 387.975317]=C2=A0 kthread+0x1c4/0x1e0
> [=C2=A0 387.978818]=C2=A0 ret_from_fork+0x10/0x20
> [=C2=A0 387.983014] ---[ end trace ]---
>=20
> This happens because the UAPI provides only seven configuration
> registers and we are reading the eighth position of this u32 array.
>=20
> Therefore, fix the out-of-bounds read in `v3d_csd_job_run()` by
> accessing only seven positions on the '__u32 [7]' array. The eighth
> register exists indeed on V3D 7.1, but it isn't currently used. That
> being so, let's guarantee that it remains unused and add a note that
> it
> could be set in a future patch.
>=20
> Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D
> 7.x")
> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c | 14 +++++++++++---
> =C2=A01 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index fd29a00b233c..e1565cf84abd 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -317,7 +317,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
> =C2=A0	struct v3d_dev *v3d =3D job->base.v3d;
> =C2=A0	struct drm_device *dev =3D &v3d->drm;
> =C2=A0	struct dma_fence *fence;
> -	int i, csd_cfg0_reg, csd_cfg_reg_count;
> +	int i, csd_cfg0_reg;
> =C2=A0
> =C2=A0	v3d->csd_job =3D job;
> =C2=A0
> @@ -337,9 +337,17 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
> =C2=A0	v3d_switch_perfmon(v3d, &job->base);
> =C2=A0
> =C2=A0	csd_cfg0_reg =3D V3D_CSD_QUEUED_CFG0(v3d->ver);
> -	csd_cfg_reg_count =3D v3d->ver < 71 ? 6 : 7;
> -	for (i =3D 1; i <=3D csd_cfg_reg_count; i++)
> +	for (i =3D 1; i <=3D 6; i++)
> =C2=A0		V3D_CORE_WRITE(0, csd_cfg0_reg + 4 * i, job-
> >args.cfg[i]);
> +
> +	/* Although V3D 7.1 has an eighth configuration register, we
> are not
> +	 * using it. Therefore, make sure it remains unused.
> +	 *
> +	 * XXX: Set the CFG7 register
> +	 */
> +	if (v3d->ver >=3D 71)
> +		V3D_CORE_WRITE(0, csd_cfg0_reg + 4 * i, 0);
> +

Since we know we want to write CFG7 I'd suggest that we just write that
directly (csd_cfg0_reg + 4 * 7), instead of making it depend on the
value of 'i' exiting the previous loop. I think that makes it more
robust against future changes. Either way:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago


> =C2=A0	/* CFG0 write kicks off the job. */
> =C2=A0	V3D_CORE_WRITE(0, csd_cfg0_reg, job->args.cfg[0]);
> =C2=A0

