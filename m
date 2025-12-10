Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14490CB3111
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 14:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E9F10E737;
	Wed, 10 Dec 2025 13:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="L7c3fCTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF8F10E261
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765374793;
 bh=qhjY1C4tjAU+eJ8c+5IoNP9bnGAv9Lr6WKUQUDzFuXk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L7c3fCTJQHGEeOC4eXBkfKP7S66HzxHwTOf0sFQwqSEQZn93lJcReRh+fInI959jn
 T878WWIHwcmraE+Y9tl0sOxPSqIgAxV2TYmKJUXlkLJLbwtFNUi4e6dy96FWbPmTNs
 QOpvLJDBEzI2BdFyYGrCFvrPUPGlvNmN92yPzXpTWCh2uW+vkFw7LFq8OzMQ3akCD/
 +F3DuBe/cfDpkHf+E/KvlOlhzOtqJggkx5XcrZ5oMnlCqYdpJH8BMNBIQOFIHLtxhz
 q6/0hooZjZWgBV1p4iPfEcf2bUPeqOdAxIMG7jOa/WIXQwX2WYmG32UGdJajeTMlpA
 2XzHU72fSxpBQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6DE1017E0F05;
 Wed, 10 Dec 2025 14:53:13 +0100 (CET)
Date: Wed, 10 Dec 2025 14:53:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com
Subject: Re: [PATCH] drm/gem: Fix builds with CONFIG_MMU=n
Message-ID: <20251210145308.210c4df4@fedora>
In-Reply-To: <c35eb3b9-2f8c-429d-b177-16f2f0c65dda@collabora.com>
References: <20251209171151.2449120-1-boris.brezillon@collabora.com>
 <c35eb3b9-2f8c-429d-b177-16f2f0c65dda@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Wed, 10 Dec 2025 14:35:51 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Hi Boris,
>=20
> I missed that one, thanks for the fix.
>=20
> On 09/12/2025 18:11, Boris Brezillon wrote:
> > drm_gem_get_unmapped_area() relies on mm_get_unmapped_area() which is
> > only available if CONFIG_MMU=3Dy.
> >=20
> > Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fo=
p")
> > Cc: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com> =20
>=20
> Reviewed-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>

Thanks, queued to drm-misc-next immediately so we don't get new kbot
reports.

>=20
> Regards,
> Lo=C3=AFc
>=20
> > ---
> >   drivers/gpu/drm/drm_gem.c | 2 ++
> >   include/drm/drm_gem.h     | 5 +++++
> >   2 files changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 6021c4087a08..ca1956608261 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1267,6 +1267,7 @@ drm_gem_object_lookup_at_offset(struct file *filp=
, unsigned long start,
> >   	return obj;
> >   }
> >  =20
> > +#ifdef CONFIG_MMU
> >   /**
> >    * drm_gem_get_unmapped_area - get memory mapping region routine for =
GEM objects
> >    * @filp: DRM file pointer
> > @@ -1309,6 +1310,7 @@ unsigned long drm_gem_get_unmapped_area(struct fi=
le *filp, unsigned long uaddr,
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gem_get_unmapped_area);
> > +#endif
> >  =20
> >   /**
> >    * drm_gem_mmap - memory map routine for GEM objects
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index cca815dc87f3..f4da8ed0d630 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -537,9 +537,14 @@ void drm_gem_vm_close(struct vm_area_struct *vma);
> >   int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_si=
ze,
> >   		     struct vm_area_struct *vma);
> >   int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> > +
> > +#ifdef CONFIG_MMU
> >   unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned l=
ong uaddr,
> >   					unsigned long len, unsigned long pgoff,
> >   					unsigned long flags);
> > +#else
> > +#define drm_gem_get_unmapped_area NULL
> > +#endif
> >  =20
> >   /**
> >    * drm_gem_object_get - acquire a GEM buffer object reference =20
>=20

