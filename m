Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1BCA694E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E36410E54C;
	Wed, 19 Mar 2025 16:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZYREVnbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2734810E54C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742401697;
 bh=6y311ojZ6KmrR84y+nAplGOynuLZAkmDpiXeT4vu6CU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZYREVnbe7E1OGyHi4zpL+g8RZ84h3G9zD+V2HLE+egEMsaWdlPCuwHnBSw5zS4qOi
 S5JovBIsXlyQue0U3IriUUSb/9WP6FSVRzVbKkQ2hsCfrV5b0J7loeTx4J1eLzB+i8
 i+yGEzvIz3Ph1Iig3IScsVUG3VcQ6d1ik86XWWjQr22iuWrMX1m5YpabyKM865BjM3
 7EMqReyzzPosLbvudaaqG4a+jLyjHqglqLy1AaLjNORE+ClNxIsRcHYBLiAm/RCiUM
 tbnmnqtHsisT4VTlVVPjzvnI0L0jpwR2o5v9CXgIhGCOJadk5EBDz5Buz/rkYVaO77
 3uzW6rZHeDbvg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5BE1317E0385;
 Wed, 19 Mar 2025 17:28:17 +0100 (CET)
Date: Wed, 19 Mar 2025 17:28:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Message-ID: <20250319172812.106f1df1@collabora.com>
In-Reply-To: <afw6maib3dvwlkb7llizczajbxi2gj5snecasycdlacvot3r2e@qlj7wvj7q6iz>
References: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
 <20250316215139.3940623-3-adrian.larumbe@collabora.com>
 <20250317085002.304305cf@collabora.com>
 <afw6maib3dvwlkb7llizczajbxi2gj5snecasycdlacvot3r2e@qlj7wvj7q6iz>
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

On Wed, 19 Mar 2025 13:49:02 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Hi Boris,
>=20
> On 17.03.2025 08:50, Boris Brezillon wrote:
> > On Sun, 16 Mar 2025 21:51:33 +0000
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > =20
> > > Allow UM to label a BO for which it possesses a DRM handle.
> > >
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_drv.c | 31 +++++++++++++++++++++++++=
++
> > >  include/uapi/drm/panthor_drm.h        | 14 ++++++++++++
> > >  2 files changed, 45 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/=
panthor/panthor_drv.c
> > > index 310bb44abe1a..f41b8946258f 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > > @@ -1330,6 +1330,35 @@ static int panthor_ioctl_vm_get_state(struct d=
rm_device *ddev, void *data,
> > >  	return 0;
> > >  }
> > >
> > > +static int panthor_ioctl_label_bo(struct drm_device *ddev, void *dat=
a,
> > > +				  struct drm_file *file)
> > > +{
> > > +	struct drm_panthor_label_bo *args =3D data;
> > > +	struct drm_gem_object *obj;
> > > +	const char *label;
> > > +	int ret =3D 0;
> > > +
> > > +	obj =3D drm_gem_object_lookup(file, args->handle);
> > > +	if (!obj)
> > > +		return -ENOENT;
> > > +
> > > +	if (args->len && args->label) {
> > > +		label =3D strndup_user(u64_to_user_ptr(args->label), args->len + 1=
);
> > > +		if (IS_ERR(label)) {
> > > +			ret =3D PTR_ERR(label);
> > > +			goto err_label;
> > > +		}
> > > +	} else
> > > +		label =3D NULL;
> > > +
> > > +	panthor_gem_label_bo(obj, label);
> > > +
> > > +err_label:
> > > +	drm_gem_object_put(obj);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static int
> > >  panthor_open(struct drm_device *ddev, struct drm_file *file)
> > >  {
> > > @@ -1399,6 +1428,7 @@ static const struct drm_ioctl_desc panthor_drm_=
driver_ioctls[] =3D {
> > >  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLO=
W),
> > >  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_AL=
LOW),
> > >  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> > > +	PANTHOR_IOCTL(LABEL_BO, label_bo, DRM_RENDER_ALLOW),
> > >  };
> > >
> > >  static int panthor_mmap(struct file *filp, struct vm_area_struct *vm=
a)
> > > @@ -1508,6 +1538,7 @@ static void panthor_debugfs_init(struct drm_min=
or *minor)
> > >   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
> > >   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
> > >   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> > > + * - 1.4 - adds DRM_IOCTL_PANTHOR_LABEL_BO ioctl
> > >   */
> > >  static const struct drm_driver panthor_drm_driver =3D {
> > >  	.driver_features =3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/pantho=
r_drm.h
> > > index 97e2c4510e69..1a7ed567d36a 100644
> > > --- a/include/uapi/drm/panthor_drm.h
> > > +++ b/include/uapi/drm/panthor_drm.h
> > > @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
> > >
> > >  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
> > >  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> > > +
> > > +	/** @DRM_PANTHOR_LABEL_BO: Label a BO. */
> > > +	DRM_PANTHOR_LABEL_BO, =20
> >
> > DRM_PANTHOR_BO_SET_LABEL to follow the DRM_PANTHOR_<object>_<action>
> > naming scheme used in this file.
> >
> > I'd also be tempted to introduce a DRM_PANTHOR_BO_GET_LABEL ioctl while
> > we're at it. =20
>=20
> I thought of this too, but I was a bit reluctant because at present there=
 are no UM
> driver users who need this functionality.

I guess the labeling done in mesa could be made to use GEM labels if
the feature is supported. And honestly, I hate the idea of having an
half-baked implementation allowing the user to set a label with no way
to retrieve this label back. Can we at least change the name such that
we can later add a GET_LABEL ioctl?

>=20
> > >  };
> > >
> > >  /**
> > > @@ -977,6 +980,15 @@ struct drm_panthor_tiler_heap_destroy {
> > >  	__u32 pad;
> > >  };
> > >
> > > +/**
> > > + * struct drm_panthor_label_bo - Arguments passed to DRM_IOCTL_PANTH=
OR_LABEL_BO
> > > + */
> > > +struct drm_panthor_label_bo {
> > > +	__u32 handle;
> > > +	__u32 len;
> > > +	__u64 label; =20
> >
> > Can you document these fields?
> > =20
> > > +};
> > > +
> > >  /**
> > >   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> > >   * @__access: Access type. Must be R, W or RW.
> > > @@ -1019,6 +1031,8 @@ enum {
> > >  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
> > >  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =3D
> > >  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> > > +	DRM_IOCTL_PANTHOR_LABEL_BO =3D
> > > +		DRM_IOCTL_PANTHOR(WR, LABEL_BO, label_bo),
> > >  };
> > >
> > >  #if defined(__cplusplus) =20
>=20
>=20
> Adrian Larumbe

