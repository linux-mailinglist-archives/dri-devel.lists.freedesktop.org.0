Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C188A2A3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D734010E8C9;
	Mon, 25 Mar 2024 13:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCTirM+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE1510E8C3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711374112; x=1742910112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q50oreO5/tOU0HVDRwYJo9YrBA4CBym6hJeFokjz93U=;
 b=gCTirM+wt1jNh+N2Eg5si7KPzo2BFGtnDJJ5ekCg6DaXs3ry5ELF/sdy
 35Mxvzi3oHILTr5vxUKElwTvSLGhec0b2VfmpDb3wW+ad0E3CroS8p1Mp
 ZxJq66A3pawHF9vc1uCf+S5RAe1cfzXN2wMyqL7b1immqV42leOVdHeL1
 jsEMZcacHeAsDYWFd+WtLW/S9H4HreQ+A8YwfO5NQFuipdw/do1pDlmXu
 LQUOHCLMu5rzxTv4gi3EoVj6ocjjhZXBxhbMtXxNIHG0oWfI6Oo8BghR2
 mTsFCuEamnZmMGc2YtlyjWTOsuNXCYFwcIofT4D35F1to/A1E4P9Nc14J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="23860698"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="23860698"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 06:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="914843837"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="914843837"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 06:41:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1roka9-0000000FzrR-3avd; Mon, 25 Mar 2024 15:41:45 +0200
Date: Mon, 25 Mar 2024 15:41:45 +0200
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
Message-ID: <ZgF_GRPHcdiDyxvX@smile.fi.intel.com>
References: <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
 <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
 <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
 <Zf2uUwcMgIpo6rVh@smile.fi.intel.com>
 <6bf102a4-6419-4083-8918-4f7c76cfa9a1@linux.dev>
 <Zf3IWyrW8IZLTg4x@smile.fi.intel.com>
 <8afe3f27-fc8e-4c20-ba28-74a0a2937e55@linux.dev>
 <Zf3LBvJEJF9xr2fv@smile.fi.intel.com>
 <839a7448-b958-402e-862a-fc3f7d86e797@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <839a7448-b958-402e-862a-fc3f7d86e797@linux.dev>
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

On Sat, Mar 23, 2024 at 02:30:08AM +0800, Sui Jingfeng wrote:
> On 2024/3/23 02:16, Andy Shevchenko wrote:
> > On Sat, Mar 23, 2024 at 02:12:14AM +0800, Sui Jingfeng wrote:
> > > On 2024/3/23 02:05, Andy Shevchenko wrote:
> > > >    Besides that, the kernel project rule is "we do not add
> > > > the dead (unused) code".
> > > This rule is good an correct and I admit.
> > > 
> > > But the problem is that it is chicken-and-egg problem,
> > > it probably have at least two user now.
> > Then show them! Convert in the same series and show that.
> 
> I believe that Vladimir has show enough to you. I have read that thread,
> I think Vladimit have explained very well.

Let's continue there. I replied there just now.

-- 
With Best Regards,
Andy Shevchenko


