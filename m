Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71381479178
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 17:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8DB10E35E;
	Fri, 17 Dec 2021 16:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B670410E4B5;
 Fri, 17 Dec 2021 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639758510; x=1671294510;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fn+RGZ5bRot5NO4rRgzUV8MWFA7RcaRafe5kV2e17Zo=;
 b=WdWnsTXUdnS/nVGfCdaeDDh25kwyeFsk/43qg9RS+XKvaTdtYewDJnGD
 LSJmY4y/v0zKodjPlQGtVye8juKWfM75653tvyUfzjiIeJExXxn+DcICG
 Ciu39zk796XHUGK+H4M3t0FCx43inF99QGcikcImCUjUZpSyaLa/0MfZ2
 KrRpWwIUA5M0SoXStJXu4+Nr34r6q6NFT+8t2CEk86zpM3Do22/M2eXtV
 35xYivVe+GcRZfP5szsEy3N7754BDXinpXjctcx1zSmGE3nrNuEi/3Rpo
 4eC4zc7KFntVd2eovwbOykLVSB6/C5b1Pls11vrsUZ7Zfpppu3WNS28/W A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="226641572"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="226641572"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 08:28:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="662882571"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 08:28:14 -0800
Date: Fri, 17 Dec 2021 08:22:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Message-ID: <20211217162254.GA22048@jons-linux-dev-box>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
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

On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
> 
> On 14/12/2021 15:07, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Log engine resets done by the GuC firmware in the similar way it is done
> > by the execlists backend.
> > 
> > This way we have notion of where the hangs are before the GuC gains
> > support for proper error capture.
> 
> Ping - any interest to log this info?
> 
> All there currently is a non-descriptive "[drm] GPU HANG: ecode
> 12:0:00000000".
>

Yea, this could be helpful. One suggestion below.

> Also, will GuC be reporting the reason for the engine reset at any point?
>

We are working on the error state capture, presumably the registers will
give a clue what caused the hang.

As for the GuC providing a reason, that isn't defined in the interface
but that is decent idea to provide a hint in G2H what the issue was. Let
me run that by the i915 GuC developers / GuC firmware team and see what
they think. 

> Regards,
> 
> Tvrtko
> 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 97311119da6f..51512123dc1a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -11,6 +11,7 @@
> >   #include "gt/intel_context.h"
> >   #include "gt/intel_engine_pm.h"
> >   #include "gt/intel_engine_heartbeat.h"
> > +#include "gt/intel_engine_user.h"
> >   #include "gt/intel_gpu_commands.h"
> >   #include "gt/intel_gt.h"
> >   #include "gt/intel_gt_clock_utils.h"
> > @@ -3934,9 +3935,18 @@ static void capture_error_state(struct intel_guc *guc,
> >   {
> >   	struct intel_gt *gt = guc_to_gt(guc);
> >   	struct drm_i915_private *i915 = gt->i915;
> > -	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> > +	struct intel_engine_cs *engine = ce->engine;
> >   	intel_wakeref_t wakeref;
> > +	if (intel_engine_is_virtual(engine)) {
> > +		drm_notice(&i915->drm, "%s class, engines 0x%x; GuC engine reset\n",
> > +			   intel_engine_class_repr(engine->class),
> > +			   engine->mask);
> > +		engine = guc_virtual_get_sibling(engine, 0);
> > +	} else {
> > +		drm_notice(&i915->drm, "%s GuC engine reset\n", engine->name);

Probably include the guc_id of the context too then?

Matt

> > +	}
> > +
> >   	intel_engine_set_hung_context(engine, ce);
> >   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> >   		i915_capture_error_state(gt, engine->mask);
> > 
