Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B594AEB5E8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1617810E044;
	Fri, 27 Jun 2025 11:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZsi9cED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018FE10E044
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751022466; x=1782558466;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+F4+PRH6RZeS8ugoToiy4TCKLKkcYPK+TGHSXOUNJ18=;
 b=TZsi9cEDzeUWdeSvRvubhEgOPrpfHKiCRdTHs0rZCfugGPjBMISCwV3a
 Ax7yRU8opXGQPqoO4hvk3oLwjSjdToaWIQomYrl6Qewh8Zy9ww9zgK3l5
 HNEVft2PQzVN9+u+0BiRuVlvHpEHlEpxdLZm0lkIe+YoR2UxvWZIRlCs5
 Q0CBS7mG9k4uWEAUbJiMHPFu+k30IwylOYy52UE7YZlmL0ei5J6h1tms2
 kZZWNg9TTWJhdDHCsnEa3OkHMLCizTEjCKkklzj5hngcFfH9Qv4SZTu7Y
 SBuXEoevCeAGnzhEqdKDwzfAAwXMrkcpqlK3MN8Urccw/uIxJ03NhUQy5 w==;
X-CSE-ConnectionGUID: YHxgB8rETKWdwV9OZI1h4A==
X-CSE-MsgGUID: 6IuPCkbfTGWOFfQCNAPP/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64772544"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64772544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 04:07:45 -0700
X-CSE-ConnectionGUID: 6KDakIrXREWbY/0lrldFZA==
X-CSE-MsgGUID: Fpu8o9HZTqm4cjPeGaFeug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153494856"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 04:07:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1uV6vh-0000000ASaL-04jT; Fri, 27 Jun 2025 14:07:37 +0300
Date: Fri, 27 Jun 2025 14:07:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <aF57eMeNafg1w9Qw@smile.fi.intel.com>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
 <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
 <0327da98-8a7c-4db8-8bcd-4179b87a9486@suswa.mountain>
 <aF3CwnHyW5HHzDSG@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF3CwnHyW5HHzDSG@surfacebook.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Fri, Jun 27, 2025 at 12:59:30AM +0300, Andy Shevchenko wrote:
> Thu, Jun 26, 2025 at 11:11:39PM +0300, Dan Carpenter kirjoitti:
> > On Thu, Jun 26, 2025 at 08:50:43PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:

...

> Ah, you have a point. Yes, the moving vmem allocation will solve the ordering
> issue.

...with moving from devm for the txbuf. Otherwise we would still have a
problematic ordering with it.

-- 
With Best Regards,
Andy Shevchenko


