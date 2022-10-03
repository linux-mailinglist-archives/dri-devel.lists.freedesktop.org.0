Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC485F3756
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 22:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3810E4D8;
	Mon,  3 Oct 2022 20:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA9110E4D8;
 Mon,  3 Oct 2022 20:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664830241; x=1696366241;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6VqIHYFgFIEoyzTdi1njUX9Hl4jD6f5/e4y6Z84H70E=;
 b=L7nZ9axYClhvimPlRs/NPve2Z87tDNOGYyU7z4WnT3AHBOUcco/O6PZt
 2I1rKQdiQEh8Swk7sxBTAwNU1jnQEz/p27w4+3HR2yM1uTLGiZLng2zcQ
 +zZdihRWJhb8QX0WA8r2LAevXFQRGaSREntTgAlfN6rbOHDTokEWlUYRk
 ybdVqNyw9k6gVNd9Kf6JMAc+OI2NZ5T/nNWoGCmQP9DAx48T4Ppp9buDV
 e2s7IvOu3Zptf4Cku8x50UzUXtpZ+unA9pM2rA4NVVIss0omJ0+PjKw69
 jAqQw+omdcCyn3SLIVM7fXSTpd9fGB7KbU2giOQt5fjESZIn5wUStBkq1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="329157760"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="329157760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 13:50:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="654518823"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="654518823"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 13:50:38 -0700
Date: Mon, 3 Oct 2022 22:50:34 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Message-ID: <YztLGogsP+U+FIFT@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-2-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

On Tue, Sep 27, 2022 at 11:20:14AM +0530, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> The i915 HWMON module will be used to expose voltage, power and energy
> values for dGfx. Here we set up i915 hwmon infrastructure including i915
> hwmon registration, basic data structures and functions.
> 
> v2:
>   - Create HWMON infra patch (Ashutosh)
>   - Fixed review comments (Jani)
>   - Remove "select HWMON" from i915/Kconfig (Jani)
> v3: Use hwm_ prefix for static functions (Ashutosh)
> v4: s/#ifdef CONFIG_HWMON/#if IS_REACHABLE(CONFIG_HWMON)/ since the former
>     doesn't work if hwmon is compiled as a module (Guenter)
> v5: Fixed review comments (Jani)
> v6: s/kzalloc/devm_kzalloc/ (Andi)
> v7: s/hwmon_device_register_with_info/
>       devm_hwmon_device_register_with_info/ (Ashutosh)
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
