Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EEFA4A2E9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 20:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00F410E33E;
	Fri, 28 Feb 2025 19:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6Oc8mqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96710ED2A;
 Fri, 28 Feb 2025 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740772029; x=1772308029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QAkzxGNM1gfcRLSdEdADHdTZjxCmVR3HvEf46OPpmrY=;
 b=e6Oc8mqimZX5PLL9klV8BpeoplP2m3UJyU0qrM98n1Lk7FFhgYvmHxr6
 EHlkJm4c9rvP4AuU9Q6AbqlMyvhstu2CZNIsCw0WT/tfBLUBbkMg+5EJh
 sbWcTjlkwZ1JnzBUonRjiEi+YNAPyGF2ehVXK1cVlnuA8QgPnLK+Vqfn+
 gK94nB0UJ6e+CCTTO6ssSOj6fuysUIan3BbGvkMhyzALI3bWdyr8yVstn
 vPZQwDPCCxMILS8wZC03AOroGGtZwfeWFAn4S3hFmMiH7TB2nN29g0isz
 IUJ/cuWIgmhaen4Fs0tH0nI8mYoL0aWAoupiuFbAHFxJnBzoiP3VM8SC/ g==;
X-CSE-ConnectionGUID: RwoIokMeQIiv+Y21ub18Aw==
X-CSE-MsgGUID: Wa0YZKVvQR6tGmdG+GW7VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41415570"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41415570"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:47:08 -0800
X-CSE-ConnectionGUID: CXQ7JbJIRFmneUcXojF2kg==
X-CSE-MsgGUID: ZGje/74sTXGzvwwKxfr9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122660125"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 11:47:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 21:47:05 +0200
Date: Fri, 28 Feb 2025 21:47:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic: Filter out redundant DPMS calls
Message-ID: <Z8ISuRz2l9Om9tC_@intel.com>
References: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
 <Z7b7tSabXeLe1ovT@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7b7tSabXeLe1ovT@phenom.ffwll.local>
X-Patchwork-Hint: comment
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

On Thu, Feb 20, 2025 at 10:53:57AM +0100, Simona Vetter wrote:
> On Wed, Feb 19, 2025 at 06:02:39PM +0200, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Video players (eg. mpv) do periodic XResetScreenSaver() calls to
> > keep the screen on while the video playing. The modesetting ddx
> > plumbs these straight through into the kernel as DPMS setproperty
> > ioctls, without any filtering whatsoever. When implemented via
> > atomic these end up as full commits on the crtc, which leads to a
> > dropped frame every time XResetScreenSaver() is called.
> 
> I think you should add here that it's just an empty commit, because we do
> filter out redundant commits where crtc->active_changed does nothing.
> Except we still run the entire machinery with timestamps and drm_event and
> everything.
> 
> And I don't think it's worth to filter that out at the atomic level,
> because it's really only legacy ioctl that had this "complete noop"
> behaviour.
> 
> With the commit message augmented:
> 
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Might also be nice to have a igt for this?

kms_flip was basically doing everything we want already,
so added one more subtest for this:
https://lore.kernel.org/igt-dev/20250228194240.20023-1-ville.syrjala@linux.intel.com/T/#u

> Plus also wondering whether we
> should cc: stable it.

I guess we could. I've been running this for who knows how long
anyway (just never got around to sending it), so should be fairly
safe.

-- 
Ville Syrjälä
Intel
