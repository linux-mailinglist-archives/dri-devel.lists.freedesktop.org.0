Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC9AC3E8A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAEF10E350;
	Mon, 26 May 2025 11:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZOeYfbO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A24D10E34D;
 Mon, 26 May 2025 11:27:34 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b5YQW02L7z9sqV;
 Mon, 26 May 2025 13:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748258851; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU+C54Zd3D04xmve+ZS48SQkLOOFwXc2vksK+GiyYXc=;
 b=ZOeYfbO92rsi2dcoW4X5xJwoBpuj0ddMW4gB2U5CreYegJSzCRatC9hTiQt+3kpihQX5Qc
 V8k7Ht9LJSf4szDkfgl6X+RxM5ROw5GDllCCpYLmSXs7NVaoJhFped5nNOkI+kYr3VsM+x
 Nt6869xtUabVK6/BULuGiDHscnqfT8TAttNSIe+nXwW1awQdnD6cEo4qDT1whW27l1C2Yl
 JKOfhwQfpy08zHApp+GeCvHk7quiLQr1ee5bCiBnrFvJVZ7t6mUAT1t2L1q6vaIdR4awfX
 uDnXy3g0yGNLJPCfdiNY6FYoJWHvaIiaIrJoa2uPpXecYiGwyQXTmQilxcc2ww==
Message-ID: <cbd3eaa4c228c0d0688745e8a539103eb2278a0b.camel@mailbox.org>
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: tursulin@ursulin.net, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Mon, 26 May 2025 13:27:28 +0200
In-Reply-To: <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDCDJ-sK9rRI6wse@cassiopeiae>
 <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
 <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
 <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 2850e8f09cd950f23c7
X-MBO-RS-META: ucsuq8r3mjcafi6ht17hzizz6sfrzfsn
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

On Mon, 2025-05-26 at 13:16 +0200, Christian K=C3=B6nig wrote:
> On 5/26/25 11:34, Philipp Stanner wrote:
> > On Mon, 2025-05-26 at 11:25 +0200, Christian K=C3=B6nig wrote:
> > > On 5/23/25 16:16, Danilo Krummrich wrote:
> > > > On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich
> > > > wrote:
> > > > > On Fri, May 23, 2025 at 02:56:40PM +0200, Christian K=C3=B6nig
> > > > > wrote:
> > > > > > It turned out that we can actually massively optimize here.
> > > > > >=20
> > > > > > The previous code was horrible inefficient since it
> > > > > > constantly
> > > > > > released
> > > > > > and re-acquired the lock of the xarray and started each
> > > > > > iteration from the
> > > > > > base of the array to avoid concurrent modification which in
> > > > > > our
> > > > > > case
> > > > > > doesn't exist.
> > > > > >=20
> > > > > > Additional to that the xas_find() and xas_store() functions
> > > > > > are
> > > > > > explicitly
> > > > > > made in a way so that you can efficiently check entries and
> > > > > > if
> > > > > > you don't
> > > > > > find a match store a new one at the end or replace existing
> > > > > > ones.
> > > > > >=20
> > > > > > So use xas_for_each()/xa_store() instead of
> > > > > > xa_for_each()/xa_alloc().
> > > > > > It's a bit more code, but should be much faster in the end.
> > > > >=20
> > > > > This commit message does neither explain the motivation of
> > > > > the
> > > > > commit nor what it
> > > > > does. It describes what instead belongs into the changelog
> > > > > between versions.
> > > >=20
> > > > Sorry, this is wrong. I got confused, the commit message is
> > > > perfectly fine. :)
> > > >=20
> > > > The rest still applies though.
> > > >=20
> > > > > Speaking of versioning of the patch series, AFAIK there were
> > > > > previous versions,
> > > > > but this series was sent as a whole new series -- why?
> > > > >=20
> > > > > Please resend with a proper commit message, version and
> > > > > changelog. Thanks!
> > >=20
> > >=20
> > > Well Philip asked to remove the changelog. I'm happy to bring it
> > > back, but yeah...
> >=20
> > No no no no :D
> >=20
> > Philipp asked for the changelog to be removed *from the git commit
> > message*; because it doesn't belong / isn't useful there.
> >=20
> > If there's a cover letter, the changelog should be in the cover
> > letter.
> > If there's no cover letter, it should be between the ---
> > separators:
>=20
> I can live with that, just clearly state what you want.

Sure thing:

 * Patches and patch series's should contain their version identifier
   within the square brackets [PATCH v3]. git format-patch -v3 does
   that automatically.
 * Changelog should be as described above
 * Ideally, cover letters always contain the full changelog, v2, v3 and
   so on, so that new readers get a sense of the evolution of the
   series.

>=20
> For DRM the ask is often to keep the changelog in the commit message
> or remove it entirely.

Yup, I've seen that a few times. I think we, the DRM community, should
stop that. It's just not useful and makes the commit messages larger,
both for the human reader while scrolling, as for the hard drive
regarding storage size


Thx
P.


>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > Signed-off-by: Gordon Freeman <freeman@blackmesa.org>
> > Reviewed-by: Alyx Vance <alyx@vance.edu>
> > ---
> > Changes in v2:
> > =C2=A0 - Provide more docu for crowbar-alloc-function.
> > =C2=A0 - Use NULL pointers for reserved xarray entries
> > ---
> > <DIFF>
> >=20
> >=20
> > P.
> >=20
> >=20
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > >=20
> > > > > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > ---
> > > > > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 29
> > > > > > ++++++++++++++++++--------
> > > > > > =C2=A01 file changed, 20 insertions(+), 9 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index f7118497e47a..cf200b1b643e 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> > > > > > =C2=A0int drm_sched_job_add_dependency(struct drm_sched_job
> > > > > > *job,
> > > > > > =C2=A0 struct dma_fence *fence)
> > > > > > =C2=A0{
> > > > > > + XA_STATE(xas, &job->dependencies, 0);
> > > > > > =C2=A0 struct dma_fence *entry;
> > > > > > - unsigned long index;
> > > > > > - u32 id =3D 0;
> > > > > > - int ret;
> > > > > > =C2=A0
> > > > > > =C2=A0 if (!fence)
> > > > > > =C2=A0 return 0;
> > > > > > @@ -883,24 +881,37 @@ int
> > > > > > drm_sched_job_add_dependency(struct
> > > > > > drm_sched_job *job,
> > > > > > =C2=A0 * This lets the size of the array of deps scale with
> > > > > > the number of
> > > > > > =C2=A0 * engines involved, rather than the number of BOs.
> > > > > > =C2=A0 */
> > > > > > - xa_for_each(&job->dependencies, index, entry) {
> > > > > > + xa_lock(&job->dependencies);
> > > > > > + xas_for_each(&xas, entry, ULONG_MAX) {
> > > > > > =C2=A0 if (entry->context !=3D fence->context)
> > > > > > =C2=A0 continue;
> > > > > > =C2=A0
> > > > > > =C2=A0 if (dma_fence_is_later(fence, entry)) {
> > > > > > =C2=A0 dma_fence_put(entry);
> > > > > > - xa_store(&job->dependencies, index,
> > > > > > fence, GFP_KERNEL);
> > > > > > + xas_store(&xas, fence);
> > > > > > =C2=A0 } else {
> > > > > > =C2=A0 dma_fence_put(fence);
> > > > > > =C2=A0 }
> > > > > > - return 0;
> > > > > > + xa_unlock(&job->dependencies);
> > > > > > + return xas_error(&xas);
> > > > > > =C2=A0 }
> > > > > > =C2=A0
> > > > > > - ret =3D xa_alloc(&job->dependencies, &id, fence,
> > > > > > xa_limit_32b, GFP_KERNEL);
> > > > > > - if (ret !=3D 0)
> > > > > > +retry:
> > > > > > + entry =3D xas_store(&xas, fence);
> > > > > > + xa_unlock(&job->dependencies);
> > > > > > +
> > > > > > + /* There shouldn't be any concurrent add, so no need
> > > > > > to loop again */
> > > > >=20
> > > > > Concurrency shouldn't matter, xas_nomem() stores the pre-
> > > > > allocated memory in the
> > > > > XA_STATE not the xarray. Hence, I think we should remove the
> > > > > comment.
> > > > >=20
> > > > > > + if (xas_nomem(&xas, GFP_KERNEL)) {
> > > > > > + xa_lock(&job->dependencies);
> > > > > > + goto retry;
> > > > >=20
> > > > > Please don't use a goto here, if we would have failed to
> > > > > allocate
> > > > > memory here,
> > > > > this would be an endless loop until we succeed eventually. It
> > > > > would be equal to:
> > > > >=20
> > > > > while (!ptr) {
> > > > > ptr =3D kmalloc();
> > > > > }
> > > > >=20
> > > > > Instead just take the lock and call xas_store() again.
> > > > >=20
> > > > > > + }
> > > > > > +
> > > > > > + if (xas_error(&xas))
> > > > > > =C2=A0 dma_fence_put(fence);
> > > > > > + else
> > > > > > + WARN_ON(entry);
> > > > >=20
> > > > > Please don't call WARN_ON() here, this isn't fatal, we only
> > > > > need
> > > > > to return the
> > > > > error code.
> > >=20
> >=20
>=20

