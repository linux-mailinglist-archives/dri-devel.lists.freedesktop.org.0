Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8BC4FF519
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCDC10E15B;
	Wed, 13 Apr 2022 10:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADDF10E15B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649846993; x=1681382993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=24MmeEn2Cbl39Z9DZndnyl+5AVJ6TfhTumGasuy47do=;
 b=RXGzdzhYnFaVpUIy1yzy8plxhIdK+6QiBaOkcYw9Jsf4v+ig42Y3rTrt
 /XQai0ST/BK6vOxpAdjDvDOWHNI2TBsGlKPQnJfobf0DFtxYWnZFtZ8LZ
 Yqr7YvEMduerAfj0RQqb9E4a7SmjVX1ObWFLR5LvG0Jp3O5SpdRO0Vzyw
 tQ/0cHqMu3fr4WS9IhKaKVZnfQE9BX0SLf6IvDQUoL6ih8GDetTM0iYDU
 YQxtnsb4xDS0ww/s6Y856QXE2Cly2KLjNUeOnPtrGwuuO+8MIcFSY0C7q
 jHbJA6SY75dsfkpf3W19tmaDsJ4zJuyINNRQwCFfWBK1/S2HoOdiomlld w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="287661449"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="287661449"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 03:49:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="660883901"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 03:49:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1neaVm-001nR0-8j; Wed, 13 Apr 2022 13:46:10 +0300
Date: Wed, 13 Apr 2022 13:46:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
Message-ID: <Ylap8rTKbXp80Woc@smile.fi.intel.com>
References: <20220412162729.184783-1-javierm@redhat.com>
 <20220412162729.184783-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412162729.184783-5-javierm@redhat.com>
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

On Tue, Apr 12, 2022 at 06:27:28PM +0200, Javier Martinez Canillas wrote:
> These are declared in the ssd130x-i2c transport driver but the information
> is not I2C specific, and could be used by other SSD130x transport drivers.
> 
> Move them to the ssd130x core driver and just set the OF device entries to
> an ID that could be used to lookup the correct device info from an array.
> 
> While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
> bytes. Since even though they are used by the I2C interface, they could
> also be useful for other transport protocols such as SPI.

...

> +EXPORT_SYMBOL_GPL(ssd130x_variants);

What I meant is to use EXPORT_SYMBOL_NS_GPL() here. It might require a separate
patch to move other exports to that namespace first.

-- 
With Best Regards,
Andy Shevchenko


