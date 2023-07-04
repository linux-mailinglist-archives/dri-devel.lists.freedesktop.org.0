Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD73746A6A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B5510E294;
	Tue,  4 Jul 2023 07:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C80A10E294
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688455071; x=1719991071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E5NBCKClhK46jwcevA3AhRLGaK+1QlR+RReRt1xL4Mo=;
 b=fj3GxN/08Do1toL0spTocRGQu5ybrccnaTamyf7xZivQ3zEi5h0H/AsT
 /q/8VC3YLED1u+fKYRmKaNOMwQwRci40aDD2E+yFZ/CmLc90xSxxqN0vD
 tpbG3VR92AM+uT3hgBssE6odcHoaQzWgBLMQPOItUEMdNebz3pkaPq6DX
 0AUlGom88cj4zCKLHiIGjPDk1w/QTBVfMNjZJfktGhScilGbYQuo+Wi8M
 jS2t68oyeo2SOLs1dQkQqMUEBdPrFbE6G5OGATkTk8JntEF9OxD50IZ6f
 qncVbAcaI1v5Wxyq8Ln+jrbQNe5lri8R13h62leiAlVdADY2cJB9unpB1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342646994"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="342646994"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 00:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="842900336"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="842900336"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 04 Jul 2023 00:17:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qGaIC-0024DD-2J; Tue, 04 Jul 2023 10:17:44 +0300
Date: Tue, 4 Jul 2023 10:17:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/5] fbdev: Move core fbdev symbols to a separate
 Kconfig file
Message-ID: <ZKPHmJDsUtG7nROo@smile.fi.intel.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703230534.997525-3-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 01:05:26AM +0200, Javier Martinez Canillas wrote:
> The drivers/video/fbdev/Kconfig defines both symbols for fbdev drivers and
> core fbdev symbols, that can be enabled independently of the fbdev drivers.
> 
> Split the Kconfig in two, one that only has the symbols for fbdev drivers
> and another one that contains the fbdev core symbols.

...

>  source "drivers/video/fbdev/omap/Kconfig"
>  source "drivers/video/fbdev/omap2/Kconfig"
>  source "drivers/video/fbdev/mmp/Kconfig"
> +
> +source "drivers/video/fbdev/core/Kconfig"

Hmm... Shan't we start Kconfig from core options?

-- 
With Best Regards,
Andy Shevchenko


