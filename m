Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD452958CF0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F98B10E525;
	Tue, 20 Aug 2024 17:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsNlLfML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6045510E525
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174213; x=1755710213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1WOCN1hQxUm1krY7hl5MD+NIzVYaTnsupZFCAJLrYTs=;
 b=SsNlLfML/5llR9WXs1mG8UIFwbQFKx+j0k10VEpdhV2V5GNRcFYXcl/1
 dSxQpyCE4cYKv7wDGfA1MDJgoCMDFldjBD1+/PH/4tCYlYgwrE7NuGkji
 eRyIO8kmOwxWAxUh6DoOoIKoeP1e0i9xSATSSejT5fZZtNQRkjDeKaC9T
 D59Z48sFq7mifsiBYwwnupdQieK8HzCDW8r0ePzYpJQuvbNQRxsmvL/w0
 oJ7+G91g7mgxYflL/zip9Fqv3IQeUd7qy2NetbKZ4ZHqspOw+zBcu/sUT
 B6YN/CTGc7XcL2tscmGoGDdkdUEPPSahouMzXLNJTUuZojc+jMlJ6Hx/M A==;
X-CSE-ConnectionGUID: /5EUGa4wSReZhZl+pvD+jA==
X-CSE-MsgGUID: CYZ1nF3/TRyWYDtgpJ5e6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26363974"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26363974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:16:53 -0700
X-CSE-ConnectionGUID: 9kKj3Zq/Rcak+WCW+VHNBQ==
X-CSE-MsgGUID: YxLX6qvOT+uBQrS9ly4vBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65650227"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:16:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgSTI-0000000HNl0-2L24; Tue, 20 Aug 2024 20:16:40 +0300
Date: Tue, 20 Aug 2024 20:16:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 05/17] usb: typec: Add device managed
 typec_switch_register()
Message-ID: <ZsTPeEsS1m4Y8imq@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-6-swboyd@chromium.org>
 <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
 <CAE-0n52O01UgrDT2=-JJpZj39BOJNyyQC4w_pgDUmKDmcN=8Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52O01UgrDT2=-JJpZj39BOJNyyQC4w_pgDUmKDmcN=8Yw@mail.gmail.com>
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

On Tue, Aug 20, 2024 at 10:01:07AM -0700, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2024-08-20 03:16:09)
> > On Mon, Aug 19, 2024 at 03:38:19PM -0700, Stephen Boyd wrote:
> > > +     ptr = devres_alloc(devm_typec_switch_unregister, sizeof(*ptr), GFP_KERNEL);
> > > +     if (!ptr)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     switch_dev = typec_switch_register(parent ,desc);

(Side note: wrong location of the white space)

> > > +     if (!IS_ERR(switch_dev)) {

(Side note: positive conditional is okay)

> > > +             *ptr = switch_dev;
> > > +             devres_add(parent, ptr);
> > > +     } else {
> > > +             devres_free(ptr);
> > > +     }
> >
> > devm_add_action_or_reset() ?
> 
> No. We don't want to call the 'action' devm_typec_switch_unregister()
> when it fails because that would unregister a switch that has never been
> registered.

Hmm... With devm_add_action_or_reset() we first do things and then try to add
them to the managed resources. In that case it won't be like you described.

What do I miss?

-- 
With Best Regards,
Andy Shevchenko


