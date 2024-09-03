Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5401F96948C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1610E3F1;
	Tue,  3 Sep 2024 07:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvkfycTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DA710E332;
 Tue,  3 Sep 2024 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725347039; x=1756883039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HDiRpwFLjtX5OFnt4wRwVKdwCf9ddRZFjct2YLor6FI=;
 b=QvkfycTruKZwrA3rb2sG6rKJCPhSAMO3EzCGN8jRVF+R8TasGprLJduz
 BDDLAt+fum60HTnvOnmbYwI5mYILr+IE7fvoKXaiVOlGR3p1GYtzaIXq1
 RuHhxKWPzjTXU/s7Rb3AejlEXRIwjs/uN0+4mwH9gTbZ4DP+FrOgJkTUD
 5TX1GDNIMtrScMWCwd4DpKfGDL+Og/XGuAMcf72G7cIZBpStuiaGkKBGs
 XOTAlyHMrk8YS9w0MO95BAcKahcs1q0aPqfDAFZnKNmQdBD5B7p/mnTiU
 xnldMrDqcGMuJenxzoHfSwJkMK8TG8eEDA7tKUeKs9c4b7dNS3t5H/I9O w==;
X-CSE-ConnectionGUID: 3fwisBXzQ9m3tp3/gFMO8A==
X-CSE-MsgGUID: hUDFUg5xRgqKs4539NmQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35318052"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="35318052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:03:59 -0700
X-CSE-ConnectionGUID: z6M1HZJ/Rjm7Lwa1gbpBtA==
X-CSE-MsgGUID: 3BRoDhdhQG2RyxP5G4kQKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="65539876"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:03:55 -0700
Date: Tue, 3 Sep 2024 10:03:51 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 anshuman.gupta@intel.com, bellekallu.rajkiran@intel.com,
 saikishore.konda@intel.com
Subject: Re: [PATCH v3 3/3] drm/i915: Use device wedged event
Message-ID: <Zta015-J31HRW3iM@black.fi.intel.com>
References: <20240902074859.2992849-1-raag.jadav@intel.com>
 <20240902074859.2992849-4-raag.jadav@intel.com>
 <9011dfee-3f69-4d80-90e1-efffc6576740@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9011dfee-3f69-4d80-90e1-efffc6576740@linux.intel.com>
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

On Mon, Sep 02, 2024 at 02:22:21PM +0530, Aravind Iddamsetty wrote:
> 
> On 02/09/24 13:18, Raag Jadav wrote:
> > Now that we have device wedged event supported by DRM core, make use
> > of it. With this in place, userspace will be notified of wedged device
> > on gt reset failure.
> >
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_reset.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> > index 735cd23a43c6..60d09ec536c4 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> > @@ -1409,6 +1409,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
> >  
> >  	if (!test_bit(I915_WEDGED, &gt->reset.flags))
> >  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
> > +	else
> > +		drm_dev_wedged(&gt->i915->drm);
> >  }
> rather than intel_gt_reset_global, __intel_get_set_wedged looks to be
> an appropriate place where actually the device is declared wedged and
> that would cover all call sites too.

Which is why it may be the appropriate place IMHO.
We'd want to make sure the device is _really_ unrecoverable when we
choose to send the event.

Raag
