Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A05A22CD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7672710E720;
	Fri, 26 Aug 2022 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5110E160;
 Fri, 26 Aug 2022 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661501956; x=1693037956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nXuqSIv5YEId+sK01ef5leX4DEms/2aThScg317HKnc=;
 b=RlbJppbDDUuqifDYOEKQ3MzPOal08JiU8tSA1cCVO3S6dvfcRHlWwhwM
 pd7SriPPJzMJ/JLbCrK5xn3GdRx9lmaqoI1s1TxoaGUF+0m8uU9pTG3oQ
 qb704rz3AB6kx7MgF2+Wk0vx1lqJn03UzPKvHOZJBmU4AUqAGPdyu+CK0
 Sr2fssx/x4v+VIyMB83gVolT1pipIRdaZKFuHEZV70yXb6QI1B9r0R4tK
 gKba5L3PMIvN3F07U433lITJ8xjXY0d1SF3KwIMFfSHf5Ay8YTbM1PGs1
 LjjBjCingRwcQrc1/XIA5//bkN1w80INUahfiy9QJI/GH1qcsoPZdRjnA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="292035538"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="292035538"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 01:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="671372121"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 26 Aug 2022 01:19:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 26 Aug 2022 11:19:11 +0300
Date: Fri, 26 Aug 2022 11:19:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <YwiB/xQf6Z6ScU+Z@intel.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824150834.427572-4-contact@emersion.fr>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 03:08:55PM +0000, Simon Ser wrote:
> This new kernel capability indicates whether async page-flips are
> supported via the atomic uAPI. DRM clients can use it to check
> for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel.

I think we'd need to clarify the semantics of the async flag
for atomic commits.

Eg. on Intel hw only pure page flips are possible async, if you do
anything else (change plane size/pos/scaling/etc.) you will need
to do a sync update. Technically not even all page flips (from the
uapi POV) might be possible as the exact scanout source address
is specified via two registers, only one of which can be update
async. So technically the two framebuffers might be laid out
just slightly differently which could prevent an async flip.
Also only some subset of planes actually support async flips.

And on hw where multiple planes support it on the same crtc, only one
plane can do it at a time. Well, more accurately we can only select
one plane at a time to give us the "flip done" interrupt. I guess
if the user wants to async flip multiple planes at the same time
we could do them serially as opposed to in parallel to make sure
all the flips actually happened before we signal completion of the
entire commit. Async flips of multiple planes probably won't
happen atomically anyway so doing them serially seems fine.

ATM in i915 we probably don't have sufficient state checks in
place to catch all the restrictions, and instead in part we rely
on the limited scope of the legacy async flip ioctl to make sure
the operation doesn't attempt something the hw can't do.

> Make it clear that DRM_CAP_ASYNC_PAGE_FLIP is for legacy uAPI only.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  drivers/gpu/drm/drm_ioctl.c |  5 +++++
>  include/uapi/drm/drm.h      | 10 +++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ca2a6e6101dc..5b1591e2b46c 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -302,6 +302,11 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
>  	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
>  		req->value = 1;
>  		break;
> +	case DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP:
> +		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
> +			     dev->mode_config.async_page_flip &&
> +			     !dev->mode_config.atomic_async_page_flip_not_supported;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..b1962628ecda 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -706,7 +706,8 @@ struct drm_gem_open {
>  /**
>   * DRM_CAP_ASYNC_PAGE_FLIP
>   *
> - * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
> + * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for legacy
> + * page-flips.
>   */
>  #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
>  /**
> @@ -767,6 +768,13 @@ struct drm_gem_open {
>   * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
>   */
>  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> +/**
> + * DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
> + *
> + * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
> + * commits.
> + */
> +#define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
>  
>  /* DRM_IOCTL_GET_CAP ioctl argument type */
>  struct drm_get_cap {
> -- 
> 2.37.2
> 

-- 
Ville Syrjälä
Intel
