Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1524A5975
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE5D10E82E;
	Tue,  1 Feb 2022 09:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6DA10E82E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643708837; x=1675244837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nbH4qI7u9cfJLtzUmRrSg0eYBDFxCuv9yYJvWGip0I0=;
 b=hPb80OuuOJemaRXn4R6w2IajJ6RHdtvyREXJisLUbxEfgU2LGv2DPgMK
 l99nFRAJo8kC/8ecYmQCao/5H1TRY6DUaespO0JcDlCeivywEdY0kZGBd
 9OdDlE1CfUpquQmz4i1wIsF0eHfuSEHFq1bEfrra8u8CrcwVZKHhqY+Dr
 eLqCxWyDrhA1vUQxJvyNVrN3bgSD/bn1KTXw9fBeZhJEwzvVTMKae+aMw
 1fxdBtWETD2togre9ubByWihhMR2l4ijZgjg6JBu2IGfhTOn0CtRIsTyj
 aPVZCc+g89YuTBeIukG6QNfZ+wj74z7wR8Ceg+roz0y9zns+iNMrHCs87 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247426610"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="247426610"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:47:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="599179155"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 01:47:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEphh-00HFWy-0q; Tue, 01 Feb 2022 11:44:01 +0200
Date: Tue, 1 Feb 2022 11:44:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <YfkA4ER/52I2v1JP@smile.fi.intel.com>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <YfhVBtv1UIA7bJja@ravnborg.org>
 <3aac291a-b30e-2775-336f-66dd08d634e2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aac291a-b30e-2775-336f-66dd08d634e2@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 01:14:22AM +0100, Javier Martinez Canillas wrote:
> On 1/31/22 22:30, Sam Ravnborg wrote:
> > On Mon, Jan 31, 2022 at 09:29:16PM +0100, Javier Martinez Canillas wrote:

...

> > The driver uses the pwms property for the backlight.
> > It would have been much better to bite the bullet and require the
> > backlight to be specified using a backlight node in the DT.
> > This is the standard way to do it and then the driver could use the
> > existing backlight driver rather than embedding a backlight driver here.
> >
> 
> I did consider that. Because that would allow me to use a struct drm_panel
> and as you said make the core to manage the backlight. But then decied to
> just keep the backward compatibility with the existing binding to make it
> easier for users to migrate to the DRM driver.
> 
> I wonder if we could make the driver to support both ? That is, to query
> if there's a backlight with drm_panel_of_backlight() and if not found then
> registering it's own backlight like the driver is currently doing.

If we keep 100% backward compatibility, just drop the old driver.
After all module name is not so important as compatibility strings.

The problem with no backward compatibility means that removal of old driver
makes users unhappy since DT is kinda ABI and we do not break it.

-- 
With Best Regards,
Andy Shevchenko


