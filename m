Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B18C31D72
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB04310E62D;
	Tue,  4 Nov 2025 15:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IwxMFQXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAEF10E62D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:30:43 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d1C8H2BNPz9v76;
 Tue,  4 Nov 2025 16:30:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762270239; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXw6kCFBo5eidUV/wPgMY2T8iMEfPQj0hALJrToc0oY=;
 b=IwxMFQXUcI3TdafSuVoVPXSCtxouMMSjDnqn11sgXym8XEDiCOrOK2HYxs3xK6TIFEliG1
 +McIE9KGm4i0lmPhaP+r5zGI5rFZR8pF36F+rQBxmuleWOq6m38Io9WpUsxAsjaTOtq7Zo
 /iZw2c4a/qDmf6Oobue+Tt3Izlq84WpXqHLCN7FE9JFuM1tqEZowZ6f9kuBrkQ5GZ4bdK5
 FLJMW+hhEXRpCYU8cARrrGyWKOYX7oq4IJMJVNwBKfnGJBEGlQ9936FYheUYxlgCJFxEO9
 KMDqjzSnYCSepWseYXsC+GyJ3jCLyKuHlIrRXA+n3B4OPvmoKI4JrpJVw18kog==
Message-ID: <85e573fa81913b4afe274f27142f526062f184f4.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, phasta@kernel.org, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Date: Tue, 04 Nov 2025 16:30:24 +0100
In-Reply-To: <c1da66b4-3b71-4d83-8e8e-56151030b691@damsy.net>
References: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
 <628cdf3a0c5b783c09fe2a40aca4a4a48c614e66.camel@mailbox.org>
 <c1da66b4-3b71-4d83-8e8e-56151030b691@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: b7zmj93dted6cq4japbk7tzm6j7j7tmc
X-MBO-RS-ID: ce66c1907a5c42a4b78
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

On Tue, 2025-11-04 at 16:24 +0100, Pierre-Eric Pelloux-Prayer wrote:
>=20
>=20
> Le 04/11/2025 =C3=A0 13:43, Philipp Stanner a =C3=A9crit=C2=A0:
>=20
> >=20
> > Some things I have unfortunately overlooked below.
> >=20
> > >=20
> > > Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fi=
ni")
> >=20
> > We should +Cc stable. It's a deadlock after all.
>=20
> OK.
>=20
> >=20
> > > Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
> > > Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > > Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++=
++-----------
> > > =C2=A0=C2=A01 file changed, 19 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index c8e949f4a568..fe174a4857be 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_ent=
ity *entity)
> > > =C2=A0=C2=A0}
> > > =C2=A0=C2=A0EXPORT_SYMBOL(drm_sched_entity_error);
> > > =C2=A0=20
> > > +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> > > +					=C2=A0 struct dma_fence_cb *cb);
> >=20
> > It's far better to move the function up instead. Can you do that?
>=20
> Since drm_sched_entity_kill_jobs_cb uses drm_sched_entity_kill_jobs and v=
ice=20
> versa, I'll have to forward declare one of the 2 functions anyway.

Ah, right.
OK then.

I can push this and +Cc stable in the commit message if you want.


P.
