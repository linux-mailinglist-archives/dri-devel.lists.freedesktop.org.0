Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6A0CF4BBC
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E680810E411;
	Mon,  5 Jan 2026 16:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7LVJEuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A33610E437
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767631042; x=1799167042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qZAn9J61xyp2Ig1CyWZxSXFDkMK7qiIB3/dvwnNhe+g=;
 b=W7LVJEuKEeRy5Ljc6t0vHX7hPnyAR2Hgg2tTrzc0+esSkx6hLP1yvPND
 S3SUnolAswg1rE2Gb1tBB69RDenG5yA9azNPpx2Q/CQZLOvugvY4YST7N
 nSB98hp2RWZEdHjFw7xQlE2UrHdS2TnlGYkxnq5X2tdWnIYH0byb4sOzb
 iXqZ3/u01JG1XLQPHuunYQJVWRUM0ZTKvKxTS6KirnfE5nPzUJKZhQR9y
 3MwjEmHAe99KS/0OrQdrgKxAULJizVAQRcHXyZaa13L7FfC7JDgK7bb0D
 +aBU8y7iVqqY0K7974O30LunVCZngjP4YA8aTV+yLRSFjIfu3bUz1AvpE Q==;
X-CSE-ConnectionGUID: JE8U8qibSKGT9x2ed+v4HA==
X-CSE-MsgGUID: G9BOmQ1oQRaPCo0DPIgwIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79632665"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="79632665"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:37:00 -0800
X-CSE-ConnectionGUID: y6OEChXgRsWd37sdoT/7/w==
X-CSE-MsgGUID: TKzZCZDEQLevivsC5HWQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202475744"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.215])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:36:59 -0800
Date: Mon, 5 Jan 2026 18:36:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 4/4] staging: fbtft: hx8353d: send LUT via buffer to
 reduce stack usage
Message-ID: <aVvoqP9ONrNF45N4@smile.fi.intel.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-5-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104110638.532615-5-sun.jian.kdev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Sun, Jan 04, 2026 at 07:06:38PM +0800, Sun Jian wrote:
> Clang reports a large stack frame in init_display()
>  (-Wframe-larger-than=1024) due to the very large
>  write_reg(MIPI_DCS_WRITE_LUT, ...) call.
> 
> Send MIPI_DCS_WRITE_LUT followed by the LUT payload using
> fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.
> 
> No functional change intended.

...

> +static const u8 lut[] = {
> +			  0,  2,  4,  6,  8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
> +			 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62,
> +			  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
> +			 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
> +			 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
> +			 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
> +			  0,  2,  4,  6,  8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
> +			 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62,
> +			  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
> +			 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
> +			 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
> +			 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,

Two tabs too many on each line.

> +		};
> +

-- 
With Best Regards,
Andy Shevchenko


