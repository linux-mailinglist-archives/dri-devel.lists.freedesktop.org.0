Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B47A25A55
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 14:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5413E10E4B5;
	Mon,  3 Feb 2025 13:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDqQQLnK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438B710E4B5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738588041; x=1770124041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Iv61x4iGBHTvEl65EBQzUt2TO7zniIckQfdujV1iu4=;
 b=iDqQQLnKhVUFxUAd29lHQpNzQgNjGall1epb2+bA7o6szs+8HEcxXMkS
 FW+r80wppy+DKIYczgkpyTHG4u+FzSIV37PzyBNbnBsybuGi9JCGvXAS/
 nZa6v9BB7z1vY8Ki5eTN9x8yjReJ8WLDSduWhjAYv/LXA0A6EJD17f1FA
 INOtdKSB7NBS5GQXHi1QZ2yNwX5mQtuy1/aQaa+pUvm2Q7VkprfkrJ/Ys
 cFa0rfNENBBNsDOUkeLtd1/Bjvj87/UbPw+6zNjZsbAvtnNT35iAnjK2k
 RGlfhj6+yBjqHihLMGuGuOPh81GMbXrYGDQI8Q70ajS8UTOlq0ILn/24u Q==;
X-CSE-ConnectionGUID: FNoibFJVRCSMaKfX+UHzvQ==
X-CSE-MsgGUID: XNqo7WSzT3G/dyD3SQ+Iyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50492925"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50492925"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:07:21 -0800
X-CSE-ConnectionGUID: 39ZnDj6TTMeDiJ1StK8P9A==
X-CSE-MsgGUID: o8Ar0ERMTZeO4bdLMiKkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114904819"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:07:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tewAW-00000007psU-1GMK; Mon, 03 Feb 2025 15:07:16 +0200
Date: Mon, 3 Feb 2025 15:07:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z6C_hAvjW9FC2Pix@smile.fi.intel.com>
References: <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
 <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
 <849eca29-4f03-4fb2-bd1f-747ce42f4c5f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <849eca29-4f03-4fb2-bd1f-747ce42f4c5f@sirena.org.uk>
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

On Mon, Feb 03, 2025 at 12:45:27PM +0000, Mark Brown wrote:
> On Mon, Feb 03, 2025 at 11:19:22AM +0200, Andy Shevchenko wrote:
> 
> > Thank you, guys, for reporting an testing, but it seems the simple problem
> > to solve requires a lot of changes to be done without regressions
> > (this fix on fix makes a regression to those who have cache enabled), which
> > means that for now I propose to revert it (or drop) if possible, Mark,
> > what is your preference?
> 
> I dropped it a while ago, it's not in mainline.

Okay, thanks!

-- 
With Best Regards,
Andy Shevchenko


