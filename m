Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C99D3415
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 08:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A159010E3A4;
	Wed, 20 Nov 2024 07:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVV34r8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ED210E3A1;
 Wed, 20 Nov 2024 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732087604; x=1763623604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lJF1BO8cpIT2Ewk09WmHV4SsVJLrfP5TOl+MPz0RQrg=;
 b=BVV34r8m4yuAF9sPDeJzkJn4BUdTXTT1H4OYg9D4EeVMa5eOwEuTWAx4
 nT6LWy4Rmw+ALvhgk6WxTzcAp9UtFqGaykrPmRObuiD2xFZi6u/PCM5Cf
 /zpVq9WbVO1UPnHEAnXeVuLZzPjTcmw2DsSk3mbhjnumFcHeIjsyEL6gR
 Smck99YP6cEOK47FklBioqZ2eLSc1S1yyNrQut9XbLu0t5VZ1VB1TEU9x
 i+rbUe9X0lmIFiMNQgzCJjsni7kN9lRqig+bKFgrAjswaPKpkSxQHXDvT
 B15tbUZbD4i67lMUZDj/4a62s5d3enIcEn+R66MdsIJTIT5GN1IQMK5jp g==;
X-CSE-ConnectionGUID: uiaTnlM1Q32ILCPVoKRr8Q==
X-CSE-MsgGUID: YVK4BAd7R6ajO5VmWq3Wqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31878778"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="31878778"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 23:26:43 -0800
X-CSE-ConnectionGUID: KDyYHiBTR6ySXRnu7TAKZg==
X-CSE-MsgGUID: iNI4eyrIQqigss4ndezLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="94646238"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 23:26:39 -0800
Date: Wed, 20 Nov 2024 09:26:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v9 3/4] drm/xe: Use device wedged event
Message-ID: <Zz2PLNDeoPaxFuxh@black.fi.intel.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-4-raag.jadav@intel.com>
 <9249af09-3943-4c72-ab44-08f08ea4807e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9249af09-3943-4c72-ab44-08f08ea4807e@intel.com>
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

On Tue, Nov 19, 2024 at 10:25:10AM +0530, Ghimiray, Himal Prasad wrote:
> On 15-11-2024 10:37, Raag Jadav wrote:
> > This was previously attempted as xe specific reset uevent but dropped
> > in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
> > as part of refactoring.
> > 
> > Now that we have device wedged event provided by DRM core, make use
> > of it and support both driver rebind and bus-reset based recovery.
> > With this in place userspace will be notified of wedged device, on
> > the basis of which, userspace may take respective action to recover
> > the device.
> > 
> > $ udevadm monitor --property --kernel
> > monitor will print the received events for:
> > KERNEL - the kernel uevent
> > 
> > KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
> > ACTION=change
> > DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
> > SUBSYSTEM=drm
> > WEDGED=rebind,bus-reset
> > DEVNAME=/dev/dri/card0
> > DEVTYPE=drm_minor
> > SEQNUM=5208
> > MAJOR=226
> > MINOR=0
> 
> 
> The patch in itself looks good. Do we have IGT tests in place to validate
> this uevent ?

I unit tested it with documented example which seems to work. We can have an
igt in place once we have acceptance from the community.

Raag
