Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6337864058F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 12:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC93110E6DB;
	Fri,  2 Dec 2022 11:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D976010E6D9;
 Fri,  2 Dec 2022 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669979583; x=1701515583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pyBYVphqUTlXX1TSLoH/ZyWA9dYxkUdhcdDaZICoNQc=;
 b=VkxskLMftyBG6Mj6znsJnQDCZESSi7ynx9yKVoZv95zA9cWPd8J14Ivq
 C8snVDpz8aQ9AukZ/7pcvrCaIORqQxnKvI7ITTz7HIrI1+0ksQh8gF4kB
 aVrbjAL4lcQ4sT4uRlWwhK/Qjz1U/hKPow247slMO41um8xMiD0e6pHIY
 izrrcx2uayypkedOQWFh80k9oj7xiS/uKPawDxqoQ9j4HA2QSB2dUGVL8
 uA+pYMtIFhwkyu476F8z2QpZpbeRV87wYDuyJlOTPK6CMIxi+4XZJmZrN
 8qrTijRWEMU+PJCJOG/sWWLCh9MDg4kRoIlfgoQFadJEnHVXtTqgazXDL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317081440"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="317081440"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 03:11:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="819406145"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="819406145"
Received: from noest-mobl4.ger.corp.intel.com (HELO intel.com)
 ([10.252.35.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 03:11:33 -0800
Date: Fri, 2 Dec 2022 12:11:30 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 3/5] drm/i915: Introduce guard pages to
 i915_vma
Message-ID: <Y4ndYv5C6K39C8PP@ashyti-mobl2.lan>
References: <20221201144446.333776-1-andi.shyti@linux.intel.com>
 <20221201203912.346110-1-andi.shyti@linux.intel.com>
 <8a8152b6-a7f9-7ecb-4e5b-2b961f8e3ee2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a8152b6-a7f9-7ecb-4e5b-2b961f8e3ee2@linux.intel.com>
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
Cc: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Fri, Dec 02, 2022 at 10:20:11AM +0000, Tvrtko Ursulin wrote:
> 
> On 01/12/2022 20:39, Andi Shyti wrote:
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> > 
> > Introduce the concept of padding the i915_vma with guard pages before
> > and after. The major consequence is that all ordinary uses of i915_vma
> > must use i915_vma_offset/i915_vma_size and not i915_vma.node.start/size
> > directly, as the drm_mm_node will include the guard pages that surround
> > our object.
> > 
> > The biggest connundrum is how exactly to mix requesting a fixed address
> > with guard pages, particularly through the existing uABI. The user does
> > not know about guard pages, so such must be transparent to the user, and
> > so the execobj.offset must be that of the object itself excluding the
> > guard. So a PIN_OFFSET_FIXED must then be exclusive of the guard pages.
> > The caveat is that some placements will be impossible with guard pages,
> > as wrap arounds need to be avoided, and the vma itself will require a
> > larger node. We must not report EINVAL but ENOSPC as these are unavailable
> > locations within the GTT rather than conflicting user requirements.
> > 
> > In the next patch, we start using guard pages for scanout objects. While
> > these are limited to GGTT vma, on a few platforms these vma (or at least
> > an alias of the vma) is shared with userspace, so we may leak the
> > existence of such guards if we are not careful to ensure that the
> > execobj.offset is transparent and excludes the guards. (On such platforms
> > like ivb, without full-ppgtt, userspace has to use relocations so the
> > presence of more untouchable regions within its GTT such be of no further
> > issue.)
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> > Hi Tvrtko,
> > 
> > I removed your r-b in this version because I restored the original value
> > of the guard being aligned with the vma size alignment. Turns out that
> > CI failed with the latest version because the guard was becoming too big
> > (we would have hit the GEM_BUG_ON)[*].
> > 
> > The reason why now the guard is aligned with the vma alignment is that
> > the area is already aligned and if we use as a starting address start +
> > guard, guard needs to be aligned, otherwise we screw up all the memory
> > alignment.
> > 
> > Let me know if it makes sense to you.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Conditional to promise of a prioritised follow up improvement, if it turns
> out GGTT wastage due a bit over zealous guard size comes to bite.

Sure! I'll be alert!

There are some unrelated failures from CI, just to be sure I sent
last night a trybot run.

Thanks, Tvrtko!

Andi
