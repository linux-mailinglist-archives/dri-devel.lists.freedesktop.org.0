Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B93C77D8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 22:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511E06E123;
	Tue, 13 Jul 2021 20:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2536589FCC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 20:21:29 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id e349d41a-e417-11eb-9082-0050568c148b;
 Tue, 13 Jul 2021 20:21:21 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 54F2B194B15;
 Tue, 13 Jul 2021 22:21:37 +0200 (CEST)
Date: Tue, 13 Jul 2021 22:21:23 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/fb-helper: Try to protect cleanup against delayed
 setup
Message-ID: <YO31w67WHcyz8btB@ravnborg.org>
References: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Jul 13, 2021 at 03:59:22PM +0200, Daniel Vetter wrote:
> Some vague evidences suggests this can go wrong. Try to prevent it by
> holding the right mutex and clearing ->deferred_setup to make sure we
> later on don't accidentally try to re-register the fbdev when the
> driver thought it had it all cleaned up already.
> 
> v2: I realized that this is fundamentally butchered, and CI complained
> about lockdep splats. So limit the critical section again and just add
> a few notes what the proper fix is.
> 
> References: https://intel-gfx-ci.01.org/tree/linux-next/next-20201215/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 9d82fda274eb..8f11e5abb222 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -598,6 +598,9 @@ EXPORT_SYMBOL(drm_fb_helper_alloc_fbi);
>   * A wrapper around unregister_framebuffer, to release the fb_info
>   * framebuffer device. This must be called before releasing all resources for
>   * @fb_helper by calling drm_fb_helper_fini().
> + *
> + * Note that this is fundamentally racy on hotunload because it doen't handle
s/doen't/doesn't/
> + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
>   */
>  void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
>  {
> @@ -611,6 +614,9 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_fbi);
>   * @fb_helper: driver-allocated fbdev helper, can be NULL
>   *
>   * This cleans up all remaining resources associated with @fb_helper.
> + *
> + * Note that this is fundamentally racy on hotunload because it doen't handle
s/doen't/doesn't/
> + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
>   */
>  void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>  {
> @@ -2382,6 +2388,10 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>  {
>  	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>  
> +	mutex_lock(&fb_helper->lock);
> +	fb_helper->deferred_setup = false;
> +	mutex_unlock(&fb_helper->lock);
> +
>  	if (fb_helper->fbdev)
>  		/* drm_fbdev_fb_destroy() takes care of cleanup */
>  		drm_fb_helper_unregister_fbi(fb_helper);

I could not find any better spot to clear deferred_setup - so I think
this is OK.

With the two spellign issues fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

No r-b as I an not too fluent in these code paths and all the locking.

	Sam
