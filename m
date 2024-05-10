Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABDF8C27E5
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5B610E2CD;
	Fri, 10 May 2024 15:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuddutjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC04310E2CD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715355219; x=1746891219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FyxosxiDRe7kVFCrtSH8YTzfIKGevBBbWmNlhONBN+4=;
 b=NuddutjBatgF5Eclz78Dm9SDO0gyjMaas3erYSmW+pHXWKd04rskzQtJ
 ZuzymTaWmsqVWxH8apDDxXuchDsTs+fwXImkSlBKhIGnWqqKADg6wpXom
 YMUIauK5DGV0hA/F77zAGGRFPotkXjkb5Ztq2gDz/CKNnmpfFLEsLLM5h
 WWr5y6b/eQAd+++dwSBcsyGukuRu22AMieQS5wT/W/teW7EvRWEsKEmW+
 vpZnWn3jnl7E20RlQyqK0Y2ERbEbNMEDnmKFcxnuKDw2TN4rTRuLvh8+z
 9MCwa1Ihz1rUGJJ2aaZ5+bGRPQy3J5ZIwGJg7bXvQTLGUHy65ukbJFoDh Q==;
X-CSE-ConnectionGUID: vUphZErtR5an4S4+DpxdCw==
X-CSE-MsgGUID: tUe4vpeuT9iDySnT8UKGzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11473312"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11473312"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:33:39 -0700
X-CSE-ConnectionGUID: 89FEUiuBR0m5PfFMMwgE1w==
X-CSE-MsgGUID: GBexyAV4TMKoXywh+6+7qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34090819"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:33:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s5SFV-000000069Cb-2rTA; Fri, 10 May 2024 18:33:29 +0300
Date: Fri, 10 May 2024 18:33:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com, jani.nikula@intel.com
Subject: Re: [PATCH v7 8/8] gpu: ipu-v3: Use generic macro for rounding to
 nearest multiple
Message-ID: <Zj4-SfdNjRHxpHhe@smile.fi.intel.com>
References: <20240509184010.4065359-1-devarsht@ti.com>
 <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
 <20240510151642.GA17158@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510151642.GA17158@pendragon.ideasonboard.com>
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

On Fri, May 10, 2024 at 06:16:42PM +0300, Laurent Pinchart wrote:
> On Fri, May 10, 2024 at 06:03:52PM +0300, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 12:10:10AM +0530, Devarsh Thakkar wrote:
> > > Use generic macro round_closest_up for rounding to nearest multiple instead
> > 
> > round_closest_up()
> > 
> > We refer to the functions as func().
> > 
> > > of using local function.

...

> > > @@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
> > >  		 * The closest input sample position that we could actually
> > >  		 * start the input tile at, 19.13 fixed point.
> > >  		 */
> > > -		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
> > > +		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
> > >  		/* Convert 19.13 fixed point to integer */
> > >  		in_pos_rounded = in_pos_aligned / 8192U;
> > 
> > Oh, these seems to be better to use either ALIGN*(), or PFN_*() / PAGE_*()
> > families of macros. What the semantic of 8192 is?
> 
> The comment mentions 19.13 fixed point, so I assume that's the
> fractional part of the integer. It doesn't seem related to pages.

Okay, and align word in all those variable names?

-- 
With Best Regards,
Andy Shevchenko


