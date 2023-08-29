Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2D678C1B1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 11:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11D810E04D;
	Tue, 29 Aug 2023 09:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D6310E04D;
 Tue, 29 Aug 2023 09:44:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DF786607214;
 Tue, 29 Aug 2023 10:44:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693302257;
 bh=Z94pAeCLfwRuWm2Tvr2fBDlolGZR8Vfz+wCcKDz3J48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=knmEgmJMXHvOrSkcpBXuxz19tU/R8ZtRLNvLeXGDO5ZgXFoBCTUPMJAhWSuii4t5/
 gJpxlzO/uIZeM1+Kl0RynstVZP2jLdzJzLxWrEV9Pz6kkP2lyW6bm/YqeilrLyUleR
 JUy4cY9g0wsEmvnwG66qcR+edlWwoYYjwi1BZr+5pDoX/Bhu9ogns+pfc6wn6w7Ei/
 a4BA4aszsN+yNpLUWdHgce32o3vc8HrPrzPNxkWBmywfF1UR3HAlknYP5TS6/jf77H
 sBjBPgM8XEPYPKo8pmvU0BvsezmC23LBv6KRVIf18Hd4rrU/lM4xLnT0Ganem0odFW
 vusr7l4Skn/GQ==
Date: Tue, 29 Aug 2023 11:44:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v15 17/23] drm/shmem-helper: Add and use
 drm_gem_shmem_resv_assert_held() helper
Message-ID: <20230829114413.7adc9709@collabora.com>
In-Reply-To: <0ff9b35a-3a44-6221-3017-e9efab2d33f2@amd.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-18-dmitry.osipenko@collabora.com>
 <20230828121239.78a180e6@collabora.com>
 <01930e66-cba2-5d81-7f46-d46907bdd300@collabora.com>
 <20230829092950.3a9c40c1@collabora.com>
 <0ff9b35a-3a44-6221-3017-e9efab2d33f2@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023 10:52:03 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 29.08.23 um 09:29 schrieb Boris Brezillon:
> > On Tue, 29 Aug 2023 05:34:23 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> > =20
> >> On 8/28/23 13:12, Boris Brezillon wrote: =20
> >>> On Sun, 27 Aug 2023 20:54:43 +0300
> >>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >>>     =20
> >>>> In a preparation of adding drm-shmem memory shrinker, move all reser=
vation
> >>>> locking lockdep checks to use new drm_gem_shmem_resv_assert_held() t=
hat
> >>>> will resolve spurious lockdep warning about wrong locking order vs
> >>>> fs_reclam code paths during freeing of shmem GEM, where lockdep isn't
> >>>> aware that it's impossible to have locking contention with the fs_re=
clam
> >>>> at this special time.
> >>>>
> >>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>> ---
> >>>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 37 +++++++++++++++++-----=
----
> >>>>   1 file changed, 25 insertions(+), 12 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/dr=
m/drm_gem_shmem_helper.c
> >>>> index d96fee3d6166..ca5da976aafa 100644
> >>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>>> @@ -128,6 +128,23 @@ struct drm_gem_shmem_object *drm_gem_shmem_crea=
te(struct drm_device *dev, size_t
> >>>>   }
> >>>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> >>>>  =20
> >>>> +static void drm_gem_shmem_resv_assert_held(struct drm_gem_shmem_obj=
ect *shmem)
> >>>> +{
> >>>> +	/*
> >>>> +	 * Destroying the object is a special case.. drm_gem_shmem_free()
> >>>> +	 * calls many things that WARN_ON if the obj lock is not held.  But
> >>>> +	 * acquiring the obj lock in drm_gem_shmem_free() can cause a lock=
ing
> >>>> +	 * order inversion between reservation_ww_class_mutex and fs_recla=
im.
> >>>> +	 *
> >>>> +	 * This deadlock is not actually possible, because no one should
> >>>> +	 * be already holding the lock when drm_gem_shmem_free() is called.
> >>>> +	 * Unfortunately lockdep is not aware of this detail.  So when the
> >>>> +	 * refcount drops to zero, we pretend it is already locked.
> >>>> +	 */
> >>>> +	if (kref_read(&shmem->base.refcount))
> >>>> +		drm_gem_shmem_resv_assert_held(shmem);
> >>>> +}
> >>>> +
> >>>>   /**
> >>>>    * drm_gem_shmem_free - Free resources associated with a shmem GEM=
 object
> >>>>    * @shmem: shmem GEM object to free
> >>>> @@ -142,8 +159,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_obj=
ect *shmem)
> >>>>   	if (obj->import_attach) {
> >>>>   		drm_prime_gem_destroy(obj, shmem->sgt);
> >>>>   	} else if (!shmem->imported_sgt) {
> >>>> -		dma_resv_lock(shmem->base.resv, NULL);
> >>>> -
> >>>>   		drm_WARN_ON(obj->dev, kref_read(&shmem->vmap_use_count));
> >>>>  =20
> >>>>   		if (shmem->sgt) {
> >>>> @@ -156,8 +171,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_obj=
ect *shmem)
> >>>>   			drm_gem_shmem_put_pages_locked(shmem); =20
> >>> AFAICT, drm_gem_shmem_put_pages_locked() is the only function that's
> >>> called in the free path and would complain about resv-lock not being
> >>> held. I think I'd feel more comfortable if we were adding a
> >>> drm_gem_shmem_free_pages() function that did everything
> >>> drm_gem_shmem_put_pages_locked() does except for the lock_held() check
> >>> and the refcount dec, and have it called here (and in
> >>> drm_gem_shmem_put_pages_locked()). This way we can keep using
> >>> dma_resv_assert_held() instead of having our own variant. =20
> >> It's not only drm_gem_shmem_free_pages(), but any drm-shmem function
> >> that drivers may use in the GEM's freeing callback.
> >>
> >> For example, panfrost_gem_free_object() may unpin shmem BO and then do
> >> drm_gem_shmem_free(). =20
> > Is this really a valid use case? =20
>=20
> I haven't followed the whole discussion, but I think it isn't a valid=20
> use case.
>=20
> That page_use_count is none zero while the GEM object is about to be=20
> destroyed can only happen is someone managed to grab a reference to the=20
> page without referencing the GEM object.

Actually, drm_gem_shmem_object is a bit special (weird?) in this regard.
drm_gem_shmem_get_pages_sgt_locked() creates the sgt and takes a
pages ref (pages_use_count++). The sgt itself is cached (next call to
drm_gem_shmem_get_pages_sgt_locked() will return the existing sgt) but
not refcounted, which means it will stay around until the GEM object is
destroyed or its pages are purged (GEM eviction). Because of that,
shmem->pages_use_count =3D=3D 1 in drm_gem_shmem_free_pages() is valid iff
shmem->sgt !=3D NULL. pages_use_count > 1 is invalid though, as should be
pages_pin_count after Dmitry's patches.

If we want to 'fix' that (not convinced this is a bug, more a design
choice), we need to refcount the sgt users and add
drm_gem_shmem_put_pages_sgt[_locked](), so drivers can reflect when
they're done using the sgt.
