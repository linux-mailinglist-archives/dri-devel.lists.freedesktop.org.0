Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E93F8901
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173A76E854;
	Thu, 26 Aug 2021 13:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5066E852;
 Thu, 26 Aug 2021 13:31:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204875724"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="204875724"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 06:31:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="686973823"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.132])
 ([10.249.254.132])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 06:31:54 -0700
Message-ID: <fe6ffb91c2f562f50c66bc02e993d993280d0456.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Register the migrate contexts with
 their engines
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Brost Matthew
 <matthew.brost@intel.com>,  Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 26 Aug 2021 15:31:52 +0200
In-Reply-To: <2722f768-f73c-1501-996f-c009eab660a1@linux.intel.com>
References: <20210826104514.400352-1-thomas.hellstrom@linux.intel.com>
 <2722f768-f73c-1501-996f-c009eab660a1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-08-26 at 14:04 +0100, Tvrtko Ursulin wrote:
> 
> On 26/08/2021 11:45, Thomas Hellström wrote:
> > Pinned contexts, like the migrate contexts need reset after resume
> > since their context image may have been lost. Also the GuC needs to
> > register pinned contexts.
> 
> So kernel context can get corrupt because we park the GPU with it 
> active. Blitter context for a different reason - which is that it is 
> used to copy itself over to smem, no?
> 
> If that is correct, then why bother copying the blitter context in
> the 
> first place and not just always re-create it on resume?
> 
> That would be along the lines of marking the backing store as
> "dontneed" 
> (however the exact mechanics of that look these days) so suspend can 
> skip them.

I think that is marking the object with I915_BO_ALLOC_VOLATILE. However
I assume this follows the rule of the internal backend objects:
Contents are valid while pinned (or locked), and these images are
indeed pinned on suspend so we need to come up with something else.
Perhaps I915_BO_ALLOC_PM_NOSAVE for the context images (and engine
status pages?) I915_BO_ALLOC_PM_MEMCPY for the migrate vm pagetables
only. The latter will come in handy also for supporting small apertures
where we need to pin these in the mappable area.

> 
> > Add a list to struct intel_engine_cs where we add all pinned
> > contexts on
> > creation, and traverse that list at resume time to reset the pinned
> > contexts.
> > 
> > This fixes the kms_pipe_crc_basic@suspend-read-crc-pipe-a selftest
> > for now,
> > but proper LMEM backup / restore is needed for full suspend
> > functionality.
> > However, note that even with full LMEM backup / restore it may be
> > desirable to keep the reset since backing up the migrate context
> > images
> > must happen using memcpy() after the migrate context has become
> > inactive,
> > and for performance- and other reasons we want to avoid memcpy()
> > from
> > LMEM.
> 
> Hm I guess this talks about the issue - so are these images migrated
> at 
> all today or not?

My current WIP backs them up. But with something like the above flags,
that's easily changed. Suggestions welcome.

/Thomas


