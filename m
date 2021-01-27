Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C951E305C19
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29016E81A;
	Wed, 27 Jan 2021 12:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16F6E7D1;
 Wed, 27 Jan 2021 12:53:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23714177-1500050 for multiple; Wed, 27 Jan 2021 12:52:53 +0000
MIME-Version: 1.0
In-Reply-To: <20210127124135.11750-2-tzimmermann@suse.de>
References: <20210127124135.11750-1-tzimmermann@suse.de>
 <20210127124135.11750-2-tzimmermann@suse.de>
Subject: Re: [PATCH v5 1/5] drm/i915: Remove references to struct
 drm_device.pdev
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com
Date: Wed, 27 Jan 2021 12:52:55 +0000
Message-ID: <161175197533.2943.2162038120755672032@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Thomas Zimmermann (2021-01-27 12:41:31)
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 0188f877cab2..2a07a008de2e 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -146,7 +146,6 @@ struct drm_i915_private *mock_gem_device(void)
>         }
>  
>         pci_set_drvdata(pdev, i915);
> -       i915->drm.pdev = pdev;

Strictly this removal is still too early. Though it's a mock device and
we shouldn't be touching the pci_dev that often, semantically those
accesses are not removed until later.

>  
>         dev_pm_domain_set(&pdev->dev, &pm_domain);
>         pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> index 7270fc8ca801..5c7ae40bba63 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> @@ -74,7 +74,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
>         ppgtt->vm.i915 = i915;
>         ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
>         ppgtt->vm.file = ERR_PTR(-ENODEV);
> -       ppgtt->vm.dma = &i915->drm.pdev->dev;
> +       ppgtt->vm.dma = i915->drm.dev;

We can remove this shorthand later.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
