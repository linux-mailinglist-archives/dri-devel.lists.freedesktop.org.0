Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF20A80CC8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E229F10E13E;
	Tue,  8 Apr 2025 13:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nDgFkkME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3545C10E13E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744120079;
 bh=C3YRdVfN9/tTERgpzrFW3Dz1VIKYRWNPIZCGRvkTjQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nDgFkkMEertxPzp7FI7rLDLgWd/jyh1Cmrn8XxSMVprkJ5Q0P3XLoQYXi1yTkAp3e
 qWrgEUXO/B3yeacx7cSkTcwY1kHbmIRc1cHtIQsClfflQHENP01YmMv+0gzBiHSg9S
 shfcJMfrJvpIIA6VtmHpXm6ccx95myyISWvYvezP9pA3a/NJy+MaQSHyhhOS6041tS
 uiP96Cq9qFDKO7Qr5X+Qu0Yxl/z0d5PBC09FRW4juTzy2RSJ/66Y0qfjVJnKYFmhsY
 X2POczZraBQBg2bxlLWszgjhwWRq9HKDQorpJVXygctsb4MOZxz+wCqv/w4BoHu+sd
 orQB1f527BupA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B4A0917E10F7;
 Tue,  8 Apr 2025 15:47:58 +0200 (CEST)
Date: Tue, 8 Apr 2025 15:47:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250408154755.0d45b54b@collabora.com>
In-Reply-To: <s66dyt32ukr37p24zjgbatm6sk5lzw5ujx2n7p2pr2ixrq3jf4@byemjauyp2mv>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
 <20250402115432.1469703-5-adrian.larumbe@collabora.com>
 <20250402145804.5cf07f5e@collabora.com>
 <s66dyt32ukr37p24zjgbatm6sk5lzw5ujx2n7p2pr2ixrq3jf4@byemjauyp2mv>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Tue, 8 Apr 2025 14:38:44 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/=
panthor/panthor_gem.c
> > > index 44d027e6d664..2fc87be9b700 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > @@ -2,6 +2,7 @@
> > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > >  /* Copyright 2023 Collabora ltd. */
> > >
> > > +#include <linux/cleanup.h>
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/err.h>
> > > @@ -10,14 +11,65 @@
> > >  #include <drm/panthor_drm.h>
> > >
> > >  #include "panthor_device.h"
> > > +#include "panthor_fw.h"
> > >  #include "panthor_gem.h"
> > >  #include "panthor_mmu.h"
> > >
> > > +#ifdef CONFIG_DEBUG_FS
> > > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *b=
o, u32 type_mask)
> > > +{
> > > +	INIT_LIST_HEAD(&bo->debugfs.node); =20
> >
> > This should be called when the GEM object is created, otherwise the
> > list_empty() test done in panthor_gem_debugfs_bo_rm() will only work if
> > panthor_gem_debugfs_bo_add() is called, and depending on when this
> > happens, or whether it happens at all, the error path will do a NULL
> > deref. =20
>=20
> I'll be moving panthor_gem_debugfs_bo_add() back into panthor_gem_create_=
object() and
> inline panthor_gem_debugfs_bo_init() into it.

You mean moving the panthor_gem_debugfs_bo_add() call to
panthor_gem_create_object(), not inlining its content, right?

> > > +	} else {
> > > +		bo->debugfs.creator.tgid =3D 0;
> > > +		snprintf(bo->debugfs.creator.process_name,
> > > +			 sizeof(bo->debugfs.creator.process_name),
> > > +			 "kernel");
> > > +	}
> > > +
> > > +	bo->debugfs.bo_mask =3D type_mask; =20
> >
> > Why not do that directly in panthor_gem_debugfs_bo_add()? The only bits
> > that might be useful to do early is the INIT_LIST_HEAD(), and I think
> > it can be inlined in panthor_gem_create_object(). =20
>=20
> I'll be doing in this in the next revision, but because I've no access to=
 the BO
> type mask from inside Panthor's drm_driver::gem_create_object() binding, =
then
> I'll have to assign the mask right after the object has been created.
>=20
> I think this means there might be a short window after the object's been =
added to
> the DebugFS GEMs list in which it could be shown with the kernel mask fie=
ld still
> set to 0, but I guess that's not too important either.

I think it's okay, as long as you don't crash when printing partially
initialized objects. Another solution would be to have a flag encoding
when the obj is initialized, so you can skip objects that don't have
this flag set yet.
