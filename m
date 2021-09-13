Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA7408B33
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 14:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24646E188;
	Mon, 13 Sep 2021 12:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0994F6E185;
 Mon, 13 Sep 2021 12:41:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="282663367"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="282663367"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 05:41:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="507276373"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.119])
 ([10.249.254.119])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 05:41:12 -0700
Subject: Re: [RFC PATCH] drm/ttm: Add a private member to the struct
 ttm_resource
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
 <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
 <a1a8fd3f1ca13b84192bd3c8719f510e5b655b2c.camel@linux.intel.com>
 <c8484b51-4365-bedd-be73-4c0898ac70b1@amd.com>
 <5ea3f498cc5ae84fa6aeba97a64e4eb8ab32e02b.camel@linux.intel.com>
 <c67b3b42-d260-44dc-81cb-1d1eb18db643@amd.com>
 <a6badfa3-efbb-7830-e019-1dd61b0f800e@linux.intel.com>
 <5ca10e93-9bac-bd8f-39b0-d60fe06bc289@amd.com>
 <4b9e25e3-0a9d-a7a8-e092-8355c6b5878f@linux.intel.com>
Message-ID: <7c0b6e6d-fd36-9a5c-758d-7c172c0c5e05@linux.intel.com>
Date: Mon, 13 Sep 2021 14:41:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4b9e25e3-0a9d-a7a8-e092-8355c6b5878f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 9/13/21 12:16 PM, Thomas Hellström wrote:
>
> On 9/13/21 11:41 AM, Christian König wrote:
>> Am 13.09.21 um 11:36 schrieb Thomas Hellström:
>>> On 9/13/21 8:17 AM, Christian König wrote:
>>>> Am 11.09.21 um 08:07 schrieb Thomas Hellström:
>>>>> On Fri, 2021-09-10 at 19:03 +0200, Christian König wrote:
>>>>>> Am 10.09.21 um 17:30 schrieb Thomas Hellström:
>>>>>>> On Fri, 2021-09-10 at 16:40 +0200, Christian König wrote:
>>>>>>>> Am 10.09.21 um 15:15 schrieb Thomas Hellström:
>>>>>>>>> Both the provider (resource manager) and the consumer (the TTM
>>>>>>>>> driver)
>>>>>>>>> want to subclass struct ttm_resource. Since this is left for
>>>>>>>>> the
>>>>>>>>> resource
>>>>>>>>> manager, we need to provide a private pointer for the TTM
>>>>>>>>> driver.
>>>>>>>>>
>>>>>>>>> Provide a struct ttm_resource_private for the driver to
>>>>>>>>> subclass
>>>>>>>>> for
>>>>>>>>> data with the same lifetime as the struct ttm_resource: In the
>>>>>>>>> i915
>>>>>>>>> case
>>>>>>>>> it will, for example, be an sg-table and radix tree into the
>>>>>>>>> LMEM
>>>>>>>>> /VRAM pages that currently are awkwardly attached to the GEM
>>>>>>>>> object.
>>>>>>>>>
>>>>>>>>> Provide an ops structure for associated ops (Which is only
>>>>>>>>> destroy() ATM)
>>>>>>>>> It might seem pointless to provide a separate ops structure,
>>>>>>>>> but
>>>>>>>>> Linus
>>>>>>>>> has previously made it clear that that's the norm.
>>>>>>>>>
>>>>>>>>> After careful audit one could perhaps also on a per-driver
>>>>>>>>> basis
>>>>>>>>> replace the delete_mem_notify() TTM driver callback with the
>>>>>>>>> above
>>>>>>>>> destroy function.
>>>>>>>> Well this is a really big NAK to this approach.
>>>>>>>>
>>>>>>>> If you need to attach some additional information to the resource
>>>>>>>> then
>>>>>>>> implement your own resource manager like everybody else does.
>>>>>>> Well this was the long discussion we had back then when the
>>>>>>> resource
>>>>>>> mangagers started to derive from struct resource and I was under
>>>>>>> the
>>>>>>> impression that we had come to an agreement about the different
>>>>>>> use-
>>>>>>> cases here, and this was my main concern.
>>>>>> Ok, then we somehow didn't understood each other.
>>>>>>
>>>>>>> I mean, it's a pretty big layer violation to do that for this use-
>>>>>>> case.
>>>>>> Well exactly that's the point. TTM should not have a layer design in
>>>>>> the
>>>>>> first place.
>>>>>>
>>>>>> Devices, BOs, resources etc.. are base classes which should 
>>>>>> implement
>>>>>> a
>>>>>> base functionality which is then extended by the drivers to 
>>>>>> implement
>>>>>> the driver specific functionality.
>>>>>>
>>>>>> That is a component based approach, and not layered at all.
>>>>>>
>>>>>>> The TTM resource manager doesn't want to know about this data at
>>>>>>> all,
>>>>>>> it's private to the ttm resource user layer and the resource
>>>>>>> manager
>>>>>>> works perfectly well without it. (I assume the other drivers that
>>>>>>> implement their own resource managers need the data that the
>>>>>>> subclassing provides?)
>>>>>> Yes, that's exactly why we have the subclassing.
>>>>>>
>>>>>>> The fundamental problem here is that there are two layers wanting
>>>>>>> to
>>>>>>> subclass struct ttm_resource. That means one layer gets to do that,
>>>>>>> the
>>>>>>> second gets to use a private pointer, (which in turn can provide
>>>>>>> yet
>>>>>>> another private pointer to a potential third layer). With your
>>>>>>> suggestion, the second layer instead is forced to subclass each
>>>>>>> subclassed instance it uses from  the first layer provides?
>>>>>> Well completely drop the layer approach/thinking here.
>>>>>>
>>>>>> The resource is an object with a base class. The base class
>>>>>> implements
>>>>>> the interface TTM needs to handle the object, e.g.
>>>>>> create/destroy/debug
>>>>>> etc...
>>>>>>
>>>>>> Then we need to subclass this object because without any additional
>>>>>> information the object is pretty pointless.
>>>>>>
>>>>>> One possibility for this is to use the range manager to implement
>>>>>> something drm_mm based. BTW: We should probably rename that to
>>>>>> something
>>>>>> like ttm_res_drm_mm or similar.
>>>>> Sure I'm all in on that, but my point is this becomes pretty awkward
>>>>> because the reusable code already subclasses struct ttm_resource. Let
>>>>> me give you an example:
>>>>>
>>>>> Prereqs:
>>>>> 1) We want to be able to re-use resource manager implementations 
>>>>> among
>>>>> drivers.
>>>>> 2) A driver might want to re-use multiple implementations and have
>>>>> identical data "struct i915_data" attached to both
>>>>
>>>> Well that's the point I don't really understand. Why would a driver 
>>>> want to do this?
>>>
>>> Let's say you have a struct ttm_object_vram and a struct 
>>> ttm_object_gtt, both subclassing drm_gem_object. Then I'd say a 
>>> driver would want to subclass those to attach identical data, extend 
>>> functionality and provide a single i915_gem_object to the rest of 
>>> the driver, which couldn't care less whether it's vram or gtt? 
>>> Wouldn't you say having separate struct ttm_object_vram and a struct 
>>> ttm_object_gtt in this case would be awkward?. We *want* to allow 
>>> common handling.
>>
>> Yeah, but that's a bad idea. This is like diamond inheritance in C++.
>>
>> When you need the same functionality in different backends you 
>> implement that as separate object and then add a parent class.
>>
>>>
>>> It's the exact same situation here. With struct ttm_resource you let 
>>> *different* implementation flavours subclass it, which makes it 
>>> awkward for the driver to extend the functionality in a common way 
>>> by subclassing, unless the driver only uses a single implementation.
>>
>> Well the driver should use separate implementations for their 
>> different domains as much as possible.
>>
> Hmm, Now you lost me a bit. Are you saying that the way we do dynamic 
> backends in the struct ttm_buffer_object to facilitate driver 
> subclassing is a bad idea or that the RFC with backpointer is a bad idea?
>
>
Or if you mean diamond inheritance is bad, yes that's basically my point.

Looking at
https://en.wikipedia.org/wiki/Multiple_inheritance#/media/File:Diamond_inheritance.svg

1)

A would be the struct ttm_resource itself,
D would be struct i915_resource,
B would be struct ttm_range_mgr_node,
C would be struct i915_ttm_buddy_resource

And we need to resolve the ambiguity using the awkward union construct, 
iff we need to derive from both B and C.

Struct ttm_buffer_object and struct ttm_tt instead have B) and C) being 
dynamic backends of A) or a single type derived from A) Hence the 
problem doesn't exist for these types.

So the question from last email remains, if ditching this RFC, can we 
have B) and C) implemented by helpers that can be used from D) and that 
don't derive from A?

Thanks,

Thomas



