Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F22C8C9A4A
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019BC10E57D;
	Mon, 20 May 2024 09:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQbBfgZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA88010E584
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716197173; x=1747733173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+o5WBwq3z89cCTcpo5xmDGTx5x6mVmQa0pcXGwdpSq4=;
 b=aQbBfgZ5H59yVx9i9S2AKHX73xLvS2LmNSfbwYdy0AdDPNSqniTxmLlx
 izUv2MO9LE0iL/GAyVqQbkyK6nrNcrVaJALBOOfbEoQB8bEPFR4gCIUUY
 T786iRnLUyggogR2cjn2OJ3kx1FU2hKm7TX+tIqiakIxBmmf17TmjV0WW
 7hNZGFxjFBXt642VmvZ4k42yG/eiOhOuZKFTDamn0bQvZ02j9CaNIVltP
 93JCTnjz/oQmUZi8/z1ks7dAZ0WZeuYXy5iR8pFrNLl/WgVo5jO43cVwi
 xqQKnqs7HOi6Bz+bkh7HfqYcvSGqJtuNxlnRBBPM0R/uOowjieQxEekvZ Q==;
X-CSE-ConnectionGUID: iNZx9XBMSe6LWYNtc6djFQ==
X-CSE-MsgGUID: LN5xC1XHQ0a/PvQ1NXCHbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12503806"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12503806"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:26:11 -0700
X-CSE-ConnectionGUID: bgDNe6UKToKCx6fw2iVP6Q==
X-CSE-MsgGUID: JkJGMuG0TSyTHiDiTgyLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="36886785"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:26:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s8zHO-00000009GGq-0M79; Mon, 20 May 2024 12:26:02 +0300
Date: Mon, 20 May 2024 12:26:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Latypov <dlatypov@google.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com,
 jani.nikula@intel.com, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZksXKaT2514B71QL@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <CAGS_qxpCM=Aw1J_EVQPZv_nDy0zCp6JqxfQk5mGkV+5iCe1OZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGS_qxpCM=Aw1J_EVQPZv_nDy0zCp6JqxfQk5mGkV+5iCe1OZA@mail.gmail.com>
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

On Fri, May 17, 2024 at 01:53:47PM -0700, Daniel Latypov wrote:
> On Fri, May 17, 2024 at 1:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > > [devarsht: Rebase to 6.9 and change license to GPL]
> >
> > I'm not sure that you may change license. It needs the author's confirmation.
> 
> Checking, this is referring to the MODULE_LICENSE, which used to be
> MODULE_LICENSE("GPL v2");
> 
> and is now
> MODULE_LICENSE("GPL");
> 
> If checkpatch is suggesting that now, then changing it sounds good to me.

In this case I agree on the change as it's purely syntax and not semantic.

> > > ---
> > > Changes since v6:
> > > * Rebase to linux-next, change license to GPL as suggested by checkpatch.
> >
> > Note, checkpatch.pl is not false positives free. Be careful
> > with what it suggests.
> >
> > > +#include <kunit/test.h>
> > > +#include <linux/gcd.h>
> >
> > > +#include <linux/kernel.h>
> >
> > Do you know why this header is included?
> 
> I think I had put it in the original before a lot of the work you did
> to split things out of kernel.h.
> I haven't had time to look apply this patch series locally yet, but
> I'd be pretty sure we can remove it without anything breaking.

Briefly looking at the code I even not sure it was needed before, but maybe
I missed something, in any case, please remove / replace it.

-- 
With Best Regards,
Andy Shevchenko


