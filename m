Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB72814D02
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 17:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AF510EA49;
	Fri, 15 Dec 2023 16:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267AF10EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702657700; x=1734193700;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e0ojniOZ8WxwTGBWPkR76m9m2PjY31tBB/jsoZxQrFA=;
 b=aNffeOxoVv4gaVTv01R49kxGFgRJLYzgoMs1qIC/AE3lpUs8FUty71R2
 VgMOfdNeeJaeptw5533me3HvPSeB/NCCw8eKV9yAhKCxhxjQCuUAdLsDl
 5rDPZXIGj4rSDf4I9K2I4wy+quqIWoP3lpqt1NXqJ0nj5SCF0JahRpJMa
 8JrENGRbaJ2sNKOReQ5I6S+VWyrsQXByC5N8FaTG4jepMjByzDrFJroYT
 23U3484U+wIpCXcXSlyag9Y3KEMM4YCyhnw1T1idV6oPugUyJhFV82Nmn
 VNfH/BjrtHf4i4+2oa58/BpUiX9EIhXbRxQpjoS2jFy75NCVci7/NX9O9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="16849010"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16849010"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724503354"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="724503354"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:28:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rEB2r-00000006AUF-3aBR; Fri, 15 Dec 2023 18:28:13 +0200
Date: Fri, 15 Dec 2023 18:28:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 1/2] backlight: mp3309c: Make use of device properties
Message-ID: <ZXx-nVZlp26JxqWb@smile.fi.intel.com>
References: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
 <20231214195158.1335727-2-andriy.shevchenko@linux.intel.com>
 <20231215161102.GA662726@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215161102.GA662726@aspen.lan>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 04:11:02PM +0000, Daniel Thompson wrote:
> On Thu, Dec 14, 2023 at 09:51:13PM +0200, Andy Shevchenko wrote:

...

> >  static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
> 
> Pretty minor... but I wonder if it should be renamed:
> mp3309c_parse_fwnode().

I am fine with either. Lee, do you want this be incorporated?

P.S> Flavio, thanks for testing!

-- 
With Best Regards,
Andy Shevchenko


