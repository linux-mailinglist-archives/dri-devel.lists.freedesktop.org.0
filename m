Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FF8BB03C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 17:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0610310F961;
	Fri,  3 May 2024 15:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1Yg2tw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C335410F961
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714751168; x=1746287168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6qkIQL5v3S2njbRTTPohfz7nDTUUHJuFC7dc+uHtgaA=;
 b=X1Yg2tw8IERMTK5AbNFBXwDU8/ppaAZAIFobEzR0qGbreMUjxXQGh99d
 bE/1BGRixK9y50qLb1R1X47qF+Wsp4Sxk/R18PshmjklaAZOUNGytieHO
 +sfba/kOOLLqNvUBjrD+Bwkq6pFJOiTCeLzjrUo/Giyi23G3MK3Nn1rw+
 jCAYDkGdz/gn67uCUCw9DVMDSAqhg+7PQSuakohw1IF+ANHzcIVhQtKxn
 Ptp89rtJjehEQHvLiB6iKy3juCGaSASJ0ScGYpLPVFgAqpnImSyUkUesZ
 XK76mcTfKhkv6muLz86erwdwlZRb/3JFqHpo5Ke+fN2EI+HHsHAjk7Wnq A==;
X-CSE-ConnectionGUID: RzJtFOJ6Tl+7g/eKlxFcPA==
X-CSE-MsgGUID: Suf0suFhTsSBpmVL2fadnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28038398"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28038398"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 08:46:07 -0700
X-CSE-ConnectionGUID: fqWA1A5EQmupe0GZIVoW4A==
X-CSE-MsgGUID: YaTUMS4MSHC/Y6O07af/sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="58681897"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 08:46:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s2v6m-00000003h0l-36ft; Fri, 03 May 2024 18:46:00 +0300
Date: Fri, 3 May 2024 18:46:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Message-ID: <ZjUGuKGm7IdtwKgg@smile.fi.intel.com>
References: <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ce6a480d-80b3-46b0-a32d-26bc6480d02f@linux.dev>
 <ZiqrLfezhns4UycR@smile.fi.intel.com>
 <b5ffd984-4031-4a8a-adbc-75a1e1dfe765@linux.dev>
 <ZjD8eoO3TmuCUj-a@smile.fi.intel.com>
 <9e69b129-7539-4403-a621-bf3775aab995@linux.dev>
 <ZjNPiBvLF3WcBftn@smile.fi.intel.com>
 <e1d01191-fd96-4b17-b223-7147eb427315@linux.dev>
 <ZjPNU24ZJIzGFDNg@smile.fi.intel.com>
 <a8509e96-bfe2-4c50-8624-8f418c88edfa@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8509e96-bfe2-4c50-8624-8f418c88edfa@linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 03, 2024 at 12:57:33PM +0800, Sui Jingfeng wrote:
> On 2024/5/3 01:28, Andy Shevchenko wrote:
> > On Fri, May 03, 2024 at 12:25:17AM +0800, Sui Jingfeng wrote:
> > > On 2024/5/2 16:32, Andy Shevchenko wrote:
> > > > On Wed, May 01, 2024 at 12:27:14AM +0800, Sui Jingfeng wrote:
> > > > > On 2024/4/30 22:13, Andy Shevchenko wrote:
> > > > > > On Fri, Apr 26, 2024 at 05:13:43AM +0800, Sui Jingfeng wrote:

...

> > > > > > the former might be subdivided to "is it swnode backed or real fwnode one?"
> > > > > > 
> > > > > Yeah,
> > > > > On non-DT cases, it can be subdivided to swnode backed case and ACPI fwnode backed case.
> > > > > 
> > > > >    - For swnode backed case: the device_get_match_data() don't has a implemented backend.
> > > > >    - For ACPI fwnode backed case: the device_get_match_data() has a implemented backend.
> > > > > 
> > > > > But the driver has *neither* software node support
> > > > True.
> > > > 
> > > > > nor ACPI support,
> > > > Not true.
> > > Why this is not true? Are you means that the panel-ilitek-ili9341 driver has ACPI support?
> > That's the idea (as far as I see the copy of the code from tinyDRM),
> > but broken over the copy'n'paste. This patch rectifies that to be
> > in align with the original code, which *does* support ACPI.
> > 
> > > I'm asking because I don't see struct acpi_device_id related stuff in that source file,
> > > am I miss something?
> > Yes, you are. I leave it for you to research.
> 
> After researching a few hours I still don't understand how does
> the panel-ilitek-ili9341 driver has the ACPI support and be able
> to ACPI probed when compiled as module.
> 
> As far as I know, drivers that has the ACPI support *must* has the
> .acpi_match_table hooked, so that be able to be probed when the
> driver is compiled as a module.

No, and this is the thing. Hint: there is a glue code to reuse compatible
strings from OF, that's why dependency to OF prevents *some* systems from
being able to use that. But it's easy to fix by enabling OF in the
configuration, however the ID tables are orthogonal to the environment.
That's why all those ACPI_PTR() and of_match_ptr() are design mistakes
that are going to be removed eventually (the work is ongoing, btw,
as well as killing specific *_device_get_match_data() calls).

> For example, see commit 75a1b44a54bd9 ("spi: tegra210-quad: add acpi support")
> to get a feel what a SPI device with *real* ACPI support looks like.

If under *real* you assume the allocated _HID in use, yes, that's how it's
done. But there is the other tricky way of achieving similar effect w/o
allocating a new / custom ACPI _HID.

Hint: it's all documented in kernel under firmware-guide/acpi/.

> I have double checked the panel-ilitek-ili9341 driver, it doesn't
> has acpi_match_table hooked, which means that this driver won't
> even be able probed. And probed as pure SPI device still out of
> the scope of "correct use of device property APIs". Because SPI
> device specific method don't belong to the device property API.
> I don't really know what's we are missing, but we already intend
> to let it go, thanks.
> 
> > > > So, slow down and take your time to get into the code and understand how it works.
> > > > 
> > > > > so that the rotation property can not get and ili9341_dpi_probe() will fails.
> > > > > So in total, this is not a 100% correct use of device property APIs.
> > > > > 
> > > > > But I'm fine that if you want to leave(ignore) those less frequent use cases temporarily,
> > > > > there may have programmers want to post patches, to complete the missing in the future.
> > > > > 
> > > > > So, there do have some gains on non-DT cases.
> > > > > 
> > > > >    - As you make it be able to compiled on X86 with the drm-misc-defconfig.
> > > > >    - You cleanup the code up (at least patch 2 in this series is no obvious problem).
> > > > >    - You allow people to modprobe it, and maybe half right and half undefined.
> > > > > 
> > > > > But you do helps moving something forward, so congratulations for the wake up.

-- 
With Best Regards,
Andy Shevchenko


