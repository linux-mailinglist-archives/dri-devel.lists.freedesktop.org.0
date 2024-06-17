Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDB090B9D5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271E710E4A9;
	Mon, 17 Jun 2024 18:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbWjDXTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF65410E4A9;
 Mon, 17 Jun 2024 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718649508; x=1750185508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bheoonFmY0ElhyC9169yGmiz4e/tbKGVNIFZftOCfeM=;
 b=FbWjDXTcIUUtO+moa+Qs3FPpSTJ3/HCugiCV+EfPQ6AZaYI3rlp+/m4p
 PHw6Nqb5sIJqijDupq1qoZtwvGBDf/XAkiYHY6pm3irjmNO46KZFGMlNx
 j/Vcfm3pDc6XjFZZYgedfCGRoffPfbpj020BiDxXM39MMlAvztogfMcaL
 fT3jwkwTuFTgQV0tX9FtndOf+aWNy0Wt5MggPA8zlWraCOohz5EzCYsbO
 RTLt3EsdOrmzrlSHJQ09n1FxFUrbNVfkUkD1tAsfY9fLwOszhqdv7Y76N
 ZpL8ug3TOsU+Y1EMyaC2Z6RmQsfhwGzkKLaqNMlPOnu7pKREnNcj2Rtqm A==;
X-CSE-ConnectionGUID: leHboNfCRNG50a59JDMeAA==
X-CSE-MsgGUID: xFubOd8iSWeMPyMVMgwLtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33028675"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="33028675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:38:26 -0700
X-CSE-ConnectionGUID: T9tZVtc1SgK3lDpMopQD9A==
X-CSE-MsgGUID: 4DxcOrbLQky3/nOUr77twA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45817791"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.127])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:38:24 -0700
Date: Mon, 17 Jun 2024 20:38:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Return -EINVAL instead of '0'
Message-ID: <ZnCCnEeNCWfyhhY0@ashyti-mobl2.lan>
References: <20240616070349.250899-1-andi.shyti@linux.intel.com>
 <20240616070349.250899-2-andi.shyti@linux.intel.com>
 <3fpme67vq7nf3sswznn7un7m7p53bibfbd5ek3uknnlwkogu6a@34oufw2qwtie>
 <ZnBGk9mUq5HImyz9@ashyti-mobl2.lan>
 <hh6i4vsz2ky52hw5g74l5llhjtzuyuebjtnaebqh3dq7svbfnp@zy4cwkqqzszz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hh6i4vsz2ky52hw5g74l5llhjtzuyuebjtnaebqh3dq7svbfnp@zy4cwkqqzszz>
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

On Mon, Jun 17, 2024 at 10:46:07AM -0500, Lucas De Marchi wrote:
> On Mon, Jun 17, 2024 at 04:22:11PM GMT, Andi Shyti wrote:
> > On Mon, Jun 17, 2024 at 07:55:10AM -0500, Lucas De Marchi wrote:
> > > On Sun, Jun 16, 2024 at 09:03:48AM GMT, Andi Shyti wrote:
> > > > Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
> > > > warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
> > > > supposed to return a pointer to the intel_memory_region
> > > > structure.
> > > >
> > > > Sparse complains with the following message:
> > > >
> > > > > > drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
> > > >   Using plain integer as NULL pointer
> > > >
> > > > The caller checks for errors, and if no error is returned, it
> > > > stores the address of the stolen memory. Therefore, we can't
> > > > return NULL. Since we are handling a case of out-of-bounds, it's
> > > > appropriate to treat the "lmem_size < dsm_base" case as an error.
> > > 
> > > which completely invalidates the point of the commit that introduced this
> > > regression. That was commit was supposed to do "let's continue, just
> > > disabling stolen".
> > 
> > Yes, correct, I missed the point while fixing stuff. But patch 2
> > is still valid.
> 
> no, it's not. It's introduced by the same commit. I went to look into
> this exactly because of the second issue: it broke 32b build in xe and
> all the CI.Hooks in xe are failing.

yes, it's broken because it's using %lli, right? In 32b it should
be %li.

Patch 2 is replacing %lli with %pa which should fix the 32b
build.

I'm sending a new series now.

Andi

> Lucas De Marchi
> 
> 
> > 
> > Thanks,
> > Andi
