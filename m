Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD883F5E4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 15:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C698310E804;
	Sun, 28 Jan 2024 14:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01610E804
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706452693; x=1737988693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ANwtYKhLvju5//43bnHV/uOQimOHUSPddVFPoST5fb4=;
 b=JrTkpw0Jd7OwlqYRyclhe9/qGFbr4SAsWUU7LOoe6wHOTcOLJMk5gEk+
 g9qSlQEdXZK0ssk3+RAf4SEG8IGhsMWrBxpRJ7rOL92PQg7OV+Wsb2ld5
 0HVoUKkKviIvqbN4XdlOfKcAcDcfxLV8THaTlljB7iop2ZD/CUfQUscQo
 mbLhCt70rIGf6uThNJa5IKaioAoAA2VYqq6JkXQNCTAtfPx0LvuJ4Q15n
 LC7qoWP7RiQ8OSVawTZSlzXFSQzOiGpfUQsyzv2gWEmHCUE8oVxzPuNRl
 LOp+15n/r1sCS7WgLUaIwVBwktkVgU42i83Ouz9l97m5k4/RbgA3ichfc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="399932778"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="399932778"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 06:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="906818358"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="906818358"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 06:38:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rU6IO-0000000HTqZ-2aVl; Sun, 28 Jan 2024 16:38:04 +0200
Date: Sun, 28 Jan 2024 16:38:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 1/4] backlight: hx8357: Make use of device properties
Message-ID: <ZbZmzC6A_TxGvEWm@smile.fi.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-2-andriy.shevchenko@linux.intel.com>
 <20240124171953.GA15539@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124171953.GA15539@aspen.lan>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 05:19:53PM +0000, Daniel Thompson wrote:
> On Sun, Jan 14, 2024 at 05:25:08PM +0200, Andy Shevchenko wrote:

...

> > +typedef int (*hx8357_init)(struct lcd_device *);

> > +	hx8357_init init;
> 
> As somewhere else in this thread, I'd find this a lot more readable
> as:
> 	hx8357_init_fn init_fn;

I agree with you, dunno why I haven't added _fn in the first place...

-- 
With Best Regards,
Andy Shevchenko


