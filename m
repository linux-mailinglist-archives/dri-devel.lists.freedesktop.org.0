Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750EE746A7D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A7F10E28F;
	Tue,  4 Jul 2023 07:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3CA10E28F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688455243; x=1719991243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6EHfns0z/SkAEaLYtQzwvi2YwXKwLGS9wAfa8FcB+k0=;
 b=Z2fbzTloIXa1AsGCHZaWUjHG3rgc5h/D6Mv0EJZbN0LUwSlLZRZIKCDX
 R8bHIJTfss+pyuSA1+Pte6opAsEvOpXmlRZVJLPMqtZ1QQahBt2zgMlx7
 6xiMIYgcfTxKUl378WJ9rsCUsWNm1AP8LamG5NjShVzKXPNzxTSdMQMB/
 fMcn4FHGBmvCxik1qKPVlhA0w19FqeusI5QwWAzygJjDjFR62+0j6Facu
 fSiHrlHS45zaXEJrRraHFX5y0iFG7qFgYB39HOrLzH2Mxy8OQcMpf1e/B
 s09gGCFZQuLu81OG1j8hFSR2rH7dkPZsbMt7+1jRtL1QNhV5DcRhpC694 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="365624118"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="365624118"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 00:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788773010"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="788773010"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 00:20:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qGaKx-0024FC-0K; Tue, 04 Jul 2023 10:20:35 +0300
Date: Tue, 4 Jul 2023 10:20:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 4/5] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
Message-ID: <ZKPIQngz6WkzASqa@smile.fi.intel.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703230534.997525-5-javierm@redhat.com>
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 01:05:28AM +0200, Javier Martinez Canillas wrote:
> Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
> drivers are needed (e.g: only to have support for framebuffer consoles).
> 
> The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
> and so it can only be enabled if that dependency is enabled as well.
> 
> That means fbdev drivers have to be explicitly disabled if users want to
> enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.
> 
> This patch introduces a non-visible CONFIG_FB_CORE symbol that could be
> enabled just to have core support needed for CONFIG_DRM_FBDEV_EMULATION,
> allowing CONFIG_FB to be disabled (and automatically disabling all the
> fbdev drivers).
> 
> Nothing from fb_backlight.o and fbmon.o is used by the DRM fbdev emulation
> layer so these two objects can be compiled out when CONFIG_FB is disabled.

...

Wondering if

  if FB_CORE
  ...
  endif

makes Kconfig looking better instead of replacing all these "depends on" lines.

>  config FB_DEVICE
>  	bool "Provide legacy /dev/fb* device"
> -	depends on FB
> +	depends on FB_CORE
>  	default y

-- 
With Best Regards,
Andy Shevchenko


