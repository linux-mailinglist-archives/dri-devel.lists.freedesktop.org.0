Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB2A4216C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93C10E501;
	Mon, 24 Feb 2025 13:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jS8GT6zS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165A10E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740390916; x=1771926916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1ilvj0oDQeThsIG8wBY8lof+2A6deA3Sr4q3qxryDVo=;
 b=jS8GT6zSYSX5Wvulf/f6ohkOFJfqyPU1tQySOJXeqrz/HbLAY8BUImaN
 +tv9QMelInR/ZhQzEe6QKzbsz6lNrwYYYD8nEW7BTJRmwAip790X3lfIU
 4qk1iavQw5g7yKdXbsr4PtfaG+eCDjwxqzIQU7AlCwQU2Vr9hr57LR4Xz
 Wvx4mOcWMD2Z6fV8AkEgomHJ1vIBzhAPntwdsRukSTsy+M3Jna7dC9tAU
 bqM7CjtVU8qIGfRkqS1KrXQIYIdOMJlwn+bflex8CrY3bKgKKQNd4r7Nu
 HW/Wuesvxf2AimRMD74iaeZXx7+2sVlzMkWgjzHI0O+9oT2wryXDO+qq2 g==;
X-CSE-ConnectionGUID: q6EMwELMRJumyCeZa7dXgQ==
X-CSE-MsgGUID: HGpdDxyzTMucuQa2E3CRkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="52538781"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="52538781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 01:55:16 -0800
X-CSE-ConnectionGUID: lC++JjrHQvqYs+QjHqNAUg==
X-CSE-MsgGUID: xy0XPd+SSduIhKi6mf0hPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153213616"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 01:55:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmVB1-0000000EeoE-3eVf; Mon, 24 Feb 2025 11:55:03 +0200
Date: Mon, 24 Feb 2025 11:55:03 +0200
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
Subject: Re: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Message-ID: <Z7xB9xD6748bF9vJ@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <Z7ig8Br4duEt2TUG@smile.fi.intel.com>
 <27efffe1-6562-4612-a748-893475ba02fa@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27efffe1-6562-4612-a748-893475ba02fa@suse.de>
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

On Mon, Feb 24, 2025 at 10:19:13AM +0100, Thomas Zimmermann wrote:
> Am 21.02.25 um 16:51 schrieb andriy.shevchenko@linux.intel.com:
> > On Fri, Feb 21, 2025 at 11:36:00AM +0000, Aditya Garg wrote:

...

> > > +	for (x = 0; x < pixels; x++) {
> > > +		pix = le32_to_cpu(sbuf32[x]);
> > > +		/* write red-green-blue to output in little endianness */
> > > +		*dbuf8++ = (pix & 0x00ff0000) >> 16;
> > > +		*dbuf8++ = (pix & 0x0000ff00) >> 8;
> > > +		*dbuf8++ = (pix & 0x000000ff) >> 0;
> > put_unaligned_be24()
> 
> I'm all for sharing helper code, but maybe not here.
> 
> - DRM pixel formats are always little endian.
> - CPU encoding is LE or BE.
> - Pixel-component order can be anything: RGB/BGR/etc.
> 
> So the code has a comment to explain what happens here. Adding that call
> with the _be24 postfix into the mix would make it more confusing.

I'm not objecting the comment, the code has definite meaning and with the
proposed helper it makes clearer (in my opinion).

Comment can be adjusted to explain better this conversion.

Or, perhaps pix should be be32? That's probably where confusion starts.

		pix = be32_to_cpu(sbuf32[x]);

		/* write red-green-blue to output in little endianness */
		put_unaligned_le24(...);

?

> > > +	}

...

> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		3,
> > > +	};
> > One line?
> > 
> > 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = { 3 };
> 
> I'd be ok, if there's a string preference in the kernel to use thins style.

Just a common sense to avoid more LoCs when it's not needed / redundant.

> Most of DRM doesn't AFAIK.

-- 
With Best Regards,
Andy Shevchenko


