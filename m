Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113BB8872D3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 19:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1821126DC;
	Fri, 22 Mar 2024 18:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axSqTKNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FC31126DB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711131406; x=1742667406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CSb/2Xd0kjyrzXVz+VuBtqsWEMSEE9CK8ZtmpNce0Hw=;
 b=axSqTKNkTnEVbovQV5wPy2pEYWljKjAVmd1nu4G+XVERUIL9KwuuMXIw
 UWcio8egxcmzvTO5JuYxx6rLWEsOTjkjHXzoEDo4rpsQaGeBo2WYQ+VlC
 kwSprKDIeAj9pklpZDD3oBiwIrrEUqKsgr71lLchnG68JSLzuOpVLYGJK
 WZ+HkuLM+YrR3JOFe+ws2ysdqKxj6sq7Wr4AjK+5lCBQJnuyDrwOqi5YI
 hztT38hmECrTpLcl0DRFSzMID4JeYWEsWnA4iQe/n+BK1lWQIGto7P/vr
 pF9TVrZK75fjbCeueOUxcs1xJ99FWuwG7mxm+RyKTYg5yjA50vxfXOLSO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28671895"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="28671895"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914750928"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="914750928"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:16:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rnjRW-0000000FEYM-2S1Q; Fri, 22 Mar 2024 20:16:38 +0200
Date: Fri, 22 Mar 2024 20:16:38 +0200
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
Message-ID: <Zf3LBvJEJF9xr2fv@smile.fi.intel.com>
References: <20240318234222.1278882-1-sui.jingfeng@linux.dev>
 <Zfq85f-Dp1S3CKuG@smile.fi.intel.com>
 <9ced20e0-dfbd-4337-b5df-223b7baffd9e@linux.dev>
 <ZftG6Q5AaG71dhWq@smile.fi.intel.com>
 <9644da91-f367-4083-a3e4-4d0677c8cbca@linux.dev>
 <Zf2uUwcMgIpo6rVh@smile.fi.intel.com>
 <6bf102a4-6419-4083-8918-4f7c76cfa9a1@linux.dev>
 <Zf3IWyrW8IZLTg4x@smile.fi.intel.com>
 <8afe3f27-fc8e-4c20-ba28-74a0a2937e55@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afe3f27-fc8e-4c20-ba28-74a0a2937e55@linux.dev>
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

On Sat, Mar 23, 2024 at 02:12:14AM +0800, Sui Jingfeng wrote:
> On 2024/3/23 02:05, Andy Shevchenko wrote:
> >   Besides that, the kernel project rule is "we do not add
> > the dead (unused) code".
> 
> This rule is good an correct and I admit.
> 
> But the problem is that it is chicken-and-egg problem,
> it probably have at least two user now.

Then show them! Convert in the same series and show that.

> it's possible that it will gain more users in the future.
> 
> But if you reject everybody from now, then it is zero.

As a no-user patch, yes, I reject this.

-- 
With Best Regards,
Andy Shevchenko


