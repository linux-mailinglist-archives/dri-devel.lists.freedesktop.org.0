Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4E98B391
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 07:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06B10E5D2;
	Tue,  1 Oct 2024 05:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ez0fU4kF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37A010E0C9;
 Tue,  1 Oct 2024 05:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727760209; x=1759296209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h+o36KzyQNytM2F5BZUn0/c6DP/8OiOTMixT5bmM0v4=;
 b=ez0fU4kFLM7PEnt79kRjJC8cj09YTZd9HnEUqUaJG/rCpPSfWRoTsys2
 Nin/tahHIq8PguLVatafKlKpoObnVQSVlMhTPiyijUYy4/O7lYuHkQuKM
 vxRhuRBx7B/xQMZwAwuduf6IAqiyWq5/zSL3W/Iyeax9ihyfkwVU/NQks
 GJezW0t3luAWV4TCfznbsJ2Dbn3ISnZVdd9O2Przyby/imT3qt5VpgxBn
 r/PYAJdgxPm4d9C+2KuR4VspsfAoj7FvIvSLCR1FZzzqkyFEavmikwmcN
 AY4pankDxeOCOTm5DGBgqmVCVF2QUbIzQl8WuCGNdv0rHfDmRZLzLVPI7 Q==;
X-CSE-ConnectionGUID: uiTf6M5kTSap6kNFLVKwZQ==
X-CSE-MsgGUID: TTyQivYFQjiAT5nkAof5+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30667312"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="30667312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:23:28 -0700
X-CSE-ConnectionGUID: 4WgSV8DbQ5y2x1R4o8wOZA==
X-CSE-MsgGUID: EKfumJPpQiCe6hLIaj+NvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="104314705"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:23:24 -0700
Date: Tue, 1 Oct 2024 08:23:21 +0300
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
Subject: Re: [PATCH v7 2/5] drm: Expose wedge recovery methods
Message-ID: <ZvuHSapK96Uf6Nho@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-3-raag.jadav@intel.com>
 <ZvqhMt14GKju1B0X@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvqhMt14GKju1B0X@smile.fi.intel.com>
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

On Mon, Sep 30, 2024 at 04:01:38PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 30, 2024 at 01:08:42PM +0530, Raag Jadav wrote:
> > Now that we have device wedged event in place, add wedge_recovery sysfs
> > attribute which will expose recovery methods supported by the DRM device.
> > This is useful for userspace consumers in cases where the device supports
> > multiple recovery methods which can be used as fallbacks.
> > 
> >   $ cat /sys/class/drm/card<N>/wedge_recovery
> >   rebind
> >   bus-reset
> >   reboot
> 
> ...
> 
> > +static ssize_t wedge_recovery_show(struct device *device,
> > +				   struct device_attribute *attr, char *buf)
> 
> Looking at the below line it seems you are fine with 100 limit, so, why two
> lines above if they perfectly fit 100?

Just trying to avoid another bikeshed about conventions ;)

Raag
