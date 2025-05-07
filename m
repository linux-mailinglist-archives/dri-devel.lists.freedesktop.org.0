Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5388AAE2BD
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A984A10E1AC;
	Wed,  7 May 2025 14:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oez4XtBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E09310E1AC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746627951;
 bh=QdL9SjrGRnihVvSpoqL7V1MZ+Id0oxj48vooafPkONI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oez4XtBOg8ZWSf7aYD03PdM/1bpvw4W0lDazOR2KCypkNMPblNlALNsePSBXLSUYt
 tbHyKb92slx17n8h4vTDgHRiQ8vftL9o6+zKVphFzMkeNFiSI72FS4hhTjt09TXvbV
 2d/ov8iAJm/p3jN4R3P45bc/oehQmg6KqJ8po0VCmxBAf7RpAugLppY6antTT1WKGt
 bI5+fykS16cK+WiKBw4HKpAhEanfmEJhQBP+3jg/RsH94GTguPEEMKQD4iywTJKC1I
 ulAOpFIT6NaFTvf4HQgwrLe+KyS2uNPrYBHfOkwF/gP4Q+aIGUwdma/v0BSGXkr+RB
 pVGj5M28z4NTg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F95317E0286;
 Wed,  7 May 2025 16:25:51 +0200 (CEST)
Date: Wed, 7 May 2025 16:25:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
Message-ID: <20250507162545.3475be0d@collabora.com>
In-Reply-To: <3mdoa5wslxmpp4jsjhtwgdkqqqjcovudy3ge45lye2i4eiruby@hpxkzhulpdvs>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
 <20250424022138.709303-2-adrian.larumbe@collabora.com>
 <20250506085453.0fbb5a02@collabora.com>
 <3mdoa5wslxmpp4jsjhtwgdkqqqjcovudy3ge45lye2i4eiruby@hpxkzhulpdvs>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 May 2025 14:01:04 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 06.05.2025 08:54, Boris Brezillon wrote:
> > On Thu, 24 Apr 2025 03:21:30 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > =20
> > > Unlike in Panthor, from where this change is based on, there is no ne=
ed
> > > to support tagging of BO's other than UM-exposed ones, so all strings
> > > can be freed with kfree().
> > >
> > > This commit is done in preparation of a following one that will allow
> > > UM to set BO labels through a new ioctl().
> > >
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
> > >  drivers/gpu/drm/panfrost/panfrost_gem.h | 16 ++++++++++++++++
> > >  2 files changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/dr=
m/panfrost/panfrost_gem.c
> > > index 963f04ba2de6..a7a29974d8b1 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > > @@ -1,6 +1,7 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > >
> > > +#include <linux/cleanup.h>
> > >  #include <linux/err.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/dma-buf.h>
> > > @@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem=
_object *obj)
> > >  	 */
> > >  	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
> > >
> > > +	kfree(bo->label.str);
> > > +	mutex_destroy(&bo->label.lock);
> > > +
> > >  	if (bo->sgts) {
> > >  		int i;
> > >  		int n_sgt =3D bo->base.base.size / SZ_2M;
> > > @@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object=
(struct drm_device *dev, size_t
> > >  	mutex_init(&obj->mappings.lock);
> > >  	obj->base.base.funcs =3D &panfrost_gem_funcs;
> > >  	obj->base.map_wc =3D !pfdev->coherent;
> > > +	mutex_init(&obj->label.lock);
> > >
> > >  	return &obj->base.base;
> > >  }
> > > @@ -302,3 +307,17 @@ panfrost_gem_prime_import_sg_table(struct drm_de=
vice *dev,
> > >
> > >  	return obj;
> > >  }
> > > +
> > > +void
> > > +panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
> > > +{
> > > +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> > > +	const char *old_label;
> > > +
> > > +	scoped_guard(mutex, &bo->label.lock) {
> > > +		old_label =3D bo->label.str;
> > > +		bo->label.str =3D label;
> > > +	}
> > > +
> > > +	kfree(old_label);
> > > +}
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/dr=
m/panfrost/panfrost_gem.h
> > > index 7516b7ecf7fe..c0be2934f229 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> > > @@ -41,6 +41,20 @@ struct panfrost_gem_object {
> > >  	 */
> > >  	size_t heap_rss_size;
> > >
> > > +	/**
> > > +	 * @label: BO tagging fields. The label can be assigned within the
> > > +	 * driver itself or through a specific IOCTL.
> > > +	 */
> > > +	struct {
> > > +		/**
> > > +		 * @label.str: Pointer to NULL-terminated string,
> > > +		 */
> > > +		const char *str;
> > > +
> > > +		/** @lock.str: Protects access to the @label.str field. */
> > > +		struct mutex lock;
> > > +	} label; =20
> >
> > Can we do as we did in panthor, and put those fields in the debugfs
> > field. =20
>=20
> BO labelling fields must be present outside of DebugFS builds.

Hm, right. I see those are not in an #ifdef CONFIG_DEBUGFS section in
panthor. I don't really see a good reason to store labels if we don't
have a way to retrieve/display them, but I guess that'd make sense if
we introduce a GET_LABEL ioctl.

>=20
> > +
> >  	bool noexec		:1;
> >  	bool is_heap		:1;
> >  };
> > @@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct pa=
nfrost_gem_object *bo);
> >  int panfrost_gem_shrinker_init(struct drm_device *dev);
> >  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
> >
> > +void panfrost_gem_set_label(struct drm_gem_object *obj, const char *la=
bel);
> > +
> >  #endif /* __PANFROST_GEM_H__ */ =20
>=20
>=20
> Adrian Larumbe

