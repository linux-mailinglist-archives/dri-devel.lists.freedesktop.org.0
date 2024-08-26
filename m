Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D295EDD8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 11:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA4410E16E;
	Mon, 26 Aug 2024 09:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZ42Okhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D1110E182
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724666323; x=1756202323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cfs1NTC0kOCerLyAMnm5595shMi+Z7RzTsRvt3/2wYY=;
 b=TZ42OkhcMpIo1MgpbOTIz+2QKJ566T6VlnYn8I1KLJHVgphH6daJHGZu
 z62ARhxXCl4vm+rMq/jZ76Fga379fq7jV9ShKzEcVtMe+wW8FhQc6ePpX
 UDcxv5fryvsQwVdy39ba9gKTnU9/BbpXUOuIYOmWiNxqbu7NacILDzAgs
 qRdoX4/PC5LEoOoxPzHShB3m7puQO0PKfvZDV/rrUZ1wRGB5qN+08HTsn
 +jjIHjmyCBZheSZB5rlpZil0F9TMIp5XNGdZ15NOf3Y59tBPKCbK9wo60
 aQZ0E0ftXaQuxIdPuCgaasVWHe/qZgiLIC13vDImG0ohrWjnrGTRlSVDy g==;
X-CSE-ConnectionGUID: +yGbX5yGRT+WNfyTpVa6Sg==
X-CSE-MsgGUID: 1mP+IYlBTv6bierWVKftBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33644756"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="33644756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:58:43 -0700
X-CSE-ConnectionGUID: 7CMsBR3YQ3+eOksdL8fgFw==
X-CSE-MsgGUID: c0vrIWrCTyecNL9XlIOepg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62979148"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:58:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1siWUY-00000001p9k-3ljv; Mon, 26 Aug 2024 12:58:30 +0300
Date: Mon, 26 Aug 2024 12:58:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 16/17] platform/chrome: cros_ec_typec: Support DP muxing
Message-ID: <ZsxRxpyqsslvQFO2@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-17-swboyd@chromium.org>
 <ZsdNEWX-eeLiokZl@tzungbi-laptop>
 <CAE-0n50Tuxp0WjFoTx+_i1L4cSOajSNHWPh32PPoXvskJByJJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50Tuxp0WjFoTx+_i1L4cSOajSNHWPh32PPoXvskJByJJg@mail.gmail.com>
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

On Fri, Aug 23, 2024 at 01:44:41PM -0700, Stephen Boyd wrote:
> Quoting Tzung-Bi Shih (2024-08-22 07:37:05)
> > On Mon, Aug 19, 2024 at 03:38:30PM -0700, Stephen Boyd wrote:

...

> > > +     /*
> > > +      * Assume the first port to have HPD asserted is the one muxed to DP
> > > +      * (i.e. active_port). When there's only one port this delays setting
> > > +      * the active_port until HPD is asserted, but before that the
> > > +      * drm_connector looks disconnected so active_port doesn't need to be
> > > +      * set.
> > > +      */
> > > +     if (dp_bridge && hpd_asserted && !dp_bridge->active_port)
> > > +             dp_bridge->active_port = port;
> > > +
> > > +     is_active_port = !dp_bridge || dp_bridge->active_port == port;
> >
> > Why `!dp_bridge`?  When will `dp_bridge` be NULL?
> 
> I'll add a comment.
> 
> 'dp_bridge' is NULL when this driver is running on non-DT platforms,
> i.e. ACPI, or there isn't a graph/ports node for this device. The latter
> could happen if there's some AP controlled piece of hardware that is a
> typec switch, connected directly to a usb-c-connector. This is the case
> on Kukui where we send the DP lanes directly to the usb-c-connector.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


