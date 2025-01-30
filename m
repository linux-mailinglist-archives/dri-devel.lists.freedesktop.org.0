Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D41A2297B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 09:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F5A893DB;
	Thu, 30 Jan 2025 08:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+joXJeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F1A893DB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738225288; x=1769761288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M1qt6yIqv7j8m2gxhiDBq3JhCbnCFKoGYMctlmrwUuo=;
 b=R+joXJeHAQS/3BFYZBm2Nh4zsbysvb6DsxfUNtWxd+Z8Givhp4TidHQ1
 MzxkXqQ7aOGPzb6BfBiR4OA/iESEFWMf6mWTy6pwNwUqk/NYxMZqFv+RR
 CmVmLenU/zl93Ndtz1AdE0jrX1bHkLr1JZ4Uu95g/TYoeW91tzzvAcxt2
 XT5ryO/OWew+VPXcoY2dnVy8uEzfrPo5J4leztmH4JtAvaBJZEa/LJs8g
 f19SIyBI34FD2E8bbeMNFKL03gIvAh4hUwMId8Rx5dSzoxNQpLVlksxka
 wNVDloB26pjFVpkublRODSqyDn83jiCSsa6/3B2nzTfyM+3hUoHn+bWnC A==;
X-CSE-ConnectionGUID: AVA4N4kQRJ66oeq+W/Qkmw==
X-CSE-MsgGUID: 5So+5YTNQyiohsv9fg5LwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38664563"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38664563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:21:27 -0800
X-CSE-ConnectionGUID: Jg+3FL3KT4OdJNtJ2Qsjuw==
X-CSE-MsgGUID: 0uzz3YCcQgq+3fMLp1Bocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113877805"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:21:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tdPne-00000006coi-2jbv; Thu, 30 Jan 2025 10:21:22 +0200
Date: Thu, 30 Jan 2025 10:21:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z5s2gpIj-HOiHD3C@smile.fi.intel.com>
References: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2c2f613-3b65-4efe-99c2-135f043b2d3b@samsung.com>
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

On Wed, Jan 29, 2025 at 06:50:57PM +0100, Marek Szyprowski wrote:
> On 29.01.2025 16:07, Andy Shevchenko wrote:
> >> [...]
> > Meanwhile, can you test this patch (on top of non-working case)?
> >
> > If I understood the case, the affected driver doesn't use case and we actually
> > write to the selector register twice which most likely messes up the things.
> > But this is only a theory (since we don't have the traces yet).
> 
> Bingo! This patch (on top of current linux-next) fixed the probe issue. 
> Feel free to add:
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thank you! I will test it on my HW as well to confirm that there no regressions
and will submit a formal fix.

> (although I'm not sure if this is a fix for the generic case or just 
> this driver)

This is for all cases where cache is not in use.

-- 
With Best Regards,
Andy Shevchenko


