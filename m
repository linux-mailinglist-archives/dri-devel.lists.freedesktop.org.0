Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3944180C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 10:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77181899A7;
	Mon,  1 Nov 2021 09:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4256899A7;
 Mon,  1 Nov 2021 09:41:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="218170669"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="218170669"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 02:41:24 -0700
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="499971520"
Received: from lellis-mobl.ger.corp.intel.com (HELO [10.213.243.87])
 ([10.213.243.87])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 02:41:23 -0700
Subject: Re: [Intel-gfx] [PATCH 02/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-2-maarten.lankhorst@linux.intel.com>
 <022f8ecb-37c0-3d67-563f-012f0a3651df@amd.com>
 <c7c82fa5-6fe5-33e2-e224-c5433020100c@linux.intel.com>
 <007050d3-0207-5226-0cbe-7a3d8679811c@linux.intel.com>
 <810de535-0902-04ef-be13-35c978fd80bc@amd.com>
 <YXrCAaGhLVtduUfa@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f62922a7-344d-3e81-b391-840298f833d4@linux.intel.com>
Date: Mon, 1 Nov 2021 09:41:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXrCAaGhLVtduUfa@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 28/10/2021 16:30, Daniel Vetter wrote:
> On Thu, Oct 28, 2021 at 10:41:38AM +0200, Christian König wrote:
>> Am 21.10.21 um 13:13 schrieb Tvrtko Ursulin:
>>>
>>> On 21/10/2021 12:06, Maarten Lankhorst wrote:
>>>> Op 21-10-2021 om 12:38 schreef Christian König:
>>>>> Am 21.10.21 um 12:35 schrieb Maarten Lankhorst:
>>>>>> From: Christian König <christian.koenig@amd.com>
>>>>>>
>>>>>> Simplifying the code a bit.
>>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> [mlankhorst: Handle timeout = 0 correctly, use new
>>>>>> i915_request_wait_timeout.]
>>>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>
>>>>> LGTM, do you want to push it or should I pick it up into drm-misc-next?
>>>>
>>>> I think it can be applied to drm-intel-gt-next, after a backmerge.
>>>> It needs patch 1 too, which fixes
>>>>
>>>> i915_request_wait semantics when used in dma-fence. It exports a
>>>> dma-fence compatible i915_request_wait_timeout function, used in
>>>> this patch.
>>
>> What about the other i915 patches? I guess you then want to merge them
>> through drm-intel-gt-next as well.
>>
>>> I don't think my open has been resolved, at least I haven't seen a reply
>>> from Daniel on the topic of potential for infinite waits with untrusted
>>> clients after this change. +Daniel
>>
>> Please resolve that internally and let me know the result. I'm fine to use
>> any of the possible approaches, I just need to know which one.
> 
> I thought I explained this in the patch set from Maarten. This isn't an
> issue, since the exact same thing can happen if you get interrupts and
> stuff.

Ah were you trying to point out all this time the infinite wait just got 
moved from inside the "old" dma_resv_get_fences to the new iterator caller?

Regards,

Tvrtko

> 
> The only proper fix for bounding the waits is a) compositor grabs a stable
> set of dma_fence from the dma-buf through the proposed fence export ioctl
> b) compositor waits on that fence (or drm_syncobj).
> 
> Everything else is cargo-culted nonsense, and very much includes that igt
> patch that's floating around internally.
> 
> I can also whack this into drm-next if this is stuck in this silly
> bikeshed.
> -Daniel
> 
