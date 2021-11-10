Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72944CC9F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 23:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F9A6E3AC;
	Wed, 10 Nov 2021 22:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534536E3AC;
 Wed, 10 Nov 2021 22:24:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="220005089"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="220005089"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 14:24:25 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="589534534"
Received: from saiburra-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.33.11])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 14:24:24 -0800
Date: Wed, 10 Nov 2021 17:24:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/rpm: Enable runtime pm
 autosuspend by default
Message-ID: <YYxGljFixGqaO3Ti@intel.com>
References: <20211110052926.2881092-1-tilak.tangudu@intel.com>
 <20211110052926.2881092-2-tilak.tangudu@intel.com>
 <YYuxJs0dAYvZAL3+@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYuxJs0dAYvZAL3+@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Tilak Tangudu <tilak.tangudu@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 01:46:46PM +0200, Ville Syrjälä wrote:
> On Wed, Nov 10, 2021 at 10:59:26AM +0530, Tilak Tangudu wrote:
> > Enable runtime pm autosuspend by default for gen12 and
> > later versions.
> > 
> > Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_runtime_pm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> > index eaf7688f517d..ef75f24288ef 100644
> > --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> > +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> > @@ -600,6 +600,10 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
> >  		pm_runtime_use_autosuspend(kdev);
> >  	}
> >  
> > +	/* XXX: Enable by default only for newer platforms for now */
> > +	if (GRAPHICS_VER(i915) >= 12)
> > +		pm_runtime_allow(kdev);
> 
> If we change some default then we should just do it across the board.
> There is nothing special about tgl+.

Nothing special with tgl and newer platforms indeed. This is why we
have the XXX message here.

The problem in the last attempt was with the gen9 platforms.
Apparently some special there, and I didn't want to block the
progress while we cannot get to the gen9 bugs.

> 
> > +
> >  	/*
> >  	 * The core calls the driver load handler with an RPM reference held.
> >  	 * We drop that here and will reacquire it during unloading in
> > -- 
> > 2.25.1
> 
> -- 
> Ville Syrjälä
> Intel
