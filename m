Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC596BE2D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCF210E7C3;
	Wed,  4 Sep 2024 13:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PV04f8GE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E882610E65F;
 Wed,  4 Sep 2024 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725456042; x=1756992042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fhgy+PnHyOkrbfp+KTvQnBbfzQ2UdSouXmr7w3P8DRQ=;
 b=PV04f8GEHRbEob3lwEZm8R3Q/QWn26NFgq5mHzIcN3nkjeo0q4M+DBsQ
 fptCwWz2fb7KVZLII36dBJD7AUEKCdZrsPIEb10a59hu4oqhLFcjj9ONz
 qH1UckSh9c4Sq7fWfnA/Bcd7NJs8FBd20dlA38nZYCK4C5/F4Mrn+BTIb
 95GhYPe6c/uvJ4hyMyR3G+iYvKxBDKC+PxgXDwclyEkprwf1Xa/+NkiPa
 wuVhgAJKYRNTknxs7Y+6yTtRwwFpDuAmgqZD1hGjEUiAzjtTugerk4Vli
 UVusoapkhrRy23/LXVaCIrVhpXi2S/eJG+oCoclz7y7EAnT/cS4IYqYZ/ g==;
X-CSE-ConnectionGUID: l26oK8CfRluwhFmMiSNnXA==
X-CSE-MsgGUID: aaHHTlpWTiaMjfrp4FMQUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23980730"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23980730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:20:42 -0700
X-CSE-ConnectionGUID: 5i4W3DE6Qhmtv3n3ffexIw==
X-CSE-MsgGUID: nI0DxEx/QHK51KZdWl/uNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="65993322"
Received: from slindbla-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.33])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:20:36 -0700
Date: Wed, 4 Sep 2024 15:20:33 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <ZtheoXODm_6AFgcV@ashyti-mobl2.lan>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local>
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

Hi Sima,

On Tue, Aug 27, 2024 at 07:05:05PM +0200, Daniel Vetter wrote:
> On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
> > The i915 driver generates sysfs entries for each engine of the
> > GPU in /sys/class/drm/cardX/engines/.
> > 
> > The process is straightforward: we loop over the UABI engines and
> > for each one, we:
> > 
> >  - Create the object.
> >  - Create basic files.
> >  - If the engine supports timeslicing, create timeslice duration files.
> >  - If the engine supports preemption, create preemption-related files.
> >  - Create default value files.
> > 
> > Currently, if any of these steps fail, the process stops, and no
> > further sysfs files are created.
> > 
> > However, it's not necessary to stop the process on failure.
> > Instead, we can continue creating the remaining sysfs files for
> > the other engines. Even if some files fail to be created, the
> > list of engines can still be retrieved by querying i915.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Uh, sysfs is uapi. Either we need it, and it _must_ be there, or it's not
> needed, and we should delete those files probably.
> 
> This is different from debugfs, where failures are consistently ignored
> because that's the conscious design choice Greg made and wants supported.
> Because debugfs is optional.
> 
> So please make sure we correctly fail driver load if these don't register.
> Even better would be if sysfs files are registered atomically as attribute
> blocks, but that's an entire different can of worms. But that would really
> clean up this code and essentially put any failure handling onto core
> driver model and sysfs code.

This comment came after I merged the patch. So far, we have been
keeping the driver going even if sysfs fails to create, with the
idea of "if there is something wrong let it go as far as it can
and fail on its own".

This change is just setting the behavior to what the rest of the
interfaces are doing, so that either we change them all to fail
the driver's probe or we have them behaving consistently as they
are.

Tvrtko, Chris, Rodrigo any opinion from your side? Shall we bail
out as Sima is suggesting?

Thanks,
Andi
