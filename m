Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D01F544A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 14:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634886E0F1;
	Wed, 10 Jun 2020 12:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAF66E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 12:10:58 +0000 (UTC)
IronPort-SDR: OJQE5zJLkVV5xeABi/ZgoBvFwLQdpHIQ17NI7mv+4G6t/Dy1gNPyGOipnffgXu3ROG8wwJJm+0
 g5VLkvQaWrQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 05:10:57 -0700
IronPort-SDR: axW/UbekDqOIAY+Z+yJKbtZb+YfomVFr53IM8JQwshRf3H/uLvhEqFLfc6iE4N1j7so0NNI78C
 xWPXbU6B+C7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; d="scan'208";a="314486572"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 10 Jun 2020 05:10:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jun 2020 15:10:54 +0300
Date: Wed, 10 Jun 2020 15:10:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
Message-ID: <20200610121054.GV6112@intel.com>
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610113059.2164132-1-thierry.reding@gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 10, 2020 at 01:30:59PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> =

> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> have a zpos property") a warning is emitted if there's a mix of planes
> with and without a zpos property.
> =

> On Tegra, cursor planes are always composited on top of all other
> planes, which is why they never had a zpos property attached to them.
> However, since the composition order is fixed, this is trivial to
> remedy by simply attaching an immutable zpos property to them.
> =

> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 10 ++++++++--
>  drivers/gpu/drm/tegra/hub.c |  2 +-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 83f31c6e891c..e7a6eb952ece 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(s=
truct drm_device *drm,
>  	}
>  =

>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +	drm_plane_create_zpos_property(&plane->base, 1 + plane->index, 1, 255);
>  =

>  	err =3D drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create=
(struct drm_device *drm,
>  	}
>  =

>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> +	drm_plane_create_zpos_immutable_property(&plane->base, 0);

zpos=3D=3D0 means the plane is at the bottom of the pile. Doesn't seem to
agree what you say in the commit msg.

>  =

>  	return &plane->base;
>  }
> @@ -1074,7 +1075,12 @@ static struct drm_plane *tegra_dc_overlay_plane_cr=
eate(struct drm_device *drm,
>  	}
>  =

>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +
> +	if (!cursor)
> +		drm_plane_create_zpos_property(&plane->base, 1 + plane->index,
> +					       1, 255);
> +	else
> +		drm_plane_create_zpos_immutable_property(&plane->base, 0);
>  =

>  	err =3D drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index a2ef8f218d4e..697d75bbb9fa 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -590,7 +590,7 @@ struct drm_plane *tegra_shared_plane_create(struct dr=
m_device *drm,
>  	}
>  =

>  	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
> -	drm_plane_create_zpos_property(p, 0, 0, 255);
> +	drm_plane_create_zpos_property(p, 1 + index, 1, 255);
>  =

>  	return p;
>  }
> -- =

> 2.24.1
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
