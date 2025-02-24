Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF2A41973
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 10:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9E10E00D;
	Mon, 24 Feb 2025 09:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bT2ICR5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D6910E00D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740390446; x=1771926446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+WTxUZC6daTEmaagLEmds/XTc+7JQgGYHuO1yDEuspo=;
 b=bT2ICR5YhKL7qLMRyyaG2mtQb0x9lXzASSTMq78q5g0QXxQEm000K7ZW
 go4SZKEXCLQh5pcrzqR6nKECmwPs0vzf2QikoXtg4dNBkLCrc/7OafJA/
 2/oUBPRNKnZ7sDwdw8Kk+kaUJqflX0YAoyNU5ksfcGm030AhEcI+sTlKV
 QYrvnrPCS7zfHeOinzyDTe8PGtUX9eZ3jedwWwgTtN9fY5a8RY3xhCOg8
 wVSRQ/FdA3mqC4haJrwMKX2WSVKc4Qdkov4hD99OvHTDQ8mmuS6vKVjPc
 wfknpS3mkGkSqwx9AcDG51ZkdYVS8dfPAYrqjWVfMaEV7Y4u3Ic93XRf0 w==;
X-CSE-ConnectionGUID: ZJetSbTBTGa+EHuV+ZYIKQ==
X-CSE-MsgGUID: Df4wSZihQICoRo/EIHEqPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="44789673"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="44789673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 01:47:26 -0800
X-CSE-ConnectionGUID: vQmcoqNlR3C0fKUshxY8iA==
X-CSE-MsgGUID: oCE9LlNOTnOO77JGa4IywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121097706"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 01:47:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmV3R-0000000EXdv-14JO; Mon, 24 Feb 2025 11:47:13 +0200
Date: Mon, 24 Feb 2025 11:47:12 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Aditya Garg <gargaditya08@live.com>, "pmladek@suse.com" <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z7xAINooeB7zpnhf@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
 <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
 <6f7b0886-5f31-4ba9-b82e-e9d3614b504f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7b0886-5f31-4ba9-b82e-e9d3614b504f@suse.de>
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

On Mon, Feb 24, 2025 at 09:41:43AM +0100, Thomas Zimmermann wrote:
> Am 22.02.25 um 10:07 schrieb Aditya Garg:

...

> > > What padding, please? Why TCP UAPI headers do not have these attributes?
> > > Think about it, and think about what actually __packed does and how it affects
> > > (badly) the code generation. Otherwise it looks like a cargo cult.
> > > 
> > > > I tried removing __packed btw and driver no longer works.
> > > So, you need to find a justification why. But definitely not due to padding in
> > > many of them. They can go without __packed as they are naturally aligned.
> > Alright, I did some debugging, basically printk sizeof(struct). Did it for both packed and unpacked with the following results:
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_request_header is 16
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_request_header_unpacked is 16
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_response_header is 20
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_response_header_unpacked is 20
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_simple_request is 32
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_simple_request_unpacked is 32
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_information is 65
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_information_unpacked is 68
> 
> In the unpacked version, there is a 3-byte gap after the 'bits_per_pixel' to
> align the next field. Using __packed removes those gaps at the expense of
> runtime overhead.
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_frame is 12
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_frame_unpacked is 12
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_footer is 80
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_footer_unpacked is 80
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request is 48
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_unpacked is 48
> > 
> > Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_response is 40
> > Feb 22 13:02:04 MacBook kernel: size of struct appletbdrm_fb_request_response_unpacked is 40
> > 
> > So, the difference in sizeof in unpacked and packed is only in appletbdrm_msg_information. So, I kept this packed, and removed it from others. The Touch Bar still works.
> > 
> > So maybe keep just this packed?
> 
> The fields in the TCP header are aligned by design.

> Unfortunately, this hardware's protocol is not. And there's no way of fixing
> this now. Just keep all of them packed if you want.

It would be nice to see the difference in the code generation for the all
__packed vs. only those that require it.

> At least it's clear then
> what happens. And if your hardware requires this, you can't do much anyway.

One aspect (member level alignment) is clear but the other is not
(object level alignment). I dunno if it makes sense to be pedantic about this,
but would like to see the binary outcome asked for.

-- 
With Best Regards,
Andy Shevchenko


