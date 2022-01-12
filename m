Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C748CB40
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 19:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF06E10E86D;
	Wed, 12 Jan 2022 18:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4301810E864;
 Wed, 12 Jan 2022 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642013305; x=1673549305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fhbk1wBeMFUAod5o2AraGdSoFEeFxhksOgiugS8Kqzg=;
 b=fbEFbs+mYOU3EWW3IF6WP2qBbJt7I8IZ0gTJGunBNcKJnMswIEaGfKf2
 67tGr4pJBe/7Jnmx/mTtzrxBeLflg1L2wo+aaNtAph973A4ugCnjcEnyj
 +9aflH0p/0j3osnUsZFxuNi3v3nb0wrtecK+lHBa5v/3+qBiGO3bK3yGM
 AXLG+DgsCOHFc5Jpks7epvS1C26aKqmrxyR+sqIv1ToAUwRsfKEJ4c6W4
 idN+OC9sekkTGn44P6j5dmujoSDpfqztbr1hseNsPnjuTfjfxgxi6iiWq
 qp71P/nukaveby5SEbjd98NjLdo2kxaTzMJr0axy4RbXrH/KKs8rde5yS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="242638500"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="242638500"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 10:43:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="515611987"
Received: from erozenmx-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.217.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 10:43:51 -0800
Date: Wed, 12 Jan 2022 20:43:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Stimson, Dale B" <dale.b.stimson@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Prepare for multiple GTs
Message-ID: <Yd8hZNZvMwIas0Mb@intel.intel>
References: <20220111121552.35679-1-andi.shyti@linux.intel.com>
 <20220111121552.35679-2-andi.shyti@linux.intel.com>
 <20220111225053.GA60352@dbstims-dev.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111225053.GA60352@dbstims-dev.fm.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dale,

thanks for looking into this patch,

> > +	/*
> > +	 * i915->gt[0] == &i915->gt0
> > +	 */
> > +#define I915_MAX_GT 4
> > +	struct intel_gt *gt[I915_MAX_GT];
> > +
> 
> 
> It would be nice if I915_MAX_GT was defined in a more basic header file so
> that the definition of I915_MAX_GT would be available without the necessity of
> including this heavier file i915_drv.h.  Maybe gt/intel_gt.h would be a good
> place, as that is where macro for_each_gt (a user of I915_MAX_GT) is defined.

I actually see I915_MAX_GT more suited for in drv.h as it is a
description for i915 rather than the GT singularly.

We should see the GT as a standalone elemnt not aware of the
overall properties of the entire GPU.

While for_each_gt() is more an utility from intel_gt.

Personally, I do not even like this define: I think the number
of the GTs should be read during startup and stored in
drm_i915_private or similar, but this is another discussion.

Thank you,
Andi
