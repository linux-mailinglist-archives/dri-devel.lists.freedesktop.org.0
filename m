Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF677A1514A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 15:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5510EAF9;
	Fri, 17 Jan 2025 14:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4uhZ1sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3A910EAF9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737123005; x=1768659005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zeKFK+vn+TJmhgSu8T6k7acGXHGYVDOiUO5ZOU9J2tw=;
 b=I4uhZ1sfSRT/s1MRF87JTqxMHj/UwY8ADi04DYSnkHNF3E46U3iJr4ye
 g9nk07jhYZ90p05bXkfJObxfGk4ccKMkJZitIzawFA9fzmQ8EGlAxLMrJ
 TLITmYFO3Chi3ddfIaLqdWmsVr2zgIdCQ0mwuwCs/wb9Rb7kWaY+UP1Iz
 yzjRV3DzHAfWw7UmUeogk01RVlK6/f/D8PUSIxGO8iUujLnF7gAhUNOds
 qZ4TrK1hUlyTJmdgBxe716VddkUpcwKt2fnEM4fjmYrqdSxd6SfxwVhkz
 7o32LTFP4Ss1CQSv6yVAT4ZYtzmG4avoV0gL9v9KQzpw6Viyo3XXZCd3x A==;
X-CSE-ConnectionGUID: H0H60DhJT96xnuy5hz5p1Q==
X-CSE-MsgGUID: Uvmv+ObVRMSiiwfPJVjHiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36762604"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="36762604"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 06:10:04 -0800
X-CSE-ConnectionGUID: AyTQVXKGRGmWE85xGLzROA==
X-CSE-MsgGUID: dLU+naDLS7Oq4xOUX2AbHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="105604765"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 06:10:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tYn2s-000000025HF-3qCK; Fri, 17 Jan 2025 16:09:58 +0200
Date: Fri, 17 Jan 2025 16:09:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
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

On Fri, Jan 17, 2025 at 02:57:52PM +0100, Marek Szyprowski wrote:
> On 16.01.2025 13:42, Andy Shevchenko wrote:
> > If the selector register is represented in each page, its value
> > in accordance to the debugfs is stale because it gets synchronized
> > only after the real page switch happens. Synchronize cache for
> > the page selector.
> >
> > Before (offset followed by hexdump, the first byte is selector):
> >
> >      // Real registers
> >      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
> >      ...
> >      // Virtual (per port)
> >      40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      60: 01 ff 00 00 ff ff 00 00 00 00 00 00
> >      70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
> >      80: 03 ff 00 00 00 00 00 00 00 00 00 ff
> >      90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00
> >
> > After:
> >
> >      // Real registers
> >      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
> >      ...
> >      // Virtual (per port)
> >      40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
> >      60: 02 ff 00 00 ff ff 00 00 00 00 00 00
> >      70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
> >      80: 04 ff 00 00 00 00 00 00 00 00 00 ff
> >      90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
> >
> > Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This patch landed in linux-next some time ago as commit 1fd60ed1700c 
> ("regmap: Synchronize cache for the page selector"). Today I've noticed 
> that it causes a regression for Lontium LT9611UXC HDMI bridge driver. 

Is there any datasheet link to the HW in question?

(FWIW, I have tested this with the CY8C9540 GPIO I²C expander on Intel Galileo
 Gen 1 board.)

> With today's linux-next I got the following messages on QCom RB5 board:
> 
> # dmesg | grep  lt9611uxc
> [   13.737346] lt9611uxc 5-002b: LT9611 revision: 0x00.00.00
> [   13.804190] lt9611uxc 5-002b: LT9611 version: 0x00
> [   13.870564] lt9611uxc 5-002b: FW version 0, enforcing firmware update
> [   13.877437] lt9611uxc 5-002b: Direct firmware load for 
> lt9611uxc_fw.bin failed with error -2
> [   13.887517] lt9611uxc 5-002b: probe with driver lt9611uxc failed with 
> error -2
> 
> after reverting the $subject patch, the driver probes fine on that board.
> 
> I'm not sure if this is really a bug caused by this change or simply the 
> driver already was aligned to old regmap behavior. Dmitry, could you 
> check the regamp usage and review the changes introduced by this patch? 
> Let me know if there is anything to check on the real hardware to help 
> resolving this issue.

Yes, see below. And thank you for your report!

...

> > +		/*
> > +		 * If selector register has been just updated, update the respective
> > +		 * virtual copy as well.
> > +		 */
> > +		if (page_chg &&
> > +		    in_range(range->selector_reg, range->window_start, range->window_len))
> > +			_regmap_update_bits(map, sel_register, mask, val, NULL, false);

Can you add a test printk() here to show

page_chg
range->selector_reg, range->window_start, range->window_len
sel_register, mask, val

?

And would commenting these three lines make it work again?

-- 
With Best Regards,
Andy Shevchenko


