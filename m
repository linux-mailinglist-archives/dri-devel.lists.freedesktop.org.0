Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE414BD926D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E533610E5B5;
	Tue, 14 Oct 2025 11:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="l30+CX4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7014510E5B5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:56:37 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmCNy34yYz9v4c;
 Tue, 14 Oct 2025 13:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760442994; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuoYyhr414yRpQ1i3t+tJMdoecfQ3AFGJPDsRDzlW4Y=;
 b=l30+CX4KcX/76P3K4m3nxk9hG/aYc1yR7XcJQ1hfewt2hSRQuz9gkmYDwG+zYCXPap9HWu
 GS02z7nM/wPewqT2H6LQdY6U2SHnJ3qTfTbyx2EpVErc2O6AaETfIcLQj7lTgmMFaG/VBW
 oUs1ncZ3+7UZ3tif1DHZTyeMgNYUGXeW4qB243Oajj3zoCVEHZp2Q3kaytPOjxiyGFlHBd
 9RwhLyWJwdBBLsp9efyZZeRRrGeVvNBFTyZylfsV1nihy+bqytp92gvqE9UHxBXxsMXDZw
 c2O8ZHwPW7FWJ8vu6ta4yoIkvUeqvQBwM8Z1D/9lCxi+W+6ERv/2d44eNPv8Ig==
Message-ID: <87f93819aed4784b3e280af38bd7b447821873f5.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Mandate usage of drm_sched_job_cleanup()
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Oct 2025 13:56:30 +0200
In-Reply-To: <1490c292-c244-4dd9-80a6-3fecd0ffb422@ursulin.net>
References: <20250926123630.200920-2-phasta@kernel.org>
 <1490c292-c244-4dd9-80a6-3fecd0ffb422@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 935dee319ee6b438310
X-MBO-RS-META: wehwq34khft9zbe6q6epm7ry5cbpuf6f
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

On Mon, 2025-10-13 at 13:20 +0100, Tvrtko Ursulin wrote:
>=20
> On 26/09/2025 13:36, Philipp Stanner wrote:
> > drm_sched_job_cleanup()'s documentation so far uses relatively soft
> > language, only "recommending" usage of the function. To avoid memory
> > leaks and, potentiall, other bugs, however, the function has to be used=
.
> >=20
> > Demand usage of the function explicitly.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> > =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 46119aacb809..0a9df9e61963 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1030,7 +1030,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Cleans up the resources allocated with drm_sched_job_ini=
t().
> > =C2=A0=C2=A0 *
> > - * Drivers should call this from their error unwind code if @job is ab=
orted
> > + * Drivers need to call this from their error unwind code if @job is a=
borted
>=20
> Should is indeed wrong. I think it could be better to go with "shall" or=
=20
> "must" though. Since those two are more standard language for this.

"need to" is standard UK(?) English for "must to" I think.

But I'm fine with "must"

>=20
> > =C2=A0=C2=A0 * before drm_sched_job_arm() is called.
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * drm_sched_job_arm() is a point of no return since it ini=
tializes the fences
> > @@ -1038,7 +1038,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
> > =C2=A0=C2=A0 * submit it with drm_sched_entity_push_job() and cannot si=
mply abort it by
> > =C2=A0=C2=A0 * calling drm_sched_job_cleanup().
> > =C2=A0=C2=A0 *
> > - * This function should be called in the &drm_sched_backend_ops.free_j=
ob callback.
> > + * This function must be called in the &drm_sched_backend_ops.free_job=
 callback.
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_sched_job_cleanup(struct drm_sched_job *job)
> > =C2=A0 {
>=20
> Hm, having read the thread so far the situation seems not so easy to=20
> untangle.
>=20
> On one hand I see Matt's point that free_job callback is a bit=20
> misleadingly named and that there isn't anything really requiring=20
> drm_sched_job_cleanup() to be called exactly from there. Free_job=20
> semantics seem to be "job is done, *scheduler* is done with it".
>=20
> Drm_sched_job_cleanup() already says it has to be called after the point=
=20
> of no return (arm) so it could be left at drivers discretion (de facto=
=20
> state today) to choose how and when to do it.
>=20
> What I did not get is what is actually the perceived problem with=20
> letting this stay? (Ie. "should" indicating it is recommended, but not a=
=20
> must/shall.)

I think the most correct formulation with our current mess would be
"cleanup() must be called earliest in free_job(), or later (if there is
a very good reason for that)."

Question would be how to document that.

I still have that big life time docu patch pending. Let me dig into how
I could combine that..


P.

>=20
> Regards,
>=20
> Tvrtko
>=20

