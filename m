Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDEF87241A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE19A112BE8;
	Tue,  5 Mar 2024 16:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESo5pM+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282B0112BEA;
 Tue,  5 Mar 2024 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709655944; x=1741191944;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=40eSUX/VljPh55bLVd15eMDKqIxcw68IpaBVs4wZma0=;
 b=ESo5pM+ZRd3U8yFJNSUBJdwL78EuoOOsEQEvPCm7lUz7iUADLsZw/yhQ
 1nSZ0Ff7aLADAMW6rBfPR31S6X8OMagpewcjAve7Ut+uURS27+8fSXOMv
 Vuyl1wdghGRpVqwxSAoT92RK1ihi8XB6pTSYdObTSxfID6SnVWPKuHDuZ
 ZOr3nH2hbiaPBQvqi3t672aUyFg7MonJWvFZf5K86RHQ9qwb25xwKccje
 MsKW029k9RzXXOJU9uAM/utboztzsLohm8FkSjFLEGRuWPaJnYqc789im
 5fXDm/pk3qAxWkqOS/jPRBdbOmJh2qrNnQOpZH217oVv7lSyrGXpPBJAQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="26677153"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="26677153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:25:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9588764"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:25:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
Cc: joonas.lahtinen@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v7 2/6] drm/i915: Unregister in-kernel clients
In-Reply-To: <ZedDHPupthhNWte8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240301134448.31289-1-tzimmermann@suse.de>
 <20240301134448.31289-3-tzimmermann@suse.de> <ZedDHPupthhNWte8@intel.com>
Date: Tue, 05 Mar 2024 18:25:28 +0200
Message-ID: <878r2w1w93.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Mar 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, Mar 01, 2024 at 02:42:55PM +0100, Thomas Zimmermann wrote:
>> Unregister all in-kernel clients before unloading the i915 driver. For
>> other drivers, drm_dev_unregister() does this automatically. As i915
>> does not use this helper, it has to perform the call by itself. For xe,
>> do the same in xe_device_remove()
>> 
>> Note that there are currently no in-kernel clients in i915 or xe. The
>> patch prepares the drivers for a related update of their fbdev support.
>> 
>> v7:
>> 	* update xe driver
>> 
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/i915/i915_driver.c | 3 +++
>>  drivers/gpu/drm/xe/xe_device.c     | 3 +++
>>  2 files changed, 6 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 9ee902d5b72c4..97910a85e3917 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -41,6 +41,7 @@
>>  
>>  #include <drm/drm_aperture.h>
>>  #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_client.h>
>>  #include <drm/drm_ioctl.h>
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_probe_helper.h>
>> @@ -852,6 +853,8 @@ void i915_driver_remove(struct drm_i915_private *i915)
>>  {
>>  	intel_wakeref_t wakeref;
>>  
>> +	drm_client_dev_unregister(&i915->drm);
>> +
>>  	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>>  
>>  	i915_driver_unregister(i915);
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 919ad88f0495a..7f41f0ec819f0 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>
> probably deserves a separate patch since this is one here is named 'drm/i915:'

Or do this for both in intel_display_driver_unregister()?

BR,
Jani.


>
>> @@ -9,6 +9,7 @@
>>  
>>  #include <drm/drm_aperture.h>
>>  #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_client.h>
>>  #include <drm/drm_gem_ttm_helper.h>
>>  #include <drm/drm_ioctl.h>
>>  #include <drm/drm_managed.h>
>> @@ -614,6 +615,8 @@ void xe_device_remove(struct xe_device *xe)
>>  	struct xe_gt *gt;
>>  	u8 id;
>>  
>> +	drm_client_dev_unregister(&xe->drm);
>> +
>>  	xe_device_remove_display(xe);
>>  
>>  	xe_display_fini(xe);
>> -- 
>> 2.43.2
>> 

-- 
Jani Nikula, Intel
