Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA00675C858
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 15:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333DF10E68E;
	Fri, 21 Jul 2023 13:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4CD10E68C;
 Fri, 21 Jul 2023 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689947506; x=1721483506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SVttKu/eu28MCOim1B0YM+4ULop9gmNJ5KJQB5200Kc=;
 b=U/rKVOZPRMf3vXRtHSBBFTzPrruO+qkM1QR2Qg4wYyba66tPStWOMC6i
 X9TplIvDZRfk6IQhO8tBPRl/MvDZexN1v69fbptQpkljK5NLC8vdAz6/L
 59XPvi5yxbd6KpH2aY2KWnOyyb4kc5zy6+dx7YpBrFC/hF2HSuxlJqRTG
 Zz9ZZHi/QJ6Qj4V0WYKp8Q+TmjnvgeUISWbj4FpQbCZ53OVjd34G0Ov7G
 y/GlZTczBG6KjTvL1UHVD+M0HyFGsXHq//Ov2EbN5si8uz1ps+W0QL+0B
 uALJdJSXVFOxNbNEanCet0mRlvtSzyG6z9zyXUmE0LPo4Zm7Fmd4Lchft Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430818250"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="430818250"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="794964238"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="794964238"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 06:51:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qMqXj-0073G3-0u; Fri, 21 Jul 2023 16:51:39 +0300
Date: Fri, 21 Jul 2023 16:51:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/i915: Move abs_diff() to math.h
Message-ID: <ZLqNazKSE8f6XBsg@smile.fi.intel.com>
References: <20230721134235.15517-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721134235.15517-1-andriy.shevchenko@linux.intel.com>
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
 Nikita Shubin <nikita.shubin@maquefel.me>, Stephen Boyd <sboyd@kernel.org>,
 Helge Deller <deller@gmx.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 04:42:35PM +0300, Andy Shevchenko wrote:
> abs_diff() belongs to math.h. Move it there.
> This will allow others to use it.

Sorry, forgot omap-serial case.
Will be v2 soon.

-- 
With Best Regards,
Andy Shevchenko


