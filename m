Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC32C23E80
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAA210E2A4;
	Fri, 31 Oct 2025 08:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V2jlkPA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A3510E2A4;
 Fri, 31 Oct 2025 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761900598;
 bh=tzJ2aNT+TdXhEDg4BOMXnSkiNbzvOb7Pn4gIxc4/BzM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V2jlkPA7Kg2A/UpWR+uAehQ3Qk5UkUesVDGewNFo4kDUciZXoYmcjRKTZAl31yJIt
 jEYmEl7BeK04RRo3C5zZEyxDUljj3dwv57VJpGbDB/6nWVILBt8JtZ+ELaj/Kbg/9P
 QJNJnFR8DRo7xBM8u8HMA6kJMym8xUztr/RgeOiQyw9xPEofuf8ScAe+bcy+D14SXw
 BUqHISr5e575evfRevJ9QN2v1w3nE4TAaTpHf+SpN9uArYYQzS5Wd21/5BrRQWVZ56
 iYw8havsV4lAivBHMTAll3EiYsTKDxDeumCXGhaQNJdYqul4lPidgkeKbfAgSJroq4
 ApEr6tTLRGHxQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CF5E517E00A6;
 Fri, 31 Oct 2025 09:49:57 +0100 (CET)
Date: Fri, 31 Oct 2025 09:49:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marcin =?UTF-8?B?xZpsdXNhcno=?= <marcin.slusarz@arm.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v5 13/16] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Message-ID: <20251031094946.6ab9a19f@fedora>
In-Reply-To: <aQRgZDWo0Jc2-YrX@e129842.arm.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-14-boris.brezillon@collabora.com>
 <aQRgZDWo0Jc2-YrX@e129842.arm.com>
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

On Fri, 31 Oct 2025 08:08:20 +0100
Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:

> On Thu, Oct 30, 2025 at 03:05:22PM +0100, Boris Brezillon wrote:
> > +static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
> > +				  struct drm_file *file)
> > +{
> > +	struct drm_panfrost_sync_bo *args =3D data;
> > +	struct drm_panfrost_bo_sync_op *ops;
> > +	struct drm_gem_object *obj;
> > +	int ret;
> > +	u32 i;
> > +
> > +	if (args->pad)
> > +		return -EINVAL;
> > +
> > +	ops =3D kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
> > +	if (!ops) {
> > +		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
> > +			   args->op_count * sizeof(*ops))) {
> > +		DRM_DEBUG("Failed to copy in BO sync ops\n");
> > +		ret =3D -EFAULT;
> > +		goto err_ops;
> > +	}
> > +
> > +	for (i =3D 0; i < args->op_count; i++) {
> > +		obj =3D drm_gem_object_lookup(file, ops[i].handle);
> > +		if (!obj) {
> > +			ret =3D -ENOENT;
> > +			goto err_ops;
> > +		}
> > +
> > +		ret =3D panfrost_gem_sync(obj, ops[i].type,
> > +					ops[i].offset, ops[i].size);
> > +
> > +		drm_gem_object_put(obj);
> > +
> > +		if (ret)
> > +			goto err_ops;
> > +	}
> > +
> > +err_ops:
> > +	kvfree(ops);
> > +
> > +	return ret; =20
>=20
> This function will still return garbage if args->op_count is 0.

Sorry, this fell through the cracks. Will be fixed in v6.
