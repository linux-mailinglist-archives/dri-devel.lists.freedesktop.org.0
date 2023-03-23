Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1F6C5B49
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 01:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D2210E428;
	Thu, 23 Mar 2023 00:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4310E14B;
 Thu, 23 Mar 2023 00:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679530599; x=1711066599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hUcdA/EZf3wSrxPghrvp76QuacXfEPbSMw7LM2tW7Qg=;
 b=Rphu33znNn/DYktggKAS4PeHz8KMzkG/ldBkwVELuxdq95RJbGp7qb5L
 EhD3WjoQONkfuEgNxHLdy4fQfRCZWzC4qP0jqP4cYY7hnsQVrhGd8/JrF
 4FQDy1ZdgzQOljlvmfCOuF+1NJ3wlmVfTSyTEZ1Ut/Z8vez2RLL0TP3RE
 5+Pw1T+fK8ggj3GLGAfMbcC+4ngP4PBGuHoRwiRPwRpJ59nCJM/GK2RzQ
 NB59+f2Fh68lS/zSMsbNGQjWmNvDverFcZszfz2Q4F1YzeDulnUE9rLhA
 SdonPcpsmxgRyYNbSkr7YTRQQIxVRISsPyeLvmj4UTuQsNcUNTFLu9Amp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336867682"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="336867682"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 17:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="1011562772"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="1011562772"
Received: from hlakyil-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.178])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 17:16:34 -0700
Date: Thu, 23 Mar 2023 01:16:08 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: limit double GT reset to pre-MTL
Message-ID: <ZBuaSHIRkZh3Ot6x@ashyti-mobl2.lan>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
 <382f0058-2b4f-4ef2-8031-27a2f75715df@intel.com>
 <0296ba17-6e91-76f2-4866-179feb94074b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0296ba17-6e91-76f2-4866-179feb94074b@intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> On 3/22/2023 12:44 PM, John Harrison wrote:
> > On 3/20/2023 14:10, Daniele Ceraolo Spurio wrote:
> > > Commit 3db9d590557d ("drm/i915/gt: Reset twice") modified the code to
> > > always hit the GDRST register twice when doing a reset, with the
> > > reported aim to fix invalid post-reset engine state on some platforms
> > > (Jasperlake being the only one actually mentioned).
> >
> > It still concerns me that there are no actual details about this issue
> > from a hardware perspective as to what/why it goes wrong, the comment is
> > fully of non-definitive language - 'appears to', 'should', 'is still a
> > concern that'. And there is no w/a number associated with it. It all
> > feels extremely suspect and warrants a great big FIXME tag as a minimum.
> 
> I agree that the whole thing is unclear and we could add a FIXME, but IMO
> that is outside the scope of this patch as I'm not adding the code in
> question. This should be discussed with the original author/reviewers.

Sorry for chiming in a bit late. I'm with Daniele on this one;
the patch just takes things back to how they were before Chris's
patch, so we should look into the reasoning behind Chris's patch
itself.

As mentioned in the commit log, in Jasperlake (and only
Jasperlake), a second reset attempt is needed to clear the
register state. If I remember right, Chris discovered this
through experimentation, and I don't think any hardware folks
have documented it.

Chris can probably give more details on this.

In general, I'm on board with Daniele's patch since it's doing
what the driver has always done, which is why I gave it a quick
review already in V1.

On the other hand, the price to pay having something like this:

  loops = GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 70) ? 2 : 1;

Is the following perhaps a bit more self-explanatory?

  /*
   * The big comment with explanation
   */
  if (IS_PLATFORM(i915, INTEL_JASPERLAKE))
  	/* try again */ ;

Andi
