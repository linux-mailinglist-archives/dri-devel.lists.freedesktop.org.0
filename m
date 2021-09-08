Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED0240402B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 22:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A836E2C8;
	Wed,  8 Sep 2021 20:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176756E2C7;
 Wed,  8 Sep 2021 20:23:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="306153573"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="306153573"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 13:23:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="469756323"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 13:23:20 -0700
Date: Wed, 8 Sep 2021 13:23:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH 2/8] drm/i915/xehp: CCS shares the render reset domain
Message-ID: <20210908202319.GQ461228@mdroper-desk1.amr.corp.intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
 <20210907171916.2548047-3-matthew.d.roper@intel.com>
 <4ce6bdc9-82c6-e281-400d-ce658d6ba80b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ce6bdc9-82c6-e281-400d-ce658d6ba80b@linux.intel.com>
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

On Wed, Sep 08, 2021 at 11:07:07AM +0100, Tvrtko Ursulin wrote:
> 
> On 07/09/2021 18:19, Matt Roper wrote:
> > The reset domain is shared between render and all compute engines,
> > so resetting one will affect the others.
> > 
> > Note:  Before performing a reset on an RCS or CCS engine, the GuC will
> > attempt to preempt-to-idle the other non-hung RCS/CCS engines to avoid
> > impacting other clients (since some shared modules will be reset).  If
> > other engines are executing non-preemptable workloads, the impact is
> > unavoidable and some work may be lost.
> 
> Since here it talks about engine reset, should this patch add warning if
> same is attempted by i915 on a GuC platform - to document it is not

Did you mean "on a *non* GuC platform" here?  We aren't going to have
compute engine support on any platforms where GuC submission isn't the
default operating model, so the only way to get compute engines +
execlist submission is to force an override via module parameters (e.g.,
enable_guc=0).  Doing so will taint the kernel, so I think the current
consensus from offline discussion is that the user has already put
themselves into a configuration where it's easier than usual to shoot
themselves in the foot; it's not too much different than the kind of
trouble a user could get themselves into if they loaded the driver with
hangcheck disabled or something.


Matt

> implemented/supported? Or perhaps later in the series, or future series
> works better.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Regards,
> 
> Tvrtko
> 
> > Bspec: 52549
> > Original-patch-by: Michel Thierry
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_reset.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> > index 91200c43951f..30598c1d070c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> > @@ -507,6 +507,10 @@ static int gen11_reset_engines(struct intel_gt *gt,
> >   		[VECS1] = GEN11_GRDOM_VECS2,
> >   		[VECS2] = GEN11_GRDOM_VECS3,
> >   		[VECS3] = GEN11_GRDOM_VECS4,
> > +		[CCS0] = GEN11_GRDOM_RENDER,
> > +		[CCS1] = GEN11_GRDOM_RENDER,
> > +		[CCS2] = GEN11_GRDOM_RENDER,
> > +		[CCS3] = GEN11_GRDOM_RENDER,
> >   	};
> >   	struct intel_engine_cs *engine;
> >   	intel_engine_mask_t tmp;
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
