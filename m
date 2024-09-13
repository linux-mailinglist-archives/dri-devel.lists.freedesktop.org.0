Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C99978262
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 16:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD56A10ED21;
	Fri, 13 Sep 2024 14:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q0qow9oX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847AD10ED21
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726236962;
 bh=Tqd+HyNhO+4ubB7mpWmepdMwImsFgbJry9rfO1wr//E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q0qow9oXoLh0ZnwwfvbFY9DYepfSEMY8xkk2VlHEvf53twCvMToV5CM58JAI3qn4v
 tJy4l4z9lV4iqIuHwYWFktE4/Kx3rmL0l7Tgk3UdooYm2cQyXBC9OpxFy0nx81W+aZ
 Rrl5IjNnFji9PlR563cB9pgEgPrRVtr/npVpFAheJwkqtjyKF/InHhYzoB9HliiZuT
 YWHS0W7CibLiXdmU/I/sF2t/3TdskFTdXtjWJBL5sUNWCfFVZZGcvbWUBkrnijfzIM
 CR9baYmW2/hKce5IJDVAWqZhy/e2DpSIor+ygnyD7HZTvP1TA5RteEtsPeVCytIpqs
 m0FsKW85Pu7Sw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B690717E1524;
 Fri, 13 Sep 2024 16:16:01 +0200 (CEST)
Date: Fri, 13 Sep 2024 16:15:57 +0200
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
Subject: Re: [PATCH v6 5/5] drm/panthor: add sysfs knob for enabling job
 profiling
Message-ID: <20240913161557.6fee852c@collabora.com>
In-Reply-To: <20240913124857.389630-6-adrian.larumbe@collabora.com>
References: <20240913124857.389630-1-adrian.larumbe@collabora.com>
 <20240913124857.389630-6-adrian.larumbe@collabora.com>
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

On Fri, 13 Sep 2024 13:42:13 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This commit introduces a DRM device sysfs attribute that lets UM control
> the job accounting status in the device. The knob variable had been broug=
ht
> in as part of a previous commit, but now we're able to fix it manually.
>=20
> As sysfs files are part of a driver's uAPI, describe its legitimate input
> values and output format in a documentation file.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  .../testing/sysfs-driver-panthor-profiling    | 10 ++++
>  Documentation/gpu/panthor.rst                 | 46 +++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c         | 39 ++++++++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profil=
ing
>  create mode 100644 Documentation/gpu/panthor.rst
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-panthor-profiling b/D=
ocumentation/ABI/testing/sysfs-driver-panthor-profiling
> new file mode 100644
> index 000000000000..af05fccedc15
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-panthor-profiling
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/platform/drivers/panthor/.../profiling
> +Date:		September 2024
> +KernelVersion:	6.11.0
> +Contact:	Adrian Larumbe <adrian.larumbe@collabora.com>
> +Description:
> +		Bitmask to enable drm fdinfo's job profiling measurements.
> +		Valid values are:
> +		0: Don't enable fdinfo job profiling sources.
> +		1: Enable GPU cycle measurements for running jobs.
> +		2: Enable GPU timestamp sampling for running jobs.
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> new file mode 100644
> index 000000000000..cbf5c4429a2d
> --- /dev/null
> +++ b/Documentation/gpu/panthor.rst
> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> + drm/Panthor CSF driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +.. _panfrost-usage-stats:
> +
> +Panthor DRM client usage stats implementation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The drm/Panthor driver implements the DRM client usage stats specificati=
on as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +Example of the output showing the implemented key value pairs and entire=
ty of
> +the currently possible format options:
> +
> +::
> +     pos:    0
> +     flags:  02400002
> +     mnt_id: 29
> +     ino:    491
> +     drm-driver:     panthor
> +     drm-client-id:  10
> +     drm-engine-panthor:     111110952750 ns
> +     drm-cycles-panthor:     94439687187
> +     drm-maxfreq-panthor:    1000000000 Hz
> +     drm-curfreq-panthor:    1000000000 Hz
> +     drm-total-memory:       16480 KiB
> +     drm-shared-memory:      0
> +     drm-active-memory:      16200 KiB
> +     drm-resident-memory:    16480 KiB
> +     drm-purgeable-memory:   0
> +
> +Possible `drm-engine-` key names are: `panthor`.
> +`drm-curfreq-` values convey the current operating frequency for that en=
gine.
> +
> +Users must bear in mind that engine and cycle sampling are disabled by d=
efault,
> +because of power saving concerns. `fdinfo` users and benchmark applicati=
ons which
> +query the fdinfo file must make sure to toggle the job profiling status =
of the
> +driver by writing into the appropriate sysfs node::
> +
> +    echo <N> > /sys/bus/platform/drivers/panthor/[a-f0-9]*.gpu/profiling
> +
> +Where `N` is a bit mask where cycle and timestamp sampling are respectiv=
ely
> +enabled by the first and second bits.
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 233b265c0819..6f47d9d1d86a 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1513,6 +1513,44 @@ static void panthor_remove(struct platform_device =
*pdev)
>  	panthor_device_unplug(ptdev);
>  }
> =20
> +static ssize_t profiling_show(struct device *dev,
> +			      struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", ptdev->profile_mask);
> +}
> +
> +static ssize_t profiling_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> +	u32 value;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &value);
> +	if (err)
> +		return err;
> +
> +	if ((value & ~PANTHOR_DEVICE_PROFILING_ALL) !=3D 0)
> +		return -EINVAL;
> +
> +	ptdev->profile_mask =3D value;
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RW(profiling);
> +
> +static struct attribute *panthor_attrs[] =3D {
> +	&dev_attr_profiling.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(panthor);
> +
>  static const struct of_device_id dt_match[] =3D {
>  	{ .compatible =3D "rockchip,rk3588-mali" },
>  	{ .compatible =3D "arm,mali-valhall-csf" },
> @@ -1532,6 +1570,7 @@ static struct platform_driver panthor_driver =3D {
>  		.name =3D "panthor",
>  		.pm =3D pm_ptr(&panthor_pm_ops),
>  		.of_match_table =3D dt_match,
> +		.dev_groups =3D panthor_groups,
>  	},
>  };
> =20

