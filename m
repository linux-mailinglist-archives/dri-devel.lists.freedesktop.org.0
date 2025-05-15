Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B10AB81F1
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BB010E7CE;
	Thu, 15 May 2025 09:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Vcz7F49k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082A510E7D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:05:18 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZyknQ5nwKz9t9S;
 Thu, 15 May 2025 11:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747299914; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oS679U8JvubQBoby8haiERAdHK4LzGkZzIjtNydUGJ0=;
 b=Vcz7F49kh77fbx6mMQ9hsT6GOKbGbnBgEPf58UpG1TlPalotvGl5UZHm2V/R6Sk0DuXhMc
 dXguL/WUYVcFIe028der9QX0kCUFNpQMjoCbqkSmWrwJuNFdWvpCYYLwuKY4UTK3zM5amL
 iAvIL6YIG3d2TFhI1siEJMIcfaRZp3/dgfybecNLZlMYRqb00w8Pk4F5rkCpchpxg7Ypyb
 QHajByESBfqNAWvyR5ZFW7yjOSQCTwSnaNEqUYPPKrbKdu0YedmWiSARiLbbfPCMRzz21s
 tpSQf6wIYPjHCXjnNR6EevLxx2WX4l6DvsXx15kfhfKl2i0uOTyEoSYzSE9BVQ==
Message-ID: <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Lin.Cao"
 <lincao12@amd.com>, dri-devel@lists.freedesktop.org, 
 aamd-gfx@lists.freedesktop.org
Cc: haijun.chang@amd.com, zhenguo.yin@amd.com, Danilo Krummrich
 <dakr@kernel.org>,  Philipp Stanner <phasta@kernel.org>
Date: Thu, 15 May 2025 11:05:12 +0200
In-Reply-To: <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5c93c51bf77cfc2602d
X-MBO-RS-META: rs1yyqsip4fuwmh1zbes6zrwkema8iz6
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

On Thu, 2025-05-15 at 10:48 +0200, Christian K=C3=B6nig wrote:
> Explicitly adding the scheduler maintainers.
>=20
> On 5/15/25 04:07, Lin.Cao wrote:
> > Previously we only signaled finished fence which may cause some
> > submission's dependency cannot be cleared the cause benchmark hang.
> > Signal both scheduled fence and finished fence could fix this
> > issue.

Code seems legit to me; but be so kind and also pimp up the commit
message a bit, Christian. It's not very clear what the bug is and why
setting the parent to NULL solves it. Or is the issue simply that the
fence might be dropped unsignaled, being a bug by definition? Needs to
be written down.

Grammar is also a bit too broken.

And running the unit tests before pushing is probably also a good idea.

> >=20
> > Signed-off-by: Lin.Cao <lincao12@amd.com>

Acked-by: Philipp Stanner <phasta@kernel.org>

>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Danilo & Philipp can we quickly get an rb for that? I'm volunteering
> to push it to drm-misc-fixes and add the necessary stable tags since
> this is a fix for a rather ugly bug.
>=20
> Regards,
> Christian.
>=20
>=20
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index bd39db7bb240..e671aa241720 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -176,6 +176,7 @@ static void
> > drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
> > =C2=A0{
> > =C2=A0	struct drm_sched_job *job =3D container_of(wrk,
> > typeof(*job), work);
> > =C2=A0
> > +	drm_sched_fence_scheduled(job->s_fence, NULL);
> > =C2=A0	drm_sched_fence_finished(job->s_fence, -ESRCH);
> > =C2=A0	WARN_ON(job->s_fence->parent);
> > =C2=A0	job->sched->ops->free_job(job);
>=20

