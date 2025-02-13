Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1332A34E0D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521C010EB79;
	Thu, 13 Feb 2025 18:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5yi+iYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF47110EB79
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739472689; x=1771008689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z4JIzyla/zB42IIdyq9rsiYIJ4BG8zZIFXJSyVMSn5A=;
 b=O5yi+iYrXxKqvWzjL3L9IAMDOS8ziGCquYhC+S7VElPmYLtHrLf++Cr3
 mp1ui1gVtf6tODkubyDD/Na156Ew6Hi7qDBPG26sEJipnVYEpdub0SUhW
 9X44ngE7oKd2RINb3JH+wSrqShNHC3ieb4McxV70ss3NyhKG019v4q9KK
 X5yf87/tR8I+xApeRoG4Tcy9hprqaXre5BwzAuKvKPyG2wQu0C5r9KUJJ
 hJl1DCBtTBrMeEtcJft8+saQ6CYMPWlL4mqX5QdoRgUwTYOv4p7kSy4WR
 PLUwo6Xea0TzUCGt7xIX8HhPppODqws2TZ6nmPRuOIdNdsHp4R1Ky8buJ A==;
X-CSE-ConnectionGUID: al4gyjn8TbKoUApKNh5ECA==
X-CSE-MsgGUID: 7WKtOUihThiDKiZ0+lY8Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40123365"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40123365"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:51:29 -0800
X-CSE-ConnectionGUID: h8dHvQ9XTBSbZoTu5XPOSw==
X-CSE-MsgGUID: u5xXpwf1Sh2wFmPfe87bCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113108142"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:51:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tieJ0-0000000BFtK-2TtO; Thu, 13 Feb 2025 20:51:22 +0200
Date: Thu, 13 Feb 2025 20:51:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Alexandru Ardelean <aardelean@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for
 wider use
Message-ID: <Z64_KheQ_b0TtBDn@smile.fi.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
 <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
 <87msepy93x.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msepy93x.fsf@intel.com>
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

On Thu, Feb 13, 2025 at 08:48:02PM +0200, Jani Nikula wrote:
> On Thu, 13 Feb 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Other subsystem(s) may want to reuse the for_each_if() macro.
> > Move it to util_macros.h to make it globally available.

> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks!

> If you want to go down the memory lane, see [1]. ;)
> 
> [1] https://lore.kernel.org/r/20180709083650.23549-1-daniel.vetter@ffwll.ch

Yeah, I have read it a few hours ago to refresh my memories.

-- 
With Best Regards,
Andy Shevchenko


