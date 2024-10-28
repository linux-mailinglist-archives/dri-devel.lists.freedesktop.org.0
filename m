Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C209B2ABE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1E910E0A8;
	Mon, 28 Oct 2024 08:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrRT3LNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21810E0A8;
 Mon, 28 Oct 2024 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730105413; x=1761641413;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=657hYw7J/Dxe9Ea7h7VmmvLW1VdPQO7SipI2N9ffzt8=;
 b=KrRT3LNiS8OoqcwS4S6tEZqDbpcS3QZ0VQZCkj/medfL094CfCq0g3G4
 svCBVvuPNem+oDa8/uIN6Tf9mBURgnnnZT0gPnXwLDGx2idp+o5b3w0RJ
 PknW/AYclFEXzcJp4g7j1daHEm4N85KfhFR+h+mj7OrbPZGi5dQ+zGEQY
 GBRcaP5j0me6BYvCtEsfRk6KPKW1qJJrjsIZnS6fMyCB8A+D8vJjwiCBN
 uOmiHks6gSVEI8ikPbOVF0SQe/wB3AKaT6Ks7pSLmZ+xI63dnumyegrt5
 EqMofRTn9UqjtW5OOqL74ENntfK6M47guU/n08J0SfmOyO5mvgheXHixg A==;
X-CSE-ConnectionGUID: pSEq8OoBRw2eaJKGhqQKtQ==
X-CSE-MsgGUID: qL1RQSZEQRCZp/0Lp1UpTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29126990"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; d="scan'208";a="29126990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 01:50:12 -0700
X-CSE-ConnectionGUID: +lvN+3RwSQWFs6MEyUaSDw==
X-CSE-MsgGUID: oygOs0J6SVK/IB7Ahnltgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; d="scan'208";a="81715545"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.21])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 01:50:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Raag Jadav
 <raag.jadav@intel.com>
Subject: Re: [PATCH v8 1/4] drm: Introduce device wedged event
In-Reply-To: <87r084r1lp.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241025084817.144621-1-raag.jadav@intel.com>
 <20241025084817.144621-2-raag.jadav@intel.com> <87r084r1lp.fsf@intel.com>
Date: Mon, 28 Oct 2024 10:50:02 +0200
Message-ID: <87ttcwpq6d.fsf@intel.com>
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

On Fri, 25 Oct 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Fri, 25 Oct 2024, Raag Jadav <raag.jadav@intel.com> wrote:
>> @@ -70,6 +73,16 @@ static struct dentry *drm_debugfs_root;
>>  
>>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>  
>> +/*
>> + * Available recovery methods for wedged device. To be sent along with device
>> + * wedged uevent.
>> + */
>> +static const char *const drm_wedge_recovery_opts[] = {
>> +	[ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]	= "rebind",
>> +	[ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1]	= "bus-reset",
>> +};
>> +static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
>
> This might work in most cases, but you also might end up finding that
> there's an arch and compiler combo out there that just won't be able to
> figure out ffs() at compile time, and the array initialization fails.

And the kernel test robot hits exactly this.

BR,
Jani.


-- 
Jani Nikula, Intel
