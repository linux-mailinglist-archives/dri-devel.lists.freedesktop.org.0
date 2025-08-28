Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26BB396F2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C39B10E327;
	Thu, 28 Aug 2025 08:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pGvhnLcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A0410E3C8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:29:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cCF162CCqz9tRV;
 Thu, 28 Aug 2025 10:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756369738; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFw4tqBP0jjDKzRQjS/NUlldQwm7m+edN6Jc0V91AOY=;
 b=pGvhnLcMdJJOvz7uVPoVJL5NlxV1ATHCFoMQlF342Y3tXZsTZnHg5aBqHUDAkki+E65ZOB
 SL1Xrm6zDAb/6NuCfxXlA8tzfwzUJTEwVVO84frD2W2CCGYyBusZjSS/dZPCH7ObKgNLmi
 Ey3UHF59uc1sivbCywSw1C42GivpDlPEKs63C/Bx3RXjTu06bTIYYRfniboZfO7XAaBMJj
 ENlH3r+yp+/LirNaeTTg5YNAZf0n48o7CwWPMKSbvlmMfzd8V9ovIp2APf5nuUGdcCBaAf
 8DHddeuPMy4HHNNgYRd7XpcaJi8IqDbIDu7tH/SXYBfBz6YabBBWN4y+/+A+Cw==
Message-ID: <c41b717da1345bafc526ba7524b0fa24661243e2.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Document race condition in drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, James
 Flowers <bold.zone2373@fastmail.com>
Date: Thu, 28 Aug 2025 10:28:53 +0200
In-Reply-To: <DC1BGCY1JPKJ.7BHDGBYZDYMZ@kernel.org>
References: <20250813085654.102504-2-phasta@kernel.org>
 <DC1BGCY1JPKJ.7BHDGBYZDYMZ@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 93fb8p3pn7pc33koyyzxqjju885p743o
X-MBO-RS-ID: f51ef53e48fd1a49415
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

On Wed, 2025-08-13 at 14:58 +0200, Danilo Krummrich wrote:
> On Wed Aug 13, 2025 at 10:56 AM CEST, Philipp Stanner wrote:
> > In drm_sched_fini() all entities are marked as stopped - without taking
> > the appropriate lock, because that would deadlock. That means that
> > drm_sched_fini() and drm_sched_entity_push_job() can race against each
> > other.
> >=20
> > This should most likely be fixed by establishing the rule that all
> > entities associated with a scheduler must be torn down first. Then,
> > however, the locking should be removed from drm_sched_fini() alltogethe=
r
> > with an appropriate comment.
> >=20
> > Reported-by: James Flowers <bold.zone2373@fastmail.com>
> > Link: https://lore.kernel.org/dri-devel/20250720235748.2798-1-bold.zone=
2373@fastmail.com/
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-next

> > ---
> > Changes in v2:
> > =C2=A0 - Fix typo.
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++++++++++
> > =C2=A01 file changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 5a550fd76bf0..46119aacb809 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1424,6 +1424,22 @@ void drm_sched_fini(struct drm_gpu_scheduler *sc=
hed)
> > =C2=A0			 * Prevents reinsertion and marks job_queue as idle,
> > =C2=A0			 * it will be removed from the rq in drm_sched_entity_fini()
> > =C2=A0			 * eventually
> > +			 *
> > +			 * FIXME:
> > +			 * This lacks the proper spin_lock(&s_entity->lock) and
> > +			 * is, therefore, a race condition. Most notably, it
> > +			 * can race with drm_sched_entity_push_job(). The lock
> > +			 * cannot be taken here, however, because this would
> > +			 * lead to lock inversion -> deadlock.
> > +			 *
> > +			 * The best solution probably is to enforce the life
> > +			 * time rule of all entities having to be torn down
> > +			 * before their scheduler. Then, however, locking could
> > +			 * be dropped alltogether from this function.
>=20
> "Enforce the rule" is correct, since factually it's there, as a dependenc=
y in
> the code.
>=20
> Do we know which drivers violate this lifetime rule?

I've got no idea :(

>=20
> @Christian: What about amdgpu (for which the below was added to begin wit=
h)?

+1

P.

>=20
> > +			 * For now, this remains a potential race in all
> > +			 * drivers that keep entities alive for longer than
> > +			 * the scheduler.
> > =C2=A0			 */
> > =C2=A0			s_entity->stopped =3D true;
> > =C2=A0		spin_unlock(&rq->lock);
> > --=20
> > 2.49.0
>=20

