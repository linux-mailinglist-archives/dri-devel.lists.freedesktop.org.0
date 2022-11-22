Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52DB634018
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E88810E40A;
	Tue, 22 Nov 2022 15:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F157910E409;
 Tue, 22 Nov 2022 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669130632; x=1700666632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rMOdI3P7VdfIy2nfD0+wdUsYo7XnmOvFsyP8v8HsR3g=;
 b=NSCJ4iaADUD9kg16U3d9Tolz9n7sX2VzYInlfHn5wINYIJfoTaCxN2mK
 SrKGYFobjH49e6LNuObd7j2OO7e/5rGKBJvg+dCwoVfoeI5+y1Nh/nKpi
 k8uUfN1kOQxF/6jguVbuV/9IvM91Hmajd4ban33QWrbLyIqSc9I4uTDbB
 6Z8oC6oJ6R2dbKYXrqnxkurUA/WkqlVEiD5RV76QcdjpT/ayROfGXXnFY
 cAMSveZrngQ7OSH2RJMI0o/mx8GXwECFcsvLr3CQr0KXCaWdbut/fOu/+
 mSvjoPg/wz6puqFSywlv1jmMFMNqpLXH518J5CZTYUkmIs8YpBp1WK4Xh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="400129238"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="400129238"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 07:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="705004007"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="705004007"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008.fm.intel.com with ESMTP; 22 Nov 2022 07:23:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oxV7h-00FsxN-2Q; Tue, 22 Nov 2022 17:23:45 +0200
Date: Tue, 22 Nov 2022 17:23:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/4] i915: Move list_count() to list.h for broader use
Message-ID: <Y3zpgRd89Dz/LTPk@smile.fi.intel.com>
References: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
 <87leoc2pbf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leoc2pbf.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Kevin Cernekee <cernekee@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jakob Koschel <jakobkoschel@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 05:46:28PM +0200, Jani Nikula wrote:
> On Mon, 14 Nov 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Some of the existing users, and definitely will be new ones, want to
> > count existing nodes in the list. Provide a generic API for that by
> > moving code from i915 to list.h.
> 
> I think I'd find list_length() a much more natural name for this.

i915 suggests my variant :-)

> *shrug*
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> regardless of what you decide to do with name or static inline etc.

Thanks! I will check which one looks and feels better and update for v3.

-- 
With Best Regards,
Andy Shevchenko


