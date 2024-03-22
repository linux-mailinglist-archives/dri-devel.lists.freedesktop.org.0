Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9D8870A9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 17:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B7B1125C0;
	Fri, 22 Mar 2024 16:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcnBUbjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547B1125C0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711124094; x=1742660094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9clx4xMKo6TTUmWWEwbubFYNBTdT7l8M7ma/medzlo8=;
 b=CcnBUbjn72n75OJ16B4lusVmLNfbn1z3u4rDNFrgiKQC+eeQXHCpHLIX
 bN7nD0EsQSDcT6AJ19aGqFOfCvwhBDKbG0vQiYoRzaDfGgRqPQ7EfgF1k
 ribsjgMdWUBb0J8akDxUxUJwhlwwD7AKXDZWM4/v9E6anAsxOBHGa35FV
 RCwNOV00FMKj/p8Vqq6n8tfjmkf6gomI6gAvMfngdeP6V6CvURMT4Ku3c
 AmIZJEReSOrKPlNIg+afjeouIX27SRgH2lB8LjMVh2/foSJfw7fpPfyjD
 HWrFgQn6oisEDbSS+aqe5ARxgDHyPoFnW/nBUXYzN2UQmiHgi9hoxWgLK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6080435"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6080435"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914748094"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="914748094"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:14:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rnhX1-0000000FCWi-3ZGk; Fri, 22 Mar 2024 18:14:11 +0200
Date: Fri, 22 Mar 2024 18:14:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <Zf2uUwcMgIpo6rVh@smile.fi.intel.com>
References: <20240318234222.1278882-1-sui.jingfeng@linux.dev>
 <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
 <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
 <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
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

On Fri, Mar 22, 2024 at 05:00:05PM +0800, Sui Jingfeng wrote:
> On 2024/3/21 04:28, Andy Shevchenko wrote:

...

> > > > > By replacing it with device_get_match_data() and creating a software
> > > > > graph that mimics the OF graph, everything else works fine, except that
> > > > > there isn't an out-of-box replacement for the of_device_get_match_data()
> > > > > function. Because the software node backend of the fwnode framework lacks
> > > > > an implementation for the device_get_match_data callback.
> > > > .device_get_match_data
> > > > 
> > > > > Implement device_get_match_data fwnode callback fwnode callback to fill
> > > > .device_get_match_data
> > > OK, thanks a lot.
> > > 
> > > > > this gap. Device drivers or platform setup codes are expected to provide
> > > > > a "compatible" string property. The value of this string property is used
> > > > > to match against the compatible entries in the of_device_id table. Which
> > > > > is consistent with the original usage style.
> > > > Why do you need to implement the graph in the board file?
> > > It can be inside the chip, there is no clear cut.\
> > Which chip? Flash memory / ROM or you meant something like FPGA here?
> > For the latter there is another discussion on how to use DT overlays
> > in ACPI-enabled environments for the FPGA configurations.
> 
> There are some hardware resource or software entity is created on the
> driver runtime. But DT or DT overlays are compiled before device driver
> get loaded. GPIO-emulated-I2C is just an example, this is kind of driver
> level knowledge on the runtime. With the GPIO or programmable some
> hardware IP unit, device driver authors can change the connection relationship
> at their will at the runtime. While with DT, every thing has to be sure
> before the compile time.
> 
> DT overlays can be a alternative solution, but this doesn't conflict with
> this patch. This patch won't assume how device drives go to use it, and
> allow device driver creating device instead enumerating by DT. In one
> word: "flexibility".

Software nodes in general for the device driver / platform quirks.
They are not designed for what you are talking about here.

Consider using SSDT / DT overlays instead.

-- 
With Best Regards,
Andy Shevchenko


