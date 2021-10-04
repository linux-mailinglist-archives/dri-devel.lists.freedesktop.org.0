Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCE420740
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 10:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC346E956;
	Mon,  4 Oct 2021 08:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8D86E956
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 08:23:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="225652788"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="225652788"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 01:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="621770538"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 04 Oct 2021 01:23:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 11:23:29 +0300
Date: Mon, 4 Oct 2021 11:23:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kernel@amanoeldawod.com,
 dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev: Clamp fbdev surface size if too large
Message-ID: <YVq6AffkPKB62aGF@intel.com>
References: <20211004081506.6791-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004081506.6791-1-tzimmermann@suse.de>
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

On Mon, Oct 04, 2021 at 10:15:06AM +0200, Thomas Zimmermann wrote:
> Clamp the fbdev surface size of the available maximum height to avoid
> failing to init console emulation. An example error is shown below.
> 
>   bad framebuffer height 2304, should be >= 768 && <= 768
>   [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on minor 0
>   simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-22)
> 
> This is especially a problem with drivers that have very small screen
> sizes and cannot over-allocate at all.
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
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 6860223f0068..364f11900b37 100644
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
> +		drm_warn(dev, "Fbdev over-allocation too large; clamping height to %d\n",
> +			 config->max_height);

drm_warn() seems a bit excessive. drm_info()?

Or could just have no printk and use a simple min() perhaps.

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
