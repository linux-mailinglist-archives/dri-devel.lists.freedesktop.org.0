Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B37EAC3BEC
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 10:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC45610E2EB;
	Mon, 26 May 2025 08:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YmRbGBp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BC710E2AA;
 Mon, 26 May 2025 08:46:21 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b5TrV3ppfz9tJf;
 Mon, 26 May 2025 10:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748249178; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FITOC9q0QoXrfQh+VXBfJzN4BRB3plpWTI8J8NoeSVQ=;
 b=YmRbGBp+J/y58b1K1Y1lXXG5WKDzTd48EpSV2PKBiJpbpwZg7pZtVyTvYWLafP1dQbGQol
 uCVXPNf1zSso7M2OgG6g8JRReLf6HtFYhSAO2DqAWK4aJsl6VhqINF8RF+5sunKZLoT4SK
 wIGp5DJNH7zoCpQLEl5Ir3c5Xr6Fq+qp9EBtOJ9i30jliAm6CI3+TuvAZ1mU2/6kfE4hsv
 HmWutgA0hEYxWA3U70ZeoQGORRxi4uLn8EDmn+ezSgITT3YomnkdFYPuJX5C0MyMazgxmF
 IFtKeDqXT4noh+d3ZWaczrYCjTcSS4EiuncaRP2BsxvLKcUaXtYUUr3MNGqv8A==
Message-ID: <0e4c67eba26d25fbd369dd7a241376a0506ad94d.camel@mailbox.org>
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency a bit
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 dakr@kernel.org,  amd-gfx@lists.freedesktop.org, Matthew Wilcox
 <willy@infradead.org>
Date: Mon, 26 May 2025 10:46:16 +0200
In-Reply-To: <bdf82e27-ae7e-4580-ab77-c05842bc8ec1@amd.com>
References: <20250522134117.7561-1-christian.koenig@amd.com>
 <20250522134117.7561-2-christian.koenig@amd.com>
 <a96a73ee-32a5-4c38-b277-e76101b94837@ursulin.net>
 <bdf82e27-ae7e-4580-ab77-c05842bc8ec1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 3624485f52e3dc55115
X-MBO-RS-META: o19epfdepxb84yh3zi17pd9j8q8e9oa3
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

+Cc Matthew, again :)

On Thu, 2025-05-22 at 18:19 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 16:27, Tvrtko Ursulin wrote:
> >=20
> > On 22/05/2025 14:41, Christian K=C3=B6nig wrote:
> > > Since we already iterated over the xarray we know at which index
> > > the new
> > > entry should be stored. So instead of using xa_alloc use xa_store
> > > and
> > > write into the index directly.
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 12 ++++++------
> > > =C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index f7118497e47a..d2d64bf17c96 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> > > =C2=A0 int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *fence)
> > > =C2=A0 {
> > > +=C2=A0=C2=A0=C2=A0 unsigned long index =3D -1;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *entry;
> > > -=C2=A0=C2=A0=C2=A0 unsigned long index;
> > > -=C2=A0=C2=A0=C2=A0 u32 id =3D 0;
> > > -=C2=A0=C2=A0=C2=A0 int ret;
> > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!fence)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > @@ -896,11 +894,13 @@ int drm_sched_job_add_dependency(struct
> > > drm_sched_job *job,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D xa_alloc(&job->dependencies, &id, =
fence,
> > > xa_limit_32b, GFP_KERNEL);
> > > -=C2=A0=C2=A0=C2=A0 if (ret !=3D 0)
> > > +=C2=A0=C2=A0=C2=A0 entry =3D xa_store(&job->dependencies, index + 1,=
 fence,
> > > GFP_KERNEL);
> >=20
> > From the code it looks index does not "move" for NULL slots?
>=20
> Correct, but I just found out that the macro initializes index to
> zero, so that approach also doesn't work.
>=20
> *sigh* going to look into this again tomorrow. It looks like this use
> case is somehow not well supported at all by xarray.

@Matthew, would be really nice if you could give some insights to that
and maybe give advice on a path how to best do that with xarray in a
canonical way.


Thanks,
P.


>=20
> Regards,
> Christian.
>=20
> >=20
> > That is, if someone:
> >=20
> > 1) Preallocates one entry, when trying to populate it index will be
> > -1 after xa_for_each?
> >=20
> > 2) Add one, preallocate one, then add one more - index will be 0
> > after xa_for_each?
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > > +=C2=A0=C2=A0=C2=A0 if (xa_is_err(entry))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(=
fence);
> > > +=C2=A0=C2=A0=C2=A0 else
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(entry);
> > > =C2=A0 -=C2=A0=C2=A0=C2=A0 return ret;
> > > +=C2=A0=C2=A0=C2=A0 return xa_err(entry);
> > > =C2=A0 }
> > > =C2=A0 EXPORT_SYMBOL(drm_sched_job_add_dependency);
> > > =C2=A0=20
> >=20
>=20

