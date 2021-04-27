Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805E36C69B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 15:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65EE6E1FB;
	Tue, 27 Apr 2021 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73C6E1FB;
 Tue, 27 Apr 2021 13:00:42 +0000 (UTC)
IronPort-SDR: fEAQh4vG8/uHa8Nzeb6v5m87FpIWBjLYMFqPC28DUrULOafkF9Mv/6obJiwUSQauJyrOc5ll07
 tEpll8CY3wuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="175985086"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="175985086"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 06:00:16 -0700
IronPort-SDR: KNAd0Qsix3RNh8qUtI46oiFbypF46d65jdPTJ+Aa4nLb4wbLT7DuJQoB9ftSSape1lhdusLDcu
 GlrkkD2uZyHQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="429801515"
Received: from aalbarra-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.41.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 06:00:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk
Subject: Re: [PATCH v7 0/4] drm: Move struct drm_device.pdev to legacy
In-Reply-To: <495a983e-f995-e63c-b63b-9a29daa2edbf@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210427111421.2386-1-tzimmermann@suse.de>
 <87v9883pd9.fsf@intel.com> <495a983e-f995-e63c-b63b-9a29daa2edbf@suse.de>
Date: Tue, 27 Apr 2021 16:00:07 +0300
Message-ID: <87o8dz51d4.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi Jani
>
> Am 27.04.21 um 14:04 schrieb Jani Nikula:
>> On Tue, 27 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> V7 of the patchset fixes some bitrot in the intel driver.
>>>
>>> The pdev field in struct drm_device points to a PCI device structure and
>>> goes back to UMS-only days when all DRM drivers were for PCI devices.
>>> Meanwhile we also support USB, SPI and platform devices. Each of those
>>> uses the generic device stored in struct drm_device.dev.
>>>
>>> To reduce duplication and remove the special case of PCI, this patchset
>>> converts all modesetting drivers from pdev to dev and makes pdev a field
>>> for legacy UMS drivers.
>>>
>>> For PCI devices, the pointer in struct drm_device.dev can be upcasted to
>>> struct pci_device; or tested for PCI with dev_is_pci(). In several places
>>> the code can use the dev field directly.
>>>
>>> After converting all drivers and the DRM core, the pdev fields becomes
>>> only relevant for legacy drivers. In a later patchset, we may want to
>>> convert these as well and remove pdev entirely.
>> 
>> On the series,
>> 
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> How should we merge these?
>
> Thanks for the quick reply.
>
> There is another pdev patch that I just sent out. [1] It has to go into 
> the intel tree. After it landed, I want to get this patchset into 
> drm-misc-next ASAP. Otherwise, drm-tip would stop building.

On merging the series via drm-misc-next,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> This should fix things in the correct order and finally remove pdev for 
> current drivers.
>
> Best regards
> Thomas
>
> [1] 
> https://lore.kernel.org/dri-devel/20210427110747.2065-1-tzimmermann@suse.de/T/#u
>
>> 
>> 
>> 
>>>
>>> v7:
>>> 	* fix instances of pdev that have benn added under i915/
>>> v6:
>>> 	* also remove assignment in i915/selftests in later patch (Chris)
>>> v5:
>>> 	* remove assignment in later patch (Chris)
>>> v4:
>>> 	* merged several patches
>>> 	* moved core changes into separate patch
>>> 	* vmwgfx build fix
>>> v3:
>>> 	* merged several patches
>>> 	* fix one pdev reference in nouveau (Jeremy)
>>> 	* rebases
>>> v2:
>>> 	* move whitespace fixes into separate patches (Alex, Sam)
>>> 	* move i915 gt/ and gvt/ changes into separate patches (Joonas)
>>>
>>> Thomas Zimmermann (4):
>>>    drm/i915/gt: Remove reference to struct drm_device.pdev
>>>    drm/i915: Remove reference to struct drm_device.pdev
>>>    drm/i915: Don't assign to struct drm_device.pdev
>>>    drm: Move struct drm_device.pdev to legacy section
>>>
>>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
>>>   drivers/gpu/drm/i915/i915_drv.c                  | 1 -
>>>   drivers/gpu/drm/i915/intel_runtime_pm.h          | 2 +-
>>>   drivers/gpu/drm/i915/selftests/mock_gem_device.c | 1 -
>>>   include/drm/drm_device.h                         | 6 +++---
>>>   5 files changed, 5 insertions(+), 7 deletions(-)
>>>
>>> --
>>> 2.31.1
>>>
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
