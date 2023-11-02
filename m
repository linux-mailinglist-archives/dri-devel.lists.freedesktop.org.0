Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29917DF4CA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647B10E8D2;
	Thu,  2 Nov 2023 14:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DEB89128;
 Thu,  2 Nov 2023 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698934793; x=1730470793;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YIoOazyZIxRBLXmipC//1yjCBmIXsr31xOo/Ttayfpw=;
 b=L/qu+/6P0OEbXeaLA//3+PWkfVdyJ+v7MYTKofEvtktBADnEz3DL3QOX
 UzUaE7NSq/MiRlxmZMX694LbCoDJSyml0GVbt2QA1CIHHV8BOe2ylV8GL
 CoqunAIpqT8q7gmyr52GFUX85u3UL+cS1SB7u+JRx0qTKvc5Lk0/lH8TC
 psPiMFRB4QDriI2qGBzT0mX/TzTovspAwjE7gTZTd+QyRQPezFR4UTjwq
 jpdVhYGZDqWJNxJln5QA/wtQszQNjrUo2OFYqsaIA4XayiMtR367wjY1a
 HBrUNke2Hj7v5LoRR7OisBs1aI0Sej7mwM5cqTIsORG8yzbNLpdLsIMH9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1647428"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1647428"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 07:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="831702572"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="831702572"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 07:19:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qyYXy-0000000AhvZ-3fkX; Thu, 02 Nov 2023 16:19:46 +0200
Date: Thu, 2 Nov 2023 16:19:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
Message-ID: <ZUOwAn158pUELTBq@smile.fi.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
 <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
 <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
 <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
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

On Wed, Nov 01, 2023 at 11:20:23AM +0100, Hans de Goede wrote:
> On 11/1/23 10:32, Andy Shevchenko wrote:
> > On Tue, Oct 31, 2023 at 10:15:52PM +0100, Hans de Goede wrote:
> >> On 10/31/23 17:07, Hans de Goede wrote:
> >>> On 10/24/23 18:11, Andy Shevchenko wrote:
> >>>> On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:

...

> Note you still need the first part of my patch which is
> an unrelated bugfix:
> 
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -219,8 +219,7 @@ static void soc_exec_gpio(struct intel_connector *connector, const char *con_id,
>  	} else {
>  		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
>  						 con_id, gpio_index,
> -						 value ? GPIOD_OUT_LOW :
> -						 GPIOD_OUT_HIGH);
> +						 value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
>  		if (IS_ERR(gpio_desc)) {
>  			drm_err(&dev_priv->drm,
>  				"GPIO index %u request failed (%pe)\n",

Can you attach or send a formal submission, so I can incorporate it into one
(v3) series among other changes?

-- 
With Best Regards,
Andy Shevchenko


