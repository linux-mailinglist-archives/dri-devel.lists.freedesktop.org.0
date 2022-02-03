Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333004A8595
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7249710F96A;
	Thu,  3 Feb 2022 13:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1122C10F96A;
 Thu,  3 Feb 2022 13:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643896579; x=1675432579;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z32PB9LQlb0G4VQ/++GEN1JNPjs2ptGI2xIXrAOl0aY=;
 b=hmUQ3/OQMd8GDidscPUFG/ojAPSA3Ohm3VlSJgwUp4lVhB0VCPSEmWym
 vwB+NJA7uxePn2Oybu9pImKR8G5fQjlNvWyjePEUZf9ijFpvQ19EgoZTo
 cXbCFbzloj6cTLLbEypT+SeP1nMzAnkFG3KkpoAeyTZfTqRhmqtvvLX2Y
 hTjasm5kl+FapXB1vlOeAILIht+gpm3BQ4fS3n/iWVkDnESzKFde7wFG7
 CGxspW0+X1V9prWp3wpPtjdpo6C6lPo1VYb8UsBmdmwrJ5z9tPAW5fivO
 pruko7/GspxBo5uW7ixvldK/JhqXFt+RiptXGL/Hw75B/8WJx20HeoI+G g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="334506068"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="334506068"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:56:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="599913668"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:56:17 -0800
Message-ID: <170468f918b202f540133e80032290424ff70936.camel@linux.intel.com>
Subject: Re: [PATCH 19/20] drm/i915/lmem: don't treat small BAR as an error
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 03 Feb 2022 14:56:15 +0100
In-Reply-To: <addd2b3d-95b1-f824-c7dc-c7b05b4497ba@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-20-matthew.auld@intel.com>
 <a537f361-ae72-c62c-062f-4e96a9e48682@linux.intel.com>
 <addd2b3d-95b1-f824-c7dc-c7b05b4497ba@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-02-03 at 11:18 +0000, Matthew Auld wrote:
> On 03/02/2022 09:48, Thomas Hellström wrote:
> > 
> > On 1/26/22 16:21, Matthew Auld wrote:
> > > Just pass along the probed io_size. The backend should be able to
> > > utilize the entire range here, even if some of it is non-
> > > mappable.
> > Changes here LGTM.
> > > 
> > > It does leave open with what to do with stolen local-memory.
> > 
> > Are objects in stolen local required to be mappable?
> 
>  From a quick look I don't really see such users on discrete, outside
> of 
> maybe intelfb_create(), where I guess the initial fb might be located
> in 
> stolen on DG1. But from DG2+ it looks like it will just be located in
> normal LMEM. For that I was thinking we add something like 
> i915_gem_object_create_region_at(), and somehow wire that up to the 
> {fpfn, lpfn}...

So we could then skip STOLEN completely on DG2+? Could we then also do
the same on DG1, at least assuming that creating and pinning an object
for that initial fb would be done before any other pinning into LMEM?

/Thomas


