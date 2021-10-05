Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507E421FA7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0976EB16;
	Tue,  5 Oct 2021 07:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476F56EB16
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 07:48:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="212800378"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="212800378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 00:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="457976420"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 05 Oct 2021 00:48:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 10:48:07 +0300
Date: Tue, 5 Oct 2021 10:48:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kernel@amanoeldawod.com,
 dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/fbdev: Clamp fbdev surface size if too large
Message-ID: <YVwDN6vYfvo0wzSX@intel.com>
References: <20211005070355.7680-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005070355.7680-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 09:03:55AM +0200, Thomas Zimmermann wrote:
> Clamp the fbdev surface size of the available maximumi height to avoid
> failing to init console emulation. An example error is shown below.
> 
>   bad framebuffer height 2304, should be >= 768 && <= 768
>   [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on minor 0
>   simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-22)
> 
> This is especially a problem with drivers that have very small screen
> sizes and cannot over-allocate at all.
> 
> v2:
> 	* reduce warning level (Ville)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> Reported-by: Amanoel Dawod <kernel@amanoeldawod.com>
> Reported-by: Zoltán Kővágó <dirty.ice.hu@gmail.com>
> Reported-by: Michael Stapelberg <michael+lkml@stapelberg.ch>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.14+

Looks sane.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 6860223f0068..3b5661cf6c2b 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1508,6 +1508,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
>  	struct drm_device *dev = fb_helper->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
>  	int ret = 0;
>  	int crtc_count = 0;
>  	struct drm_connector_list_iter conn_iter;
> @@ -1665,6 +1666,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  	/* Handle our overallocation */
>  	sizes.surface_height *= drm_fbdev_overalloc;
>  	sizes.surface_height /= 100;
> +	if (sizes.surface_height > config->max_height) {
> +		drm_dbg_kms(dev, "Fbdev over-allocation too large; clamping height to %d\n",
> +			    config->max_height);
> +		sizes.surface_height = config->max_height;
> +	}
>  
>  	/* push down into drivers */
>  	ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
> -- 
> 2.33.0

-- 
Ville Syrjälä
Intel
