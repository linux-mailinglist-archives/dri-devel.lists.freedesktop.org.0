Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4C3A1427
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 14:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82736E243;
	Wed,  9 Jun 2021 12:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709466E2C7;
 Wed,  9 Jun 2021 12:20:58 +0000 (UTC)
IronPort-SDR: d7C19KG0B5Y1ToAZOUl5tCnqG8TFdwG0W6iUWn6i/+F8tdw+ZY+si64VlNcK6YA3vQHXQjJS43
 Rosqh+0sxE1Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="204873215"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="204873215"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 05:20:57 -0700
IronPort-SDR: 9W2lNE1DGkmylqlo1zkI5ksJCbEzMg8kS4YOXJNPtOGNycrn/fea7+s4IavCGha9+tNBf65S/V
 TsZ+25ffddKw==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="419261382"
Received: from gbwalsh-mobl6.ger.corp.intel.com (HELO [10.252.10.147])
 ([10.252.10.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 05:20:55 -0700
Subject: Re: [Intel-gfx] [PATCH v2 0/9] Prereqs for TTM accelerated migration
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <YMCqm48rZIKLYk/s@phenom.ffwll.local>
 <9f38fc28-15fb-2736-ba01-503821fdbe54@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <4d570a5b-0ea7-71ab-5082-e67f0cd668a7@intel.com>
Date: Wed, 9 Jun 2021 13:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9f38fc28-15fb-2736-ba01-503821fdbe54@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2021 13:16, Thomas Hellström wrote:
> 
> On 6/9/21 1:48 PM, Daniel Vetter wrote:
>> On Wed, Jun 09, 2021 at 08:34:27AM +0200, Thomas Hellström wrote:
>>> A couple of patches from Chris which implement pipelined migration and
>>> clears by atomically writing the PTEs in place before performing the
>>> actual blit.
>>>
>>> Some ww utilities mainly for the accompanying selftests added by Thomas,
>>> as well as modified the above patches for ww locking- and lmem support.
>>>
>>> The actual hook up to the i915 ttm backend is being worked on and not
>>> included yet, so this is considered to be an early review opportunity.
>>>
>>> v2:
>>> - A couple of minor style fixes pointed out by Matthew Auld
>>> - Export and use intel_engine_destroy_pinned_context() to address a
>>> ls   CI warning / failure.
>> Just to check my understanding of the plan: These are the new windowed
>> clear/blt functions which we plan to use everywhere, because less nasty
>> locking implications? And the clear/blt we currently have in upstream 
>> will
>> be replaced?
> 
> Yes. These are for LMEM clearing and migration. It looks to me like the 
> other ones we have in upstream are actually unused except for selftests. 
> We're actually using CPU clearing for now.
> 
>>
>> If so would be nice if this patch set includes that replacement work (I
>> think right now all we have is the clear for lmem), including updating of
>> selftests and stuff like that. Just to avoid having two ways to do the
>> same thing in the driver.
> 
> OK, I'll have a look at stripping the existing code. If we need it 
> moving forward, we can always re-add.

Some low hanging fruit would be all the client_blt stuff which can for 
sure be deleted now.

> 
> /Thomas
> 
> 
>> -Daniel
>>
>>> Chris Wilson (6):
>>>    drm/i915/gt: Add an insert_entry for gen8_ppgtt
>>>    drm/i915/gt: Add a routine to iterate over the pagetables of a GTT
>>>    drm/i915/gt: Export the pinned context constructor and destructor
>>>    drm/i915/gt: Pipelined page migration
>>>    drm/i915/gt: Pipelined clear
>>>    drm/i915/gt: Setup a default migration context on the GT
>>>
>>> Thomas Hellström (3):
>>>    drm/i915: Reference objects on the ww object list
>>>    drm/i915: Break out dma_resv ww locking utilities to separate files
>>>    drm/i915: Introduce a ww transaction helper
>>>
>>>   drivers/gpu/drm/i915/Makefile                 |   2 +
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +-
>>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  68 ++
>>>   drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +
>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  27 +-
>>>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
>>>   drivers/gpu/drm/i915/gt/intel_gt.c            |   4 +
>>>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |   3 +
>>>   drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 +
>>>   drivers/gpu/drm/i915/gt/intel_migrate.c       | 685 ++++++++++++++++++
>>>   drivers/gpu/drm/i915/gt/intel_migrate.h       |  65 ++
>>>   drivers/gpu/drm/i915/gt/intel_migrate_types.h |  15 +
>>>   drivers/gpu/drm/i915/gt/intel_renderstate.h   |   1 +
>>>   drivers/gpu/drm/i915/gt/intel_ring.h          |   1 +
>>>   drivers/gpu/drm/i915/gt/selftest_migrate.c    | 671 +++++++++++++++++
>>>   drivers/gpu/drm/i915/i915_gem.c               |  52 --
>>>   drivers/gpu/drm/i915/i915_gem.h               |  12 -
>>>   drivers/gpu/drm/i915/i915_gem_ww.c            |  63 ++
>>>   drivers/gpu/drm/i915/i915_gem_ww.h            |  50 ++
>>>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>>>   .../drm/i915/selftests/i915_perf_selftests.h  |   1 +
>>>   21 files changed, 1675 insertions(+), 76 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
>>>   create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
>>>   create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
>>>   create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
>>>   create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
>>>   create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h
>>>
>>> -- 
>>> 2.31.1
>>>
>>> _______________________________________________
>>> Intel-gfx mailing list
>>> Intel-gfx@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
