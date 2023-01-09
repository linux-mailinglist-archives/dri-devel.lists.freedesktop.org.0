Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B646623EC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7408E10E3D7;
	Mon,  9 Jan 2023 11:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522610E3D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673262919; x=1704798919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bZbtSxVq7tKRN0w032vmRM6pRPfyv3+6ov17Khe0FpU=;
 b=cab7MJ0+YavhmXxy2tk1jZmDeXzl9pf7UC6gnGOSFvuHpRmtnXk55bwk
 XKgMRWIPNx6nZc6+x8mrIEHimyifYeFfdhSDYJLAy+2ZGGc/KUMth2Vz1
 vGQSuf+iyr5gutxs2XruYYj86sygxXNROa2Q5pzPHC63fxXSBaqswRrQI
 oYE6J0WVgSPA1xoC6Mmx98L8cc16BSVAHRVbe4DYy/9h5rVeEqzlLLDI4
 eI7gLsH+DtnywMI3ajr7cknStbsEH4bRXY8vIdqcbNx5QYc/j4qfbIXu6
 z7b9S7oy6OfS3gcz562XkRv2LmP6S4xBeDivGGGrguHABE4mVYFPY9UAb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="324095823"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="324095823"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 03:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="830562411"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="830562411"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP; 09 Jan 2023 03:15:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pEq7Q-006MOk-0s; Mon, 09 Jan 2023 13:15:08 +0200
Date: Mon, 9 Jan 2023 13:15:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sam@ravnborg.org
Subject: Re: [PATCH 10/15] staging: fbtft: core: Introduce backlight_is_blank()
Message-ID: <Y7v3O+6wacN8qL7K@smile.fi.intel.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-10-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-10-1bd9bafb351f@ravnborg.org>
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
 linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Peter Suti <peter.suti@streamunlimited.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin van der Gracht <robin@protonic.nl>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 07, 2023 at 07:26:24PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Avoiding direct access to backlight_properties.props.
> 
> Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> Access to props.power is dropped - it was only used for debug.

...

> +	if (blank)
>  		gpiod_set_value(par->gpio.led[0], !polarity);
> +	else
> +		gpiod_set_value(par->gpio.led[0], polarity);

	if (blank)
		polarity = !polarity;

	gpiod_set_value(par->gpio.led[0], polarity);

?

-- 
With Best Regards,
Andy Shevchenko


