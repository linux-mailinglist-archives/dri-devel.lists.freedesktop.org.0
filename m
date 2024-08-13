Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC5F950013
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 10:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B45310E2A2;
	Tue, 13 Aug 2024 08:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRQOI9tm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F0210E2A6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723538477; x=1755074477;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PBEQx+yY3OhWhUnu+Qxd/D05zs3Xvom47MnLDK6y4/g=;
 b=TRQOI9tmGvh53CVTp5y9s2ThvIdO6a+2XdzUG4NI0gpDAEqueGSx67d5
 HvWsRQRhk30LG23ZNv5wARreS7/QtnFllNCJtldiRBYQICYsdybs0Oxx/
 Tlb4OEYdVUPJMM2NLhecaLKb+DApcDNR4h/Uz9oBx4p7u2iGHGLau5AGF
 GbCytARxc31uK0Y0cYlFPp1vz/MwaCL2sTUSSTo8jxsBY2NnmAKtUhpkP
 SWTdyerczHGaV/LhOiYURaFNYd4m0dZmnYGtK938MIo6HCiHh6ng7TdC8
 5FakQHyt4MbNAKCApVOxY+5r4X2YEnHdXBn437ku+mulmTYhKgvAcZWlG Q==;
X-CSE-ConnectionGUID: HQXy/xFnTY24UQWULjYZWA==
X-CSE-MsgGUID: iy+zj7zdRy+Gdn1n4XGTsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33089164"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="33089164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 01:41:16 -0700
X-CSE-ConnectionGUID: IHd6Lx2rSkmJaLyLlQYuqw==
X-CSE-MsgGUID: Uy7beN9nQcCqR4DuX/K5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58669140"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 01:41:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sdn5b-0000000Ef9e-0weh; Tue, 13 Aug 2024 11:41:11 +0300
Date: Tue, 13 Aug 2024 11:41:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm: fixed: Don't use "proxy" headers
Message-ID: <ZrscJvDZqMQNFgR3@smile.fi.intel.com>
References: <20240422143338.2026791-1-andriy.shevchenko@linux.intel.com>
 <87r0exs067.fsf@intel.com> <ZiqPAeps9uiG63qD@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiqPAeps9uiG63qD@smile.fi.intel.com>
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

On Thu, Apr 25, 2024 at 08:12:33PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 22, 2024 at 09:49:04PM +0300, Jani Nikula wrote:
> > On Mon, 22 Apr 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > Update header inclusions to follow IWYU (Include What You Use)
> > > principle.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Assuming it builds, and nothing depends on other stuff from kernel.h via
> > drm_fixed.h,
> 
> For the record, I have built-tested this via `make allyesconfig` on x86_64.
> 
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> Thank you!

Who is going to apply this, please?

-- 
With Best Regards,
Andy Shevchenko


