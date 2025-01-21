Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D2A17ECB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 14:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E4710E585;
	Tue, 21 Jan 2025 13:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1dBJsR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC1810E585
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737466166; x=1769002166;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=H9kMdRt8GCDNIVgRncWAENc9hqjG3uNq8keSN4EZJxQ=;
 b=J1dBJsR9UbjxZtUwJVGGSXae4pvmiExsPRi2R7D0oiPWDRp8Hd6Pvsxt
 BPu2c1oc3sYV2PodGW66OIs80FG9yaytr1NEu31/9VIFQ9l5tVr/Me4W3
 TzToCzPtZgiEU2WdcSOgJ2C5mUAKZ/tEqMKR/JQ2wrX2bugCW4luGtwhx
 4AEP3ImwBSzDz4++fBZ3poR/r9KDlhr2agwRFyG+InSSszLgu5aaDp/Rj
 jZnaDABbIcQJQoylFEALiGqJ/sESDCcI3nTGF3rqhUpu1DlPEQNZVvUW9
 EyehSwQz43/fBuCGjJmE9qDhUFSnNqatf/jhcgUx3lhf7FC7PBPbCnmrL w==;
X-CSE-ConnectionGUID: caTS4DYCR6WAIA5EpkEhkg==
X-CSE-MsgGUID: r9168J1RQZWO2CO9rAGAbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48471232"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="48471232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 05:29:26 -0800
X-CSE-ConnectionGUID: 4dRFVcJ3SeS6MfcKpTSeCQ==
X-CSE-MsgGUID: lMTdIBpORPSMsbFyUBzeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="111795497"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 05:29:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1taEJl-00000003m1c-1QAp; Tue, 21 Jan 2025 15:29:21 +0200
Date: Tue, 21 Jan 2025 15:29:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
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

On Tue, Jan 21, 2025 at 08:33:09AM +0100, Marek Szyprowski wrote:
> On 17.01.2025 18:28, Andy Shevchenko wrote:
> > On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:

> > Does it fail in the same way?
> 
> Yes, the hw revision is reported as zero in this case: LT9611 revision: 
> 0x00.00.00

Hmm... This is very interesting! It means that the page selector is a bit
magical there. Dmitry, can you chime in and perhaps shed some light on this?

> >> Does it mean that there is really a bug in the driver?
> > Without looking at the datasheet it's hard to say. At least what I found so far
> > is one page of the I²C traffic dump on Windows as an example how to use their
> > evaluation board and software, but it doesn't unveil the bigger picture. At
> > least what I think is going on here is that the programming is not so easy as
> > just paging. Something is more complicated there.
> >
> > But at least (and as Mark said) the most of the regmap based drivers got
> > the ranges wrong (so, at least there is one bug in the driver).
> 
> I can do more experiments if this helps. Do you need a dump of all 
> regmap accesses or i2c traffic from this driver?

It would be helpful! Traces from the failed and non-failed cases
till the firmware revision and chip ID reading would be enough to
start with.

-- 
With Best Regards,
Andy Shevchenko


