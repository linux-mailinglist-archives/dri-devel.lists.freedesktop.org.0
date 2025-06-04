Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE2ACDC0F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1007910E715;
	Wed,  4 Jun 2025 10:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftBSYJD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784F010E600;
 Wed,  4 Jun 2025 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749033839; x=1780569839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0HSLugeSnhV9sYxcrnzzq7+6J5CDJUPyKHIls88ft1I=;
 b=ftBSYJD7jcAdGukkuERrUWag2H6jrVwoqo7H5asR9xXC9meeY9uzrqZ0
 OArwDW+UYMnexVJNnGz6iWggW9ClbAjep7fs19LVkNMst++GgzCAKHk8p
 SHjd9f/pcqt5ZxQ6+Ddm4aEUEPbJbMQBicy3wAnL1bRZM8CY570+SvntP
 hJjTg9EzEnhAfgAshrrsYo6S+VHEZyQwW18cO5Po5ztATcrP3EIV1hm1l
 Ogum3w6hIoWCZ0H9dty7ZovoOhcV2GlbbezuUfW/hnwA8A+Ire8UCE1LN
 z2d6YeKTCwuqmdW7PztQ5XQQ8XbF83BHbZTYrlS8pyRWAEIib9YOINxtR g==;
X-CSE-ConnectionGUID: zTZ7Yjp+QHSczGellbTRiQ==
X-CSE-MsgGUID: ntR0jI5LQP629Hf/wCfvdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50976813"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50976813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:43:58 -0700
X-CSE-ConnectionGUID: k8Z/teZlRgaW7FzPsrvnng==
X-CSE-MsgGUID: EzkwzdghT7C9g38Y5yOuDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145022329"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:43:55 -0700
Date: Wed, 4 Jun 2025 13:43:52 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 himal.prasad.ghimiray@intel.com, frank.scarbrough@intel.com
Subject: Re: [PATCH 1/4] drm: Add a firmware flash method to device wedged
 uevent
Message-ID: <aEAjaGK9BYK89U3Z@black.fi.intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
 <20250603081409.1509709-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603081409.1509709-2-riana.tauro@intel.com>
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

On Tue, Jun 03, 2025 at 01:43:57PM +0530, Riana Tauro wrote:
> A device is declared wedged when it is non-recoverable from
> the driver context. Some firmware errors can also cause
> the device to enter this state and the only method to recover
> from this would be to do a firmware flash
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 6 +++---
>  drivers/gpu/drm/drm_drv.c      | 2 ++
>  include/drm/drm_device.h       | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 4863a4deb0ee..524224afb09f 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>  more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +(like soft/hard system reboot, physical device replacement or any other procedure
> +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +434,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    firmware-flash  unbind + firmware flash + bind

Can you guarantee this to be generic for all drivers?

Raag
