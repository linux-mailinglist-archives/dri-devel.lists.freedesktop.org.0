Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AA6623F9F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 11:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A369710E6BC;
	Thu, 10 Nov 2022 10:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01B310E136;
 Thu, 10 Nov 2022 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668075580; x=1699611580;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TTcb86UtadUXJCy3qfD/FllQa6KAbQainzScpfzhNJw=;
 b=XZUS2EHC3wk5oIfjboSbmx7mfzoVJzu1iewFL+daaO1FnbInxTX0POsg
 W7+x4eJ7rzCUJnfdBTnjy3k40LMuLx9iSQswkqtGhZkFnzMjmG2I/5n0m
 stDpSWeIjKtZ3Ges5sC53gOTLBQbcJo6TgXlATajxo5YMjja5zUoQRmZn
 nQlcq662cdIcEW1QaDT9SVsubbqTa1u1mHnzwJxSHF3ivWU4OJcoAvIIc
 YHF3ETIa+rvKtDyaccnUqC4SwHJwqwpdvu+f/zPv7OS1iBtw9DXT6O4Hv
 8MME+W7spc57rCkP5qKRh0uLVD1pMvYUVDz1N2UubtNv4+0TAxCWk8Wxr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312406990"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="312406990"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 02:19:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="588125964"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="588125964"
Received: from salmasha-mobl.ger.corp.intel.com (HELO [10.213.230.214])
 ([10.213.230.214])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 02:19:33 -0800
Message-ID: <b3795eb7-3d9b-21d8-8b10-fc090097c412@linux.intel.com>
Date: Thu, 10 Nov 2022 10:19:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 0/3] add guard padding around i915_vma
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221109174058.912720-1-andi.shyti@linux.intel.com>
 <f1f4123c3705c6883acdff4770e404704d54dc6e.camel@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f1f4123c3705c6883acdff4770e404704d54dc6e.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 09/11/2022 18:03, Thomas Hellström wrote:
> Hi, Andi,
> 
> This has been on the list before (three times I think) and at that
> point it (the guard pages) was NAK'd by Daniel as yet another
> complication, and a VT-d
> scanout workaround was implemented and pushed using a different
> approach, initially outlined by Daniel.

I can't find this discussion and NAKs on the list - do you have a link?

> Patch is 2ef6efa79fecd. Those suspend/resumes should now be fast.

So the initiator to re-start this series was actually the boot time is 
failing KPIs by quite a margin. Which means we may need a way forward 
after all. Especially if the most churny patch 1 was deemed okay, then I 
don't see why the concept of guard pages should be a problem. But again, 
I couldn't find the discussion you mention to read what were the 
objections..

For 2ef6efa79fecd specifically. I only looked at it today - do you think 
that the heuristic of checking one PTE and deciding all content was 
preserved is safe? What if someone scribbled at random locations? On a 
first thought it is making me a bit uncomfortable.

Regards,

Tvrtko

> I then also discussed patch 1 separately with Dave Airlie and Daniel
> and since both me and Dave liked it, Daniel OK'd it, but it never made
> it upstream.
> 
> Just a short heads up on the history.
> 
> /Thomas
> 
> 
> On Wed, 2022-11-09 at 18:40 +0100, Andi Shyti wrote:
>> Hi,
>>
>> This series adds guards around vma's but setting a pages at the
>> beginning and at the end that work as padding.
>>
>> The first user of the vma guard are scanout objects which don't
>> need anymore to add scratch to all the unused ggtt's and speeding
>> up up considerably the boot and resume by several hundreds of
>> milliseconds up to over a full second in slower machines.
>>
>> Andi
>>
>> Chris Wilson (3):
>>    drm/i915: Wrap all access to i915_vma.node.start|size
>>    drm/i915: Introduce guard pages to i915_vma
>>    drm/i915: Refine VT-d scanout workaround
>>
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 13 ++++
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 33 ++++++-----
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  4 +-
>>   .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>>   .../i915/gem/selftests/i915_gem_client_blt.c  | 23 ++++----
>>   .../drm/i915/gem/selftests/i915_gem_context.c | 15 +++--
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
>>   .../drm/i915/gem/selftests/igt_gem_utils.c    |  7 ++-
>>   drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 39 ++++--------
>>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  3 +-
>>   drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
>>   .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
>>   drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  8 +--
>>   drivers/gpu/drm/i915/gt/selftest_execlists.c  | 18 +++---
>>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 15 ++---
>>   drivers/gpu/drm/i915/gt/selftest_lrc.c        | 16 ++---
>>   .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/selftest_rps.c        | 12 ++--
>>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +--
>>   drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
>>   drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
>>   drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 +-
>>   drivers/gpu/drm/i915/i915_perf.c              |  2 +-
>>   drivers/gpu/drm/i915/i915_vma.c               | 59 +++++++++++++----
>> --
>>   drivers/gpu/drm/i915/i915_vma.h               | 52 +++++++++++++++-
>>   drivers/gpu/drm/i915/i915_vma_resource.c      |  4 +-
>>   drivers/gpu/drm/i915/i915_vma_resource.h      | 17 ++++--
>>   drivers/gpu/drm/i915/i915_vma_types.h         |  3 +-
>>   drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++----
>>   drivers/gpu/drm/i915/selftests/igt_spinner.c  |  8 +--
>>   34 files changed, 246 insertions(+), 160 deletions(-)
>>
> 
