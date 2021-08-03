Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE483DF3EB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 19:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F1989C7F;
	Tue,  3 Aug 2021 17:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4289489C7F;
 Tue,  3 Aug 2021 17:26:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="200910013"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="200910013"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 10:26:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="479606648"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 10:26:25 -0700
Date: Tue, 3 Aug 2021 17:26:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] Enable GuC submission by default on DG1
Message-ID: <20210803172623.GA82856@DUT151-ICLU.fm.intel.com>
References: <20210803051121.72017-1-matthew.brost@intel.com>
 <CAKMK7uGOAx7xM=6nDGtLqqW7sf2Rjbj24hAu8U9NK9J2t5+LwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGOAx7xM=6nDGtLqqW7sf2Rjbj24hAu8U9NK9J2t5+LwQ@mail.gmail.com>
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

On Tue, Aug 03, 2021 at 02:15:13PM +0200, Daniel Vetter wrote:
> On Tue, Aug 3, 2021 at 6:53 AM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Minimum set of patches to enable GuC submission on DG1 and enable it by
> > default.
> >
> > A little difficult to test as IGTs do not work with DG1 due to a bunch
> > of uAPI features being disabled (e.g. relocations, caching memory
> > options, etc...).
> 
> Matt Auld has an igt series which fixes a lot of this stuff, would be
> good to do at least a Test-With run with that.
> 

If I'm understanding his series correct it only fixes the mmap issues
not relocs so I don't think it will help all that much. I probably could
send a trybot series letting relocs work on DG1 + his series and that
might work? I guess I'll find out.

> Also I'm assuming that for ADL-P we'll get this equivalent patch set

GuC submission is enabled by default on ADL-P. We don't have ADL-P in
pre-merge CI currently though :(, just offline runs of about 1800 tests.
Still a awaiting results for that though.

For what it is worth I've run all 1800 locally, via a script, and gotten
solid results back with my IGT updates. There are some failures but I
believe I understand all of them as either test issues or known
differences in behavior between execlists and GuC submission with are
opens (e.g. persistence, semaphores, SUBMIT fence, etc...).

Matt

> soon, and there we should be able to get real results?
> -Daniel
> 
> >
> > Tested with the loading the driver and 'live' selftests. Submissions
> > seem to work.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >
> > Daniele Ceraolo Spurio (1):
> >   drm/i915/guc: put all guc objects in lmem when available
> >
> > Matthew Brost (2):
> >   drm/i915/guc: Add DG1 GuC / HuC firmware defs
> >   drm/i915/guc: Enable GuC submission by default on DG1
> >
> > Venkata Sandeep Dhanalakota (1):
> >   drm/i915: Do not define vma on stack
> >
> >  drivers/gpu/drm/i915/gem/i915_gem_lmem.c  | 26 +++++++
> >  drivers/gpu/drm/i915/gem/i915_gem_lmem.h  |  4 +
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  9 ++-
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 11 ++-
> >  drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 14 +++-
> >  drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  2 +-
> >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 90 ++++++++++++++++++++---
> >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +
> >  8 files changed, 138 insertions(+), 20 deletions(-)
> >
> > --
> > 2.28.0
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
