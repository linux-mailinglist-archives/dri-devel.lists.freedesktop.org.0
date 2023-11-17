Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16197EF926
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEBE10E793;
	Fri, 17 Nov 2023 21:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1823010E793;
 Fri, 17 Nov 2023 21:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700255192; x=1731791192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P/2jZ6JHxUbZa9SDIcVD15ATpthu+hET9d9WFIL3VoU=;
 b=gRMse5a+U3hLfiYNIlhaZDGZEvkDy1x/4pJ6A+KxL9Dml2PFahkcQEvL
 +570fOubRktGmdA3joEgSI099CGGGokjYlH4IeZ/CfUmkZa0EULLXjdb0
 9FBv7JW+f0vh+Xe1r63pbQfPQD7aLSJH6HeX8p5bRmBf9ad7GSlKIVWGT
 cA12B7AMW1R12nMnmeoojFa6Fxq4own/cOiIcfXl+QW0/Yf27IVqkMIOu
 Y+BhxizeKZBaZyGc5CrAgLmCjELgO5sHTNTTR431qQ7KrbKIwQJ4Rh9yp
 vwVSDZgw/TITlNc+2CpBF3FfHVOBN4cMyFsZxSSdw77VwxrmZY6EuCkc1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371547065"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371547065"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="769319948"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="769319948"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:06:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1r462j-0000000Eu2V-3x4X; Fri, 17 Nov 2023 23:06:25 +0200
Date: Fri, 17 Nov 2023 23:06:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [rft, PATCH v4 00/16] drm/i915/dsi: 4th attempt to get rid of
 IOSF GPIO
Message-ID: <ZVfV0XIsUXSekXb5@smile.fi.intel.com>
References: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
 <e66638b0-bbad-4ac7-ad93-6fb0c6147005@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e66638b0-bbad-4ac7-ad93-6fb0c6147005@redhat.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 09:58:06AM +0100, Hans de Goede wrote:
> On 11/3/23 21:18, Andy Shevchenko wrote:
> > DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
> > talking to GPIO IP behind the actual driver's back. A second attempt
> > to fix that is here.
> > 
> > If I understood correctly, my approach should work in the similar way as
> > the current IOSF GPIO.
> > 
> > Hans, I believe you have some devices that use this piece of code,
> > is it possible to give a test run on (one of) them?
> 
> Ok, this now has been testen on both a BYT and a CHT device which
> actually use GPIO controls in their MIPI sequences so this
> series is:
> 
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> And the code of the entire series also looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> for the series.

Good news so far, thank you!

-- 
With Best Regards,
Andy Shevchenko


