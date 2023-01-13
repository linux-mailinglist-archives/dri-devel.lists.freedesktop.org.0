Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49182669800
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 14:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A4610E23D;
	Fri, 13 Jan 2023 13:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996BC10E1EE;
 Fri, 13 Jan 2023 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673615200; x=1705151200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LhbeKovqZSB+MvKETHc05L5lrhNB1IekiqbZZa6UlNY=;
 b=bN4jSjcAOx56AX1XX2BQvU2szARFC7+R1MeBJotulrTSuMKyikJO1R91
 Bf9qCQ0yQfZ94ML2Wn8jiHZVRCbHyBQ0y7bYrgWBfWAeK4zS8k1fMlaZQ
 SOKfm9EANi9ZrLRfnLQsqK3uFakuccIPl8jgnPoKojSjF4zJC3TliNYlL
 XHtHhzJrL9kCjZ3xmXaodSBVfZ/b+afXRmJ6CEDdWs2ns9bPMkTuH7VXh
 C9he0SfJNcq1WupDDq5w8eK7nbMZgqahTbQghhWwzVSswUAyG0SYY5oRs
 UDWQI+rJVbwdz3IyI36Q5MSMnndSwk/Q6/aYl0HyaKd4m/TIvMRTns195 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="303684266"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="303684266"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 05:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="660211887"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="660211887"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga007.fm.intel.com with SMTP; 13 Jan 2023 05:06:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Jan 2023 15:06:34 +0200
Date: Fri, 13 Jan 2023 15:06:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 1/3] drm/framebuffer: Check for valid formats
Message-ID: <Y8FXWvEhO7GCRKVJ@intel.com>
References: <20230113112743.188486-1-mcanal@igalia.com>
 <20230113112743.188486-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230113112743.188486-2-mcanal@igalia.com>
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 08:27:42AM -0300, Maíra Canal wrote:
> Currently, framebuffer_check() doesn't check if the pixel format is
> supported, which can lead to the acceptance of invalid pixel formats
> e.g. the acceptance of invalid modifiers. Therefore, add a check for
> valid formats on framebuffer_check(), so that the ADDFB2 IOCTL rejects
> calls with invalid formats.
> 
> Moreover, note that this check is only valid for atomic drivers,
> because, for non-atomic drivers, checking drm_any_plane_has_format() is
> not possible since the format list for the primary plane is fake, and
> we'd therefore reject valid formats.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  Documentation/gpu/todo.rst        | 9 ++++-----
>  drivers/gpu/drm/drm_framebuffer.c | 8 ++++++++
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 1f8a5ebe188e..3a79c26c5cc7 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -276,11 +276,10 @@ Various hold-ups:
>  - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
>    setup code can't be deleted.
>  
> -- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
> -  atomic drivers we could check for valid formats by calling
> -  drm_plane_check_pixel_format() against all planes, and pass if any plane
> -  supports the format. For non-atomic that's not possible since like the format
> -  list for the primary plane is fake and we'd therefor reject valid formats.
> +- Need to switch to drm_gem_fb_create(), as now framebuffer_check() checks for
> +  valid formats for atomic drivers.
> +
> +- Add an addfb format validation for non-atomic drivers.
>  
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
>    version of the varios drm_gem_fb_create functions. Maybe called
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index aff3746dedfb..605642bf3650 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -280,6 +280,14 @@ static int framebuffer_check(struct drm_device *dev,
>  		}
>  	}
>  
> +	/* Verify that the modifier is supported. */
> +	if (drm_drv_uses_atomic_modeset(dev) &&
> +	    !drm_any_plane_has_format(dev, r->pixel_format, r->modifier[0])) {
> +		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> +			    &r->pixel_format, r->modifier[0]);
> +		return -EINVAL;
> +	}

Like I said this is still wrong for the !modifiers case.

> +
>  	return 0;
>  }
>  
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
