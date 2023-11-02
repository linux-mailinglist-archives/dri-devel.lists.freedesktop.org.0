Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF887DF7EF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977C10E939;
	Thu,  2 Nov 2023 16:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB16610E08F;
 Thu,  2 Nov 2023 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698943753; x=1730479753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HKl+m4Zjr7h+atr2oTK1n7KhWyPIB1bTDQkuRUWLgbk=;
 b=XZ7VlFjIeDCx7M5tkbevGdM+f0CP30Zp7l2z/0hGjcciLphXUvXtFsW8
 nIHeEFJ23Ew9q9PsPwC/J9TVFIyMqYRnCDT8feahrRkvEws1f2JunL2V5
 7L5bnoETFecV6hbDu63X56XjeQyP7papWt7Eprvo6mvU1+g0lxm6GpRIh
 29xSiCNKDok4KXx25KatNmm0q2TwsTVujDBXUOJz8cz0+MJg0PzLix+Ol
 VtTd5NTWb+JsvGvmrACRwxoVi9oR87cSX1v2kVTA6RV7Gq5AUlj/FG3ho
 GOSKLnFwRiqw4ZpQdfVDnI483qzePfH0I3GEXbXwMdCx26Td+OjUVDt8P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="453060189"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="453060189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 09:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="764985106"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="764985106"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 09:49:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qyasT-0000000AkGd-0B1U; Thu, 02 Nov 2023 18:49:05 +0200
Date: Thu, 2 Nov 2023 18:49:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 14/15] drm/i915/dsi: Replace poking of CHV GPIOs
 behind the driver's back
Message-ID: <ZUPTAG5ZuxKoOugs@smile.fi.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
 <20231102151228.668842-15-andriy.shevchenko@linux.intel.com>
 <34b4f396-ecf3-576d-69e5-f8eac2a5d488@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34b4f396-ecf3-576d-69e5-f8eac2a5d488@redhat.com>
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

On Thu, Nov 02, 2023 at 04:47:41PM +0100, Hans de Goede wrote:
> On 11/2/23 16:12, Andy Shevchenko wrote:

...

> > +			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:03", "Panel SE",
> > +					     gpio_index - CHV_GPIO_IDX_START_SW, value);
> 
> The "gpio_index - CHV_GPIO_IDX_START_SW" here needs to be "gpio_index - CHV_GPIO_IDX_START_SE".
> 
> Also this patch needs s/soc_exec_opaque_gpio/soc_opaque_gpio_set_value/ to compile ...

Ah, indeed. I looks like I run the test build, but forgot to look into the result. :-(

-- 
With Best Regards,
Andy Shevchenko


