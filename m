Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B884DBD9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 09:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5910E4CB;
	Thu,  8 Feb 2024 08:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsxYhPQ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E16210E46D;
 Thu,  8 Feb 2024 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707382210; x=1738918210;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0lR0Js2Ta6ESjjgeXWYiaIlClzCWLnCunSK0HHuu9dE=;
 b=bsxYhPQ8B0HIHBmtXJUfd3EQmabp/9VLavTByvCHcOdIwjo1Dby9qBoI
 PDM632/DYDRN0oUcyuhvGxlRtyf4TFuaRvDxA2ktteWNVhmU33IoVTV1A
 vlJc/MHINGeMul1a9TZzgne8aYQMoWHHTSjmDfrozqcusAUc4M9/+B9uL
 uAzBuVBcCzL7YlWx/iFmsNoJEBykflVnoDzQ+//iRo0r50Z88J9pWCbdB
 j1QshcWyO/EOwSnh2alwoycuKjEIkMw9bD6yP9zVZlTkf0aDl4AF2qD9n
 0tbW2pq9SExYHK5404HACTQFluEcFHNOuDtEASL6eltbZwEZuYhB0gieB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1071739"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1071739"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:50:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1837099"
Received: from aavzirov-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.13])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:50:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Yury Norov
 <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Lucas De
 Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 3/3] drm/i915: Convert REG_GENMASK* to fixed-width
 GENMASK_*
In-Reply-To: <20240208074521.577076-4-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-4-lucas.demarchi@intel.com>
Date: Thu, 08 Feb 2024 10:49:58 +0200
Message-ID: <875xyzcpc9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 07 Feb 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Now that include/linux/bits.h implements fixed-width GENMASK_*, use them
> to implement the i915/xe specific macros. Converting each driver to use
> the generic macros are left for later, when/if other driver-specific
> macros are also generalized.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks for doing this!

This is fine to merge via whichever tree you find best. The i915 parts
have very little conflict potential, there haven't been changes here in
a while.

BR,
Jani.


-- 
Jani Nikula, Intel
