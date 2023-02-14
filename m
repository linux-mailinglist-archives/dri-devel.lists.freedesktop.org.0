Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED46962DC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7D410E8A8;
	Tue, 14 Feb 2023 11:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6E910E8A8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676375808; x=1707911808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+9TMZ1BVviUTFTi1jj3OvKVS7NNp6zT+KUDBodDiEuc=;
 b=NxDes8zLog4ioXISIxpfSdnCXg0lLP1nb/O7kvWg4e1Aj/WWm8ElBJuL
 2n2T+Ndv7ah3OH0HYfGO1fHOVJCm3v9diEg+hnX0tR3Eq1k8iMUlghWMk
 aoQZaDPGvWOh231Sy7tAZhpIxBV1nHIsYantisW+MvvywYSxqyhw95DrO
 CTVhZoJHUgZpg4jAPCJVvsp+fNKesTLSyNA8DtGcCHU0d8DpfVB3fcFTn
 PcgWC8kkqbzJYMFpise9oycSSXEFra5+4WZGRlYJR48X9NlkJM1nHX5Oj
 LSFKSAAa0aMiN1fiKx5Znw3XYMf0hTOQDHegvmfmOBIro7xL/MTrkjaeW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="311500442"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="311500442"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:56:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="671201671"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="671201671"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:56:46 -0800
Date: Tue, 14 Feb 2023 12:56:44 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/3] drm/debugfs: separate debugfs creation into init and
 register
Message-ID: <20230214115644.GC2824715@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209081838.45273-2-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 09:18:36AM +0100, Christian König wrote:
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index c6eb8972451a..88ce22c04672 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -156,6 +156,10 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  	if (IS_ERR(minor->kdev))
>  		return PTR_ERR(minor->kdev);
>  
> +	r = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
> +	if (r)
> +		return r;
> +
>  	*drm_minor_get_slot(dev, type) = minor;
>  	return 0;
>  }
> @@ -172,15 +176,10 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>  	if (!minor)
>  		return 0;
>  
> -	if (minor->type == DRM_MINOR_ACCEL) {
> +	if (minor->type == DRM_MINOR_ACCEL)
>  		accel_debugfs_init(minor, minor->index);

Please move this to drm_minor_alloc() as well. Or perhaps make
conditional code for DRM_MINOR_ACCEL inside drm_debugfs_init().

Regards
Stanislaw

> -	} else {
> -		ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
> -		if (ret) {
> -			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> -			goto err_debugfs;
> -		}
> -	}
> +	else
> +		drm_debugfs_register(minor);

>  
>  	ret = device_add(minor->kdev);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index ed2103ee272c..332fb65a935a 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -185,6 +185,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
>  #if defined(CONFIG_DEBUG_FS)
>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root);
> +void drm_debugfs_register(struct drm_minor *minor);
>  void drm_debugfs_cleanup(struct drm_minor *minor);
>  void drm_debugfs_late_register(struct drm_device *dev);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
> -- 
> 2.34.1
> 
