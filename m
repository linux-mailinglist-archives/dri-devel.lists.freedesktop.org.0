Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF6977C7E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A7010ECD6;
	Fri, 13 Sep 2024 09:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XiOT0Yqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFEE10ECD6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726220721; x=1757756721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MUAHhEXFPurd2AS6xdCG/w4vKY+yhMt7IXNzDb0O7JE=;
 b=XiOT0YqkSqRTFYaEsAsF28N4aL6sJMagLguyXfhxdwXyaqvY9OQq7qw9
 4s2yDAnUZmEPP+Fc6nlVDGWezlto+DfkxNGRlYngwg9gaY036GEuncvK1
 Wl9BxYlkejSWjbHqP0IWDBJhXPQ487GyUItIlD26Ac+5h9oa+W/lLw+L4
 KC6bEdXgdE/Q6cE2f4i4dMPGvKAq75APKCqckJaCgj4Xa/gx/qVvrcYiY
 rFTj9pwsFFD6nW7NTXJ42R/J5tvlWjdhuVbJ8+XJXqIehhxnfBmodt9NX
 0siHxrGdM0HkamsKMY3Q1oN/wlKQzSS4OFcprpKv29wJ0T76I2Jn51i/c w==;
X-CSE-ConnectionGUID: TKIicZySSxOFhdjZnmR5Lw==
X-CSE-MsgGUID: CatsxpxVReSbmcWlR/nk0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35700129"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="35700129"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 02:45:21 -0700
X-CSE-ConnectionGUID: KPRN2a54SGeerFFSFrf28A==
X-CSE-MsgGUID: igp5M5BPTT6WGc1cF/VRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="67846828"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 02:45:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sp2rb-00000008FQc-2pCc; Fri, 13 Sep 2024 12:45:15 +0300
Date: Fri, 13 Sep 2024 12:45:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/i2c: tda998x: Make use of
 irq_get_trigger_type()
Message-ID: <ZuQJq2JYAyuI4X3T@smile.fi.intel.com>
References: <20240913001156.56634-1-vassilisamir@gmail.com>
 <20240913001156.56634-2-vassilisamir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913001156.56634-2-vassilisamir@gmail.com>
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

On Fri, Sep 13, 2024 at 02:11:56AM +0200, Vasileios Amoiridis wrote:
> Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
> simple irq_get_trigger_type(irq).

LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


