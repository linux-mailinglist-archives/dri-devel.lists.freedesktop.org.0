Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2C9E1A57
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 12:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355CD10E327;
	Tue,  3 Dec 2024 11:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0icqy8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEBD10E327
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733224007; x=1764760007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hjW3UCXqD1FmULpVvmR64Z1CjnUFV+STroncPx1uBpI=;
 b=b0icqy8CTJsYpiGVoSrR9K67eISfaxwQpZgTrFCLtTUEvoV1k8D8Rg+m
 n0iBMwI4fSJtVAjfBoPbVApYmuAIjvAaWHDa00inrnWXzNg5TcordUTWQ
 oaDvthzxGPTZfpaJbRTR9KiFUgWzVLYQRpMJduw9RiXvkwKcoh8CRf1t3
 i5RkRQ2MOdzf0Q9fcGF3EcuKFlB58BeZ6YOK00Qk/j6l+N211FPDYnbZc
 7mOoUtpWzABFhl3yN6DqmngJPAwLrs14ksaOwxGtvM1RUQKxmb3UPszsT
 sjdKbJ01TZ/ihDQo4Wh7aSGVVkvzmYYEQwNTPCJQOfJUtHwNdHWAA7rH0 A==;
X-CSE-ConnectionGUID: n+aT8TcBQAOkWGrk01K2ZA==
X-CSE-MsgGUID: XLUguZ+4SgezPQD2L1KXhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33580173"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33580173"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 03:06:47 -0800
X-CSE-ConnectionGUID: YfgNoayMQHKcDVkIFVY9kg==
X-CSE-MsgGUID: 0s0s+uOsQwKwhI+eoGJ7nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="124231772"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 03:06:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, Caleb Connolly
 <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v8 1/6] drm/panic: Move drawing functions to drm_draw
In-Reply-To: <20241115142950.1758007-2-jfalempe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241115142950.1758007-1-jfalempe@redhat.com>
 <20241115142950.1758007-2-jfalempe@redhat.com>
Date: Tue, 03 Dec 2024 13:06:38 +0200
Message-ID: <87y10x3u0x.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 15 Nov 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> Move the color conversions, blit and fill functions to drm_draw.c,
> so that they can be re-used by drm_log.
> drm_draw is internal to the drm subsystem, and shouldn't be used by
> gpu drivers.

I started looking at this in patch 2:

> +#include "../drm_draw.h"

I think we should avoid #includes with ../ like this.

Either drm_draw.h belongs in include/drm, or maybe clients/Makefile
needs to add subdir-ccflags-y += -I$(src)/.. or something like that?

If it's supposed to be internal, I guess the latter, but then the
current convention is to have _internal.h suffix. All drm headers under
drivers/ have that.

Is this the first drm subsystem internal thing that's a separate module?
Should we use EXPORT_SYMBOL_NS() and MODULE_IMPORT_NS() to enforce it
being internal?


BR,
Jani.


-- 
Jani Nikula, Intel
