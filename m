Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0706BE1E44
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 09:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126FB10E975;
	Thu, 16 Oct 2025 07:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="i5cGQ7rh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B5010E96C;
 Thu, 16 Oct 2025 07:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760599333;
 bh=IoepIVDWjMVUEYx/JMoNNzAWuBitBwwdY07odCMO0Q4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i5cGQ7rhvkjDuErtbB5sX5ggFRBd+1rGKxncPvI/s6TjTXgo1MQZQIyPkkz6s/D3u
 J01+9DTEkAR9KOL7ZUQepTLpi9qT4NuGqRIpj7EoHAM/pR8bW9RVqi/mOFotKFX0MG
 7OReNQZgSFwj9belOQ1F/n63dbOFBn55qZEl8WnDClGF0rsPm0Kt4zFY+kSF+9vVVG
 UigzSGtC5g50UmmqqsV1QxvZEavI52MBBZPRGP8L4zL2l6fIsA7amz/+AFSGLSBFVe
 6vL0YQqnYE1OqalIp70NkJnwcgKze8eI+KsFgeRZ+WlkLAdXY8GoRbY6CpqwWDalZp
 yJb2MR/ufjNuQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A48017E0FC2;
 Thu, 16 Oct 2025 09:22:12 +0200 (CEST)
Date: Thu, 16 Oct 2025 09:22:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 08/13] drm/v3d: Fix builds with
 CONFIG_TRANSPARENT_HUGEPAGE=n
Message-ID: <20251016092208.2b8ae536@fedora>
In-Reply-To: <02c8447d-25fc-4503-873f-0b2932e218ec@collabora.com>
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-9-loic.molinari@collabora.com>
 <20251015201737.3956f801@fedora>
 <efc1d805-1613-45a9-aa15-fcc009adf27c@collabora.com>
 <20251016075637.3aec3465@fedora>
 <02c8447d-25fc-4503-873f-0b2932e218ec@collabora.com>
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

On Thu, 16 Oct 2025 09:09:26 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Hi Boris,
>=20
> On 16/10/2025 07:56, Boris Brezillon wrote:
> > On Wed, 15 Oct 2025 22:41:59 +0200
> > Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:
> >  =20
> >> On 15/10/2025 20:17, Boris Brezillon wrote: =20
> >>> On Wed, 15 Oct 2025 17:30:12 +0200
> >>> Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:
> >>>     =20
> >>>> Don't declare "super_pages" on builds with CONFIG_TRANSPARENT_HUGEPA=
GE
> >>>> disabled to prevent build error:
> >>>>
> >>>> ERROR: modpost: "super_pages" [drivers/gpu/drm/v3d/v3d.ko] undefined=
! =20
> >>>
> >>> I believe this is a bug introduced by the previous commit: the
> >>> compiler probably drops any code between the
> >>> IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) check and the err label
> >>> because IS_ENABLED() evaluates to false at compile time. So I'd squash
> >>> those changes in the previous commit. =20
> >>
> >> Right, it's been introduced in previous commit.
> >> =20
> >>>    =20
> >>>>
> >>>> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> >>>> ---
> >>>>    drivers/gpu/drm/v3d/v3d_drv.h | 2 ++
> >>>>    drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
> >>>>    2 files changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d=
_drv.h
> >>>> index 99a39329bb85..481502104391 100644
> >>>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> >>>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> >>>> @@ -564,7 +564,9 @@ extern const struct dma_fence_ops v3d_fence_ops;
> >>>>    struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_=
queue q);
> >>>>   =20
> >>>>    /* v3d_gem.c */
> >>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>>>    extern bool super_pages;
> >>>> +#endif
> >>>>    int v3d_gem_init(struct drm_device *dev);
> >>>>    void v3d_gem_destroy(struct drm_device *dev);
> >>>>    void v3d_reset_sms(struct v3d_dev *v3d);
> >>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d=
_gem.c
> >>>> index 635ff0fabe7e..0039063eb8b2 100644
> >>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> >>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> >>>> @@ -269,7 +269,9 @@ v3d_huge_mnt_init(struct v3d_dev *v3d)
> >>>>    	 * match our usecase.
> >>>>    	 */
> >>>>   =20
> >>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>>>    	if (super_pages)
> >>>> +#endif
> >>>>    		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size"); =20
> >>>
> >>> Why not
> >>>
> >>> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>>     	if (super_pages)
> >>>     		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> >>> #endif
> >>>
> >>> I guess
> >>>
> >>> 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
> >>> 		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> >>>
> >>> would also do, since it's likely to rely on the same optimization the
> >>> previous v3d_gemfs_init() implementation was relying on, but it's
> >>> fragile (not sure what happens when compiled with -O0). =20
> >>
> >> I'll remove the #ifdef/#endif around the super_pages declaration in
> >> v3d_drv.h because it isn't necessary if super_pages is compiled out in
> >> v3d_huge_mnt_init().
> >>
> >> In v3d_huge_mnt_init(), I'd add the #ifdef before the ret variable
> >> declaration and the #endif right after the last else so that it's clear
> >> drm_notice("THP is recommended...") is called unconditionally when
> >> CONFIG_TRANSPARENT_HUGEPAGE=3Dn, whatever the optim level. What do you=
 think? =20
> >=20
> > First off, I'm not a huge fan of the following pattern
> >=20
> > #if foo
> > 	if (xxxx)
> > #endif
> > 		do_something
> >=20
> > which also applies to
> >=20
> > #if foo
> > 	if (xxxx)
> > 		do_xxx
> > 	else if (yyy)
> > 		do_yyy
> > 	else
> > #endif
> > 		do_something
> >=20
> > I'd rather have do_something duplicated in an #else section
> > like that:
> >=20
> > #if foo
> > 	if (xxxx)
> > 		do_xxx
> > 	else if (yyy)
> > 		do_yyy
> > 	else
> > 		do_something
> > #else
> > 	do_something
> > #endif
> >=20
> > But I'm not even seeing what the problem is here. If you do:
> >=20
> > 	int err =3D 0;
> >=20
> > #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >      if (super_pages)
> >      	err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> > #endif
> >=20
> > 	if (v3d->drm.huge_mnt)
> > 		drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> > 	else if (err)
> > 		drm_warn(&v3d->drm, "Can't use Transparent Hugepages (%d)\n", err);
> > 	else
> > 		drm_notice(&v3d->drm,
> > 			   "Transparent Hugepage support is recommended for optimal performa=
nce on this platform!\n");
> >=20
> > You're guaranteed that err=3D0 and v3d->drm.huge_mnt=3DNULL when
> > CONFIG_TRANSPARENT_HUGEPAGE=3Dn, so the "THP recommended"
> > message should be displayed unconditionally. Am I missing
> > something? =20
>=20
> It doesn't really matter here but I just thought it would be cleaner to=20
> explicitly let just the drm_notice() because the compiler doesn't know=20
> v3d->drm.huge_mnt is always NULL here and would emit a branch in=20
> CONFIG_TRANSPARENT_HUGEPAGE=3Dn builds.

Okay, well. I think it would matter if this was a hot-path, maybe? But
that's clearly not the case, this code is called once at probe time.

> I know your dislike for this=20
> pattern now, so I will stick to the suggestion :)

Actually, I would probably stick to the original

	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");

pattern since it worked so far. If -O0 is really a problem (didn't
check if it is), and v3d maintainers care about it (I doubt anyone
forces -O0 to be honest), they'll fix that in a follow-up patchset.
