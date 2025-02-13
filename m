Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC0A34E06
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C30810EB78;
	Thu, 13 Feb 2025 18:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxC6cANU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26AF10EB78
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739472619; x=1771008619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tkmdP2cO4XckmU9OHEIRQibCs4HpgedOOCQZKsOnvc0=;
 b=NxC6cANU7b6ku5vN28MxP/uV9IB4ovUR6ZTPTDFbdNQ7/HCpb7IYuhf7
 42rTe8WNUmnRENlKVyFE2YywBEmlNxHFuarEnO85SfInaB6E99uWyIRL8
 tLXUbj0zWzSYlGnFTKxyFegXcgfL+YHIyp7V2YOyGx3uniuhHHQZDNx4E
 YqUYgH/8GnmGp6xvm7aXTiY++HSR59hb56Wya/E+UKQuhcj3YBVa4K1SC
 cVtQNQbxijUfb3s9z7U9Sx2DpDYRwQO2+qiVuK/VykpsvdcQ8du0KilSv
 qef61GRgHhQF8IuiFdfrdI/7BV0D0Qx4eL5N9/j2LvFV7z0sInMGGOmQX A==;
X-CSE-ConnectionGUID: y1U1euhATj6v3Kl1oIugmw==
X-CSE-MsgGUID: Jn4yH2yzQHufLUzWeXLJHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39902551"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="39902551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:50:19 -0800
X-CSE-ConnectionGUID: iSxNiRQPSQ268skEF3KY9w==
X-CSE-MsgGUID: XHULq+8MTtC54XbUm1Gg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113205221"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:50:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tieHs-0000000BFsL-0Pmm; Thu, 13 Feb 2025 20:50:12 +0200
Date: Thu, 13 Feb 2025 20:50:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Alexandru Ardelean <aardelean@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for
 wider use
Message-ID: <Z64-4xcWmlpOkG98@smile.fi.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
 <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf0MMKB40gC1hJLwY1i1Bjj+aKKDfFN9sYUzG_Z5Hu1iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf0MMKB40gC1hJLwY1i1Bjj+aKKDfFN9sYUzG_Z5Hu1iQ@mail.gmail.com>
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

On Thu, Feb 13, 2025 at 07:36:38PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 13, 2025 at 7:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Other subsystem(s) may want to reuse the for_each_if() macro.
> > Move it to util_macros.h to make it globally available.

> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Who would pick it up? Should I take it via the GPIO tree and provide
> an immutable branch for the DRM tree?

I believe it makes sense as the first user outside drm is GPIO.

-- 
With Best Regards,
Andy Shevchenko


