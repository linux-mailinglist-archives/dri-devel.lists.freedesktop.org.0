Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BADA97C341
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 06:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5698910E672;
	Thu, 19 Sep 2024 04:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwFVSAge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12E910E262;
 Thu, 19 Sep 2024 04:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726718738; x=1758254738;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P8R9S/Vebf0NsIdGgnStJFc55jV5dy9ONNwKvJZf/Ns=;
 b=mwFVSAge7akFUSQRX90IhuRUPVRvGqQWY6T0WJJ8MdTxKtA5H+HKpr7t
 HF9XPYyzexLqfCv/EJebPg/ATOVumc/j0oUaBe2j87jlm+nbkMEkpUMCb
 /ZU6fiGEm2/P5PEcbSlJEPFGTUe+sHV3ommtMjT9xYCNGZ5cqfLMVZEUQ
 NWmEerZBGJM8gibSXZT+am8W7BDSTbOu/yyRVQfS7iaQnVgTxdh7y7qSX
 tbpPUQ4jIElcDoVYVt4t0JeGHnEk/yKCf54+v7/O7sqs3liWl5MZjhrac
 PgELF2JxvjFyICmYe3t2L5Vo5XUmC9+NUAGersjmnoQ6H/Qb5OOUiS5HT w==;
X-CSE-ConnectionGUID: qe/z0YXwTXmGGaxpCO2Fkw==
X-CSE-MsgGUID: cW4yJ31aT6yZscBqQj8DWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="28562957"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="28562957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 21:05:37 -0700
X-CSE-ConnectionGUID: oPmHn/DiSzOQi6O3n+9k7w==
X-CSE-MsgGUID: dkQ9AiGnRmCVxSw8ebtIwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="100616132"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 21:05:33 -0700
Date: Thu, 19 Sep 2024 07:05:30 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v5 2/4] drm: Expose wedge recovery methods
Message-ID: <ZuujCuVxFnOAKdgR@black.fi.intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com>
 <87msk6d8jw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msk6d8jw.fsf@intel.com>
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

On Tue, Sep 17, 2024 at 10:49:07AM +0300, Jani Nikula wrote:
> On Tue, 17 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> > Now that we have device wedged event in place, add wedge_recovery sysfs
> > attribute which will expose recovery methods supported by the DRM device.
> > This is useful for userspace consumers in cases where the device supports
> > multiple recovery methods which can be used as fallbacks.
> >
> > $ cat /sys/class/drm/card0/wedge_recovery
> > rebind
> > bus-reset
> > reboot
> >
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/drm_sysfs.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > index fb3bbb6adcd1..b88cdbfa3b5e 100644
> > --- a/drivers/gpu/drm/drm_sysfs.c
> > +++ b/drivers/gpu/drm/drm_sysfs.c
> > @@ -36,6 +36,8 @@
> >  #define to_drm_minor(d) dev_get_drvdata(d)
> >  #define to_drm_connector(d) dev_get_drvdata(d)
> >  
> > +extern const char *const wedge_recovery_opts[];
> 
> Data is not an interface. Please add a function for this.

For a single user?

> Side note, extern declarations for outside stuff don't belong in .c
> files anyway.

Sure.

Raag
