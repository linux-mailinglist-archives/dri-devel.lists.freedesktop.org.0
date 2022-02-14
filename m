Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8444B48DC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5245310E32E;
	Mon, 14 Feb 2022 10:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA47410E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644832940; x=1676368940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ClBnhIKYASqr83p8ZqYdap1X3BbLj918CN+R0K2hCZQ=;
 b=US57KefKuyNg6sCEb1uX27JcdZcar3MGam16PaFVV9iuVFsQ5zan04XE
 JNpniHOloKigZodfVYiRe/I3N+tq2EbmztsLVQ9OsinrbBR/S1AQ/zOuS
 1bkSmLruC0+3jRwN/j3HHfixa7VLhg/zl2ZphlWYIEGJcu+xLG52A/hJ4
 1kXqOp+ky+SSQsxsxzLF2fddf9bXRhKxEGZbILv5usFVb6pIxKTQMLiIg
 oCvwc/FVQZ5yTWxaeNrIBF4BtBwoTy7Ta6dCepfFa7mbzTjUvbZlmoC7h
 rHJl3jIS+zeldHHBWVOrZN1qdqTO5RH3+saDuh67lvUrsEUfh60t5kYYN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="248890581"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="248890581"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:02:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="772941504"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:02:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nJYAd-004Oxt-SH; Mon, 14 Feb 2022 12:01:23 +0200
Date: Mon, 14 Feb 2022 12:01:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: qianfanguijin@163.com
Subject: Re: [PATCH] drivers: fbtft: Refactor backlight logic
Message-ID: <Ygooc5aPZ/T7gS7I@smile.fi.intel.com>
References: <20220212042739.21744-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220212042739.21744-1-qianfanguijin@163.com>
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
Cc: linux-fbdev@vger.kernel.org, preid@electromag.com.au,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 12, 2022 at 12:27:39PM +0800, qianfanguijin@163.com wrote:
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Control led gpios by using GPIO_ACTIVE flags, don't detect the polarity
> by reading the gpio value when probe.

...

> +	enum gpiod_flags flags = GPIOD_OUT_HIGH;
> +
> +	/* request and turn on backlight */
> +	return fbtft_request_one_gpio_with_flags(par, name, index, flags, gpiop);

But taking into consideration all possible polarities this is wrong
assumption. Depending on the flags in DT or ACPI this may give an
opposite effect.

P.S. Please, Cc all your fbtft patches to fbdev maintainer as well.

-- 
With Best Regards,
Andy Shevchenko


