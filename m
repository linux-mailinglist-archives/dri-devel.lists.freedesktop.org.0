Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD949E728
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 17:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D99A10E16D;
	Thu, 27 Jan 2022 16:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A01310E157;
 Thu, 27 Jan 2022 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643299984; x=1674835984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lMqzku40mv0XLTrAKz9N0IkN2fxOV9wJUhxMw5OgQ+4=;
 b=AiAA86rW8dHsVEh74chXIZtuPmPwrNIVRyw36dn2vKrsvoGZ1u8VRHGH
 jqdAILWmsc33PIkni+8M4gEIEUXEn74k0m71rmsOB8cPMY2VtAG8l5zFb
 J3yVkbOZYg0Y+Lm9Hu9J7nxXP4UXKXshxpTMoFiCqyW6qwxqkwgiL+y4b
 V0MBvW/s2miZI0CmQOJeB/VVXuWthsWaaqYdIXR5K4NuGPmBgm+DNywY9
 cmoSNfgcf0MhVlFNXey2dvQt0nU9ysS9pvFblUgI01xoOdaqBKJamIjH7
 1hw++xv2Fv+6oU512ajimeqGCLKXvUNaxhEEWsAW4Y7YvBxAjqj0Kf5XB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="247117900"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="247117900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 08:12:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="563839362"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 08:12:46 -0800
Date: Thu, 27 Jan 2022 08:12:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Message-ID: <20220127161246.mpyxmxmm55ewz5ik@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <YfJedaoeJjE3grum@phenom.ffwll.local>
 <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
 <YfJtLkdkh4yde20f@phenom.ffwll.local>
 <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 11:21:20AM +0100, Christian König wrote:
>Am 27.01.22 um 11:00 schrieb Daniel Vetter:
>>On Thu, Jan 27, 2022 at 01:33:32AM -0800, Lucas De Marchi wrote:
>>>On Thu, Jan 27, 2022 at 09:57:25AM +0100, Daniel Vetter wrote:
>>>>On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>>>>>Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>>>>>>On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>>>>>>>Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>>>>>>>When dma_buf_map struct is passed around, it's useful to be able to
>>>>>>>>initialize a second map that takes care of reading/writing to an offset
>>>>>>>>of the original map.
>>>>>>>>
>>>>>>>>Add a helper that copies the struct and add the offset to the proper
>>>>>>>>address.
>>>>>>>Well what you propose here can lead to all kind of problems and is
>>>>>>>rather bad design as far as I can see.
>>>>>>>
>>>>>>>The struct dma_buf_map is only to be filled in by the exporter and
>>>>>>>should not be modified in this way by the importer.
>>>>>>humn... not sure if I was  clear. There is no importer and exporter here.
>>>>>Yeah, and exactly that's what I'm pointing out as problem here.
>>>>>
>>>>>You are using the inter driver framework for something internal to the
>>>>>driver. That is an absolutely clear NAK!
>>>>>
>>>>>We could discuss that, but you guys are just sending around patches to do
>>>>>this without any consensus that this is a good idea.
>>>>Uh I suggested this, also we're already using dma_buf_map all over the
>>>>place as a convenient abstraction. So imo that's all fine, it should allow
>>>>drivers to simplify some code where on igpu it's in normal kernel memory
>>>>and on dgpu it's behind some pci bar.
>>>>
>>>>Maybe we should have a better name for that struct (and maybe also a
>>>>better place), but way back when we discussed that bikeshed I didn't come
>>>>up with anything better really.
>>>I suggest iosys_map since it abstracts access to IO and system memory.
>>>
>>>>>>There is a role delegation on filling out and reading a buffer when
>>>>>>that buffer represents a struct layout.
>>>>>>
>>>>>>struct bla {
>>>>>>     int a;
>>>>>>     int b;
>>>>>>     int c;
>>>>>>     struct foo foo;
>>>>>>     struct bar bar;
>>>>>>     int d;
>>>>>>}
>>>>>>
>>>>>>
>>>>>>This implementation allows you to have:
>>>>>>
>>>>>>     fill_foo(struct dma_buf_map *bla_map) { ... }
>>>>>>     fill_bar(struct dma_buf_map *bla_map) { ... }
>>>>>>
>>>>>>and the first thing these do is to make sure the map it's pointing to
>>>>>>is relative to the struct it's supposed to write/read. Otherwise you're
>>>>>>suggesting everything to be relative to struct bla, or to do the same
>>>>>>I'm doing it, but IMO more prone to error:
>>>>>>
>>>>>>     struct dma_buf_map map = *bla_map;
>>>>>>     dma_buf_map_incr(map, offsetof(...));
>>>>Wrt the issue at hand I think the above is perfectly fine code. The idea
>>>>with dma_buf_map is really that it's just a special pointer, so writing
>>>>the code exactly as pointer code feels best. Unfortunately you cannot make
>>>>them typesafe (because of C), so the code sometimes looks a bit ugly.
>>>>Otherwise we could do stuff like container_of and all that with
>>>>typechecking in the macros.
>>>I had exactly this code above, but after writting quite a few patches
>>>using it, particularly with functions that have to write to 2 maps (see
>>>patch 6 for example), it felt much better to have something to
>>>initialize correctly from the start
>>>
>>>	struct dma_buf_map other_map = *bla_map;
>>>	/* poor Lucas forgetting dma_buf_map_incr(map, offsetof(...)); */
>>>
>>>is error prone and hard to debug since you will be reading/writting
>>>from/to another location rather than exploding
>>>
>>>While with the construct below
>>>
>>>	other_map;
>>>	...
>>>	other_map = INITIALIZER()
>>>
>>>I can rely on the compiler complaining about uninitialized var. And
>>>in most of the cases I can just have this single line in the beggining of the
>>>function when the offset is constant:
>>>
>>>	struct dma_buf_map other_map = INITIALIZER(bla_map, offsetof(..));
>>Hm yeah that's a good point that this allows us to rely on the compiler to
>>check for uninitialized variables.
>>
>>Maybe include the above (with editing, but keeping the examples) in the
>>kerneldoc to explain why/how to use this? With that the concept at least
>>has my
>>
>>Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>I'll leave it up to you & Christian to find a prettier color choice for
>>the naming bikeshed.
>
>There is one major issue remaining with this and that is dma_buf_vunmap():
>
>void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>
>Here we expect the original pointer as returned by dma_buf_map(), 
>otherwise we vunmap() the wrong area!

yeah... I think the most confusing aspect here is about the name.

	void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);

this function is the implementation of the dma_buf, not dma_buf_map,
which is another thing entirely. I think the rename will be benefitial
for this to be cleared out, because then it's more obvious the shallow
copy of the map is the equivalent of having

	u8 *p = buffer;
	...
	p += 10;

Etc. You can't kfree(p) and expect it to work.

Lucas De Marchi

>For all TTM based driver this doesn't matter since we keep the vmap 
>base separately in the BO anyway (IIRC), but we had at least one case 
>where this made boom last year.
>
>Christian.
>
>>-Daniel
>>
>>>Lucas De Marchi
>>>
>>>>-Daniel
>>>>
>>>>>>IMO this construct is worse because at a point in time in the function
>>>>>>the map was pointing to the wrong thing the function was supposed to
>>>>>>read/write.
>>>>>>
>>>>>>It's also useful when the function has double duty, updating a global
>>>>>>part of the struct and a table inside it (see example in patch 6)
>>>>>>
>>>>>>thanks
>>>>>>Lucas De Marchi
>>>>-- 
>>>>Daniel Vetter
>>>>Software Engineer, Intel Corporation
>>>>https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C0654a16ea3444271d7c308d9e17bd35d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637788744226808874%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Q6soluBglaZLhLszdapaWuUVsqMq5qvJOKiJjO%2B9BTg%3D&amp;reserved=0
>
