Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF2C6623E3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFEA10E3D4;
	Mon,  9 Jan 2023 11:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B986410E3D4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673262792; x=1704798792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hdEsJAUiSPZYf7Xm2lSioHZsJcGS6XDIqya7eqaZHNQ=;
 b=MxyQVS+fmsh6fE4C1iMnsuBYrTDVWRGT+6Ihbwq5YMNzgFn7r+I3kj/C
 WJCDh2fDkr+uUtQcQmsXzgKD7gv3/S6+qgHYo9wDyelHAw6gLO3AlsWOX
 5Irl7qhuR0k6DBNP2e9N3M4Gb1fLaPP3KCluKWdyEyu2FEUBnxNn7bgq5
 aSRYcL40OWbC2nW7nKQbcjqjmvsb2veFnHJ2dHJ7soPjiDlzfYmcQ0wca
 FmEJXAMB2mBaszxEP5whf12NxgDfhC8VKEsDcCnLuvY/uEuWHMlZP1+Vp
 Fe2vWmt1ZeApkKBSD6o+i6ZVOCudwRf5Ke8NyN/tsrJG14bN/KsdroTJM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="321551715"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="321551715"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 03:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="649982329"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="649982329"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 09 Jan 2023 03:13:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pEq5N-006MLx-13; Mon, 09 Jan 2023 13:13:01 +0200
Date: Mon, 9 Jan 2023 13:13:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sam@ravnborg.org
Subject: Re: [PATCH 09/15] staging: fbtft: fb_ssd1351.c: Introduce
 backlight_is_blank()
Message-ID: <Y7v2vJtsWuhhiB2b@smile.fi.intel.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-omap@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-staging@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 07, 2023 at 07:26:23PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Avoiding direct access to backlight_properties.props.
> 
> Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> Access to props.power is dropped - it was only used for debug.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Kitt <steve@sk2.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: linux-fbdev@vger.kernel.org

Not sure why you have this (at least) explicitly mentioned as get_maintainer.pl
can generate it and git send-email can utilize the script output...

...

> -	write_reg(par, 0xB5, on ? 0x03 : 0x02);
> +	write_reg(par, 0xB5, !blank ? 0x03 : 0x02);

Why not positive conditional?

	write_reg(par, 0xB5, blank ? 0x02 : 0x03);

-- 
With Best Regards,
Andy Shevchenko


