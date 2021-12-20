Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A947B277
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 19:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A16A10FA24;
	Mon, 20 Dec 2021 18:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A81910F80B;
 Mon, 20 Dec 2021 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640023275; x=1671559275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eAEmKBYzXOHQSv2d45IIL0TKGBp04Qxkf2NTtbvo2aM=;
 b=PX+d036Yo9dt4bXJuWKx+Mc4eSR22Hrh/xg7Uk2LIu/cYMa0yZ90QLg7
 FpVcpN43JdDDM0+B3Wtn04m0zmbCtxOmNA8gTtN2NCe8pahKC5mtvTYen
 3by1//iQUDRXZCBOsplqB6pxR0A69wC7Bd3MZCj6hvBLRakCFpESuWXOO
 ovoFjoGGZ6725oy3ss0J0oNj83DEQ0RQePCncKD5/eXr+KHRuu3YOA0+G
 cD724JPIulNV2YOsvhfdYAYLGPiGcJdC9eCuBdOGmzawoLKv5H/RMsPpH
 NhgjRiU/TFTX4P2Dney+nVA9L4/CfPL2WL779XemandGDyXZZzuQE/wWj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="240190816"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="240190816"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 10:00:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="616488819"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 10:00:56 -0800
Date: Mon, 20 Dec 2021 09:55:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Message-ID: <20211220175537.GA2663@jons-linux-dev-box>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
 <20211217162254.GA22048@jons-linux-dev-box>
 <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 03:00:53PM +0000, Tvrtko Ursulin wrote:
> 
> On 17/12/2021 16:22, Matthew Brost wrote:
> > On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 14/12/2021 15:07, Tvrtko Ursulin wrote:
> > > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > 
> > > > Log engine resets done by the GuC firmware in the similar way it is done
> > > > by the execlists backend.
> > > > 
> > > > This way we have notion of where the hangs are before the GuC gains
> > > > support for proper error capture.
> > > 
> > > Ping - any interest to log this info?
> > > 
> > > All there currently is a non-descriptive "[drm] GPU HANG: ecode
> > > 12:0:00000000".
> > > 
> > 
> > Yea, this could be helpful. One suggestion below.
> > 
> > > Also, will GuC be reporting the reason for the engine reset at any point?
> > > 
> > 
> > We are working on the error state capture, presumably the registers will
> > give a clue what caused the hang.
> > 
> > As for the GuC providing a reason, that isn't defined in the interface
> > but that is decent idea to provide a hint in G2H what the issue was. Let
> > me run that by the i915 GuC developers / GuC firmware team and see what
> > they think.
> > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++++-
> > > >    1 file changed, 11 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > index 97311119da6f..51512123dc1a 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > @@ -11,6 +11,7 @@
> > > >    #include "gt/intel_context.h"
> > > >    #include "gt/intel_engine_pm.h"
> > > >    #include "gt/intel_engine_heartbeat.h"
> > > > +#include "gt/intel_engine_user.h"
> > > >    #include "gt/intel_gpu_commands.h"
> > > >    #include "gt/intel_gt.h"
> > > >    #include "gt/intel_gt_clock_utils.h"
> > > > @@ -3934,9 +3935,18 @@ static void capture_error_state(struct intel_guc *guc,
> > > >    {
> > > >    	struct intel_gt *gt = guc_to_gt(guc);
> > > >    	struct drm_i915_private *i915 = gt->i915;
> > > > -	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> > > > +	struct intel_engine_cs *engine = ce->engine;
> > > >    	intel_wakeref_t wakeref;
> > > > +	if (intel_engine_is_virtual(engine)) {
> > > > +		drm_notice(&i915->drm, "%s class, engines 0x%x; GuC engine reset\n",
> > > > +			   intel_engine_class_repr(engine->class),
> > > > +			   engine->mask);
> > > > +		engine = guc_virtual_get_sibling(engine, 0);
> > > > +	} else {
> > > > +		drm_notice(&i915->drm, "%s GuC engine reset\n", engine->name);
> > 
> > Probably include the guc_id of the context too then?
> 
> Is the guc id stable and useful on its own - who would be the user?
> 

Techincally not stable, but in practice it is. The user could be
corresponding the context that was reset to a GuC log.

More debug info is typically better.

Matt

> Regards,
> 
> Tvrtko
