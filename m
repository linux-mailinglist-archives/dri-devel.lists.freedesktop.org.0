Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F574FFC11
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 19:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7A10E121;
	Wed, 13 Apr 2022 17:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221D310E121
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649869551; x=1681405551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r7UZnsohXbfhEJy1H1rNsdtuWYYR6ExyFJHIjKpmqhA=;
 b=ZMJFTaBNkhzc3AugrI3dN5IWT02fyCurrvUDn2bAmi0WuK62S2GQN8NF
 FgtOekLxst4LBeQqWicIIzzFEOVwQgTmUR2ba+oWkXvI11H38OepdOmop
 c9GmzY28Eqk8kU7V9eDm0q8BNVk3thANkuWYb+rpaL9PaRbnOltoD0zh6
 Zg+iczNmE+i6YjTdlX1r3iy2CVPXTo/1cbN4gNBen+/y8enlj2CtOPK5L
 4FJDyviosS/eH7L7BJ4+J3UZtdXjLOVIMh3Cx7Izx6k/UqbPmsCP24d3i
 YeZoyFFHHcHeC0obOAkxUU04CGsVHLyG+va4IQSSpLtquuPzZoY7V9VeK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="325630580"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="325630580"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:05:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="526548796"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:05:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1negNc-001wAW-Ll; Wed, 13 Apr 2022 20:02:08 +0300
Date: Wed, 13 Apr 2022 20:02:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
Message-ID: <YlcCEP8ADyJNxd/Z@smile.fi.intel.com>
References: <20220413162359.325021-1-javierm@redhat.com>
 <20220413162359.325021-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413162359.325021-5-javierm@redhat.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 06:23:57PM +0200, Javier Martinez Canillas wrote:
> These are declared in the ssd130x-i2c transport driver but the information
> is not I2C specific, and could be used by other SSD130x transport drivers.
> 
> Move them to the ssd130x core driver and just set the OF device entries to
> an ID that could be used to lookup the correct device info from an array.
> 
> While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
> bytes. Since even though they are used by the I2C interface, they could
> also be useful for other transport protocols such as SPI.

Thanks!

...

> @@ -139,6 +106,8 @@ static struct i2c_driver ssd130x_i2c_driver = {
>  };
>  module_i2c_driver(ssd130x_i2c_driver);
>  
> +

Seems stray change. Dunno if maintainers can fix this when applying.

>  MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS(DRM_SSD130X);

-- 
With Best Regards,
Andy Shevchenko


