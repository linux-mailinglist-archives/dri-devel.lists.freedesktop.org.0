Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D106F90C444
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900BA10E5A3;
	Tue, 18 Jun 2024 07:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ec1V/mpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06D110E5AC;
 Tue, 18 Jun 2024 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695627; x=1750231627;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wLW3c0NdTGBgkd5y16ZE1SNJ1jmPPwr9oxB5go9HzIY=;
 b=Ec1V/mpbOgVeFPING1m1sSNmNgaqM5+ZbfibQ/Yt46/V6E6+Yo7e5sdq
 V38Xxc1d/HegE76cBh2igQL1o9A4pxP0zYy+VRhJbKaPXyc4CXW5gM3dS
 fDwhjQl8T1OLylSRT2uul8EijZ+7nsbxOFINzvR0ksPWLPeOeOxJwCXCZ
 LiMwxGW+q1Efvozw+Lu9EHPagm+a0Rpd92rBRkJOBWywvajtmuIqH/59h
 nKXRRerHz+yHWOpkVMAFr3BtbQVPv0rTol116yt8WXAPH7xiiobPwqXMI
 E3Y/n+1MhdCLKaUwjzNDQcUSARr27s6OxSd89DR+SOCIrmlm+BEMl8tYu A==;
X-CSE-ConnectionGUID: APuuAezRTteBTXOhtpcFWQ==
X-CSE-MsgGUID: 3nsOIVkaQoe/ZFGtLHa7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26672942"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26672942"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:27:07 -0700
X-CSE-ConnectionGUID: KNF3AYvLSoKaGSVrJJz4Vg==
X-CSE-MsgGUID: +XseIkgtQVSH3P3CQs8q+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41323557"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.178])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:27:03 -0700
Date: Tue, 18 Jun 2024 09:26:59 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Return -EINVAL instead of '0'
Message-ID: <ZnE2w2nlaG61VFqd@ashyti-mobl2.lan>
References: <20240616070349.250899-1-andi.shyti@linux.intel.com>
 <20240616070349.250899-2-andi.shyti@linux.intel.com>
 <3fpme67vq7nf3sswznn7un7m7p53bibfbd5ek3uknnlwkogu6a@34oufw2qwtie>
 <ZnBGk9mUq5HImyz9@ashyti-mobl2.lan>
 <hh6i4vsz2ky52hw5g74l5llhjtzuyuebjtnaebqh3dq7svbfnp@zy4cwkqqzszz>
 <ZnCCnEeNCWfyhhY0@ashyti-mobl2.lan>
 <en3word63algrcfec7dp5x455v3oofyfflnsnmtnymoiczhrk7@pm3vgs47xmcr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <en3word63algrcfec7dp5x455v3oofyfflnsnmtnymoiczhrk7@pm3vgs47xmcr>
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

Hi Lucas,

On Mon, Jun 17, 2024 at 05:29:24PM -0500, Lucas De Marchi wrote:
> On Mon, Jun 17, 2024 at 08:38:20PM GMT, Andi Shyti wrote:
> > On Mon, Jun 17, 2024 at 10:46:07AM -0500, Lucas De Marchi wrote:
> > > On Mon, Jun 17, 2024 at 04:22:11PM GMT, Andi Shyti wrote:
> > > > On Mon, Jun 17, 2024 at 07:55:10AM -0500, Lucas De Marchi wrote:
> > > > > On Sun, Jun 16, 2024 at 09:03:48AM GMT, Andi Shyti wrote:
> > > > > > Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
> > > > > > warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
> > > > > > supposed to return a pointer to the intel_memory_region
> > > > > > structure.
> > > > > >
> > > > > > Sparse complains with the following message:
> > > > > >
> > > > > > > > drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
> > > > > >   Using plain integer as NULL pointer
> > > > > >
> > > > > > The caller checks for errors, and if no error is returned, it
> > > > > > stores the address of the stolen memory. Therefore, we can't
> > > > > > return NULL. Since we are handling a case of out-of-bounds, it's
> > > > > > appropriate to treat the "lmem_size < dsm_base" case as an error.
> > > > >
> > > > > which completely invalidates the point of the commit that introduced this
> > > > > regression. That was commit was supposed to do "let's continue, just
> > > > > disabling stolen".
> > > >
> > > > Yes, correct, I missed the point while fixing stuff. But patch 2
> > > > is still valid.
> > > 
> > > no, it's not. It's introduced by the same commit. I went to look into
> > > this exactly because of the second issue: it broke 32b build in xe and
> > > all the CI.Hooks in xe are failing.
> > 
> > yes, it's broken because it's using %lli, right? In 32b it should
> > be %li.
> > 
> > Patch 2 is replacing %lli with %pa which should fix the 32b
> > build.
> > 
> > I'm sending a new series now.
> 
> wait... but instead of reverting you are sending a new series changing
> the first patch to return NULL. However in your commit message you said
> for this version:

this series of two patches is not making any logical change, it's
just fixing sparse errors (along with an i386 build warning).

> 	The caller checks for errors, and if no error is returned, it
> 	stores the address of the stolen memory. Therefore, we can't
> 	return NULL. Since we are handling a case of out-of-bounds, it's
> 	appropriate to treat the "lmem_size < dsm_base" case as an error.
> 
> 	Return -EINVAL embedded in a pointer instead of '0' (or NULL).
> 
> 	This way, we avoid a potential NULL pointer dereference.
> 
> So... what's it?  Can we return NULL or not? Is this tested on that
> scenario with with small BAR or does the module
> just fail to load later and explode?

Originally the patch just replaced '0' with NULL, but then before
sending I checked again, misread the code and changed the patch.
It's perfectly safe to return NULL (as I wrote in the cover
letter of v2), it just disables the stolen memory.

Jonathan's original patch is right. We also discussed it offline
with last European night.

Please, then, ignore this v1 and consider only v2.

Andi
