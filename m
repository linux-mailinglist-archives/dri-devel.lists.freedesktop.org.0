Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED9844D6D9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 13:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469C06EA6D;
	Thu, 11 Nov 2021 12:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F14B6EA0D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 12:50:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212940318"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="212940318"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 04:50:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="534399152"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 11 Nov 2021 04:50:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 14:50:21 +0200
Date: Thu, 11 Nov 2021 14:50:21 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: pre-fill getfb2 modifier array with INVALID
Message-ID: <YY0RjSE7mI4kkKNJ@intel.com>
References: <20211111101049.269349-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211111101049.269349-1-contact@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 10:10:54AM +0000, Simon Ser wrote:
> User-space shouldn't look up the modifier array when the modifier
> flag is missing, but at the moment no docs make this clear (working
> on it). Right now the modifier array is pre-filled with zeroes, aka.
> LINEAR. Instead, pre-fill with INVALID to avoid footguns.
> 
> This is a uAPI change, but OTOH any user-space which looks up the
> modifier array without checking the flag is broken already, so
> should be fine.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Stone <daniels@collabora.com>

Isn't this going to break the test where we pass the get
getfb2 result back into addfb2?

> ---
>  drivers/gpu/drm/drm_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 07f5abc875e9..f7041c0a0407 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -601,7 +601,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  		r->handles[i] = 0;
>  		r->pitches[i] = 0;
>  		r->offsets[i] = 0;
> -		r->modifier[i] = 0;
> +		r->modifier[i] = DRM_FORMAT_MOD_INVALID;
>  	}
>  
>  	for (i = 0; i < fb->format->num_planes; i++) {
> -- 
> 2.33.1
> 

-- 
Ville Syrjälä
Intel
