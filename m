Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712797D6E0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 16:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE2610E835;
	Fri, 20 Sep 2024 14:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyHFLcRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C334110E14D;
 Fri, 20 Sep 2024 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726842487; x=1758378487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kx/FQYBS2CwdLBqJ+8m0hxufJTzUsE/7NGH7FKRCi/E=;
 b=AyHFLcRGb+XvA7bKVW1NhCMhGOSSChv21ydi9h25zIvrvLMImkcRKQ7n
 XlPPjmrTn1suHAmOKtbR7qmwc5CoBiXSGpT9Q8iefgv5MMq0VlYgBLp02
 CY42MV5K0XaOrbQsg63q+TCbg8o2V7ztNaXrpLmth8/NtSVLUIYvWcmSx
 rqFg0Fvgtzaav9gjzWdTv9qS5Jl+u1rBZqFvPd57QKICUVnEvAAPLPpv2
 j6nYZldh4vx7D72lLj8i/8uy/JClXj3dC8TF6UqwLWPdm+ACqH0OPxd7u
 M2EvujlSTBlWhM/Q/8oqygwvoREC7qKqC02AyE/1Y9RLGv1n1QTaSMq2T g==;
X-CSE-ConnectionGUID: Ih6zmSwsQleIUQrsTuh7TQ==
X-CSE-MsgGUID: LtsyoMpCQkKKjFm+H1qAoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="26035856"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="26035856"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:28:06 -0700
X-CSE-ConnectionGUID: S/OCPEMlTDOi/LmWwmc7Sw==
X-CSE-MsgGUID: VXf0k4FJRDq56L9Fdg9N+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="75086179"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:28:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1srec2-0000000AwGC-3RXy; Fri, 20 Sep 2024 17:27:58 +0300
Date: Fri, 20 Sep 2024 17:27:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Kees Cook <kees@kernel.org>
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
Message-ID: <Zu2GbvcPO5vrc7SS@smile.fi.intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com>
 <87msk6d8jw.fsf@intel.com> <ZuujCuVxFnOAKdgR@black.fi.intel.com>
 <87r09g9jp0.fsf@intel.com> <ZuvjGpIdOgGpbBQu@black.fi.intel.com>
 <Zuwq-NOtgr2E1R5S@smile.fi.intel.com>
 <Zu1Z-xnjoEuUf8dt@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zu1Z-xnjoEuUf8dt@black.fi.intel.com>
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

+Cc: Kees

On Fri, Sep 20, 2024 at 02:18:19PM +0300, Raag Jadav wrote:
> On Thu, Sep 19, 2024 at 04:45:28PM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 19, 2024 at 11:38:50AM +0300, Raag Jadav wrote:
> > > On Thu, Sep 19, 2024 at 10:38:51AM +0300, Jani Nikula wrote:

...

> > > Anyway, would you prefer strlcat instead?
> > 
> > FYI: strl*() are subject to remove. They are bad, no-one should really prefer
> > them in the Linux kernel.
> 
> Not showing up on checkpatch (along with a few others from deprecated.rst).

Feel free to update!
See d26270061ae6 ("string: Remove strlcpy()")

-- 
With Best Regards,
Andy Shevchenko


