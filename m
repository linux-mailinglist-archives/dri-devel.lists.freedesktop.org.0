Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1842C398
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712296E0CF;
	Wed, 13 Oct 2021 14:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76326E069;
 Wed, 13 Oct 2021 14:39:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227400841"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227400841"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:39:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524653403"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:39:50 -0700
Message-ID: <95bf4577-ea21-0995-3bc7-2588fa92debf@linux.intel.com>
Date: Wed, 13 Oct 2021 16:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: Add a struct dma_fence_work
 timeline
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-5-thomas.hellstrom@linux.intel.com>
 <YWbUZ2A7iLEAaRW+@phenom.ffwll.local>
 <3af6691caadc315b01bf3acdff94ff14f967a4a4.camel@linux.intel.com>
 <YWbuU+09AkjCnGyq@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <YWbuU+09AkjCnGyq@phenom.ffwll.local>
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


On 10/13/21 16:33, Daniel Vetter wrote:
> On Wed, Oct 13, 2021 at 04:21:43PM +0200, Thomas Hellström wrote:
>> On Wed, 2021-10-13 at 14:43 +0200, Daniel Vetter wrote:
>>> On Fri, Oct 08, 2021 at 03:35:28PM +0200, Thomas Hellström wrote:
>>>> The TTM managers and, possibly, the gtt address space managers will
>>>> need to be able to order fences for async operation.
>>>> Using dma_fence_is_later() for this will require that the fences we
>>>> hand
>>>> them are from a single fence context and ordered.
>>>>
>>>> Introduce a struct dma_fence_work_timeline, and a function to
>>>> attach
>>>> struct dma_fence_work to such a timeline in a way that all previous
>>>> fences attached to the timeline will be signaled when the latest
>>>> attached struct dma_fence_work signals.
>>>>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> I'm not understanding why we need this:
>>>
>>> - if we just want to order dma_fence work, then an ordered workqueue
>>> is
>>>    what we want. Which is why hand-rolling is better than reusing
>>>    dma_fence_work for absolutely everything.
>>>
>>> - if we just need to make sure the public fences signal in order,
>>> then
>>>    it's a dma_fence_chain.
>> Part of the same series that needs reworking.
>>
>> What we need here is a way to coalesce multiple fences from various
>> contexts (including both gpu and work fences) into a single fence and
>> then attach it to a timeline.
> I thought dma_fence_chain does this for you, including coelescing on the
> same timeline. Or at least it's supposed to, because if it doesn't you can
> produce some rather epic chain explosions with vulkan :-)

I'll take a look to see if I can use dma_fence_chain for this case.

Thanks,

/Thomas

> -Daniel
