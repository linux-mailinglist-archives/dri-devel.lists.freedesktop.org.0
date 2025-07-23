Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FDB0F4E7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 16:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E10810E175;
	Wed, 23 Jul 2025 14:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0+1Q2t/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8018210E514;
 Wed, 23 Jul 2025 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753279703; x=1784815703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uam3uGSmS8X/U2z5MvULB0BxVpco+wkNtehkt3u+mt4=;
 b=I0+1Q2t/Jk+38bdiyo4OKDBiJR0x1vhTot+SntBWyiSr1vzMHfzrFODf
 lntdOXKZCzX7xa0q3x2ImeX7vw3jxJi4/nS0hi41Lh0yX7eWar91zhMy9
 dlVk57BaUPxm8SyTbCStK9pp5CMzUwpffQigAb0C+GIBi+aXAnGcHGiTn
 mbft351f0m4fJMX88TKcqWDOGwK4O3Hq+oWPCFlBjbdPE1zJLr/2SSvbG
 Pg5SKg71JUQaHoaToOCVNzc/j+gCLHp0dhvI1Dc0YLZ0vWeOeR2gkHfJu
 OkNypKbCgN8z7siui1k+CLmb9z+U3AfXysDEu20OgkX+56NARXhd4U2pg A==;
X-CSE-ConnectionGUID: eJRUa9BbRFGZIsCX/L+H7Q==
X-CSE-MsgGUID: vUFwYwWFRGiPEYy6mjlhDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59220257"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="59220257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:08:22 -0700
X-CSE-ConnectionGUID: SSZkd+7VQwm/2kRLs32b8A==
X-CSE-MsgGUID: +uwbC2FSRkOJfinnQGXK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163601539"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:08:19 -0700
Date: Wed, 23 Jul 2025 17:08:15 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH v5 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Message-ID: <aIDsz7UkxW1XRRtP@black.fi.intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-6-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715104730.2109506-6-riana.tauro@intel.com>
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

On Tue, Jul 15, 2025 at 04:17:25PM +0530, Riana Tauro wrote:
> Certain runtime firmware errors can cause the device to be in a unusable
> state requiring a firmware flash to restore normal operation.
> Runtime Survivability Mode indicates firmware flash is necessary by
> wedging the device and exposing survivability mode sysfs.
> 
> The below sysfs is an indication that device is in survivability mode
> 
> /sys/bus/pci/devices/<device>/survivability_mode

...

> +int xe_survivability_mode_runtime_enable(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int ret;
> +
> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
> +		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = init_survivability_mode(xe);
> +	if (ret)
> +		return ret;
> +
> +	ret = create_survivability_sysfs(pdev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
> +
> +	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
> +	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> +
> +	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> +	xe_device_declare_wedged(xe);
> +	dev_err(&pdev->dev, "Firmware update required, Refer the userspace documentation for more details!\n");

Do we have it? Or did I miss it somewhere? :D

Raag
