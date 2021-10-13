Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0F42C429
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C396EA5A;
	Wed, 13 Oct 2021 14:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B378D6E9FE;
 Wed, 13 Oct 2021 14:55:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226217923"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="226217923"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:55:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524658545"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:55:55 -0700
Message-ID: <19ad2239-e0ef-dbae-84a9-98c523198ee0@linux.intel.com>
Date: Wed, 13 Oct 2021 16:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/6] drm/i915: Introduce refcounted sg-tables
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-3-thomas.hellstrom@linux.intel.com>
 <YWbwJ+LbRt9+c7H6@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <YWbwJ+LbRt9+c7H6@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/13/21 16:41, Daniel Vetter wrote:
> On Fri, Oct 08, 2021 at 03:35:26PM +0200, Thomas Hellström wrote:
>> As we start to introduce asynchronous failsafe object migration,
>> where we update the object state and then submit asynchronous
>> commands we need to record what memory resources are actually used
>> by various part of the command stream. Initially for three purposes:
>>
>> 1) Error capture.
>> 2) Asynchronous migration error recovery.
>> 3) Asynchronous vma bind.
>>
>> At the time where these happens, the object state may have been updated
>> to be several migrations ahead and object sg-tables discarded.
>>
>> In order to make it possible to keep sg-tables with memory resource
>> information for these operations, introduce refcounted sg-tables that
>> aren't freed until the last user is done with them.
>>
>> The alternative would be to reference information sitting on the
>> corresponding ttm_resources which typically have the same lifetime as
>> these refcountes sg_tables, but that leads to other awkward constructs:
>> Due to the design direction chosen for ttm resource managers that would
>> lead to diamond-style inheritance, the LMEM resources may sometimes be
>> prematurely freed, and finally the subclassed struct ttm_resource would
>> have to bleed into the asynchronous vma bind code.
> On the diamon inheritence I was pondering some more whether we shouldn't
> just do the classic C union horrors, i.e.
>
> struct ttm_resource {
> 	/* stuff */
> };
>
> struct ttm_drm_mm_resource {
> 	struct ttm_resource base;
> 	struct drm_mm_node;
> };
>
> struct ttm_buddy_resource {
> 	struct ttm_resource base;
> 	struct drm_buddy_node;
> };
>
> Whatever else we have, maybe also integer resources for guc_id.
>
> And then the horrors:
>
> struct i915_gem_resource {
> 	union {
> 		struct ttm_resource base;
> 		struct ttm_drm_mm_resource drm_mm;
> 		struct ttm_buffer_object buddy;
> 	};
>
> 	/* i915 stuff */
> };
>
> BUILD_BUG_ON(offsetof(struct i915_gem_resource, base) ==
> 	offsetof(struct i915_gem_resource, drmm_mm.base))
> BUILD_BUG_ON(offsetof(struct i915_gem_resource, base) ==
> 	offsetof(struct i915_gem_resource, buddy.base))
>
> This is horrible, but also in official C89 and later unions are the only
> ways to do inheritance. The only reason we can do different in linux is
> because we compile with strict aliasing turned off.
>
> So I think we can shrug this off as officially sanctioned horrors. There's
> a small downside with overhead maybe, but I don't think the amount in
> difference between the various allocators is big enough that we should
> care. Plus a pointer to driver stuff to resolve the diamond inheritance
> through different means isn't free either.

Yes, this is exactly what was meant by "awkward constructs" in the 
commit message,

My thoughts are still that all this could be avoided by a different 
design for struct ttm_resource,
but I agree we can do with refcounted sg-lists for now, to see where 
this ends up when all related resource-on-lru stuff lands in TTM.

/Thomas


