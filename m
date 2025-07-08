Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED5AFC755
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 11:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0401710E178;
	Tue,  8 Jul 2025 09:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="mtZijEkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BAE10E178;
 Tue,  8 Jul 2025 09:47:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bbx8t4Kc2z9sJ3;
 Tue,  8 Jul 2025 11:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751968030; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaJ6RtbBBb0eQbhnTlVKDQKFU0i19YTXBJGSLvTE4qc=;
 b=mtZijEkbcKgMjYLu1Fl/CHYnpPPoCbsHQ/cM3PHgceYTzxqBYPoX6ugk1mZN4O/M+eH+D/
 2xLaqpdtXYVhmLQiRaet9APmwKsf1U0j1SobXibg2y4uSYMKiX46+ItLOJkjJCGRfy1JSR
 smQsNcIzAXlZx87ebJKneZJMO/V++DVPliKyLVywuqSSLhl/9QSQK/T27nbgVwtmmAyVKb
 jZE+jlgbP5PpMPF6Gn193E3Ec4F6C0AAJiMkNYIZ9skLRxAvmPAwp51yZ3sthMFzNubDln
 rAcKELNWmoYmzJDR+ib6dA0NzeyLgN+HHYGFSSmRiZosrEnHZXjTS7BUktxGnw==
Message-ID: <ab41ef32bd39bd623ea1e4ab48a847898718d499.camel@mailbox.org>
Subject: Re: [PATCH v4 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,  Simona Vetter
 <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, Melissa Wen
 <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 11:47:02 +0200
In-Reply-To: <aGzHMu//q1uCfNDu@lstrano-desk.jf.intel.com>
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
 <20250707-sched-skip-reset-v4-7-036c0f0f584f@igalia.com>
 <aGzHMu//q1uCfNDu@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: cef63236238073c2cab
X-MBO-RS-META: yqwke6o95a8n4a1je8nxfztqyfp4j8po
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

On Tue, 2025-07-08 at 00:22 -0700, Matthew Brost wrote:
> On Mon, Jul 07, 2025 at 11:46:36AM -0300, Ma=C3=ADra Canal wrote:
> > Xe can skip the reset if TDR has fired before the free job worker
> > and can
> > also re-arm the timeout timer in some scenarios. Instead of
> > manipulating
> > scheduler's internals, inform the scheduler that the job did not
> > actually
> > timeout and no reset was performed through the new status code
> > DRM_GPU_SCHED_STAT_NO_HANG.
> >=20
> > Note that, in the first case, there is no need to restart
> > submission if it
> > hasn't been stopped.
> >=20
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>=20
> I'm fairly certain this is correct. However, Intel's CI didn't run
> with
> your latest series. Can you resubmit and ensure a clean CI run before
> merging?

How can someone who's not at Intel ensure that?

P.

>  CI can be a bit flaky=E2=80=94if you get some failures, ping me and
> I=E2=80=99ll let you know if they're related to this patch.
>=20
> With clean CI:
> Reviewed-by: Matthew Brost matthew.brost@intel.com
>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
> > =C2=A01 file changed, 3 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index
> > 9c7e445b9ea7ce7e3610eadca023e6d810e683e9..f6289eeffd852e40b33d0e455
> > d9bcc21a4fb1467 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1078,12 +1078,8 @@ guc_exec_queue_timedout_job(struct
> > drm_sched_job *drm_job)
> > =C2=A0	 * list so job can be freed and kick scheduler ensuring
> > free job is not
> > =C2=A0	 * lost.
> > =C2=A0	 */
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> > >flags)) {
> > -		xe_sched_add_pending_job(sched, job);
> > -		xe_sched_submission_start(sched);
> > -
> > -		return DRM_GPU_SCHED_STAT_RESET;
> > -	}
> > +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> > >flags))
> > +		return DRM_GPU_SCHED_STAT_NO_HANG;
> > =C2=A0
> > =C2=A0	/* Kill the run_job entry point */
> > =C2=A0	xe_sched_submission_stop(sched);
> > @@ -1261,10 +1257,8 @@ guc_exec_queue_timedout_job(struct
> > drm_sched_job *drm_job)
> > =C2=A0	 * but there is not currently an easy way to do in DRM
> > scheduler. With
> > =C2=A0	 * some thought, do this in a follow up.
> > =C2=A0	 */
> > -	xe_sched_add_pending_job(sched, job);
> > =C2=A0	xe_sched_submission_start(sched);
> > -
> > -	return DRM_GPU_SCHED_STAT_RESET;
> > +	return DRM_GPU_SCHED_STAT_NO_HANG;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void __guc_exec_queue_fini_async(struct work_struct *w)
> >=20
> > --=20
> > 2.50.0
> >=20

