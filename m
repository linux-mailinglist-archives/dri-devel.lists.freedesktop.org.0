Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B564EB400AE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E627010E6AA;
	Tue,  2 Sep 2025 12:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7qbKK0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EA310E6AA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816446; x=1788352446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dKIOlWu6X6tSVzInNxELrT+k6xJoOIovfskXlUXMCmQ=;
 b=i7qbKK0VUtrA9emCjytVdsQdEdxTr3HBIR1cFz6KxowJ2ELa9ZSS4OXg
 QAFRB/bTMt/3W6tjvzJq1HhzlJgan60L4ny9KfW9yAvJbJO8xkTfkFniy
 Jr+ccAS4yR8QWN0dOT36AFIu0Wd6Hqg4aHCsuAkRDBamOHLiowGRXJpqI
 Qkf+UR6cZTps8ytJnAsruWKc8FgpfAQYJchaio/OX5Vfu2xNyESPNXHS9
 s3QbKpJo2eWz4SW5MqVPq7ZX07NHG6G6TRA9ibxASxuny6mj57jy3WcyI
 TUZ0VYGBoKva+8ciIMpSgIa3q93OGSF+XcDYzEjR0os0fdkdHbmO66uCt w==;
X-CSE-ConnectionGUID: n4pMuAfJRaCzOGWEZJJywQ==
X-CSE-MsgGUID: RNbE+E9nS5GpVFwJzg8mTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59156802"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59156802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:34:05 -0700
X-CSE-ConnectionGUID: ULXZ2jqUT3eZ+Wruydwibw==
X-CSE-MsgGUID: WA10W79ISFKaHCfaisZ93g==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:33:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1utQCw-0000000AgyP-3kDu; Tue, 02 Sep 2025 15:33:54 +0300
Date: Tue, 2 Sep 2025 15:33:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Zijun Hu <quic_zijuhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <aLbkMvYgSFYbtUDN@smile.fi.intel.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
 <20250814183609.3788a6df@booty>
 <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
 <20250902135709.19e1ef54@booty>
 <20250902-speedy-friendly-alpaca-f80709@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-speedy-friendly-alpaca-f80709@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Tue, Sep 02, 2025 at 02:22:28PM +0200, Maxime Ripard wrote:
> On Tue, Sep 02, 2025 at 01:57:09PM +0200, Luca Ceresoli wrote:
> > On Wed, 20 Aug 2025 16:43:56 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> > While applying this patch with dim on drm-misc-next, dim push-branch
> > failed because:
> > 
> >   dim: ERROR: cb86408b1fc2 ("list: add list_last_entry_or_null()"): Mandatory Maintainer Acked-by missing., aborting
> > 
> > Looking at the dim code, it is looking for a Reviewed- or Acked-by from
> > people listed by `scripts/get_maintainer.pl --no-git-fallback -m --nol
> > --norolestats`. but that command returns an empty string, so it will
> > never allow me to push.

This seems to be a quite strict rule, esp. for the include/* lib/* code.
I believe among DRM reviewers / maintainers a lot of people capable to
review that code and push it. Why is it a problem?

> > How can I get that commit pushed to drm-misc-next?
> 
> Adding a MAINTAINERS entry for it would be nice too

Just in case you want to go this direction, please, do not put my name as M:.

-- 
With Best Regards,
Andy Shevchenko


