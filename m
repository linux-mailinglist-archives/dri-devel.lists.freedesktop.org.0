Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31335937734
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 13:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8785C10EBE8;
	Fri, 19 Jul 2024 11:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqzs6BzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBC410EBE8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721389135; x=1752925135;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=lFkoFn00Ha6ybgDCQdfb/iShZNrZfw5oqmw6ngTrYcM=;
 b=gqzs6BzV5XhOjT0l+mUF0C32cLAzgoEzH2gr6KqQTqnABIAWi8RI0C9G
 ZU7EbBTeYpxwmHCvNJ4HEPh4PYJi4I+tysiUagKEyc7MbXVWR4Tq6Pzf3
 TW1vCht/CrNzZVKsugMws7uviPhJYyjH8+IwO3OBn/MhPS+rkg3lOZO7+
 pJm/F+xcnOZN6eAK3IO1F50x9T+BpBf/CKy13BfPTIqkOzvWxCSri/NE4
 nbjgFot8KEOhdaekuDzwYF6BNXBFu8Y0rlZbyMOTK7+OgStSllP4bcuGt
 nhzbW8fLa9X9iEPEEdkhfL/6GGGSXMUdTXSYjEUnsEnm/bVFI+J40UaHS A==;
X-CSE-ConnectionGUID: TgZG0wX1SXqyQtd1a5Y9Wg==
X-CSE-MsgGUID: s/wSn6TMRoS/cLxa9HE9xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="44417530"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="44417530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 04:38:54 -0700
X-CSE-ConnectionGUID: 4GK3yfM2RQ6FSKN1OH79/g==
X-CSE-MsgGUID: VvR7Fs2XTLCU3eCkILScQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51800584"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 04:38:51 -0700
Date: Fri, 19 Jul 2024 14:39:05 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panic: Add missing static inline to
 drm_panic_is_enabled()
Message-ID: <ZppQWb05llyndFh-@ideak-desk.fi.intel.com>
References: <20240719103615.1489714-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719103615.1489714-1-jfalempe@redhat.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 19, 2024 at 12:36:08PM +0200, Jocelyn Falempe wrote:
> This breaks build if DRM_PANIC is not enabled.
> 
> Fixes: de338c754d40 ("drm/panic: Add missing static inline to drm_panic_is_enabled()")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Thanks for the quick fix:
Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/drm_crtc_internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index c10de39cbe83..bbac5350774e 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector *connector)
>  #ifdef CONFIG_DRM_PANIC
>  bool drm_panic_is_enabled(struct drm_device *dev);
>  #else
> -bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> +static inline bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>  #endif
>  
>  #endif /* __DRM_CRTC_INTERNAL_H__ */
> -- 
> 2.45.2
> 
