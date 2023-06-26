Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7876873D8C3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 09:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D9D10E183;
	Mon, 26 Jun 2023 07:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC5410E183;
 Mon, 26 Jun 2023 07:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687765704; x=1719301704;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LK1I7Y9xB0oaCr6kyKG+9IR2e8ZYmgTZaZI2mvVKLzg=;
 b=I+8UA+e5jga9x9iJ0hqJOUVvOYjGdV7g5K6HO5PezBEvK23M8DzH3HJI
 m0dTeodPSdTyYQDfkN5DYzc+ckWPUHXJcEPPmlx5794QV8E1vw8xjkU/4
 pzSfywsAsXI1dib/Xw3jC5jeY80k0buz5WdAo2p2URca9tccRBP291TTO
 x615yiMzxVcPqbM/0w0xpMzaJ0UAz5xxfq3HV/JQ7f3FuxU5FfOJj7DIP
 sYYZ6l1Y4cjQZYzhC4qYzpA8IAc38a2Vn7hw1yaltOe5h6/Ui09gYr8k2
 /SKLdBGifcXYbSM7gike0jL3ALa2aX51hKxMipf+sZGfKgF7oiRxkrRqR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="364653461"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="364653461"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 00:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829133001"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829133001"
Received: from mkomuves-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.63.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 00:48:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Pan Xinhui
 <Xinhui.Pan@amd.com>
Subject: Re: [PATCH] drm: Remove the deprecated drm_put_dev() function
In-Reply-To: <20230625050901.393055-1-suijingfeng@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230625050901.393055-1-suijingfeng@loongson.cn>
Date: Mon, 26 Jun 2023 10:48:04 +0300
Message-ID: <87jzvqy897.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 25 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
> As this function can be replaced with drm_dev_unregister() + drm_dev_put(),
> it is already marked as deprecated, so remove it. No functional change.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/drm_drv.c           | 28 ----------------------------
>  drivers/gpu/drm/drm_pci.c           |  3 ++-
>  drivers/gpu/drm/radeon/radeon_drv.c |  3 ++-
>  include/drm/drm_drv.h               |  1 -
>  4 files changed, 4 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 12687dd9e1ac..5057307fe22a 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -406,34 +406,6 @@ void drm_minor_release(struct drm_minor *minor)
>   * possibly leaving the hardware enabled.
>   */
>  
> -/**
> - * drm_put_dev - Unregister and release a DRM device
> - * @dev: DRM device
> - *
> - * Called at module unload time or when a PCI device is unplugged.
> - *
> - * Cleans up all DRM device, calling drm_lastclose().
> - *
> - * Note: Use of this function is deprecated. It will eventually go away
> - * completely.  Please use drm_dev_unregister() and drm_dev_put() explicitly
> - * instead to make sure that the device isn't userspace accessible any more
> - * while teardown is in progress, ensuring that userspace can't access an
> - * inconsistent state.

The last sentence is the crucial one. While the patch has no functional
changes, I believe the goal never was to just mechanically replace one
call with the two.

BR,
Jani.


> - */
> -void drm_put_dev(struct drm_device *dev)
> -{
> -	DRM_DEBUG("\n");
> -
> -	if (!dev) {
> -		DRM_ERROR("cleanup called no dev\n");
> -		return;
> -	}
> -
> -	drm_dev_unregister(dev);
> -	drm_dev_put(dev);
> -}
> -EXPORT_SYMBOL(drm_put_dev);
> -
>  /**
>   * drm_dev_enter - Enter device critical section
>   * @dev: DRM device
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 39d35fc3a43b..b3a68a92eaa6 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -257,7 +257,8 @@ void drm_legacy_pci_exit(const struct drm_driver *driver,
>  					 legacy_dev_list) {
>  			if (dev->driver == driver) {
>  				list_del(&dev->legacy_dev_list);
> -				drm_put_dev(dev);
> +				drm_dev_unregister(dev);
> +				drm_dev_put(dev);
>  			}
>  		}
>  		mutex_unlock(&legacy_dev_list_lock);
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index e4374814f0ef..a4955ae10659 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -357,7 +357,8 @@ radeon_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  
> -	drm_put_dev(dev);
> +	drm_dev_unregister(dev);
> +	drm_dev_put(dev);
>  }
>  
>  static void
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 89e2706cac56..289c97b12e82 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -511,7 +511,6 @@ void drm_dev_unregister(struct drm_device *dev);
>  
>  void drm_dev_get(struct drm_device *dev);
>  void drm_dev_put(struct drm_device *dev);
> -void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);

-- 
Jani Nikula, Intel Open Source Graphics Center
