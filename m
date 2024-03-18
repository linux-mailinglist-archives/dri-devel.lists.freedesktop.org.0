Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1394887E710
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 11:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3610F1CB;
	Mon, 18 Mar 2024 10:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCNDEcHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FC910F1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710757236; x=1742293236;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j9hJYP8DK3w/3Tegkw2PNvElGryXR1mvuoyceP9Cxq8=;
 b=oCNDEcHmuG0elpj0AWt/MG544Ru94CnK0lZwHxs3XpDwliXR7pZZiq/1
 Dv3ulKB08FCehEEShhvxjP7y+uU9QFccoH3kTR8WvHC14NxWL2snnADp3
 zUD1WZ8pkgP8mIwQBhG3jzrcd81p5bSO03CsqHPq2mmvyG5+okP6bfZX1
 DH6p2zkDUSHXAPy6jTzO0dXwo22XEaVd2Doo0hqcz4dMia/2wV5FCNR3C
 QredJyA/gvEyImHWjkIcmymijnC5/NjjckuV4fPoK7dpO6DDtB/V4E2lz
 AdmyFZp4aLPRodhGG6ESqDkWvuCXhHkknMSvWRp4FH9wRi6cAcZCbvksU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="17008223"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="17008223"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 03:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="914587692"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="914587692"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 03:20:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rmA6Y-0000000Duax-263H; Mon, 18 Mar 2024 12:20:30 +0200
Date: Mon, 18 Mar 2024 12:20:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Message-ID: <ZfgVbraKN1-Xtj3v@smile.fi.intel.com>
References: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
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

On Sat, Mar 16, 2024 at 12:45:27PM +0300, Dan Carpenter wrote:
> The "num_levels" variable is used to store error codes from
> device_property_count_u32() so it needs to be signed.  This doesn't
> cause an issue at runtime because devm_kcalloc() won't allocate negative
> sizes.  However, it's still worth fixing.

Agree.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


