Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857243B7647
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 18:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A116E8C7;
	Tue, 29 Jun 2021 16:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF186E8C6;
 Tue, 29 Jun 2021 16:11:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="205170316"
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="205170316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 09:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="419649867"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 29 Jun 2021 09:10:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Jun 2021 19:10:46 +0300
Date: Tue, 29 Jun 2021 19:10:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/i915: Drop all references to DRM IRQ midlayer
Message-ID: <YNtGBg1+D6L1MVHl@intel.com>
References: <20210625084740.1586-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210625084740.1586-1-tzimmermann@suse.de>
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
Cc: matthew.brost@intel.com, airlied@linux.ie, mika.kuoppala@linux.intel.com,
 intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 25, 2021 at 10:47:40AM +0200, Thomas Zimmermann wrote:
> Remove all references to DRM's IRQ midlayer.
> 
> The code in xcs_resume() probably didn't work as intended. It uses
> struct drm_device.irq, which is allocated to 0, but never initialized
> by i915 to the device's interrupt number.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 536f77b1caa0 ("drm/i915/gt: Call stop_ring() from ring resume, again")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 3 ++-
>  drivers/gpu/drm/i915/i915_drv.c                 | 1 -
>  drivers/gpu/drm/i915/i915_irq.c                 | 1 -
>  3 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 5d42a12ef3d6..d893aaaed74f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -180,12 +180,13 @@ static bool stop_ring(struct intel_engine_cs *engine)
>  static int xcs_resume(struct intel_engine_cs *engine)
>  {
>  	struct intel_ring *ring = engine->legacy.ring;
> +	struct pci_dev *pdev = to_pci_dev(engine->i915->drm.dev);
>  
>  	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
>  		     ring->head, ring->tail);
>  
>  	/* Double check the ring is empty & disabled before we resume */
> -	synchronize_hardirq(engine->i915->drm.irq);
> +	synchronize_hardirq(pdev->irq);

We have intel_synchronize_irq() to hide all these mundane details.
Might want to add a matching intel_synchronize_hardirq().

>  	if (!stop_ring(engine))
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 850b499c71c8..73de45472f60 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -42,7 +42,6 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_ioctl.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index a11bdb667241..eef616d96f12 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -33,7 +33,6 @@
>  #include <linux/sysrq.h>
>  
>  #include <drm/drm_drv.h>
> -#include <drm/drm_irq.h>
>  
>  #include "display/intel_de.h"
>  #include "display/intel_display_types.h"
> 
> base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> -- 
> 2.32.0

-- 
Ville Syrjälä
Intel
