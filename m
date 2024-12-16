Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186649F2FC1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FB010E5D9;
	Mon, 16 Dec 2024 11:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMacY/PD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263FE10E5C7;
 Mon, 16 Dec 2024 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734349667; x=1765885667;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=b/jnVnpWxsgsujPLPcohF02Om3SRNnOQCq/3TSfEFrg=;
 b=hMacY/PDMGImbV80bGQ35VpGevSR6FdkGGwvQKAUZInpLWEkI0hn2d7+
 Hw58P3UYYk6uN3f98egRzycMF0IGp8rrmDOy28w74PP22tKZ42FwDjIi7
 2ib/wt9WfJY+qT+5Q1xp3Ptfk7JnGnD892LhOx9emSRc6hqiuXJ+T22mx
 9XF1YAvzrr6siZnzNgwmpXMwTwN1/Xnm0zdmSyzKCpidduVsSB7JXJSFw
 Ha4FgRHY8W7kfqhLp0ZG6pWhsaIIkDO4ObeOoLzZrVgtMZLMbOSGovx/Z
 mbXjAQLHrgCX0F5DI424tMZju40jUlYgt1aOIweWXB2rzk/8T3DoECsHx A==;
X-CSE-ConnectionGUID: 6cJItNuHQ5ycHyLhWvy7xQ==
X-CSE-MsgGUID: yLFF5jPrQTuBMCNdZ7bMZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="52144727"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="52144727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:47:47 -0800
X-CSE-ConnectionGUID: ibVkrFHNQ56/atLPvsZSZg==
X-CSE-MsgGUID: dFEPEd+kTEamIvmrKVQJlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="102046463"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.245])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:47:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Qiang Yu <yuq825@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Subject: Re: [PATCH 1/5] drm/sysfs: Constify 'struct bin_attribute'
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-1-210f2b36b9bf@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
 <20241216-sysfs-const-bin_attr-drm-v1-1-210f2b36b9bf@weissschuh.net>
Date: Mon, 16 Dec 2024 13:47:37 +0200
Message-ID: <87r067svc6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon, 16 Dec 2024, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_sysfs.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index fb3bbb6adcd16f3f325a2ae8e35f41851c00b272..60c1f26edb6fad23153c32a29=
fd3be02700fc938 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -261,7 +261,7 @@ static ssize_t enabled_show(struct device *device,
>  }
>=20=20
>  static ssize_t edid_show(struct file *filp, struct kobject *kobj,
> -			 struct bin_attribute *attr, char *buf, loff_t off,
> +			 const struct bin_attribute *attr, char *buf, loff_t off,
>  			 size_t count)
>  {
>  	struct device *connector_dev =3D kobj_to_dev(kobj);
> @@ -315,21 +315,21 @@ static struct attribute *connector_dev_attrs[] =3D {
>  	NULL
>  };
>=20=20
> -static struct bin_attribute edid_attr =3D {
> +static const struct bin_attribute edid_attr =3D {
>  	.attr.name =3D "edid",
>  	.attr.mode =3D 0444,
>  	.size =3D 0,
> -	.read =3D edid_show,
> +	.read_new =3D edid_show,
>  };
>=20=20
> -static struct bin_attribute *connector_bin_attrs[] =3D {
> +static const struct bin_attribute *const connector_bin_attrs[] =3D {
>  	&edid_attr,
>  	NULL
>  };
>=20=20
>  static const struct attribute_group connector_dev_group =3D {
>  	.attrs =3D connector_dev_attrs,
> -	.bin_attrs =3D connector_bin_attrs,
> +	.bin_attrs_new =3D connector_bin_attrs,
>  };
>=20=20
>  static const struct attribute_group *connector_dev_groups[] =3D {

--=20
Jani Nikula, Intel
