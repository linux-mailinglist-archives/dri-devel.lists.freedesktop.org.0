Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE1262944C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8482410E38F;
	Tue, 15 Nov 2022 09:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8523310E38A;
 Tue, 15 Nov 2022 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668504607; x=1700040607;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QLoXPsN6jGdeW7RcfVk92vFA77fuSIu7j6t5T7QL2HI=;
 b=ZUf2FshTjp1ygnMJIDhewf37+e5/uIVryQMpL1gYw2GBEGcx3CA4linc
 08K/u1hqZJFyoTmrUpXeBfNkfDNiTcFZYGQVRQybrEqAjZoWKi25sugpc
 Hi+R+EFaQzNA4J/iZCz10wDvAt3IEB3HPWeCsOanUgbfUXP6qq9EDSuJG
 Xc8+c5JHe5yOIfx5I6E88QU++RFJhv5JEhJpKNZnMBH/Jy1NTIi3ZUMF/
 PjkUMCSVYSC652NYXaUyNv0j1xb9Yx6WFv4zz2uJD84w0++Bsy90VLZRC
 DvjKvSkTa+FWLi6c7rHyFPDITDZ09GpsS8DPKS2BJV8/HnPgafg/nHfLe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="312212471"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="312212471"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 01:30:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="633174472"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="633174472"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.26.97])
 ([10.213.26.97])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 01:30:03 -0800
Message-ID: <60b5de09-7a3c-3a61-a7a2-a856c8be108e@intel.com>
Date: Tue, 15 Nov 2022 10:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH] drm/fb-helper: Try to protect cleanup against
 delayed setup
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.07.2021 15:59, Daniel Vetter wrote:
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

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 9d82fda274eb..8f11e5abb222 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -598,6 +598,9 @@ EXPORT_SYMBOL(drm_fb_helper_alloc_fbi);
>    * A wrapper around unregister_framebuffer, to release the fb_info
>    * framebuffer device. This must be called before releasing all resources for
>    * @fb_helper by calling drm_fb_helper_fini().
> + *
> + * Note that this is fundamentally racy on hotunload because it doen't handle
> + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
>    */
>   void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
>   {
> @@ -611,6 +614,9 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_fbi);
>    * @fb_helper: driver-allocated fbdev helper, can be NULL
>    *
>    * This cleans up all remaining resources associated with @fb_helper.
> + *
> + * Note that this is fundamentally racy on hotunload because it doen't handle
> + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
>    */
>   void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>   {
> @@ -2382,6 +2388,10 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   
> +	mutex_lock(&fb_helper->lock);
> +	fb_helper->deferred_setup = false;
> +	mutex_unlock(&fb_helper->lock);
> +
>   	if (fb_helper->fbdev)
>   		/* drm_fbdev_fb_destroy() takes care of cleanup */
>   		drm_fb_helper_unregister_fbi(fb_helper);

