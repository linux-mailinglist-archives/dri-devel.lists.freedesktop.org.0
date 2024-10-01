Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48298BF9A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 16:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11E910E631;
	Tue,  1 Oct 2024 14:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrZYgH+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECE410E17A;
 Tue,  1 Oct 2024 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727792321; x=1759328321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f/xwpNxTqNitbx89InneKuup2yZVD2QHw5scdRCz3QI=;
 b=VrZYgH+p5syxnm2sg9Ahy8hGnjfqmuZze1Tufk0px2J1X9S9BDysOWDa
 PAxk+0OUsUpGXkQ3MpH8ZMZCekpy6GLNe7zSyLzgfL/gyYwvsXVbVWveF
 V9xGQuPgPms0drmHeUaR8P6vyofekN4fZR34RdKo5Ks8VcW4xWvmxjgor
 Q5TIA6qTH+Nqldh4hqOcFQvwgwsFPZXpVzLyRtA58RI7/KFnoIUhJ0ZHn
 kB3nudGw+EWV1Q60t4Ye0cOoLb91f7EPNH+fx4k+mpL8SoNl1TUBtOvlB
 ecdMxMub7fduSDeUzsoteiFcyY9k9v6DOKVJRJsyG+1F8IgciuClit6q0 A==;
X-CSE-ConnectionGUID: bUU/myqiSd2ZmKL37YdNHw==
X-CSE-MsgGUID: 8yhm+ohuToORbE+r8CP6vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37487738"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="37487738"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:18:41 -0700
X-CSE-ConnectionGUID: 7rmqgJz1R3KHgk4Ji2lAFQ==
X-CSE-MsgGUID: UJolPFigRf+YHa2th5xTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73930739"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:18:37 -0700
Date: Tue, 1 Oct 2024 17:18:33 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZvwEubI8ldUT6TsK@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <Zvqgz3Vpz2IS1Cua@smile.fi.intel.com>
 <ZvuDwvtyJ4djuIQ7@black.fi.intel.com>
 <ZvvmH0n_y_vVSpvR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvvmH0n_y_vVSpvR@smile.fi.intel.com>
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

On Tue, Oct 01, 2024 at 03:07:59PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 01, 2024 at 08:08:18AM +0300, Raag Jadav wrote:
> > On Mon, Sep 30, 2024 at 03:59:59PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > +static const char *const drm_wedge_recovery_opts[] = {
> > > > +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> > > > +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> > > > +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> > > > +};
> > > 
> > > Place for static_assert() is here, as it closer to the actual data we test...
> > 
> > Shouldn't it be at the point of access?
> 
> No, the idea of static_assert() is in word 'static', meaning it's allowed to be
> used in the global space.
> 
> > If no, why do we care about the data when it's not being used?
> 
> What does this suppose to mean? The assertion is for enforcing the boundaries
> that are defined by different means (constant of the size and real size of
> an array).

The point was to simply not assert without an active user of the array, which is
not the case now but may be possible with growing functionality in the future.

Raag
