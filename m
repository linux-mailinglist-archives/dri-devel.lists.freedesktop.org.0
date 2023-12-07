Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B188808550
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194C10E84E;
	Thu,  7 Dec 2023 10:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4731310E84E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701944301; x=1733480301;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pAy4PHd84Yjn6i03R04EdJXuK+gLbEJD4i+98NoFO74=;
 b=ZUj1sXzR3BcMoPVOegt8Y6N6M3TwnV1K+voJ4w8YaubyqRc1VEYsB/x9
 0kTAQme1kI6gNJ1eswD3OVU7Yqgy0UPI/XMp21ufovdKoET5bT/0PFRsm
 FWKJdriCHyu7UTUTMq61h9iu1fUHao/jTQCMszmql6pNbhShxiSAzJKQS
 Rc5QipWM0cnJOeOlquGZJ29vA8M0Nz7J7i8/zMLeZlpyeZgRi3WWhFASA
 HhhmjXPDxT5dZ2sdj4v6v3urF5DGeQxuvODQrhpOxympmE70T0wEafBqr
 pb85h8UAdBng2NzWx0TkBwbsEk2xKhkC0hN3qK39c7NJNu25lL9cjY3s3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1279469"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1279469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19660925"
Received: from mrehana-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:18:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/4] drm/plane: Make init functions panic consitently
 and explicitly
In-Reply-To: <20231206111351.300225-1-mripard@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231206111351.300225-1-mripard@kernel.org>
Date: Thu, 07 Dec 2023 12:18:13 +0200
Message-ID: <87a5qm1fkq.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Dec 2023, Maxime Ripard <mripard@kernel.org> wrote:
> All of the current plane init / allocation functions behave slightly
> differently when it comes to argument sanitizing:
>
>  - drm_universal_plane_init() implicitly panics if the drm_device
>    pointer or the drm_plane_funcs pointer are NULL, and calls WARN_ON if
>    there's no destroy implementation but goes on with the initialization.
>
>  - drm_universal_plane_alloc() implicitly panics if the drm_device
>    pointer is NULL, and will call WARN_ON and return an error if the
>    drm_plane_funcs pointer is NULL.
>
>  - drmm_universal_plane_alloc() implicitly panics if the drm_device
>    pointer is NULL, and will call WARN_ON and return an error if the
>    drm_plane_funcs pointer is NULL or if there is a destroy
>    implementation.

NULL deref oopses but doesn't necessarily panic, right? Adding BUG() or
BUG_ON() to unconditionally panic is not the way to go, either.

BR,
Jani.


>
> The current consensus is that the drm_device pointer, the
> drm_plane_funcs pointer, and the drm_plane pointer if relevant, should
> be considered pre-requisite and the function should panic if we
> encounter such a situation, and that returning an error in such a
> situation is not welcome.
>
> Let's make all functions consider those three pointers to be always set
> and explicitly panic if they aren't. And let's document that behaviour
> too.
>
> Link: https://lore.kernel.org/dri-devel/20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_plane.c | 15 +++++++++++----
>  include/drm/drm_plane.h     |  6 ++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 9e8e4c60983d..ce0fa98a0e3f 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -482,6 +482,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>   *
>   * Returns:
>   * Zero on success, error code on failure.
> + *
> + * Panics:
> + * If @dev, @plane or @funcs are NULL.
>   */
>  int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
>  			     uint32_t possible_crtcs,
> @@ -494,6 +497,9 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
>  	va_list ap;
>  	int ret;
>  
> +	BUG_ON(!dev);
> +	BUG_ON(!plane);
> +	BUG_ON(!funcs);
>  	WARN_ON(!funcs->destroy);
>  
>  	va_start(ap, name);
> @@ -528,8 +534,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev, size_t size,
>  	va_list ap;
>  	int ret;
>  
> -	if (WARN_ON(!funcs || funcs->destroy))
> -		return ERR_PTR(-EINVAL);
> +	BUG_ON(!dev);
> +	BUG_ON(!funcs);
> +	WARN_ON(funcs->destroy);
>  
>  	container = drmm_kzalloc(dev, size, GFP_KERNEL);
>  	if (!container)
> @@ -567,8 +574,8 @@ void *__drm_universal_plane_alloc(struct drm_device *dev, size_t size,
>  	va_list ap;
>  	int ret;
>  
> -	if (drm_WARN_ON(dev, !funcs))
> -		return ERR_PTR(-EINVAL);
> +	BUG_ON(!dev);
> +	BUG_ON(!funcs);
>  
>  	container = kzalloc(size, GFP_KERNEL);
>  	if (!container)
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index c6565a6f9324..2dab1b360fa2 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -824,6 +824,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
>   *
>   * Returns:
>   * Pointer to new plane, or ERR_PTR on failure.
> + *
> + * Panics:
> + * If @dev or @funcs are NULL.
>   */
>  #define drmm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
>  				   format_count, format_modifiers, plane_type, name, ...) \
> @@ -868,6 +871,9 @@ void *__drm_universal_plane_alloc(struct drm_device *dev,
>   *
>   * Returns:
>   * Pointer to new plane, or ERR_PTR on failure.
> + *
> + * Panics:
> + * If @dev or @funcs are NULL.
>   */
>  #define drm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
>  				   format_count, format_modifiers, plane_type, name, ...) \

-- 
Jani Nikula, Intel
