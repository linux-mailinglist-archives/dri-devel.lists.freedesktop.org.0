Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78B498074
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD0C10E7DE;
	Mon, 24 Jan 2022 13:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B1610E3CB;
 Mon, 24 Jan 2022 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643029675; x=1674565675;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7E6Fs87XCrdUj+ChGikkIrmIM4xczVHdev9DVDigrNY=;
 b=G9b6LHFeE5ZAnsNV0rW+mGmk44gprIO9GTAgPAHGB9gdqeofL5W7Jtsf
 8mjXa2hQPlN24g4M1yF6/imqs+BwKg9R+M5HqXzL+AyKp9cQXj9gEdIyt
 MSES9lNW5jKX9cQRKZAyx/hD2jjT20teLAoJfA2n/8jRJngaRPO4MS25X
 18YwMzQJ8a7fz6pQxTHYgFJeWrA2K1rFL2rzOFyZ6bTlO4gAE9ex1jkFh
 gkpmQ/mTT0MVdeWAVahBSYv8stlpdE2sTZGucILhSMikvWbqaHw0ndGzz
 YOtf4pgCBQmCKFagObaWchr9YNaBHJCXIphKg0+hCl3QFz2jZSUmx/UY6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306754364"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="306754364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 05:07:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="519938558"
Received: from epreiss-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.23])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 05:07:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/guc: Don't check CT descriptor status
 before CT write / read
In-Reply-To: <20220121210359.GA11038@jons-linux-dev-box>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220120183655.3228-1-matthew.brost@intel.com>
 <20220120183655.3228-2-matthew.brost@intel.com> <87k0et8s41.fsf@intel.com>
 <20220121210359.GA11038@jons-linux-dev-box>
Date: Mon, 24 Jan 2022 15:07:39 +0200
Message-ID: <87lez52sf8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jan 2022, Matthew Brost <matthew.brost@intel.com> wrote:
> On Fri, Jan 21, 2022 at 09:28:46AM +0200, Jani Nikula wrote:
>> On Thu, 20 Jan 2022, Matthew Brost <matthew.brost@intel.com> wrote:
>> > Don't check CT descriptor status, unless CONFIG_DRM_I915_DEBUG_GUC is
>> > set, before CT write / read as this could result in a read across the
>> > PCIe bus thus adding latency to every CT write / read. On well behavied
>> > systems this vaue should always read as zero. For some reason it doesn't
>> > the CT channel is broken and will eventually recover from a GT reset,
>> > albeit the GT reset will not be triggered immediately by seeing that
>> > descriptor status is non-zero.
>> >
>> > v2:
>> >  (CI)
>> >   - Fix build error (hide corrupted label in write function behind
>> >     CONFIG_DRM_I915_DEBUG_GUC)
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> > index de89d40abd38d..948cf31429412 100644
>> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> > @@ -379,8 +379,10 @@ static int ct_write(struct intel_guc_ct *ct,
>> >  	u32 *cmds = ctb->cmds;
>> >  	unsigned int i;
>> >  
>> > +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>> >  	if (unlikely(desc->status))
>> >  		goto corrupted;
>> > +#endif
>> 
>> Please don't add #ifdefs inline. You can use
>> IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC) in if statements, but otherwise
>> the code needs to be split out to a separate function.
>> 
>
> Sure, but I feel like I've actually been by someone else to not use the
> IS_ENABLED macro and use ifdefs inlines...

Citation needed.

Basically never use #if/#ifdef inline. Only use them at the top level
like this:

#if IS_ENABLED(CONFIG_FOO)
static int bar(void)
{
	/* implementation with foo */
}
#else
static int bar(void)
{
	/* implementation without foo */
}
#endif

Sometimes you can avoid the above boilerplate with IS_ENABLED() inline:

	if (IS_ENABLED(CONFIG_FOO))
		...

Basically if you think #if/#ifdef inline is the easiest, you need to
refactor the code to do it cleanly without them.

BR,
Jani.


>
> Matt
>
>> BR,
>> Jani.
>> 
>> >  
>> >  	GEM_BUG_ON(tail > size);
>> >  
>> > @@ -445,11 +447,13 @@ static int ct_write(struct intel_guc_ct *ct,
>> >  
>> >  	return 0;
>> >  
>> > +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>> >  corrupted:
>> >  	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
>> >  		 desc->head, desc->tail, desc->status);
>> >  	ctb->broken = true;
>> >  	return -EPIPE;
>> > +#endif
>> >  }
>> >  
>> >  /**
>> > @@ -815,8 +819,10 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>> >  	if (unlikely(ctb->broken))
>> >  		return -EPIPE;
>> >  
>> > +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>> >  	if (unlikely(desc->status))
>> >  		goto corrupted;
>> > +#endif
>> >  
>> >  	GEM_BUG_ON(head > size);
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
