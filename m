Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C773F8992
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469016E85B;
	Thu, 26 Aug 2021 13:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407A46E85B;
 Thu, 26 Aug 2021 13:59:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204881587"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="204881587"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 06:59:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="684943819"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.132])
 ([10.249.254.132])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 06:59:33 -0700
Message-ID: <69c91b3b524163d1683486d8ab0f9fe8f6893192.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gt: Register the migrate
 contexts with their engines
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Brost Matthew
 <matthew.brost@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 26 Aug 2021 15:59:30 +0200
In-Reply-To: <YSeMr9cBPLOMXhyL@phenom.ffwll.local>
References: <20210826104514.400352-1-thomas.hellstrom@linux.intel.com>
 <YSeMr9cBPLOMXhyL@phenom.ffwll.local>
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

On Thu, 2021-08-26 at 14:44 +0200, Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 12:45:14PM +0200, Thomas Hellström wrote:
> > Pinned contexts, like the migrate contexts need reset after resume
> > since their context image may have been lost. Also the GuC needs to
> > register pinned contexts.
> > 
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
> > 
> > Also traverse the list at guc_init_lrc_mapping() calling
> > guc_kernel_context_pin() for the pinned contexts, like is already
> > done
> > for the kernel context.
> > 
> > v2:
> > - Don't reset the contexts on each __engine_unpark() but rather at
> >   resume time (Chris Wilson).
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Brost Matthew <matthew.brost@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> I guess it got lost, but I few weeks ago I stumbled over this and
> wondered
> why we're even setting up a separate context or at least why a
> separate vm
> compared to the gt->vm we have already?
> 
> Even on chips with bazillions of copy engines the plan is that we
> only
> reserve a single one for kernel migrations, so there's not really a
> need
> for quite this much generality I think. Maybe check with Jon
> Bloomfield on
> this.

Are you referring to the generality of the migration code itself or to
the generality of using a list in this patch to register multiple
pinned contexts to an engine? 

For the migration code itself, I figured reserving one copy engine for
migration was strictly needed for recoverable page-faults? In the
current version we're not doing that, but just tying a pinned migration
context to the first available copy engine on the gt, to be used when
we don't have a ww context available to pin a separate context using a
random copy engine. Note also the ring size of the migration contexts;
since we're populating the page-tables for each blit, it's not hard to
fill the ring and in the end multiple contexts I guess boils down to
avoiding priority inversion on migration, including blocking high
priority kernel context tasks.

As for not using the gt->vm, I'm not completely sure if we can do our
special page-table setup on that, Got to defer that question to Chris,
but once Ram's work of supporting 64K LMEM PTEs on that has landed I
guess we could easily reuse the gt->vm if possible and suitable.

Thanks,
/Thomas


