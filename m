Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D56C1433
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 14:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55710E56F;
	Mon, 20 Mar 2023 13:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BF710E19E;
 Mon, 20 Mar 2023 13:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679320744; x=1710856744;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eLfDELRNr3e2p2cdCu1LV29kvGpX6cLV1xTIjodSG88=;
 b=J1ZUm6OaqBN0FDlaRq2REjz8gXDoC3GpsO6z6B+1wkA6bF5C/m2pug1F
 6MBSTa0TttqFmMjwbLPLnZn6++eLPIcQhh4GhLI5gPj/kuhtOKRUXPb16
 9qS9+hW9A9UGTS2wIwOdnbC49sGePOABVIDSf4rfryNjeDGtIU3aEd/Ab
 x94ba/ek9jWY9SiYth3LlRcH8YQGPKpXy/Ro9EOTUFFhiLBTeAuxLj09a
 koycP2xNMp/paxipSp77TW/6+W02KWg+BXuOSc4WP7Hv1+GfYB8IN+B/C
 TXnYelHgs66UzPOxVgulVA5n8OcHJyM+vipGXPDBNC7k8/3L4DL5lBAj3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340210207"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="340210207"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 06:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713571839"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="713571839"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.65])
 ([10.213.6.65])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 06:59:02 -0700
Message-ID: <41b74bd5-1eb4-029a-40f2-79481dae439d@intel.com>
Date: Mon, 20 Mar 2023 14:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/display: Add helper func to get
 intel_fbdev from drm_fb_helper
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230320100903.23588-1-nirmoy.das@intel.com>
 <20230320100903.23588-2-nirmoy.das@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230320100903.23588-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.03.2023 11:09, Nirmoy Das wrote:
> Add a helper function to retrieve struct intel_fbdev from
> struct drm_fb_helper.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/display/intel_fbdev.c | 23 ++++++++++------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 673bcdfb7ff6..8c3b3c3fd0e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -67,6 +67,11 @@ struct intel_fbdev {
>   	struct mutex hpd_lock;
>   };
>   
> +static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
> +{
> +	return container_of(fb_helper, struct intel_fbdev, helper);
> +}
> +
>   static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
>   {
>   	return ifbdev->fb->frontbuffer;
> @@ -79,9 +84,7 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
>   
>   static int intel_fbdev_set_par(struct fb_info *info)
>   {
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct intel_fbdev *ifbdev =
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>   	int ret;
>   
>   	ret = drm_fb_helper_set_par(info);
> @@ -93,9 +96,7 @@ static int intel_fbdev_set_par(struct fb_info *info)
>   
>   static int intel_fbdev_blank(int blank, struct fb_info *info)
>   {
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct intel_fbdev *ifbdev =
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>   	int ret;
>   
>   	ret = drm_fb_helper_blank(blank, info);
> @@ -108,9 +109,7 @@ static int intel_fbdev_blank(int blank, struct fb_info *info)
>   static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>   				   struct fb_info *info)
>   {
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct intel_fbdev *ifbdev =
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>   	int ret;
>   
>   	ret = drm_fb_helper_pan_display(var, info);
> @@ -136,8 +135,7 @@ static const struct fb_ops intelfb_ops = {
>   static int intelfb_alloc(struct drm_fb_helper *helper,
>   			 struct drm_fb_helper_surface_size *sizes)
>   {
> -	struct intel_fbdev *ifbdev =
> -		container_of(helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>   	struct drm_framebuffer *fb;
>   	struct drm_device *dev = helper->dev;
>   	struct drm_i915_private *dev_priv = to_i915(dev);
> @@ -193,8 +191,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>   static int intelfb_create(struct drm_fb_helper *helper,
>   			  struct drm_fb_helper_surface_size *sizes)
>   {
> -	struct intel_fbdev *ifbdev =
> -		container_of(helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>   	struct intel_framebuffer *intel_fb = ifbdev->fb;
>   	struct drm_device *dev = helper->dev;
>   	struct drm_i915_private *dev_priv = to_i915(dev);

