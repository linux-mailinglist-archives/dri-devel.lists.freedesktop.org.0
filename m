Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF72497C5FF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFF310E6B7;
	Thu, 19 Sep 2024 08:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgKkmGzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D60510E6A4;
 Thu, 19 Sep 2024 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726735138; x=1758271138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/m+pyS//DNV9f7FmkrXey9WKou5dgta3AvsLE4Dz58c=;
 b=CgKkmGzu/UbKCgMzfLdyrpHzsUvWA6gxII2AzGg6u2kdKWH5qDEe09oQ
 mW6MKnBg6f9jpMWFkIawXWR1WFQgvnLwexN+vg9huV7LLynBrmPnErxWp
 Mz1oksMsEWi7u47RWNlz6wOTd+JKDrj05j1438LZT3esn+YUZjz3MQcc2
 2vVgyfEhPsMRkiVZjc7MVV1UkH62c0iDmxF9F2oJV5o3oSXvBUMeeIpxF
 K1WmYaZVcx564wyAYTtg6/w4BLUMQEMsBcdqW3XS8moh138+AZPDkQsK7
 pjsNW5KI1HuRpkPMxYVUn4MNXl2SM5hRewTHXs+9jTPtZjIaoJt/8J3ZM w==;
X-CSE-ConnectionGUID: 4VkYIHUbSkmEdP+IGJz2Bw==
X-CSE-MsgGUID: sT5z+ipaTDOk+LQpnMfiSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43151922"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="43151922"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:38:57 -0700
X-CSE-ConnectionGUID: Mli78OqhQzK8DXBhN2jsag==
X-CSE-MsgGUID: AA72/D/NQ5yBpOlcuCyVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74222822"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:38:53 -0700
Date: Thu, 19 Sep 2024 11:38:50 +0300
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
Message-ID: <ZuvjGpIdOgGpbBQu@black.fi.intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com>
 <87msk6d8jw.fsf@intel.com> <ZuujCuVxFnOAKdgR@black.fi.intel.com>
 <87r09g9jp0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r09g9jp0.fsf@intel.com>
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

On Thu, Sep 19, 2024 at 10:38:51AM +0300, Jani Nikula wrote:
> On Thu, 19 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> > On Tue, Sep 17, 2024 at 10:49:07AM +0300, Jani Nikula wrote:
> >> On Tue, 17 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> >> > Now that we have device wedged event in place, add wedge_recovery sysfs
> >> > attribute which will expose recovery methods supported by the DRM device.
> >> > This is useful for userspace consumers in cases where the device supports
> >> > multiple recovery methods which can be used as fallbacks.
> >> >
> >> > $ cat /sys/class/drm/card0/wedge_recovery
> >> > rebind
> >> > bus-reset
> >> > reboot
> >> >
> >> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/drm_sysfs.c | 23 +++++++++++++++++++++++
> >> >  1 file changed, 23 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> >> > index fb3bbb6adcd1..b88cdbfa3b5e 100644
> >> > --- a/drivers/gpu/drm/drm_sysfs.c
> >> > +++ b/drivers/gpu/drm/drm_sysfs.c
> >> > @@ -36,6 +36,8 @@
> >> >  #define to_drm_minor(d) dev_get_drvdata(d)
> >> >  #define to_drm_connector(d) dev_get_drvdata(d)
> >> >  
> >> > +extern const char *const wedge_recovery_opts[];
> >> 
> >> Data is not an interface. Please add a function for this.
> >
> > For a single user?
> 
> Yes.
> 
> Well, you kind of have two, and both places need to do bounds checking
> on indexing the array. You also need to do bounds checking on the string
> manipulation, you can't just strcat and assume it'll be all right.

Which would be true if we were to receive an unknown string. Here we sorta
know it offhand so we're not gonna shoot in our foot :D

Anyway, would you prefer strlcat instead?

Raag
