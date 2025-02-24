Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE53A421A7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A0310E38F;
	Mon, 24 Feb 2025 13:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1k8JJGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7F610E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740394647; x=1771930647;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7hfsHgL/INpLXjgYIikKyfu88EoC0IKBjD6nLFbtgU0=;
 b=Y1k8JJGXvhH60fmOXf3tkJZb6hPjCFRbh6Lx6alXqrUWsipwPrjc53E8
 aL7CFcrcbjjUf9o5p2WPqGuxIGNH8uEUthUPuSoVIGdU+shxXQ7u9oHr9
 UkRhXf8tBDopN5jI2Oqy4ntDt1kQDqGxFsKYlXn1vBtqBZdK64sCMyVgv
 2P4/fwErlfxocZPD1MOsO4nEzP0BYpnJeOSjY+WqwMxVk5osNxLA0Qza1
 ahz4Jp3tEZjxBfwSibrJ1+vLUlhiJAl0mrp6A/Pzm7NE3gSB4RfiXbbBQ
 aEAcQH8tTItTwv2yQQIJObX3ewQ1M20CX/MgEXoP0uBgdWlGlDOhXVabm g==;
X-CSE-ConnectionGUID: IYTFWoyoRQyzL07jaxOpbw==
X-CSE-MsgGUID: /xu1SdNGTTOZccUMEQSi/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41282455"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41282455"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:57:26 -0800
X-CSE-ConnectionGUID: ES+jTAJtSXKQ2sETxQyyEQ==
X-CSE-MsgGUID: BpUwIM6JRqagnvcwet6SMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120150992"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:57:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmW9D-0000000Efl5-0aOo; Mon, 24 Feb 2025 12:57:15 +0200
Date: Mon, 24 Feb 2025 12:57:14 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "kekrby@gmail.com" <kekrby@gmail.com>,
 "admin@kodeit.net" <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 "evepolonium@gmail.com" <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7xQikQeHLOHb1G8@smile.fi.intel.com>
References: <16F819E8-E866-4552-BB08-31486D2BA8C5@live.com>
 <4DA18DF6-4C41-4D45-9DD4-B82E043B3320@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4DA18DF6-4C41-4D45-9DD4-B82E043B3320@live.com>
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

On Sun, Feb 23, 2025 at 03:16:28PM +0000, Aditya Garg wrote:

> > Looking at the header files, it looks like doing cpu_to_le32 on that variable and doing le32_to_cpu will actually reverse the order twice, on big endian systems, thus technically all way would not swap the order at all.
> > 
> > I'm not really sure how to manage the sparse warnings here.
> 
> Not sure whether the maintainers would like it, but we can do something like this:

This is not what we want, I believe. And this looks like a reinventing a wheel
of cpu_to_*() and *_to_cpu() or similar macros.

> 	case 'l’:
> #ifdef __LITTLE_ENDIAN
> 		val = orig;
> #else
> 		orig = swab32(orig);
> 		val = orig;
> #endif
> 		break;
> 
> 	case 'b’:
> #ifdef __LITTLE_ENDIAN
> 		orig = swab32(orig);
> 		val = orig;
> #else
> 		val = orig;
> #endif
> 		break;

-- 
With Best Regards,
Andy Shevchenko


