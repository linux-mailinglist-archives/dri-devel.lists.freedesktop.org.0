Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C296E2593
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 16:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D4310ED6A;
	Fri, 14 Apr 2023 14:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99AC10ED53
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681482280; x=1713018280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AN7hXafwScawA+VdJz+BVgrtL6FImS4CxW8iempLOmE=;
 b=ZSGqrCqXdSLIAxcQiWtT0YcKwM2lBdVGlHYJX3t652Nzmrk+sf+8+PAb
 4JVvYGSo250+BWRSsQ6i7bF6WN6AIboFtSqQXJAlmxLfZScw7vE3Fwxkc
 oCe7a32xSqDDyCHKFsFx9AprWJeD5v8xBZeLqdMAbXTPCMS+ScsWAlcGL
 fOjLmip1r6KeolkoWLxF2/bH2tggmthkAZ1Xs3kTzM0fEuBQvW6FDsrIb
 TZOTXxeaZLJWA4qvtPpi8WGlDdYgbPxKiYK6hLJ+RluB7WxM7JfJrpoXn
 LwqNQUUvdEOfCiGZTfhQlgZgMHJbPqg+TnQezW9/wxLmuG/5QMzQimrN7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="341972493"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="341972493"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 07:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="720304675"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="720304675"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga008.jf.intel.com with SMTP; 14 Apr 2023 07:24:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Apr 2023 17:24:35 +0300
Date: Fri, 14 Apr 2023 17:24:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 6/7] drm/vkms: add reflect-y property
Message-ID: <ZDliI+iEgQlDMZWJ@intel.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
 <20230414135151.75975-7-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230414135151.75975-7-mcanal@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 10:51:50AM -0300, Maíra Canal wrote:
> Currently, vkms only support the reflect-x property. Therefore, add the
> reflect-y property to vkms through a software implementation of the
> operation. This is possible by reverse reading the y axis during the
> blending.
> 
> Now, vkms support all possible rotation values.
> 
> Tested with igt@kms_rotation_crc@primary-reflect-y and
> igt@kms_rotation_crc@sprite-reflect-y [1].
> 
> [1] https://patchwork.freedesktop.org/series/116025/
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++++-
>  drivers/gpu/drm/vkms/vkms_plane.c    | 16 ++++------------
>  2 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index b05bd008aeab..19d1078e9d34 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -92,8 +92,13 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
>  			return -1;
>  		return y + frame_info->dst.x1;
>  	default:
> -		return y;
> +		break;
>  	}
> +
> +	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
> +		return drm_rect_height(&frame_info->dst) - y - 1;
> +
> +	return y;
>  }
>  
>  static bool check_limit(struct vkms_frame_info *frame_info, int pos)
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 11662afa9fe4..d08bda869a24 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -121,12 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>  	frame_info->fb = fb;
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>  	drm_framebuffer_get(frame_info->fb);
> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
> -						     DRM_MODE_ROTATE_0 |
> -						     DRM_MODE_ROTATE_90 |
> -						     DRM_MODE_ROTATE_180 |
> -						     DRM_MODE_ROTATE_270 |
> -						     DRM_MODE_REFLECT_X);
> +	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_MASK |
> +						     DRM_MODE_REFLECT_MASK);

What are you trying to achieve with that?

-- 
Ville Syrjälä
Intel
