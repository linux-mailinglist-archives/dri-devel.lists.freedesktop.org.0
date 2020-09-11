Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4907265C1C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492A6E3A2;
	Fri, 11 Sep 2020 09:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF60A6E398;
 Fri, 11 Sep 2020 09:00:08 +0000 (UTC)
IronPort-SDR: acG04jobFv69NOwv3u2cC/wpIiYJ7ABXW1//NtOnJvicmcYjej6AkXq83nhJAKaUvjmuDDcIej
 7Qqj/OsbZ2+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="220274015"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="220274015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 02:00:06 -0700
IronPort-SDR: rDuZyoacQS3UGl2xXzehJ9a66brFYCu0PmEqYvW/mn3rcNsy+0wVSeqmkF3BzLpuL4YXDw8S19
 YRuD91mqRLeg==
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="286839054"
Received: from atrikali-mobl.amr.corp.intel.com (HELO [10.252.57.76])
 ([10.252.57.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 02:00:01 -0700
Subject: Re: [Intel-gfx] [PATCH 08/24] drm/i915/selftests: align more to real
 device lifetimes
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-9-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <bf227b2f-6fcb-8ff3-8a07-4880d7d9640f@linux.intel.com>
Date: Fri, 11 Sep 2020 10:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904143941.110665-9-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 04-09-2020 om 16:39 schreef Daniel Vetter:
> The big change is device_add so that device_del can auto-cleanup
> devres resources. This allows us to use devm_drm_dev_alloc, which
> removes the last user of drm_dev_init.
>
> v2: Rebased
>
> v3: use devres_open/release_group so we can use devm without real
> hacks in the driver core or having to create an entire fake bus for
> testing drivers. Might want to extract this into helpers eventually,
> maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  .../gpu/drm/i915/selftests/mock_gem_device.c  | 42 +++++++++++--------
>  1 file changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index fbb403edb7a0..164ad1746da9 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -128,12 +128,6 @@ struct drm_i915_private *mock_gem_device(void)
>  	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
>  	if (!pdev)
>  		return NULL;
> -	i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
> -	if (!i915) {
> -		kfree(pdev);
> -		return NULL;
> -	}
> -
>  	device_initialize(&pdev->dev);
>  	pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
>  	pdev->dev.release = release_dev;
> @@ -146,8 +140,29 @@ struct drm_i915_private *mock_gem_device(void)
>  	iommu.priv = (void *)-1;
>  	pdev->dev.iommu = &iommu;
>  #endif
> +	err = device_add(&pdev->dev);
> +	if (err) {
> +		kfree(pdev);
> +		return NULL;
> +	}
> +
> +	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> +		device_del(&pdev->dev);
> +		return NULL;
> +	}
> +
> +	i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
> +				  struct drm_i915_private, drm);
> +	if (err) {
> +		pr_err("Failed to allocate mock GEM device: err=%d\n", err);
> +		devres_release_group(&pdev->dev, NULL);
> +		device_del(&pdev->dev);
> +
> +		return NULL;
> +	}
>  
>  	pci_set_drvdata(pdev, i915);
> +	i915->drm.pdev = pdev;
>  
>  	dev_pm_domain_set(&pdev->dev, &pm_domain);
>  	pm_runtime_enable(&pdev->dev);
> @@ -155,16 +170,6 @@ struct drm_i915_private *mock_gem_device(void)
>  	if (pm_runtime_enabled(&pdev->dev))
>  		WARN_ON(pm_runtime_get_sync(&pdev->dev));
>  
> -	err = drm_dev_init(&i915->drm, &mock_driver, &pdev->dev);
> -	if (err) {
> -		pr_err("Failed to initialise mock GEM device: err=%d\n", err);
> -		put_device(&pdev->dev);
> -		kfree(i915);
> -
> -		return NULL;
> -	}
> -	i915->drm.pdev = pdev;
> -	drmm_add_final_kfree(&i915->drm, i915);
>  
>  	i915_params_copy(&i915->params, &i915_modparams);
>  
> @@ -231,5 +236,8 @@ struct drm_i915_private *mock_gem_device(void)
>  
>  void mock_destroy_device(struct drm_i915_private *i915)
>  {
> -	drm_dev_put(&i915->drm);
> +	struct device *dev = i915->drm.dev;
> +
> +	devres_release_group(dev, NULL);
> +	device_del(dev);
>  }

Looks sane,

For patch 7 and 8:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
