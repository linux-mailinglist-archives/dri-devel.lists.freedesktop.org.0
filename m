Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468EBE2D3B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3506B10E072;
	Thu, 16 Oct 2025 10:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qXC1kGsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852EE10E072
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760610937;
 bh=V0AheD37RG2W+8iS7v1IQF3KlDenEXKK+f66s+RnKbA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qXC1kGsCEp9tU5d7P2jfF/FuxOQVxMnp3+FRwIZ8jPUnQ9AY7hEa7+ypW2SAiw3sF
 mRTeFBpOXW+xO3WE21TZEvsDQCnZiRs5KTpz+iBIbSIxiPz4KXgB52WAaGxJm/eXEx
 fWCO0VseZQO4UOST2/2+U67PXtc78idKQ1rs/M/abj7+urwD5+6IpNdaAJASr9XKYh
 ZEIm+PS4h7PTaowG1ZWctACZ2cFV1v/Bkx2h40JefqizP5ORDoyoDBQ/rtJp072thQ
 01G5cDKNJwxj6nsnzbiZfxs2ok8eF/wSrK+eTRgNq77ZuPweR5ihsKFFOlXSAY5ir3
 +JfzyiInAs0BQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A214217E0CF8;
 Thu, 16 Oct 2025 12:35:36 +0200 (CEST)
Date: Thu, 16 Oct 2025 12:35:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marcin =?UTF-8?B?xZpsdXNhcno=?= <marcin.slusarz@arm.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v4 11/14] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Message-ID: <20251016123532.0a23668a@fedora>
In-Reply-To: <aPDCoqMEq_XzYWZz@e129842.arm.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-12-boris.brezillon@collabora.com>
 <aPCv7ZZ3t2fJvG4W@e129842.arm.com> <20251016115224.01478b1f@fedora>
 <aPDCoqMEq_XzYWZz@e129842.arm.com>
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

On Thu, 16 Oct 2025 12:02:10 +0200
Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:

> On Thu, Oct 16, 2025 at 11:52:24AM +0200, Boris Brezillon wrote:
> > On Thu, 16 Oct 2025 10:42:21 +0200
> > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> >  =20
> > > On Wed, Oct 15, 2025 at 06:03:23PM +0200, Boris Brezillon wrote: =20
> > > > +static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *d=
ata,
> > > > +				  struct drm_file *file)
> > > > +{
> > > > +	struct drm_panfrost_sync_bo *args =3D data;
> > > > +	struct drm_panfrost_bo_sync_op *ops;
> > > > +	struct drm_gem_object *obj;
> > > > +	int ret;
> > > > +	u32 i;
> > > > +
> > > > +	if (args->pad)
> > > > +		return -EINVAL;
> > > > +
> > > > +	ops =3D kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
> > > > +	if (!ops) {
> > > > +		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
> > > > +			   args->op_count * sizeof(*ops))) {
> > > > +		DRM_DEBUG("Failed to copy in BO sync ops\n");
> > > > +		ret =3D -EFAULT;
> > > > +		goto err_ops;
> > > > +	}
> > > > +
> > > > +	for (i =3D 0; i < args->op_count; i++) {   =20
> > >=20
> > > If args->op_count is 0, if I'm not mistaken, kvmalloc_array and
> > > copy_to_user will succeed, but then this function will return
> > > unitialized value. Maybe add an explicit check for op_count =3D=3D 0
> > > at the beginning and avoid going through all that code? =20
> >=20
> > If args->op_count=3D0 the loop would be exited right away, so I'm not t=
oo
> > sure where the problem is. =20
>=20
> Maybe I didn't explain it correctly, so let me clear that up:
> ret is not initialized and not set anywhere if op_count is 0.

Ah, right. I overlooked the fact ret wasn't initialized. Sorry for the
noise.

>=20
> > This being said, I agree it's not worth
> > going through kvmalloc_array() and copy_from_user() if we know there's
> > nothing to do. And it's probably a bit fragile to rely on
> > kvmalloc_array() not returning NULL when the size is zero (I actually
> > thought it was), so I agree we'd rather bail out early in that case.
> >  =20
> > >  =20
> > > > +		if (ops[i].flags & ~PANFROST_BO_SYNC_OP_FLAGS) {
> > > > +			ret =3D -EINVAL;
> > > > +			goto err_ops;
> > > > +		}
> > > > +
> > > > +		obj =3D drm_gem_object_lookup(file, ops[i].handle);
> > > > +		if (!obj) {
> > > > +			ret =3D -ENOENT;
> > > > +			goto err_ops;
> > > > +		}
> > > > +
> > > > +		ret =3D panfrost_gem_sync(obj, ops[i].flags,
> > > > +					ops[i].offset, ops[i].size);
> > > > +
> > > > +		drm_gem_object_put(obj);
> > > > +
> > > > +		if (ret)
> > > > +			goto err_ops;
> > > > +	}
> > > > +
> > > > +err_ops:
> > > > +	kvfree(ops);
> > > > +
> > > > +	return ret;
> > > > +}   =20
> >  =20

