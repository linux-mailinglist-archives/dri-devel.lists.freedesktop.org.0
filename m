Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F68D97CA55
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 15:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39310E6FA;
	Thu, 19 Sep 2024 13:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKm5Lt2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E813210E6F6;
 Thu, 19 Sep 2024 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726753536; x=1758289536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Afo0g08Q3Kxo1z9GMWGN318I9nnn7rzi/dNRfZGeOYw=;
 b=aKm5Lt2/0RfUVl4lgwzbdwkPW08haVRn2BHzRC7EYCq7iVGXqo+bKaJE
 4FmEZ1y9uBImg1wLEaM5sqGs22Uc8bvLOZO2gqiRcgw74avcHtHjQLekp
 ec4j/fsa8uA7iS4XIKMCe/2OghMjqV0a/9Xl1F/gm9DIpDneCbkhi1fn1
 yhAlixypZ4Tecvvw9w/6t5KSlJiiNI9LDPDkH2fai4MxNWoMUsk573VYe
 ChgcdwF3lnjqhILYnZkWgByd6omqxLARO5KsJ8x5t5NcUaP0uJ+oVWWAD
 H2JkE88ZeHjHy9g2xkkLOYfUVYqTbBDin4qGtCdj8fwr5h+MdzOUCK4IX Q==;
X-CSE-ConnectionGUID: Y4/bid+hQjuPHes0OKkXeQ==
X-CSE-MsgGUID: pZ7GvnTDQu6LMZlqp5v0zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25865654"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25865654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 06:45:36 -0700
X-CSE-ConnectionGUID: VPukWU1XTROyE0MKnz49qA==
X-CSE-MsgGUID: Xs8lIWRzQoSVavrJqy5ogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74721962"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 06:45:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1srHTM-0000000AXxQ-25pc; Thu, 19 Sep 2024 16:45:28 +0300
Date: Thu, 19 Sep 2024 16:45:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v5 2/4] drm: Expose wedge recovery methods
Message-ID: <Zuwq-NOtgr2E1R5S@smile.fi.intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com>
 <87msk6d8jw.fsf@intel.com> <ZuujCuVxFnOAKdgR@black.fi.intel.com>
 <87r09g9jp0.fsf@intel.com> <ZuvjGpIdOgGpbBQu@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuvjGpIdOgGpbBQu@black.fi.intel.com>
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

On Thu, Sep 19, 2024 at 11:38:50AM +0300, Raag Jadav wrote:
> On Thu, Sep 19, 2024 at 10:38:51AM +0300, Jani Nikula wrote:

...

> Anyway, would you prefer strlcat instead?

FYI: strl*() are subject to remove. They are bad, no-one should really prefer
them in the Linux kernel.

-- 
With Best Regards,
Andy Shevchenko


