Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F29E9D41
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 18:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06B810E2B5;
	Mon,  9 Dec 2024 17:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTvqMy1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6510E2B5;
 Mon,  9 Dec 2024 17:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733766242; x=1765302242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6wjLHH7rUxhPRX8p4wYcPT6RIaukhl/0O/xDVIzYZCk=;
 b=XTvqMy1LJ5gG+zUAwVDL3z6yvlCl2PbaQqGDndXjtTfJfQlVutryn0lV
 ipw4t33rMefXM2Fndeb/HStgcR8jrzj5Hh1nl2E4Ztsoe0L+Mf9RqZm/8
 0W0YdpEfh4vb0Fv+hrMIZFwdjv5VK/9MKBMxMeYVZG4wb32Wn7FVOP2fo
 vYydj5bnOQHRkO3Nnrk4CMuqrDo7L0XwcdlF5GHTigFiCXrvMLHem1LJR
 6rW9c1se6/lTD/0EiKRbvyFZF3oU39kaZsrNKhEOMiQYOffAEEGlvjO2o
 QmuYpUgzBm1RutFr8BimRHpOedRwygaXGHEah03NTYFZ5Hp1wSMISSP/t A==;
X-CSE-ConnectionGUID: 4iRr1QGVSAecS/YjGAi5+Q==
X-CSE-MsgGUID: Utk5gyENTKOs9cG+XN+5YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37869052"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="37869052"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 09:44:01 -0800
X-CSE-ConnectionGUID: cnmkT3GRTdise+d84+CuUg==
X-CSE-MsgGUID: 4CY94QGUSbqCsK0cniNPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="94844405"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 09:43:58 -0800
Date: Mon, 9 Dec 2024 19:43:55 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv10 00/10] Display Global Histogram
Message-ID: <Z1csWzRHDzU0pds9@black.fi.intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209165756.GQ3224633@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209165756.GQ3224633@mdroper-desk1.amr.corp.intel.com>
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

On Mon, Dec 09, 2024 at 08:57:56AM -0800, Matt Roper wrote:
> On Mon, Dec 09, 2024 at 09:54:54PM +0530, Arun R Murthy wrote:
> > Display histogram is a hardware functionality where a statistics for 'x'
> > number of frames is generated to form a histogram data. This is notified
> > to the user via histogram event. Compositor will then upon sensing the
> > histogram event will read the histogram data from KMD via crtc property.
> > A library can be developed to take this generated histogram as an
> > input and apply some algorithm to generate an Image EnhancemenT(IET).
> > This is further fed back to the KMD via crtc property. KMD will use this
> > IET as a multiplicand factor to multiply with the incoming pixels at the
> > end of the pipe which is then pushed onto the display.
> > 
> > One such library Global Histogram Enhancement(GHE) will take the histogram
> > as input and applied the algorithm to enhance the density and then
> > return the enhanced factor. This library can be located @
> > https://github.com/intel/ghe
> > 
> > The corresponding mutter changes to enable/disable histogram, read the
> > histogram data, communicate with the library and write the enhanced data
> > back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
> > and https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206
> > The IGT changes for validating the histogram event and reading the
> > histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/
> 
> I think other people have already asked this on previous postings of
> these patches, but please don't try to manually hack the version numbers
> within a series.  What you just posted has "PATCHv10" on the cover
> letter, "PATCHv2" on one patch, "PATCHv3" on three patches, and the rest
> are unversioned "PATCH."  The general expectation these days is that
> versioning in the subject applies to the series as a whole, not the
> individual patches, so this causes a lot of confusion.  Posting like you
> did here also wrecks havoc on a lot of the tools people use to manage
> and compare series like the "b4" tool.
> 
> When generating and sending a new series, you should just do something
> like "git format-patch -v10 ..." so that the proper "v10" numbering is
> automatically applied to all the patches and we don't wind up with this
> strange jumble.

Isn't that the starting point?

https://kernelnewbies.org/FirstKernelPatch -> "Versioning patchsets"

Raag
