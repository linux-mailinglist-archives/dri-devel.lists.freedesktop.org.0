Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D511E8A7E3C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CF510F2CF;
	Wed, 17 Apr 2024 08:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1nOdFbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEAC10EB61;
 Wed, 17 Apr 2024 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713342541; x=1744878541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fLwc5QJKW9xWSzTV50z4nM9GSFcxa5YEMRBtnSrODm8=;
 b=F1nOdFbPDVLSZ+e46MF5eAZKj8kmllqdj3tl+uc+6rTmztxBbP+to9w1
 SsmUpI6OOuo/GfMuUx1ulQpPYKNGZhbq7G6XruAzx7zKAHsrU1GTE07yk
 KBe48e84K8wGhHJXyiWSqMZ2d92+GUUGvjR2keGtrEz4aiQE/jZWHVGKk
 YKqVSAl0e4TTKdpImW4piIwoDMsEzTt6veZru9vXicvnQuC21nh/4rGyo
 qmL5Q35zVQoO4jUpdCHikZ8jhakyLDXKCs06rabImKNJdikn24ClYmH6T
 JNwbYh0zDmHfzwR1PNOHIHyJWxP5i5wfiHc2LX75E/qC10Jm0NNhLQ6yy g==;
X-CSE-ConnectionGUID: 13H1nD0/S+WDNv4lhX/JaA==
X-CSE-MsgGUID: wP6BODrBRNSY2tLvrkedqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19380792"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="19380792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:29:00 -0700
X-CSE-ConnectionGUID: pxGiJCywTGqYzrP6I/mu2g==
X-CSE-MsgGUID: Whn9xkY8QmOAwTSMPF0lHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="27104397"
Received: from unknown (HELO intel.com) ([10.247.119.38])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:28:54 -0700
Date: Wed, 17 Apr 2024 10:28:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>,
 Ville =?iso-8859-15?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/i915/hwmon: Get rid of devm
Message-ID: <Zh-IQENH0hHokBbv@ashyti-mobl2.lan>
References: <20240417051642.788740-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417051642.788740-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,

> @@ -839,16 +837,38 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
>  			continue;
>  
> -		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
> -								 ddat_gt,
> -								 &hwm_gt_chip_info,
> -								 NULL);
> -		if (!IS_ERR(hwmon_dev))
> -			ddat_gt->hwmon_dev = hwmon_dev;
> +		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
> +							    ddat_gt,
> +							    &hwm_gt_chip_info,
> +							    NULL);
> +		if (IS_ERR(hwmon_dev))
> +			goto err;

here the logic is changing, though. Before we were not leaving if
hwmon_device_register_with_info() was returning error.

Is this wanted? And why isn't it described in the log?

Thanks,
Andi

> +
> +		ddat_gt->hwmon_dev = hwmon_dev;
>  	}
