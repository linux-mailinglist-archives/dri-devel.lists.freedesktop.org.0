Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BE76BBDA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 20:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B640210E19C;
	Tue,  1 Aug 2023 18:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF9510E19C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690912811; x=1722448811;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v2FvCu0WmeUW0OFJ8LCSHOQD6rnI6LVO1u/GL2uzpCg=;
 b=Uo9/AJwO7EVhZx2saLwq9j+W2w3st24D5JNB69cNDmXelGb94BQYGpuE
 FFxtcU5mC/d8mFWUIHPPUGztha/71d0bfMM79nydv0MHRWtJxsZl3bNON
 Bul8lz/DvzIeojCSyeV84s/Pgte1nu9hrZSf4QflS4K252xEK14BQhvfS
 yt+eQQnua3hpfn5c5/wPPYPpGBSszslnehhkhKIFrHSGaSNcvrawD+cH5
 XNhH2XjD0dGteU7qdRwWhpWs5Taw6lYU1joUTn6pYJl4I8o69q9497UKA
 Ph3XLOZkLZgE/5GyeQ9xv5+j2TThVWGp9PBDiunk4bVtqzODNQG7B57kY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368275317"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="368275317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 11:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758442718"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="758442718"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 11:00:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qQtfA-00DcGh-18; Tue, 01 Aug 2023 21:00:04 +0300
Date: Tue, 1 Aug 2023 21:00:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next v2] drm/i2c: tda998x: remove redundant CONFIG_OF
 and of_match_ptr
Message-ID: <ZMlIJNQtzb1SDIb/@smile.fi.intel.com>
References: <20230801033220.219869-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033220.219869-1-wangzhu9@huawei.com>
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
Cc: arnd@arndb.de, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023 at 11:32:20AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use CONFIG_OF
> and of_match_ptr here, we remove them all.
> 
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.

Instead, you may convert this driver to use device property APIs and make it
OF-free (okay, almost, with one API that still would be called for OF, but not
for the rest).

-- 
With Best Regards,
Andy Shevchenko


