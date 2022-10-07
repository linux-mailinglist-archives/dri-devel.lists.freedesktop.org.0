Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B919C5F748B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 09:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D91E10E14F;
	Fri,  7 Oct 2022 07:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B872010E14F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 07:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665126437; x=1696662437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BMGrhWoleDAUbfjlgco7qoQXVjkkjXdRbWivXzIPMvo=;
 b=jzYV/i5vV5hNr20wCnbgnHo2KYNyVEN0EXDhKFnuxxzPJ3upLkFb/RbA
 Tm7KCzr+bRF9BNQ/Mqpk7ffN91QzSIFXGPrDAT2aFYqIjdNSAd5jo7nlK
 CpJfyoaNbZp3KSlB8N4kOj5grCbiLRt5Zt/5AtQK9J5ezhUBwNtqN/Jt7
 MkIPATk5Ts7+Gho7rGFNcE1uNpn9GWbWsoMIwZHcLjfhzMPcJOTUt+UD2
 EilLHzISxrvQTCQzLfGM+1KoMD2edReam8B8v5EZCGixbwkWxUwyguxIB
 pNJ8D111C5H2qEFcXdE6qX3Lbnpzt/ge/Od3j0iaeWRiqRsXH5BLPnm6k g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="330108020"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="330108020"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 00:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="767464407"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="767464407"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 07 Oct 2022 00:07:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Oct 2022 10:07:12 +0300
Date: Fri, 7 Oct 2022 10:07:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
Message-ID: <Yz/QICUIu25XjZGX@intel.com>
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-3-tzimmermann@suse.de>
 <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
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
Cc: jfalempe@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 06, 2022 at 10:28:12PM +0200, Javier Martinez Canillas wrote:
> On 10/5/22 13:40, Thomas Zimmermann wrote:
> > Rename the atomic helper function drm_atomic_helper_check_crtc_state()
> > to drm_atomic_helper_check_crtc_primary_plane() and only check for an
> > attached primary plane. Adapt callers.
> > 
> > Instead of having one big function to check for various CRTC state
> > conditions, we rather want smaller functions that drivers can pick
> > individually.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> [...]
> 
> > +	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> > +		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> > +			return 0;
> >  	}
> 
> I believe the code convention is to drop the curly braces when you
> have a single statement inside the a loop ?

This has two.

> 
> Feel free to ignore it though. I particularly don't agree with that
> convention anyways, because I think that makes the code more error
> prone. But still thought that was worth to point that out.
> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat

-- 
Ville Syrjälä
Intel
