Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154298A3DC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8DF10E44C;
	Mon, 30 Sep 2024 13:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAjlncC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9BE10E44B;
 Mon, 30 Sep 2024 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727701307; x=1759237307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O5ovp6Z+zv6Rf6pFDnMixqOyzUDFy5xBNhe+/cOxtJY=;
 b=FAjlncC0mAjk66f6UdR5tW3Xm+BOua1j/95j2hKyCdwtM356CBi0CwRx
 bkWq++YF7GVQ7ORY3bcr6Zr9a5JJsBTCBy6Orr9UGlfwRebDIv7SAAQK/
 gMnEh5BUb06e6FgJudlH1R+SekPbfMRzJw6Kt+nz9UZYBdHopAUuvVNec
 FHRNiTMnR3MDqjfvMeUUtSNwwSccwxz0k6/FpJ8I1tk3MuiJDDX905xG0
 NINNmxmVJalcZGVDYDaa6VGgl+DQChJcDvTZBjmye7zcs0rlKvVNPynPB
 qKAkQAKozLQhmh90ZHUyagHd1PEeDCR2KsQrhXilHrGHItV0s6SC36wVi g==;
X-CSE-ConnectionGUID: pHu5MiMORBK2cKV3J5NMkQ==
X-CSE-MsgGUID: +CSyYALzRS6SM3kBwMQGIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26740878"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26740878"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:01:47 -0700
X-CSE-ConnectionGUID: xoHrf/bkTzC3ZUncPys43g==
X-CSE-MsgGUID: 1wkKA7a8T4mWgCKUhhPdZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78257208"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:01:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1svG1z-0000000EfLa-0XOG; Mon, 30 Sep 2024 16:01:39 +0300
Date: Mon, 30 Sep 2024 16:01:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v7 2/5] drm: Expose wedge recovery methods
Message-ID: <ZvqhMt14GKju1B0X@smile.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-3-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930073845.347326-3-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Sep 30, 2024 at 01:08:42PM +0530, Raag Jadav wrote:
> Now that we have device wedged event in place, add wedge_recovery sysfs
> attribute which will expose recovery methods supported by the DRM device.
> This is useful for userspace consumers in cases where the device supports
> multiple recovery methods which can be used as fallbacks.
> 
>   $ cat /sys/class/drm/card<N>/wedge_recovery
>   rebind
>   bus-reset
>   reboot

...

> +static ssize_t wedge_recovery_show(struct device *device,
> +				   struct device_attribute *attr, char *buf)

Looking at the below line it seems you are fine with 100 limit, so, why two
lines above if they perfectly fit 100?

> +{
> +	struct drm_minor *minor = to_drm_minor(device);
> +	struct drm_device *dev = minor->dev;
> +	unsigned int method, count = DRM_WEDGE_RECOVERY_REBIND;
> +
> +	for_each_set_bit(method, &dev->wedge_recovery, DRM_WEDGE_RECOVERY_MAX)
> +		count += sysfs_emit_at(buf, count, "%s\n", drm_wedge_recovery_name(method));
> +
> +	return count;
> +}

-- 
With Best Regards,
Andy Shevchenko


