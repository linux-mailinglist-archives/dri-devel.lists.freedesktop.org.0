Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D161A43602
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D7210E031;
	Tue, 25 Feb 2025 07:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="n9xnlE09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3753410E031
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:19:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z289L4YD0z9t7J;
 Tue, 25 Feb 2025 08:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1740467942; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTqWOsuaameKwBwP2PW1oZAO/zijrhZJI/nRbm8lIX0=;
 b=n9xnlE09xFqeQXdUQ1SXlb4QeEkEBZdOcmAnl8P+r0QwpYhb3zr3SpOckymXrM5yLfffCC
 7xNbaV/rcQMHdrnK6cGWaAxNszvVyUWN1Jobh8sGVTB5/aeeykF98AUE0KLVvopGHjqmRx
 27AQYMXB7yLmPyhpCNzitAuCVFXLVzec4nVSmeKbPk1w/DC0qJyJxu8RNT956Q8GN6FadZ
 sG8FhlzxRkfdAhEWO5+Pb/k4h9kC8DyTQTXk29Ho2lvnSs/ubNtMYgJkynANo3MrhE0eaQ
 EeUogJH/X1jz6zPn2zrDGt0OeW35ZkorjJSyVvOULDz/iO5UPZdNquPJOFnbTQ==
Message-ID: <141295638b73e885f51a4b82ea7e417a6b0f5140.camel@mailbox.org>
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
From: Philipp Stanner <phasta@mailbox.org>
To: phasta@kernel.org, qianyi liu <liuqianyi125@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Feb 2025 08:18:59 +0100
In-Reply-To: <3b369e1a49b354852f361b103999673e4f7906a9.camel@mailbox.org>
References: <20250221062702.1293754-1-liuqianyi125@gmail.com>
 <3b369e1a49b354852f361b103999673e4f7906a9.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: d1huoh5qwmwhghcxnmkjt9ygpurkxqnf
X-MBO-RS-ID: 04853c29170cc312e34
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

On Mon, 2025-02-24 at 10:52 +0100, Philipp Stanner wrote:
> Hello,
>=20
> subject line: please write "drm/sched" instead of "drm/scheduler". It
> has become the norm
>=20
> On Fri, 2025-02-21 at 14:27 +0800, qianyi liu wrote:
> > Problem: If prev(last_scheduled) was already signaled I encountred
> > a
>=20
> prev(last_scheduled) almost reads like a function call. Maybe write
> "prev / last_scheduled"?
>=20
> > memory leak in drm_sched_entity_fini. This is because the
> > prev(last_scheduled) fence is not free properly.
>=20
> s/free/freed
>=20
> >=20
> > Fix: Balance the prev(last_scheduled) fence refcnt when
> > dma_fence_add_callback failed.

Oh, and importantly, I forgot:

Since this is clearly a bug fix, it needs a "Fixes: " tag and put the
stable kernel on Cc.

P.

> >=20
> > Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 7 +++++--
> > =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 69bcf0e99d57..1c0c14bcf726 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -259,9 +259,12 @@ static void drm_sched_entity_kill(struct
> > drm_sched_entity *entity)
> > =C2=A0		struct drm_sched_fence *s_fence =3D job->s_fence;
> > =C2=A0
> > =C2=A0		dma_fence_get(&s_fence->finished);
> > -		if (!prev || dma_fence_add_callback(prev, &job-
> > > finish_cb,
> > -					=C2=A0=C2=A0
> > drm_sched_entity_kill_jobs_cb))
> > +		if (!prev ||
> > +		=C2=A0=C2=A0=C2=A0 dma_fence_add_callback(prev, &job->finish_cb,
> > +					=C2=A0=C2=A0
> > drm_sched_entity_kill_jobs_cb)) {
> > +			dma_fence_put(prev);
>=20
> But now the fence will also be put when prev =3D=3D NULL. Is that
> intentional? It doesn't seem correct to me from looking at the commit
> message, which states "Balance [=E2=80=A6] refcnt when dma_fence_add_call=
back
> failed"
>=20
> It didn't get clear to me immediately which dma_fence_get() your new
> dma_fence_put() balances. Can you ellaborate on that or maybe write a
> comment?
>=20
> But also be handy of could share the kmemleak trace.
>=20
>=20
> Thanks
> P.
>=20
> > =C2=A0			drm_sched_entity_kill_jobs_cb(NULL, &job-
> > > finish_cb);
> > +		}
> > =C2=A0
> > =C2=A0		prev =3D &s_fence->finished;
> > =C2=A0	}
>=20

