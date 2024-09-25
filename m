Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69D98512E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 05:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E33110E128;
	Wed, 25 Sep 2024 03:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp5EHASl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8010E128;
 Wed, 25 Sep 2024 03:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727233496; x=1758769496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U6xk5S9p06NkLyiZ381kdyNXkjsHk/mkRAUSZhnbqEA=;
 b=Fp5EHASlSIGsF768iUgsBjKxAdSDbE9qQ5LnaHz2YUdm3v0PEGPQsE13
 Og76bEnkMiJWOx8qlDZXNHFTCI7O9VnksMk0Sv3O8rDEAIutQlkn8stoN
 YWLo2av0mgG6SorsDW6EMZXyZcP5mdLUj7kz4SGeCdlgTRdlsmDlwHdsW
 alHpNrhrB9CyjTakroaRFyYoZtEF7I2vTsdOHLoxEstaPNsNNJ+BDaTtW
 vQq5wsgYLLQP6UcGVQzWg7kS3fMtNroYG1koqnObWvn6gV818vwbNr8s3
 +Va+tDcfDGIoIUOgLWkBv7eCbXep5t6fn1t0kNeQIdr77gNLRFZXYybQg Q==;
X-CSE-ConnectionGUID: BonIcugIRyqoNM0057wx2A==
X-CSE-MsgGUID: FebXmvLkSBig7Zc3wf6arg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="29150160"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="29150160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 20:04:55 -0700
X-CSE-ConnectionGUID: qCa+3aFTTa6G0+uEJ0k+AA==
X-CSE-MsgGUID: EnDJRUkkTly9Azaj8w6/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="102391754"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 20:04:47 -0700
Date: Wed, 25 Sep 2024 06:04:43 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v6 1/4] drm: Introduce device wedged event
Message-ID: <ZvN9yw5AYtxudNne@black.fi.intel.com>
References: <20240923035826.624196-1-raag.jadav@intel.com>
 <20240923035826.624196-2-raag.jadav@intel.com>
 <ZvKhIQGnGrcPURhD@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvKhIQGnGrcPURhD@phenom.ffwll.local>
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

On Tue, Sep 24, 2024 at 01:23:13PM +0200, Simona Vetter wrote:
> On Mon, Sep 23, 2024 at 09:28:23AM +0530, Raag Jadav wrote:
> > Introduce device wedged event, which will notify userspace of wedged
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is no longer operating as
> > expected and has become unrecoverable from driver context.
> > 
> > Purpose of this implementation is to provide drivers a way to recover
> > through userspace intervention. Different drivers may have different
> > ideas of a "wedged device" depending on their hardware implementation,
> > and hence the vendor agnostic nature of the event. It is up to the drivers
> > to decide when they see the need for recovery and how they want to recover
> > from the available methods.
> > 
> > Current implementation defines three recovery methods, out of which,
> > drivers can choose to support any one or multiple of them. Preferred
> > recovery method will be sent in the uevent environment as WEDGED=<method>.
> > Userspace consumers (sysadmin) can define udev rules to parse this event
> > and take respective action to recover the device.
> > 
> >  Method    | Consumer expectations
> > -----------|-----------------------------------
> >  rebind    | unbind + rebind driver
> >  bus-reset | unbind + reset bus device + rebind
> >  reboot    | reboot system
> > 
> > v4: s/drm_dev_wedged/drm_dev_wedged_event
> >     Use drm_info() (Jani)
> >     Kernel doc adjustment (Aravind)
> > v5: Send recovery method with uevent (Lina)
> > v6: Access wedge_recovery_opts[] using helper function (Jani)
> >     Use snprintf() (Jani)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Finally caught up on mail, so dropping this here again: Please also add a
> small section to drm-uapi.rst, pointing at these functions. Just the
> kerneldoc for developers is kinda not enough I think.

Would you prefer a new section or have the existing one (Device reset which
looks somewhat similar but not entirely) modified?

Raag
