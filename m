Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4D36C5BB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81E189DC7;
	Tue, 27 Apr 2021 12:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94AD89DC7;
 Tue, 27 Apr 2021 12:04:40 +0000 (UTC)
IronPort-SDR: 9zNAJBTGEdTyx6Zjr3pQoDQ6YZb6VqTmsUXhu5c8nHKeZtAaIwxGSKbUmbAtibHhn/FCwM6M06
 /UvpzChX89fQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="175977673"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="175977673"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 05:04:40 -0700
IronPort-SDR: 9tB3YugfbNxWBsAfT/NQ+yh95Jln8hi3KrTANEqfSfjhvo2fTXMdJL5pNOBdNtbvW1kGAX5Azn
 iJ/e5jX+YQaQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="429785760"
Received: from aalbarra-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.41.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 05:04:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk
Subject: Re: [PATCH v7 0/4] drm: Move struct drm_device.pdev to legacy
In-Reply-To: <20210427111421.2386-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210427111421.2386-1-tzimmermann@suse.de>
Date: Tue, 27 Apr 2021 15:04:34 +0300
Message-ID: <87v9883pd9.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> V7 of the patchset fixes some bitrot in the intel driver.
>
> The pdev field in struct drm_device points to a PCI device structure and
> goes back to UMS-only days when all DRM drivers were for PCI devices.
> Meanwhile we also support USB, SPI and platform devices. Each of those
> uses the generic device stored in struct drm_device.dev.
>
> To reduce duplication and remove the special case of PCI, this patchset
> converts all modesetting drivers from pdev to dev and makes pdev a field
> for legacy UMS drivers.
>
> For PCI devices, the pointer in struct drm_device.dev can be upcasted to
> struct pci_device; or tested for PCI with dev_is_pci(). In several places
> the code can use the dev field directly.
>
> After converting all drivers and the DRM core, the pdev fields becomes
> only relevant for legacy drivers. In a later patchset, we may want to
> convert these as well and remove pdev entirely.

On the series,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

How should we merge these?



>
> v7:
> 	* fix instances of pdev that have benn added under i915/
> v6:
> 	* also remove assignment in i915/selftests in later patch (Chris)
> v5:
> 	* remove assignment in later patch (Chris)
> v4:
> 	* merged several patches
> 	* moved core changes into separate patch
> 	* vmwgfx build fix
> v3:
> 	* merged several patches
> 	* fix one pdev reference in nouveau (Jeremy)
> 	* rebases
> v2:
> 	* move whitespace fixes into separate patches (Alex, Sam)
> 	* move i915 gt/ and gvt/ changes into separate patches (Joonas)
>
> Thomas Zimmermann (4):
>   drm/i915/gt: Remove reference to struct drm_device.pdev
>   drm/i915: Remove reference to struct drm_device.pdev
>   drm/i915: Don't assign to struct drm_device.pdev
>   drm: Move struct drm_device.pdev to legacy section
>
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
>  drivers/gpu/drm/i915/i915_drv.c                  | 1 -
>  drivers/gpu/drm/i915/intel_runtime_pm.h          | 2 +-
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c | 1 -
>  include/drm/drm_device.h                         | 6 +++---
>  5 files changed, 5 insertions(+), 7 deletions(-)
>
> --
> 2.31.1
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
