Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6589C7092A2
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 11:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF4710E101;
	Fri, 19 May 2023 09:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D171D10E101
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684487313; x=1716023313;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f8qbA5EPZmlHu38XyLMxtMZezNlSnqXwllZJk5SeuBs=;
 b=AyDSUoSDykj+MVohBouvR5mwC8ZkUFcC9QKp9wdyVWi0PEO9u77th2EP
 Mt3oWeQB6LsUvfydD2R32hiqk5ZrkY+MZG0i87JaK/SpULp4oXPg6km3q
 T7CSm5N93gMzz22SL3F4Vn+uH9Md1Tou/uUNPvAU/+l/GEx5Q/3p0fsAQ
 My2LAGUZDhufzw8YEqPHXwoH98jFPmN783tOPH/X8llbghiH5Ir/gpYZ3
 KiDj5c1+d7WLFVbrlsemjyh0w1GRgK9nR+W+f9IFfsjc4Snty2sVZ/kXk
 F7lsmmK2+H8LzFtaaMWo+i3YXLACUKFUpitwSpUGMbDDCmBOobv4TRuYQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="352343154"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="352343154"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="792301651"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="792301651"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:08:32 -0700
Date: Fri, 19 May 2023 11:08:30 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/managed: Define drmm_mutex_init() as a macro to fix
 lockdep
Message-ID: <20230519090830.GA650806@linux.intel.com>
References: <20230519085525.1275339-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519085525.1275339-1-boris.brezillon@collabora.com>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, May 19, 2023 at 10:55:25AM +0200, Boris Brezillon wrote:
> drmm_mutex_init() needs to be defined as a macro if we want
> lockdep to classify locks properly. If we don't do that, all locks
> will be considered as belonging to the same lock class, leading to
> false positive deadlock reports.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reported-by: Sarah Walker <sarah.walker@imgtec.com>

FYI: we have similar patch already posted:
https://lore.kernel.org/dri-devel/20230517152244.348171-1-matthew.auld@intel.com/

Regards
Stanislaw

> ---
>  drivers/gpu/drm/drm_managed.c | 26 --------------------------
>  include/drm/drm_managed.h     | 30 +++++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 4cf214de50c4..71c49819a7a2 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -263,29 +263,3 @@ void drmm_kfree(struct drm_device *dev, void *data)
>  	free_dr(dr_match);
>  }
>  EXPORT_SYMBOL(drmm_kfree);
> -
> -static void drmm_mutex_release(struct drm_device *dev, void *res)
> -{
> -	struct mutex *lock = res;
> -
> -	mutex_destroy(lock);
> -}
> -
> -/**
> - * drmm_mutex_init - &drm_device-managed mutex_init()
> - * @dev: DRM device
> - * @lock: lock to be initialized
> - *
> - * Returns:
> - * 0 on success, or a negative errno code otherwise.
> - *
> - * This is a &drm_device-managed version of mutex_init(). The initialized
> - * lock is automatically destroyed on the final drm_dev_put().
> - */
> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
> -{
> -	mutex_init(lock);
> -
> -	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
> -}
> -EXPORT_SYMBOL(drmm_mutex_init);
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 359883942612..87ffb92a16ba 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -105,6 +105,34 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>  
>  void drmm_kfree(struct drm_device *dev, void *data);
>  
> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
> +/* Private function, don't use. */
> +static inline void __drmm_mutex_release(struct drm_device *dev, void *res)
> +{
> +	struct mutex *lock = res;
> +
> +	mutex_destroy(lock);
> +}
> +
> +/**
> + * drmm_mutex_init - &drm_device-managed mutex_init()
> + * @dev: DRM device
> + * @lock: lock to be initialized
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + *
> + * This is a &drm_device-managed version of mutex_init(). The initialized
> + * lock is automatically destroyed on the final drm_dev_put().
> + *
> + * This needs to be defined as a macro to let lockdep classify locks
> + * properly. If we don't do that, all locks will be considered as
> + * belonging to the same lock class, leading to false positive lockdep
> + * reports.
> + */
> +#define drmm_mutex_init(dev, lock) \
> +	({\
> +		mutex_init(lock); \
> +		drmm_add_action_or_reset(dev, __drmm_mutex_release, lock); \
> +	})
>  
>  #endif
> -- 
> 2.40.1
> 
