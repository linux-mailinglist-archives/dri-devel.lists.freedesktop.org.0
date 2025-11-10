Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E524C45616
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 09:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7997410E2B5;
	Mon, 10 Nov 2025 08:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rBIAQKf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983DB10E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:31:08 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d4jYP12zHz9t00;
 Mon, 10 Nov 2025 09:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762763465; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N39W5ot4azs3SlcJiZaQEzotzbF0rjsii8g3NyeHdx0=;
 b=rBIAQKf8qdPgU3GKLcuaXGCG/nYtN8ug65Kh8k99DqVtBdJwT97q9dPqCvxXnw+MmYcJ5D
 xMgieDhHZJ/Th7/6MIsUOxtaksDsT9tu8Pqu8KtbQVrVizY0XrkjYCAjZ4tkEEmy7R1pQq
 4Itoh+udHiY1Lo7CmeSiqRVoOJDJ7fUzFQxvYxtW0e6kr/bcPm9RGSjSJwN83+LP8kDprH
 s/Cg6L7qfWxKeAAF7d5CeYS1Gp45Zk4eIf0GHtbXSb5VT6g2RJEEVLqDQoaXbOu9u6Tnyg
 ILFFSs7ITTti9Q6KiC72OUqZYPgz4L5I0O0rpih5aOKn44FNlMISHfR03fWovw==
Message-ID: <b8ffe136ca4dcfc94530e1fe7dbac889930f03be.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Don't crash kernel on wrong params
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 09:30:54 +0100
In-Reply-To: <c4a10ad7-22c0-412c-a456-d2dd0f049ac9@ursulin.net>
References: <20251107125508.235449-2-phasta@kernel.org>
 <c4a10ad7-22c0-412c-a456-d2dd0f049ac9@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: ec2c35470daf59186e2
X-MBO-RS-META: pcwceht67bs4xe1r3qnj3nkyh3kixuhw
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

On Fri, 2025-11-07 at 14:42 +0000, Tvrtko Ursulin wrote:
>=20
> On 07/11/2025 12:55, Philipp Stanner wrote:
> > drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
> > entity being NULL. While drm_sched_job_arm() crashing or not effectivel=
y
> > arming jobs is certainly a huge issue that needs to be noticed,
> > completely shooting down the kernel reduces the probability of reaching
> > and debugging a system to 0.
> >=20
> > Moreover, the checkpatch script by now strongly discourages all new use=
s
> > of BUG_ON() for this reason.
> >=20
> > Replace the BUG_ON() in drm_sched_job_arm() with a WARN_ON().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 1d4f1b822e7b..3bf4ae0ca4bc 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -857,7 +857,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched;
> > =C2=A0=C2=A0	struct drm_sched_entity *entity =3D job->entity;
> > =C2=A0=20
> > -	BUG_ON(!entity);
> > +	WARN_ON(!entity);
> > =C2=A0=C2=A0	drm_sched_entity_select_rq(entity);
>=20
> void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> {
> 	struct dma_fence *fence;
> 	struct drm_gpu_scheduler *sched;
> 	struct drm_sched_rq *rq;
>=20
> 	/* single possible engine and already selected */
> 	if (!entity->sched_list)
>=20
> Still the same end result.
>=20
> I believe best practice is to simply not have BUG_ON's followed by null=
=20
> pointer dereferences since they add no value. Ie. it should just be=20
> removed and not replaced.

Hm, right. I agree. Both jobs and entities are initialized to 0
anyways. Existing users work, and new users would notice a null ptr
crash.

Let's remove it altogether.


P.
