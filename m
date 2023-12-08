Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4C80A419
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 14:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F30F10E289;
	Fri,  8 Dec 2023 13:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165D510E289
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 13:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702040750; x=1733576750;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QnOL0HstChe82dZJLaFn2ppbg9Lg6p6vs8wKcJ3EoZU=;
 b=h0kZxPLRvfEdQj2JMxHfOraKbH6V0kN9Nea7K2XxBuYsS5YuCADNe1FO
 s6Iv842c2fd48a4TRysGMmUE1gRUGFE8o5iRjiir5VBWYbB+1Xx6lKIGB
 FIVS7WhNms3MRIgAVJN7aV5DrQamrGyAtwQdGxgX7XnNtxNSF4O01uUNG
 eXsgIPec3c9bx94WCKM+uZoxKjtsYNENpy1ritc7X7XV1gmxD0jO5eOAv
 34OvIZepWndgy2XUyfwMsNNqE8Vr4Sx6csseybTL0xqxZdTuijUvCJHDO
 3owq8eHM7de1EhpFScMIasLZcPe9DMvCPgUqXzPichpJ3f1529fzTrhYO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15954741"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="15954741"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 05:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721861244"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721861244"
Received: from mvafin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.63.236])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 05:05:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ziqi Zhao <astrajoan@yahoo.com>, astrajoan@yahoo.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 ivan.orlov0322@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
In-Reply-To: <20230721161446.8602-1-astrajoan@yahoo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230716043411.4950-1-astrajoan@yahoo.com>
 <20230721161446.8602-1-astrajoan@yahoo.com>
Date: Fri, 08 Dec 2023 15:05:40 +0200
Message-ID: <87h6kszvx7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, glider@google.com,
 sumit.semwal@linaro.org, syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jul 2023, Ziqi Zhao <astrajoan@yahoo.com> wrote:
> The connector_set contains uninitialized values when allocated with
> kmalloc_array. However, in the "out" branch, the logic assumes that any
> element in connector_set would be equal to NULL if failed to
> initialize, which causes the bug reported by Syzbot. The fix is to use
> an extra variable to keep track of how many connectors are initialized
> indeed, and use that variable to decrease any refcounts in the "out"
> branch.

From one uninit-value bug to another?

>
> Reported-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
> Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
> ---
>  drivers/gpu/drm/drm_crtc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index df9bf3c9206e..d718c17ab1e9 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -715,8 +715,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  	struct drm_mode_set set;
>  	uint32_t __user *set_connectors_ptr;
>  	struct drm_modeset_acquire_ctx ctx;
> -	int ret;
> -	int i;
> +	int ret, i, num_connectors;

num_connectors is uninitialized.

>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
> @@ -851,6 +850,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  			goto out;
>  		}
>  
> +		num_connectors = 0;

num_connectors is initialized only if crtc_req->count_connectors > 0.

>  		for (i = 0; i < crtc_req->count_connectors; i++) {
>  			connector_set[i] = NULL;
>  			set_connectors_ptr = (uint32_t __user *)(unsigned long)crtc_req->set_connectors_ptr;
> @@ -871,6 +871,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  					connector->name);
>  
>  			connector_set[i] = connector;
> +			num_connectors++;
>  		}
>  	}
>  
> @@ -879,7 +880,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  	set.y = crtc_req->y;
>  	set.mode = mode;
>  	set.connectors = connector_set;
> -	set.num_connectors = crtc_req->count_connectors;
> +	set.num_connectors = num_connectors;

num_connectors is used uninitialized if crtc_req->count_connectors <= 0.

BR,
Jani.

>  	set.fb = fb;
>  
>  	if (drm_drv_uses_atomic_modeset(dev))
> @@ -892,7 +893,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  		drm_framebuffer_put(fb);
>  
>  	if (connector_set) {
> -		for (i = 0; i < crtc_req->count_connectors; i++) {
> +		for (i = 0; i < num_connectors; i++) {
>  			if (connector_set[i])
>  				drm_connector_put(connector_set[i]);
>  		}

-- 
Jani Nikula, Intel
