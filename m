Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8F15342BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F9310E023;
	Wed, 25 May 2022 18:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B492910E023;
 Wed, 25 May 2022 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653502459; x=1685038459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r/VY9eddmTm+/1KRYap7tXwmOb/FRNXW6/mhUir4ODc=;
 b=SS6C3NJ07W+eyLnz0zuDPGbSOu9gSulEvZ0Nf48FgGAxGoG7tlEt0xkm
 wVs8kcOStA23gUgMCe8fgIvOKRfn+vgIIVUljhZ+rUiyurQYwIfXg9Dz9
 ahqfqqF6jsbPOY/5j8MMyxckLVKx5BksaU1XFHUh5eCUE//qDxGUnELwp
 N7tlVnmd2a6DGvCEeEU0R6M4Q8MlksIpn7ycduavtzOBunRp60jVxoH1f
 m3YMzkQLCKUpsFepUxyyj2eB4g1LielaH4pS9hk3d+W+ZpWRlPyQzMB/w
 Mel39Un1ajeqW1faIlzj9Njjdho1l7gjTX6Nf1j1I96KECwftIeEYQxts g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="255960672"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="255960672"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:14:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="745864521"
Received: from nazirhos-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.165.86])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:14:18 -0700
Date: Wed, 25 May 2022 11:14:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/dg2: Catch and log more unexpected values in
 DG1_MSTR_TILE_INTR
Message-ID: <20220525181417.wnilka4bigyi5fle@ldmartin-desk2>
References: <20220524094339.1692212-1-tvrtko.ursulin@linux.intel.com>
 <Yo0bBxHBH8cZcnN4@mdroper-desk1.amr.corp.intel.com>
 <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 05:03:13PM +0100, Tvrtko Ursulin wrote:
>
>On 24/05/2022 18:51, Matt Roper wrote:
>>On Tue, May 24, 2022 at 10:43:39AM +0100, Tvrtko Ursulin wrote:
>>>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>>Catch and log any garbage in the register, including no tiles marked, or
>>>multiple tiles marked.
>>>
>>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>>---
>>>We caught garbage in DG1_MSTR_TILE_INTR with DG2 (actual value 0xF9D2C008)
>>>during glmark and more badness. So I thought lets log all possible failure
>>>modes from here and also use per device logging.
>>>---
>>>  drivers/gpu/drm/i915/i915_irq.c | 33 ++++++++++++++++++++++-----------
>>>  drivers/gpu/drm/i915/i915_reg.h |  1 +
>>>  2 files changed, 23 insertions(+), 11 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>>>index 73cebc6aa650..79853d3fc1ed 100644
>>>--- a/drivers/gpu/drm/i915/i915_irq.c
>>>+++ b/drivers/gpu/drm/i915/i915_irq.c
>>>@@ -2778,24 +2778,30 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>>  	u32 gu_misc_iir;
>>>  	if (!intel_irqs_enabled(i915))
>>>-		return IRQ_NONE;
>>>+		goto none;
>>>  	master_tile_ctl = dg1_master_intr_disable(regs);
>>>-	if (!master_tile_ctl) {
>>>-		dg1_master_intr_enable(regs);
>>>-		return IRQ_NONE;
>>>+	if (!master_tile_ctl)
>>>+		goto enable_none;
>>>+
>>>+	if (master_tile_ctl & ~(DG1_MSTR_IRQ | DG1_MSTR_TILE_MASK)) {
>>>+		drm_warn(&i915->drm, "Garbage in master_tile_ctl: 0x%08x!\n",
>>>+			 master_tile_ctl);
>>
>>I know we have a bunch of them already, but shouldn't we be avoiding
>>printk-based stuff like this inside interrupt handlers?  Should we be
>>migrating all these error messages over to trace_printk or something
>>similar that's safer to use?
>
>Not sure - I kind of think some really unexpected and worrying 
>situations should be loud and on by default. Risk is then spam if not 
>ratelimited. Maybe we should instead ratelimit most errors/warnings 
>coming for irq handlers?
>
>In this particular case at least DRM_ERROR with no device info is the 
>odd one out in the entire file so I'd suggest changing at least that, 
>if the rest of my changes is of questionable benefit.

I'd rather remove the printk's from irq rather than adding more. At the very
least, they should be the _once variant or ratelimited. One of the few
cases to even deserve a unlikely(), even to document this shouldn't
really be happening.

Our irq handlers (particularly on dgfx and multi-gt) are already too
long running... I don't like making them any onger or slower.


Lucas De Marchi
