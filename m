Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D543ACADB4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FD710E4F3;
	Mon,  2 Jun 2025 11:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KQFZPL5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B525710E4F3;
 Mon,  2 Jun 2025 11:59:28 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b9sp36k08z9stJ;
 Mon,  2 Jun 2025 13:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748865564; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cr5FKF36S3+2Th+8GFTmA1trzr0M2dkIElzTIDA6r4o=;
 b=KQFZPL5AqZPYTvxrNmE8PkyZC75LT7hZBYTRlWqdInwkBcBbBLh3yY4kqe9TOqgOCnKoVn
 JRDEwuOulepy/ZzHSf0BPWGqmRToC9tOEr8m5dKOzwHBchQTtH40JyH9WAsEQG9Aho5JhU
 wsdbgI0TtKxEuU3+zjh56cq9A/BPNq0j2ffh6XLD+RF79m3GlOzCYvhOhEH9iX5CBzO9Ka
 VSeefj8XHc6l4tMg7JM5zOZnUl1dj6LTTWn5iOOUfL/iRrVsKDd2rqdhcjlq6ck3rJiyuS
 JcfEkJJPQBRGd15K1VWPIeJxf15Z68XCqwLHsGOeuGZf6CbfwDVn8GtLWiXr/A==
Message-ID: <bcc0ed477f8a6f3bb06665b1756bcb98fb7af871.camel@mailbox.org>
Subject: Re: [PATCH v2 6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to
 skip the reset
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, phasta@kernel.org, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,  Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>,  Liviu Dudau
 <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 13:59:14 +0200
In-Reply-To: <177ea4e7-b05d-4ee0-8b5e-e3dfd67491a0@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-6-c40a8d2d8daa@igalia.com>
 <964e59ba1539083ef29b06d3c78f5e2e9b138ab8.camel@mailbox.org>
 <177ea4e7-b05d-4ee0-8b5e-e3dfd67491a0@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 847683725d56782a08d
X-MBO-RS-META: 1tywnm68gw7sdztpoqqewbfthx99axqd
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

On Mon, 2025-06-02 at 08:36 -0300, Ma=C3=ADra Canal wrote:
> Hi Philipp,
>=20
> On 02/06/25 04:28, Philipp Stanner wrote:
> > On Fri, 2025-05-30 at 11:01 -0300, Ma=C3=ADra Canal wrote:
>=20
> [...]
>=20
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > index
> > > 7146069a98492f5fab2a49d96e2054f649e1fe3d..46f5391e84a12232b247886
> > > cf13
> > > 11f8e09f42f04 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > @@ -40,11 +40,11 @@ static enum drm_gpu_sched_stat
> > > etnaviv_sched_timedout_job(struct drm_sched_job
> > > =C2=A0=C2=A0	int change;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/*
> > > -	 * If the GPU managed to complete this jobs fence, the
> > > timout is
> > > -	 * spurious. Bail out.
> > > +	 * If the GPU managed to complete this jobs fence, the
> > > timeout has
> > > +	 * fired before free-job worker. The timeout is
> > > spurious, so
> > > bail out.
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	if (dma_fence_is_signaled(submit->out_fence))
> > > -		goto out_no_timeout;
> > > +		return DRM_GPU_SCHED_STAT_NO_HANG;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * If the GPU is still making forward progress on the
> > > front-
> > > end (which
> > > @@ -70,7 +70,7 @@ static enum drm_gpu_sched_stat
> > > etnaviv_sched_timedout_job(struct drm_sched_job
> > > =C2=A0=C2=A0		gpu->hangcheck_dma_addr =3D dma_addr;
> > > =C2=A0=C2=A0		gpu->hangcheck_primid =3D primid;
> > > =C2=A0=C2=A0		gpu->hangcheck_fence =3D gpu->completed_fence;
> > > -		goto out_no_timeout;
> > > +		return DRM_GPU_SCHED_STAT_NO_HANG;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* block scheduler */
> > > @@ -86,10 +86,7 @@ static enum drm_gpu_sched_stat
> > > etnaviv_sched_timedout_job(struct drm_sched_job
> > > =C2=A0=C2=A0	drm_sched_resubmit_jobs(&gpu->sched);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	drm_sched_start(&gpu->sched, 0);
> > > -	return DRM_GPU_SCHED_STAT_RESET;
> > > =C2=A0=20
> > > -out_no_timeout:
> > > -	list_add(&sched_job->list, &sched_job->sched-
> > > >pending_list);
> >=20
> > Here you actually remove the manipulation of the scheduler
> > internals,
> > but you didn't in v3d. Just to point that out.
> >=20
> >=20
> > And BTW I'm just seeing that the pending_list gets manipulated here
> > with the scheduler's workqueues running and no locks being hold.
> >=20
> > Oh man :(
> >=20
> > That is most certainly a bug, and I recommend that the etnaviv
> > maintainers at least add the appropriate lock here and backport
> > that
> > since it can race any time.
> >=20
> >=20
> > But thx for working on that, Ma=C3=ADra. Good that we can remove the
> > stuff
> > this way.
> >=20
> > Thinking about it, this patch even fixes a bug. So could contain a
> > Fixes: tag. But I'm not sure if it's worth it to mark the entire
> > series
> > for Stable. Opinions?
>=20
> I believe the best way to fix this bug would be doing something
> similar
> to what I did to v3d: send a temporary fix adding the locks, which
> will
> be backported to stable. I'll send a fix to Etnaviv today.

Having the locking is significantly better than not having it, and
adding it gets my blessing, but it still doesn't solve all issues.

As Matt pointed out and as you address in your patch =E2=84=962, a job coul=
d
still leak if no one makes sure that free_job_work gets kicked off. And
exposing yet another scheduler function publicly is obviously
unacceptable, so it's either live with the potential leak, or use the
new status code.


P.

>=20
> Thanks for the review, Phillip!
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> >=20
> > P.
> >=20
> >=20
> > > =C2=A0=C2=A0	return DRM_GPU_SCHED_STAT_RESET;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > >=20
> >=20
>=20

