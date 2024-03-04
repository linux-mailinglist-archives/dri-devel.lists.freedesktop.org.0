Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02258707EA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 18:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2CB112377;
	Mon,  4 Mar 2024 17:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EJmp2YwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02211112377
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709571832;
 bh=QVFxd1YSLwW2a7fCHIdyRN5o6f+rp+oB5zXu4FiVrfE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EJmp2YwZN2npYth3cYKdcDbjC89Fb7BLm57YTX0okcstsmnZ2dZbh3wZR1kizg1Ub
 +Yyhexq7++bev8BdvIY8jg2WruI3TFqiC4b5fZu6ju3SEW2bWc46mgGXwB8WFLYZ2i
 BmyUK8/ZWSSB68ITN6ZouphhbjLQbni0j3qC/px+ewUQbX9jKo52QGBMGwSCYpKniE
 C20k2wE/ATntdD4anS+VAtEvfgv8w/UyXjQzqtEE3JD/VHMqh0HXLvqnHPrzMx4gO1
 BqE63y/PqhbfRgx2UlaXy3DfiC+fTAnNtHIeHoZIZgJv1Stwm24NtAm/+5i4IlQDbd
 vQXJnI6Jqs5Yw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 32BCB37820CC;
 Mon,  4 Mar 2024 17:03:52 +0000 (UTC)
Date: Mon, 4 Mar 2024 18:03:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Rob
 Herring <robh@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/panfrost: Replace fdinfo's profiling debugfs
 knob with sysfs
Message-ID: <20240304180350.74e7e385@collabora.com>
In-Reply-To: <51167b19-5a2c-4749-8b8c-b2a0e6050a33@arm.com>
References: <20240302154845.3223223-2-adrian.larumbe@collabora.com>
 <20240302154845.3223223-3-adrian.larumbe@collabora.com>
 <51167b19-5a2c-4749-8b8c-b2a0e6050a33@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Mon, 4 Mar 2024 16:04:34 +0000
Steven Price <steven.price@arm.com> wrote:

> On 02/03/2024 15:48, Adri=C3=A1n Larumbe wrote:
> > Debugfs isn't always available in production builds that try to squeeze
> > every single byte out of the kernel image, but we still need a way to
> > toggle the timestamp and cycle counter registers so that jobs can be
> > profiled for fdinfo's drm engine and cycle calculations.
> >=20
> > Drop the debugfs knob and replace it with a sysfs file that accomplishes
> > the same functionality, and document its ABI in a separate file.
> >=20
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> =20
>=20
> I'm happy with this.
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
>=20
> Boris: are you happy with the sysfs ABI, or would you like to
> investigate further the implications of leaving the counters enabled all
> the time during execution before committing to the sysfs ABI?

No, that's fine, but I have a few comments on the implementation.

> > +static ssize_t
> > +profiling_show(struct kobject *kobj, struct kobj_attribute *attr, char=
 *buf)
> > +{
> > +	bool *profile_mode =3D
> > +		&container_of(kobj, struct panfrost_device,
> > +			      profiling.base)->profiling.profile_mode;
> > +
> > +	return sysfs_emit(buf, "%d\n", *profile_mode);
> > +}
> > +
> > +static ssize_t
> > +profiling_store(struct kobject *kobj, struct kobj_attribute *attr,
> > +	       const char *buf, size_t count)
> > +{
> > +	bool *profile_mode =3D
> > +		&container_of(kobj, struct panfrost_device,
> > +			      profiling.base)->profiling.profile_mode;
> > +	int err, value;
> > +
> > +	err =3D kstrtoint(buf, 0, &value);

I'd suggest using kstrtobool() since you make the result a boolean
anyway.

> > +	if (err)
> > +		return err;
> > +
> > +	*profile_mode =3D !!value;
> > +
> > +	return count;
> > +}
> > +
> > +static const struct kobj_attribute profiling_status =3D
> > +__ATTR(status, 0644, profiling_show, profiling_store);
> > +
> > +static const struct kobj_type kobj_profile_type =3D {
> > +	.sysfs_ops =3D &kobj_sysfs_ops,
> > +};

DEVICE_ATTR(profiling, 0644, profiling_show, profiling_store);

?

> > +
> > +int panfrost_sysfs_init(struct panfrost_device *pfdev)
> > +{
> > +	struct device *kdev =3D pfdev->ddev->primary->kdev;
> > +	int err;
> > +
> > +	kobject_init(&pfdev->profiling.base, &kobj_profile_type);
> > +
> > +	err =3D kobject_add(&pfdev->profiling.base, &kdev->kobj, "%s", "profi=
ling");

Can we make it a device attribute instead of adding an extra kboj?

> > +	if (err)
> > +		return err;
> > +
> > +	err =3D sysfs_create_file(&pfdev->profiling.base, &profiling_status.a=
ttr);
> > +	if (err)
> > +		kobject_del(&pfdev->profiling.base);
> > +
> > +	return err;
> > +}
