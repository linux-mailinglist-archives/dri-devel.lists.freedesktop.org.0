Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A1B117E2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E024710E9B4;
	Fri, 25 Jul 2025 05:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMptPh8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EA110E437;
 Fri, 25 Jul 2025 05:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753420985; x=1784956985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kCfPMYNSOGORmj0xymLNb5yYJ/lTzWQoKbiOMIwrTAY=;
 b=hMptPh8PjapZrk6K556ibaHtiFmCPUwP3eQ6lxqHm1jdC5tNnsjaJA/7
 Y0+Q5c8Cgkkxz+VWznsdD28NSWkvY//FE5+1cbOGCx12D0AuUXathjeem
 +Ici/mtF9vidNegyTKYL+cLfr3iL4AAhP/CYDGAXDSXPtP+XmseoFNmBd
 UiIoRg8LBdDtxZxvX3ogHESpQBLxDZmAreIluYyp8YrRkI/RDlOkcdNsP
 hMovXl5ygLXHlN0hHbZP8lAjl1iQPromUzSU3ZnrWsGpKl1u87FQzqx0v
 qbvR+f7r+UOonfq/cnLSa3LBlfaslmj5aSatVnmZ26ON/1d3AvI90yu91 w==;
X-CSE-ConnectionGUID: NUshdrphRDyFCd6YrMsrTA==
X-CSE-MsgGUID: 86NAM9YoQi+Y6+CzSB5xsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67191073"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="67191073"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:23:05 -0700
X-CSE-ConnectionGUID: 6M3aAAsLSn+e8C8nM5U5Pg==
X-CSE-MsgGUID: vH6l/O1CQiKnBBBqa28gJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160877932"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:23:02 -0700
Date: Fri, 25 Jul 2025 08:22:58 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v6 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Message-ID: <aIMUskx87yAC8y_R@black.fi.intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724143440.232862-2-riana.tauro@intel.com>
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

On Thu, Jul 24, 2025 at 08:04:30PM +0530, Riana Tauro wrote:
> This patch addresses the need for a recovery method (firmware flash
> on Firmware errors) introduced in the later patches of Xe KMD.

Documentation/process/submitting-patches.rst +94

Although the guideline is to describe your changes in imperative mood,
e.g. "make xyzzy do frotz" instead of "[This patch] makes xyzzy do frotz",
I have come across some of our (undocumented) conventions that don't adhere
to upstream ones and I'm not sure if this is one of them.

So upto you.

Raag
