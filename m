Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB90958D64
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40E910E7F7;
	Tue, 20 Aug 2024 17:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImZw2hRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912FF10E7F7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174996; x=1755710996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=68ac7DKsySDSgzwlWvjjo7DcbuWc1QcmM244nl8RMHI=;
 b=ImZw2hRhGaOIiNpn/92VgdN7vIq5WFhLRmXt0vzyWq7JkMGP2CW7Wz7X
 pb6dS+ayQuQRsB7sJ5vdVHBa/ncmzt8qlaQrU4qgP0SZLuFsZ7PhCtt9F
 Iq2SzRasJInfFAYYjK2VO8SkttPA5ZPQjHIIZpJYhnuTfYlN/Rc1sJnnS
 HnTgv0ajfzvSHZ7StLHFSwu/3riVMh2RyStK7LAXgKWZEexrn5P5rSZJd
 onI5xwmX+hW+5qOWbx6M4grPMyBel1MnYaa2pbR2KZgrv1BklhMjOYg9D
 3XavC99YQB5M8TD5pH55MARVHbI1Fi8jqLn14/zhfPMQGZoDb61krELtf Q==;
X-CSE-ConnectionGUID: aSlTAYxqQw23wqtMdr31kg==
X-CSE-MsgGUID: lEB+CojTTH6V/ywGx0tdGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22659872"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22659872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:53 -0700
X-CSE-ConnectionGUID: 3e5GmarEQFm3vY766fVtDA==
X-CSE-MsgGUID: ZExBMhs5Sp2n9ruAFUwKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="83996247"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgSft-0000000HOIY-3G5R; Tue, 20 Aug 2024 20:29:41 +0300
Date: Tue, 20 Aug 2024 20:29:41 +0300
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
Subject: Re: [PATCH v3 02/17] drm/bridge: Verify lane assignment is going to
 work during atomic_check
Message-ID: <ZsTShZnD-NbZqGio@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-3-swboyd@chromium.org>
 <ZsRrWfoPPVGC4Dqy@smile.fi.intel.com>
 <CAE-0n536OWtoOoRSM=6u=wA75A+0WtBktiY=6Y6VjKKTQWPcNw@mail.gmail.com>
 <ZsTPuvoTIFVFHw6o@smile.fi.intel.com>
 <CAE-0n50xcj21WiPHW9ATE7BfxKpOWvdV7of97G_U5ZrMV0zUUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50xcj21WiPHW9ATE7BfxKpOWvdV7of97G_U5ZrMV0zUUw@mail.gmail.com>
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

On Tue, Aug 20, 2024 at 10:24:47AM -0700, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2024-08-20 10:17:46)
> > On Tue, Aug 20, 2024 at 10:12:55AM -0700, Stephen Boyd wrote:
> > > Quoting Andy Shevchenko (2024-08-20 03:09:29)
> > > > On Mon, Aug 19, 2024 at 03:38:16PM -0700, Stephen Boyd wrote:

...

> > > > > +     /*
> > > > > +      * Ensure this bridge is aware that the next bridge wants to
> > > > > +      * reassign lanes.
> > > > > +      */
> > > > > +     for (i = 0; i < num_input_lanes; i++)
> > > > > +             if (i != input_lanes[i].logical && !num_output_lanes)
> > > > > +                     return -ENOTSUPP;
> > > >
> > > > Besides missing {} this code is internal to the Linux kernel. Is it okay?
> > >
> > > ENOTSUPP is used by select_bus_fmt_recursive() so I simply followed that
> > > style.
> >
> > Okay, just be aware of that side effect of that code, also checkpatch may
> > complain (however it might be false positive).
> 
> Yes checkpatch complained but didn't enlighten me. Please tell me the
> side effect as I'm unaware!

I already told you above, if this code ever appears in user space it will be
printed as a number and very much confuse the user!

That's why usage of this code either has to be documented or be subsystem
_known_ practice (GPIO library comes to my mind as it uses it internally,\
but filters for user space).

-- 
With Best Regards,
Andy Shevchenko


