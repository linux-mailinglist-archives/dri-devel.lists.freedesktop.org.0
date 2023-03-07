Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB56ADEAA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 13:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7519810E10B;
	Tue,  7 Mar 2023 12:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91FB10E10B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 12:27:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315491283"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="315491283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786684036"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="786684036"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2023 04:27:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andy@kernel.org>) id 1pZWPH-00GuiB-24;
 Tue, 07 Mar 2023 14:27:03 +0200
Date: Tue, 7 Mar 2023 14:27:03 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] backlight: apple_bl: Use acpi_video_get_backlight_type()
Message-ID: <ZActl7YN+u7Yz58m@smile.fi.intel.com>
References: <20230307120540.389920-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307120540.389920-1-hdegoede@redhat.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 Aditya Garg <gargaditya08@live.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:05:40PM +0100, Hans de Goede wrote:
> On some MacBooks both the apple_bl and the apple-gmux backlight drivers
> may be able to export a /sys/class/backlight device.
> 
> To avoid having 2 backlight devices for one LCD panel until now
> the apple-gmux driver has been calling apple_bl_unregister() to move
> the apple_bl backlight device out of the way when it loads.
> 
> Similar problems exist on other x86 laptops and all backlight drivers
> which may be used on x86 laptops have moved to using
> acpi_video_get_backlight_type() to determine whether they should load
> or not.
> 
> Switch apple_bl to this model too, so that it is consistent with all
> the other x86 backlight drivers.
> 
> Besides code-simplification and consistency this has 2 other benefits:
> 
> 1) It removes a race during boot where userspace will briefly see
>    an apple_bl backlight and then have it disappear again, leading to e.g.:
>    https://bbs.archlinux.org/viewtopic.php?id=269920
> 
> 2) This allows user to switch between the drivers by passing
>    acpi_backlight=apple_gmux or acpi_backlight=vendor on the kernel
>    commandline.

...

> +	depends on ACPI_VIDEO=n || ACPI_VIDEO

I'm wondering if "imply ACPI_VIDEO" (i.o.w. weak dependency) is what suitable
here.

-- 
With Best Regards,
Andy Shevchenko


