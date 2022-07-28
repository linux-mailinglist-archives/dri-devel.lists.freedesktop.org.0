Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E95838CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 08:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152CA8ED56;
	Thu, 28 Jul 2022 06:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA0D11B715;
 Thu, 28 Jul 2022 06:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658989960; x=1690525960;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RK0HAmV0bkXD+BBB3t8pfYAFUKXxk01BYq1b2equMoE=;
 b=YajmrkwD5qp1P5Lag48lhavawKClh7xcglxXJLDuOThFQ9bc3vZ2VMr7
 fDlzVIQoNz0i5FrP9eZOt4ZO276EULIlLOy6gGMObG888ExZryaHlDkJh
 JBorFdFUzTmYB5r/FXbTDQTTUV1sC3Oa07fcB5cjlEd2rVkCiGTuA0yOB
 s3Jj7MJN47KfCKgtVtUOpqBG6mbK9bOR8CvaL/5hSveYmwZkfBU6F3OPy
 K3VSNkmNXlMwesheacsxFD4aY5Qa/TDxWji6zN1RB5a60vfAAoNWrPq5b
 LE73idH5zOaYgy3HDreDmnkCp+Svuv5vO2xVWfWT5iV6qrt2pDUEN6wKH w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268198633"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="268198633"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 23:32:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="659570540"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.249.36.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 23:32:35 -0700
Date: Thu, 28 Jul 2022 08:32:32 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 06/21] drm/i915/gt: Batch TLB invalidations
Message-ID: <20220728083232.352f80cf@maurocar-mobl2>
In-Reply-To: <d2337b73-ae34-3dd3-afa3-85c77dc2135e@linux.intel.com>
References: <cover.1657800199.git.mchehab@kernel.org>
 <9f535a97f32320a213a619a30c961ba44b595453.1657800199.git.mchehab@kernel.org>
 <567823d5-57ba-30db-dd64-de609df4d8c5@linux.intel.com>
 <20220727134836.7f7b5fab@maurocar-mobl2>
 <d2337b73-ae34-3dd3-afa3-85c77dc2135e@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>, Tomas Winkler <tomas.winkler@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022 13:56:50 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> > Because vma_invalidate_tlb() basically stores a TLB seqno, but the
> > actual invalidation is deferred to when the pages are unset, at
> > __i915_gem_object_unset_pages().
> > 
> > So, what happens is:
> > 
> > - on VMA sync mode, the need to invalidate TLB is marked at
> >    __vma_put_pages(), before VMA unbind;
> > - on async, this is deferred to happen at ppgtt_unbind_vma(), where
> >    it marks the need to invalidate TLBs.
> > 
> > On both cases, __i915_gem_object_unset_pages() is called later,
> > when the driver is ready to unmap the page.  
> 
> Sorry still not clear to me why is the patch moving marking of the need 
> to invalidate (regardless if it a bit like today, or a seqno like in 
> this patch) from bind to unbind?
> 
> What if the seqno was stored in i915_vma_bind, where the bit is set 
> today, and all the hunks which touch the unbind and evict would 
> disappear from the patch. What wouldn't work in that case, if anything?

Ah, now I see your point.

I can't see any sense on having a sequence number at VMA bind, as the
unbind order can be different. The need of doing a full TLB invalidation
or not depends on the unbind order.

The way the current algorithm works is that drm_i915_gem_object can be
created on any order, and, at unbind/evict, they receive a seqno.

The seqno is incremented at intel_gt_invalidate_tlb():

    void intel_gt_invalidate_tlb(struct intel_gt *gt, u32 seqno)
    {
	with_intel_gt_pm_if_awake(gt, wakeref) {
		mutex_lock(&gt->tlb.invalidate_lock);
		if (tlb_seqno_passed(gt, seqno))
				goto unlock;

		mmio_invalidate_full(gt);

		write_seqcount_invalidate(&gt->tlb.seqno);	// increment seqno
		

So, let's say 3 objects were created, on this order:

	obj1
	obj2
	obj3

They would be unbind/evict on a different order. On that time, 
the mm.tlb will be stamped with a seqno, using the number from the
last TLB flush, plus 1.

As different threads can be used to handle TLB flushes, let's imagine
two threads (just for the sake of having an example). On such case,
what we would have is:

seqno		Thread 0			Thread 1

seqno=2		unbind/evict event
		obj3.mm.tlb = seqno | 1
seqno=2		unbind/evict event
		obj1.mm.tlb = seqno | 1
						__i915_gem_object_unset_pages() 
						called for obj3, TLB flush happened,
						invalidating both obj1 and obj2.
						seqno += 2					
seqno=4		unbind/evict event
		obj1.mm.tlb = seqno | 1
						__i915_gem_object_unset_pages()
						called for obj1, don't flush.
...
						__i915_gem_object_unset_pages() called for obj2, TLB flush happened
						seqno += 2
seqno=6

So, basically the seqno is used to track when the object data stopped
being updated, because of an unbind/evict event, being later used by
intel_gt_invalidate_tlb() when called from __i915_gem_object_unset_pages(),
in order to check if a previous invalidation call was enough to invalidate
the object, or if a new call is needed.

Now, if seqno is stored at bind, data can still leak, as the assumption
made by intel_gt_invalidate_tlb() that the data stopped being used at
seqno is not true anymore.

Still, I agree that this logic is complex and should be better 
documented. So, if you're now OK with this patch, I'll add the above
explanation inside a kernel-doc comment.

Regards,
Mauro
