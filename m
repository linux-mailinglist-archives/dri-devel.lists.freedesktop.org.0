Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2ACF4B29
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBFD10E3E0;
	Mon,  5 Jan 2026 16:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOd5dH8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED01910E3E0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767630735; x=1799166735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ZiNycg6DBG7o/Fpvg7Up0Z7xdzF9rwnLfDxSU9euUw=;
 b=SOd5dH8Pnz1rRgbllJOR5Umq/HKQoQe7sGmLfvX720gdog2Vmtzv2hd1
 L4ypvo5YPZYbAQhoWyuLoaw2aMIVPGolkWrAJ1WdUqcHSjS81AFt11BYG
 pp0pAzk6h50jzsE8ts97zbO4Cvt5rd/zJ+RwrF1/nNOFozP1C5UOoy0l3
 ZqGGcyVqf4eyl+/RIEII+gn6SeMPC8cuG4zw79Z7lg+7UUXfYgNevA7ru
 2iK7NNBI28O07Dmm+T+m2CxMVMIvOAgoU9uKswFCJisYc4Vdo+daEsvec
 tWRnIeVfhmR5qjEyR7/a3Eyvm7WQQLEwpAO3uxenxJb12ktnjXvU1azgI A==;
X-CSE-ConnectionGUID: 6OJvr7CjSYG5modowGhVYg==
X-CSE-MsgGUID: eiE0QllhQh2mrQKG1fkHBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69039878"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69039878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:32:14 -0800
X-CSE-ConnectionGUID: mKZ6hEztR5qT/3e+FUdNww==
X-CSE-MsgGUID: tIsplbadRbih6N9+smZ/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="207312383"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.215])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:32:12 -0800
Date: Mon, 5 Jan 2026 18:32:10 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/4] staging: fbtft: reduce stack usage by avoiding
 large write_reg() varargs
Message-ID: <aVvniqcE_PBkKCnn@smile.fi.intel.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
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

On Sun, Jan 04, 2026 at 07:06:34PM +0800, Sun Jian wrote:

> This series fixes clang `-Wframe-larger-than=1024` warnings in the fbtft
> staging drivers.
> 
> The warnings are triggered by very large `write_reg()`/`write_register()`
> varargs calls, which result in excessive stack usage.
> 
> Switch the affected paths to send a u8 command byte followed by the u8
> payload using `fbtft_write_buf_dc()`. The register values and ordering are
> kept unchanged; only the transfer method is updated.

Looking at the patches I think this is wrong. W.o. detailed test pattern
provided and the list of the devices, NAK.

If you want to address a warning without HW being accessible, perhaps you just
need a simple bump in the Makefile as an exception, however it's also doubtful
as it will hide a potential issue with the stack in the future.

-- 
With Best Regards,
Andy Shevchenko


