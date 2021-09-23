Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02C4157E4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 07:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379306ECCC;
	Thu, 23 Sep 2021 05:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AAC6ECCC;
 Thu, 23 Sep 2021 05:37:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="309324890"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="309324890"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 22:37:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="702580996"
Received: from shanshug-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.133.169])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 22:37:06 -0700
Date: Wed, 22 Sep 2021 22:37:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: John Harrison <john.c.harrison@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: remove unneeded clflush
 calls
Message-ID: <20210923053703.t7pojjunrvm6gsna@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210914195151.560793-1-lucas.demarchi@intel.com>
 <27c071ae-13b8-d71d-d869-e9cbd7431afd@intel.com>
 <b6b996be-b60c-41f1-e531-77c2bcdda920@intel.com>
 <20210921054708.p63rjkxux742op72@ldmartin-desk2>
 <YUnYuCFUVULQQK7j@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUnYuCFUVULQQK7j@intel.com>
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

On Tue, Sep 21, 2021 at 04:06:00PM +0300, Ville Syrjälä wrote:
>On Mon, Sep 20, 2021 at 10:47:08PM -0700, Lucas De Marchi wrote:
>> On Wed, Sep 15, 2021 at 12:29:12PM -0700, John Harrison wrote:
>> >On 9/15/2021 12:24, Belgaumkar, Vinay wrote:
>> >>On 9/14/2021 12:51 PM, Lucas De Marchi wrote:
>> >>>The clflush calls here aren't doing anything since we are not writting
>> >>>something and flushing the cache lines to be visible to GuC. Here the
>> >>>intention seems to be to make sure whatever GuC has written is visible
>> >>>to the CPU before we read them. However a clflush from the CPU side is
>> >>>the wrong instruction to use.
>> >Is there a right instruction to use? Either we need to verify that no
>>
>> how can there be a right instruction? If the GuC needs to flush, then
>> the GuC needs to do it, nothing to be done by the CPU.
>>
>> Flushing the CPU cache line here is doing nothing to guarantee that what
>> was written by GuC hit the memory and we are reading it. Not sure why it
>> was actually added, but since it was added by Vinay and he reviewed this
>> patch, I'm assuming he also agrees
>
>clflush == writeback + invalidate. The invalidate is the important part
>when the CPU has to read something written by something else that's not
>cache coherent.

Although the invalidate would be the important part, how would that work
if there is still a flush? Wouldn't we be overriding whatever
was written by the other side? Or are we using the fact that we
shouldn't be writting to this cacheline so we know it's not dirty?

>
>Now, I have no idea if the guc has its own (CPU invisible) caches or not.
>If it does then it will need to trigger a writeback. But regardless, if
>the guc bypasses the CPU caches the CPU will need to invalidate before
>it reads anything in case it has stale data sitting in its cache.

Indeed, thanks... but another case would be if caches are coherent
through snoop.  Do you know what is the cache architecture with GuC
and CPU?

Another question comes to mind, but first some context: I'm looking
at this in order to support other archs besides x86... the only
platforms in which this would be relevant would be on the discrete ones
(I'm currently running an arm64 guest on qemu and using pci
passthrough). I see that for dgfx intel_guc_allocate_vma() uses
i915_gem_object_create_lmem() instead of i915_gem_object_create_shmem().
Would that make a difference?

thanks
Lucas De Marchi
