Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05273AD338B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673AE10E0C0;
	Tue, 10 Jun 2025 10:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9V4Sd/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EBA10E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749551208; x=1781087208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xj4Bk+QtP4Xe69OFwGbfLYunFjAhUgQvako1o9IrDtw=;
 b=L9V4Sd/B5lZVEM5lvinRVs6nb3hM5nkC2YWnAwXq7gP21mQ7bfAIEihK
 1zjdE7k+hmU32R5QYQnxk+o2rp+l3IBcD3fz4uPjzbVPYekAw+ChNqh4J
 xs1uDXb5aHE9zJKayXwLLHX4uqBTY3CdzZyN6zyEWlfBJjgyGuR5GY0Na
 DYqxBkpDFhO+n5xIPXhAw+RDA2FVRoWiY6r2Ly8iSP3O0LyvkjjiGdgLN
 yuTRs6rFMDcYsm9zgKG9vVFQ6ivrtzlLdgkNaL4bQqWDr50QuSJzCV6An
 sEqE12mrbbRUjdxmUfVmxaDe4/J3/PhjcA5K5fhxWbJjNbr9LIQPndJMm w==;
X-CSE-ConnectionGUID: Hwayic9GTAmyQ3ievxVhIw==
X-CSE-MsgGUID: fDpu5mJbRDqhE9QfZi281Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="39271734"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="39271734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 03:26:47 -0700
X-CSE-ConnectionGUID: T+GOp6Q7Ta66D4mv0ATegA==
X-CSE-MsgGUID: ODHchsrkR7WUYMpiy6C/2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="183977231"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 03:26:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uOwBj-00000005Jum-2oTR; Tue, 10 Jun 2025 13:26:39 +0300
Date: Tue, 10 Jun 2025 13:26:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Riyan Dhiman <riyandhiman14@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Paolo Perego <pperego@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbtft: reduce stack usage
Message-ID: <aEgIX221QIt5k0zY@smile.fi.intel.com>
References: <20250610092445.2640575-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092445.2640575-1-arnd@kernel.org>
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

On Tue, Jun 10, 2025 at 11:24:38AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The use of vararg function pointers combined with a huge number of
> arguments causes some configurations to exceed the stack size warning
> limit:
> 
> drivers/staging/fbtft/fbtft-core.c:863:12: error: stack frame size (1512) exceeds limit (1280) in 'fbtft_init_display_from_property' [-Werror,-Wframe-larger-than]
> 
> drivers/staging/fbtft/fb_ssd1331.c:131:30: error: stack frame size (1392) exceeds limit (1280) in 'set_gamma' [-Werror,-Wframe-larger-than]
>                   ^
> drivers/staging/fbtft/fb_ssd1351.c:120:30: error: stack frame size (1392) exceeds limit (1280) in 'set_gamma' [-Werror,-Wframe-larger-than]
> 
> Move the varargs handling into a separate noinline function so each
> individual function stays below the limit. A better approach might be to
> replace the varargs function with one that takes an array of arguments,
> but that would be a much larger rework of the other callers.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +static noinline_for_stack void fbtft_write_register_64(struct fbtft_par *par,
> +							int i, int buf[64])

Perhaps int i, int buf[64] should be u32?

> +{
> +	par->fbtftops.write_register(par, i,
> +		buf[0], buf[1], buf[2], buf[3],
> +		buf[4], buf[5], buf[6], buf[7],
> +		buf[8], buf[9], buf[10], buf[11],
> +		buf[12], buf[13], buf[14], buf[15],
> +		buf[16], buf[17], buf[18], buf[19],
> +		buf[20], buf[21], buf[22], buf[23],
> +		buf[24], buf[25], buf[26], buf[27],
> +		buf[28], buf[29], buf[30], buf[31],
> +		buf[32], buf[33], buf[34], buf[35],
> +		buf[36], buf[37], buf[38], buf[39],
> +		buf[40], buf[41], buf[42], buf[43],
> +		buf[44], buf[45], buf[46], buf[47],
> +		buf[48], buf[49], buf[50], buf[51],
> +		buf[52], buf[53], buf[54], buf[55],
> +		buf[56], buf[57], buf[58], buf[59],
> +		buf[60], buf[61], buf[62], buf[63]);
> +}

Wondering if we may reuse this in other cases (by providing the additional
length parameter). But it may be done later on.

-- 
With Best Regards,
Andy Shevchenko


