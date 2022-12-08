Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A471F647397
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 16:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116D010E0EF;
	Thu,  8 Dec 2022 15:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD60D10E0EF;
 Thu,  8 Dec 2022 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670514805; x=1702050805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Oetrozn7hREZ1+E90eIuWjD6cJMvrafRb9KTJQ6cvAQ=;
 b=izHi7omGR7sl6P2DFIQcvDv4dNUSBrp8NPXl1hw2KhIAEQ9P3DrI3vDG
 lDJrbkX3xfYCKfpxhPzVo0a+jrF4IuFeohvyAodqr1vGZpogZLUupglnh
 uvmSRxqEzzRFM6GKlMxGnjTVni2VORk0xDbtey0GtGDZvNrhv+NsbsY/w
 lz7Uh4pcnYjO3fnaVYkeuOjTFU0qG5S6RXWrAfJVK26ezXi7zpl466kMi
 2TrkDBelijSTWJPtiDSy4QCvhLG5lJriQwjMKIvz1oW4BgoEVClBQSBvu
 41Y8HG6WK8Hkv9mfbXWhhVtZfoeT5Q3gZFBld3hxrQka2DfJrhVE+Yj8b Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="314850719"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="314850719"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 07:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="735852344"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="735852344"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2022 07:53:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1p3JD3-006QZD-2Z; Thu, 08 Dec 2022 17:53:17 +0200
Date: Thu, 8 Dec 2022 17:53:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 1/4] i915: Move list_count() to list.h as
 list_count_nodes() for broader use
Message-ID: <Y5IIbTtF4dHxRn/W@smile.fi.intel.com>
References: <20221130134838.23805-1-andriy.shevchenko@linux.intel.com>
 <Y5HelZhkxnPf6hIs@smile.fi.intel.com> <Y5HjTpzmgZWft+nF@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5HjTpzmgZWft+nF@kroah.com>
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
 Mathias Nyman <mathias.nyman@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Kevin Cernekee <cernekee@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 08, 2022 at 02:14:54PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 08, 2022 at 02:54:45PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 03:48:35PM +0200, Andy Shevchenko wrote:
> > > Some of the existing users, and definitely will be new ones, want to
> > > count existing nodes in the list. Provide a generic API for that by
> > > moving code from i915 to list.h.
> > 
> > Greg, I believe this one is ready to be taken. Or please tell me what I need
> > to do.
> 
> Wait for me to get through the current backlog of patches that I have in
> my review queue.  Odds are, it will have to wait until after 6.2-rc1 is
> out based on when 6.1 is going to be released.

It's fine, no hurry and take your time!

> Don't worry, it's not lost.

Thank you, got it!

-- 
With Best Regards,
Andy Shevchenko


