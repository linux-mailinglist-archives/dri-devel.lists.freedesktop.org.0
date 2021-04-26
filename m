Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F063436B5D7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 17:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA916E83D;
	Mon, 26 Apr 2021 15:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3F46E83D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 15:33:33 +0000 (UTC)
IronPort-SDR: emXEqYbllBjR3imXnHt3gDx1JjxBb534Tr8UpBN6pxNNel10H/d1EPwyEtY1FvDhy+5pxj+Dj2
 QYWe70kMsnvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="175836215"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="175836215"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 08:33:23 -0700
IronPort-SDR: u5UbAlc/iLH+5DnGDngndvxBpa4w15K1qC8094iscTGEiRcuExLiQ8FOfd5rw/QS5eNkvOgY45
 8HH//XYxDYXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="457220251"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 26 Apr 2021 08:33:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Apr 2021 18:33:18 +0300
Date: Mon, 26 Apr 2021 18:33:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2 1/2] gpu: drm: init set panel orientation property
 earlier
Message-ID: <YIbdPqolop6cBnYH@intel.com>
References: <20210426051848.2600890-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426051848.2600890-1-hsinyi@chromium.org>
X-Patchwork-Hint: comment
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 01:18:47PM +0800, Hsin-Yi Wang wrote:
> drm_dev_register() sets connector->registration_state to
> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> drm_connector_set_panel_orientation() is first called after
> drm_dev_register(), it will fail several checks and results in following
> warning.
> =

> Create panel orientation property in drm_connector_init()
> and set default value to UNKNOWN. Let the panel set the real value
> later.
> =

> [    4.480976] ------------[ cut here ]------------
> [    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_objec=
t.c:45 __drm_mode_object_add+0xb4/0xbc
> <snip>
> [    4.609772] Call trace:
> [    4.612208]  __drm_mode_object_add+0xb4/0xbc
> [    4.616466]  drm_mode_object_add+0x20/0x2c
> [    4.620552]  drm_property_create+0xdc/0x174
> [    4.624723]  drm_property_create_enum+0x34/0x98
> [    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
> [    4.634716]  boe_panel_get_modes+0x88/0xd8
> [    4.638802]  drm_panel_get_modes+0x2c/0x48
> [    4.642887]  panel_bridge_get_modes+0x1c/0x28
> [    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.658266]  drm_mode_getconnector+0x1b4/0x45c
> [    4.662699]  drm_ioctl_kernel+0xac/0x128
> [    4.666611]  drm_ioctl+0x268/0x410
> [    4.670002]  drm_compat_ioctl+0xdc/0xf0
> [    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.678436]  el0_svc_common+0xf4/0x1c0
> [    4.682174]  do_el0_svc_compat+0x28/0x3c
> [    4.686088]  el0_svc_compat+0x10/0x1c
> [    4.689738]  el0_sync_compat_handler+0xa8/0xcc
> [    4.694171]  el0_sync_compat+0x178/0x180
> [    4.698082] ---[ end trace b4f2db9d9c88610b ]---
> [    4.702721] ------------[ cut here ]------------
> [    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_objec=
t.c:243 drm_object_attach_property+0x48/0xb8
> <snip>
> [    4.833830] Call trace:
> [    4.836266]  drm_object_attach_property+0x48/0xb8
> [    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
> [    4.846432]  boe_panel_get_modes+0x88/0xd8
> [    4.850516]  drm_panel_get_modes+0x2c/0x48
> [    4.854600]  panel_bridge_get_modes+0x1c/0x28
> [    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.869978]  drm_mode_getconnector+0x1b4/0x45c
> [    4.874410]  drm_ioctl_kernel+0xac/0x128
> [    4.878320]  drm_ioctl+0x268/0x410
> [    4.881711]  drm_compat_ioctl+0xdc/0xf0
> [    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.890142]  el0_svc_common+0xf4/0x1c0
> [    4.893879]  do_el0_svc_compat+0x28/0x3c
> [    4.897791]  el0_svc_compat+0x10/0x1c
> [    4.901441]  el0_sync_compat_handler+0xa8/0xcc
> [    4.905873]  el0_sync_compat+0x178/0x180
> [    4.909783] ---[ end trace b4f2db9d9c88610c ]---
> =

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210409045314.=
3420733-1-hsinyi@chromium.org/
> ---
>  drivers/gpu/drm/drm_connector.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 7631f76e7f34..a1acb4af0ef4 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -303,6 +303,10 @@ int drm_connector_init(struct drm_device *dev,
>  				   config->tile_property,
>  				   0);
>  =

> +	drm_object_attach_property(&connector->base,
> +				   config->panel_orientation_property,
> +				   DRM_MODE_PANEL_ORIENTATION_UNKNOWN);
> +

A bit silly to add this to every connector. I think you should just
fix the driver/bridge stuff to set up the orientaion earlier.

>  	if (drm_core_check_feature(dev, DRIVER_ATOMIC)) {
>  		drm_object_attach_property(&connector->base, config->prop_crtc_id, 0);
>  	}
> @@ -1210,7 +1214,7 @@ static const struct drm_prop_enum_list dp_colorspac=
es[] =3D {
>   *	INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
>   *	coordinates, so if userspace rotates the picture to adjust for
>   *	the orientation it must also apply the same transformation to the
> - *	touchscreen input coordinates. This property is initialized by calling
> + *	touchscreen input coordinates. This property value is set by calling
>   *	drm_connector_set_panel_orientation() or
>   *	drm_connector_set_panel_orientation_with_quirk()
>   *
> @@ -1298,6 +1302,14 @@ int drm_connector_create_standard_properties(struc=
t drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.hdr_output_metadata_property =3D prop;
>  =

> +	prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> +					"panel orientation",
> +					drm_panel_orientation_enum_list,
> +					ARRAY_SIZE(drm_panel_orientation_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.panel_orientation_property =3D prop;
> +
>  	return 0;
>  }
>  =

> @@ -2205,19 +2217,9 @@ int drm_connector_set_panel_orientation(
>  	info->panel_orientation =3D panel_orientation;
>  =

>  	prop =3D dev->mode_config.panel_orientation_property;
> -	if (!prop) {
> -		prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> -				"panel orientation",
> -				drm_panel_orientation_enum_list,
> -				ARRAY_SIZE(drm_panel_orientation_enum_list));
> -		if (!prop)
> -			return -ENOMEM;
> -
> -		dev->mode_config.panel_orientation_property =3D prop;
> -	}
>  =

> -	drm_object_attach_property(&connector->base, prop,
> -				   info->panel_orientation);
> +	drm_object_property_set_value(&connector->base, prop,
> +				      info->panel_orientation);
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation);
> -- =

> 2.31.1.498.g6c1eba8ee3d-goog
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
