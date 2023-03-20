Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798416C0F9D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD84910E33A;
	Mon, 20 Mar 2023 10:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBD910E33A;
 Mon, 20 Mar 2023 10:49:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4B6961222;
 Mon, 20 Mar 2023 10:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06CEC433D2;
 Mon, 20 Mar 2023 10:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679309383;
 bh=rBnl45ab07dv+jCjy3GZR8/un4kz0TabDyE+0e2TZrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XJUDJljFf4RX0CvyVU79OVlxapTuGL+XrkqLFO0akjjfuWMsGdCZ9UsRzAfno0Iwb
 6X+nsAecZEc59YaLN4EW85eDAOfusMbCaD1mB6XHqD+668tbwJ+oswNb7Y3ffeMY1e
 kNGU4uxWX9cay8HnNSO3oD/yKmThTTbpe3F7O4tXlSjUL1PQE74akFBPaW42ptsFnG
 EkgzvfBYJAYotvw1j5cPB53c9ZdbOWN09AMVvXmGASyPuYbQm3AhjrMLx6UjM19EE5
 pjyxg3/oXZtc5I6SL7r1d6FGTLp0u6ki8Yfa76dq/+zX6xnDVGhUXSbgfkU9vaByH/
 IjLfDQipk0+rA==
Date: Mon, 20 Mar 2023 11:49:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/display: Add helper func to get intel_fbdev
 from drm_fb_helper
Message-ID: <20230320104940.mjumwmjddbtkjmss@intel.intel>
References: <20230320100903.23588-1-nirmoy.das@intel.com>
 <20230320100903.23588-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320100903.23588-2-nirmoy.das@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:09:02AM +0100, Nirmoy Das wrote:
> Add a helper function to retrieve struct intel_fbdev from
> struct drm_fb_helper.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 23 ++++++++++------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 673bcdfb7ff6..8c3b3c3fd0e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -67,6 +67,11 @@ struct intel_fbdev {
>  	struct mutex hpd_lock;
>  };
>  
> +static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
> +{
> +	return container_of(fb_helper, struct intel_fbdev, helper);
> +}
> +
>  static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
>  {
>  	return ifbdev->fb->frontbuffer;
> @@ -79,9 +84,7 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
>  
>  static int intel_fbdev_set_par(struct fb_info *info)
>  {
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct intel_fbdev *ifbdev =
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>  	int ret;
>  
>  	ret = drm_fb_helper_set_par(info);
> @@ -93,9 +96,7 @@ static int intel_fbdev_set_par(struct fb_info *info)
>  
>  static int intel_fbdev_blank(int blank, struct fb_info *info)
>  {
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct intel_fbdev *ifbdev =
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>  	int ret;
>  
>  	ret = drm_fb_helper_blank(blank, info);
> @@ -108,9 +109,7 @@ static int intel_fbdev_blank(int blank, struct fb_info *info)
>  static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>  				   struct fb_info *info)
>  {
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct intel_fbdev *ifbdev =
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
>  	int ret;
>  
>  	ret = drm_fb_helper_pan_display(var, info);
> @@ -136,8 +135,7 @@ static const struct fb_ops intelfb_ops = {
>  static int intelfb_alloc(struct drm_fb_helper *helper,
>  			 struct drm_fb_helper_surface_size *sizes)
>  {
> -	struct intel_fbdev *ifbdev =
> -		container_of(helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>  	struct drm_framebuffer *fb;
>  	struct drm_device *dev = helper->dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> @@ -193,8 +191,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>  static int intelfb_create(struct drm_fb_helper *helper,
>  			  struct drm_fb_helper_surface_size *sizes)
>  {
> -	struct intel_fbdev *ifbdev =
> -		container_of(helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>  	struct intel_framebuffer *intel_fb = ifbdev->fb;
>  	struct drm_device *dev = helper->dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> -- 
> 2.39.0
> 
