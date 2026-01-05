Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBACCF4ADB
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AA110E1DC;
	Mon,  5 Jan 2026 16:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnPak/ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E52D10E1DC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767630520; x=1799166520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FsPS/LubOaNTccnvOYz0BxmjeM7vrFfXaA9Rl62TCtg=;
 b=gnPak/ruUMxEH6yxtPppSzUydxbxw6n4S4ru+kXMWPvOYcj7B/m3SUW2
 FaxyA3/xJs14a3YCbFx8GgHhWHSvgGC6ok6Or0GqB/1Hi17Ymf/M+KnWd
 SEbq9+z+3gxZfBNI5U7pstmmufxrWGmTckFv7sT8Y5Rs87CzGfOjvIQPS
 UmknQFN+z+1lltA7wctAdo5U/CWpVd4q6UfAkHnS2FP7XgWbO+yMjJUwI
 OvFQ+UyC5iQSeT7Z9oIP9rs1uoWNA9F5ZyFMBCGYzV7mlFSmsKLipIMHJ
 wPYNLG4fQ2n9aWORzf0Jz1xeZD2tzPy70PtZk6LJGDLqilF156h6r6fh6 A==;
X-CSE-ConnectionGUID: 7qqA+CFlS/eHrL22V2Sqgw==
X-CSE-MsgGUID: cQasgG3hQjiD+OzeFI9EqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71574087"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="71574087"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:28:35 -0800
X-CSE-ConnectionGUID: yjeDY+T2RFOcWKugteKcWw==
X-CSE-MsgGUID: HHb9E8xQQ6CS5mko4iL4fA==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.215])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:28:33 -0800
Date: Mon, 5 Jan 2026 18:28:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in
 DT init parsing
Message-ID: <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-2-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104110638.532615-2-sun.jian.kdev@gmail.com>
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

On Sun, Jan 04, 2026 at 07:06:35PM +0800, Sun Jian wrote:
> Clang reports a large stack frame for fbtft_init_display_from_property()
> (-Wframe-larger-than=1024) when the init sequence is emitted through a
> fixed 64-argument write_register() call.
> 
> write_reg()/write_register() relies on NUMARGS((int[]){...}) and large
> varargs which inflates stack usage. Switch the DT "init" path to send the
> command byte and the payload via fbtft_write_buf_dc() instead.
> 
> No functional change intended: the same register values are sent in the
> same order, only the transport is changed.

How did you test this?

...

>  	struct device *dev = par->info->device;
> -	int buf[64], count, index, i, j, ret;
> +	u8 buf[64];
> +	int count, index, i, j, ret;

Please, try to preserve reversed xmas tree order.

>  	u32 *values;
>  	u32 val;
>  

...

> -				buf[i++] = val;
> +				buf[i++] = val & 0xFF;

Unneeded change, I suppose.

...

> -			par->fbtftops.write_register(par, i,
> -				buf[0], buf[1], buf[2], buf[3],
> -				buf[4], buf[5], buf[6], buf[7],
> -				buf[8], buf[9], buf[10], buf[11],
> -				buf[12], buf[13], buf[14], buf[15],
> -				buf[16], buf[17], buf[18], buf[19],
> -				buf[20], buf[21], buf[22], buf[23],
> -				buf[24], buf[25], buf[26], buf[27],
> -				buf[28], buf[29], buf[30], buf[31],
> -				buf[32], buf[33], buf[34], buf[35],
> -				buf[36], buf[37], buf[38], buf[39],
> -				buf[40], buf[41], buf[42], buf[43],
> -				buf[44], buf[45], buf[46], buf[47],
> -				buf[48], buf[49], buf[50], buf[51],
> -				buf[52], buf[53], buf[54], buf[55],
> -				buf[56], buf[57], buf[58], buf[59],
> -				buf[60], buf[61], buf[62], buf[63]);
> +			/* buf[0] is command, buf[1..i-1] is data */
> +			ret = fbtft_write_buf_dc(par, &buf[0], 1, 0);
> +			if (ret < 0)
> +				goto out_free;
> +
> +			if (i > 1) {
> +				ret = fbtft_write_buf_dc(par, &buf[1], i - 1, 1);
> +				if (ret < 0)
> +					goto out_free;
> +			}

I believe this is incorrect change and has not to be applied. write !=
write_register. Without any evidence of testing, definite NAK to it.
Otherwise, please provide detailed testing pattern and which devices were
tested.

-- 
With Best Regards,
Andy Shevchenko


