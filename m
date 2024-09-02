Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6D96825D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FD010E264;
	Mon,  2 Sep 2024 08:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jI4qn8wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CA510E259;
 Mon,  2 Sep 2024 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725266956; x=1756802956;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9Wj+2wzibliCuxzZyWPyPWMg3OD23kyW+0P1Z8qTaC0=;
 b=jI4qn8wch35179v47uT3BtY8ywt7zlaSweVlRpLb9i7IFU9CGoOBsVTk
 iqT5igSSLc1H8weHRZf8eALke+0qQbJmceRuMhy6PBuUErmyMjOz4Fifq
 b5QcnLPxyn92niTmaLV+fJjQ7eADDa/a08L2+3ZO+2wnmBxyeyvzsO9zF
 ZMe2I7qHgUwT28EF08ZD71nBGmGNrVqzvhHFKgbFrkCfOXmE/QpSeC+PS
 7R0oxtplflUO8PBkXxx9WOwQgoyESr62jwgm6vZGfoKcuu05Ah65SZNik
 qXX6Cu7Yfg+AzWb5sG9S4CeyvBy42b3Rg4qmLRdwGF4n0C3WyOsGTh7K5 g==;
X-CSE-ConnectionGUID: 4eV90TavSd6ovG12boX3Sg==
X-CSE-MsgGUID: KeHXQGOqTR296rhPjKV+Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23706721"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23706721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 01:49:16 -0700
X-CSE-ConnectionGUID: WNfUaGuERs+tdCI+2XRvvQ==
X-CSE-MsgGUID: O1Zjf5U8SPi6QKi2ASouQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="69352917"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 01:49:12 -0700
Message-ID: <9011dfee-3f69-4d80-90e1-efffc6576740@linux.intel.com>
Date: Mon, 2 Sep 2024 14:22:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/i915: Use device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, daniel@ffwll.ch,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, anshuman.gupta@intel.com,
 bellekallu.rajkiran@intel.com, saikishore.konda@intel.com
References: <20240902074859.2992849-1-raag.jadav@intel.com>
 <20240902074859.2992849-4-raag.jadav@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240902074859.2992849-4-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 02/09/24 13:18, Raag Jadav wrote:
> Now that we have device wedged event supported by DRM core, make use
> of it. With this in place, userspace will be notified of wedged device
> on gt reset failure.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 735cd23a43c6..60d09ec536c4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1409,6 +1409,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  
>  	if (!test_bit(I915_WEDGED, &gt->reset.flags))
>  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
> +	else
> +		drm_dev_wedged(&gt->i915->drm);
>  }
rather than intel_gt_reset_global, __intel_get_set_wedged looks to be
an appropriate place where actually the device is declared wedged and
that would cover all call sites too.

Thanks,
Aravind.
>  
>  /**
