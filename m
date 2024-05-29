Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82798D395D
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84B310E477;
	Wed, 29 May 2024 14:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BigCRDHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD4110E477
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716993260; x=1748529260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JLKy8WDpu5HmtB8Z5d4WT7LLGA/yOmYqTdfiaadPM3k=;
 b=BigCRDHvGxJLvFekcZGYubIBIhYDJGCOHXALwzwApLpNmg6/NOg7UaJn
 h8AMmQaJYGnL3xKsa5gJEcnoYPpZoz3NxY1R7LQHJT5HoUVrhmFWyBe/7
 lkrJ0sB6Q+th1NAQ75SCtfP9aT5dZDUzRror79kjCIwSb3yQozXje6HK5
 yhTEqKhh6lpmVedq+MP4CfzvZAkI662grez808sQ8wKupJvCGxWZXsluI
 lXDclJKDCRddheXeXFjsxH2e1tSZi72dwzYycf4N5fa8oLMCnETaYVU8H
 c8A2wvwx0fd7YnlWIb89sFvbu1JvXcxEzmpQWoj+lVQ4X0PD0VRiP+fPr Q==;
X-CSE-ConnectionGUID: 4VJAbpS8Tg6yFqWFMJT+8g==
X-CSE-MsgGUID: EQluO1GuQ8qRezb+qZNcBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17231101"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="17231101"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:34:20 -0700
X-CSE-ConnectionGUID: uRNd/7unTDGM4mSY9zG97g==
X-CSE-MsgGUID: bs+wwQN7Rmq9zWhhStL9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35540140"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:34:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sCKNV-0000000BpVS-2taG; Wed, 29 May 2024 17:34:09 +0300
Date: Wed, 29 May 2024 17:34:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <Zlc84Z7G1YIEbggN@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
 <4a8cea8c-4575-bdd8-e8a8-634a2b267ff5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8cea8c-4575-bdd8-e8a8-634a2b267ff5@ti.com>
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

On Tue, May 28, 2024 at 04:51:46PM +0530, Devarsh Thakkar wrote:
> On 28/05/24 02:07, Andy Shevchenko wrote:

[..]

> >> +#include <kunit/test.h>
> >> +#include <linux/gcd.h>
> >> +#include <linux/lcm.h>
> > 
> > + math.h (where abs()/DIV_ROUND_*()/etc come from?)
> > I believe I mentioned that.
> > 
> 
> I did compile and test this, so math.h was indirectly getting included via
> some other header file already included but I would not rely on that and
> include math.h separately as you suggested.

Please, follow the IWYU principle, what you are suggesting is a fragile
approach.

> >> +#include <linux/reciprocal_div.h>

-- 
With Best Regards,
Andy Shevchenko


