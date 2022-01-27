Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A649E72D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 17:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3B610E145;
	Thu, 27 Jan 2022 16:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4FC10E157;
 Thu, 27 Jan 2022 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643300048; x=1674836048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QDeROQcMDq4DozBjzzP3pc8HJ6jhoXd94r+7dP703bk=;
 b=Of9wJbiST76e0dFzK2G+vx5nIvl4I8aoPCDx3O2SiGVltz5D3I3BjI5v
 mNGW9O4eHe7QZJsE30ToFyTCWvjNMWu5qYYbbPoBFRTEfzBNcZWGxKFRp
 bBB8JEb+IPFI/QWwTl51jkpU/BoY2TE3xhMICZVjrlbzxkGk6Yqly+QOJ
 1Lh0aNst39AKId+5kZgWavsXf8RduMwXJ+Zc2tgNXg/tBk3oUK9JOr2r/
 LzBv9SaR9a9BHpl/qUHfBZmDmv9irztH7Wjb2H7wz9P+1OM4hYvJK1jhq
 FJ3laIE0rrTje9nEoVz5tsOYHWIHUMmgty14jav3ww7hgLH+/K9HbEphw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246675611"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="246675611"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 08:14:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="674765072"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 08:13:58 -0800
Date: Thu, 27 Jan 2022 08:13:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add
 helper to initialize second map
Message-ID: <20220127161358.hl4hiqnivbdwu7wm@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <YfJedaoeJjE3grum@phenom.ffwll.local>
 <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
 <YfJtLkdkh4yde20f@phenom.ffwll.local>
 <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>
 <YfJ/DvhxaGGppGV6@phenom.ffwll.local>
 <50cf1f2f-3fb2-8abb-7497-dafcd97935f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50cf1f2f-3fb2-8abb-7497-dafcd97935f3@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 12:44:21PM +0100, Christian König wrote:
>Am 27.01.22 um 12:16 schrieb Daniel Vetter:
>>On Thu, Jan 27, 2022 at 11:21:20AM +0100, Christian König wrote:
>>>Am 27.01.22 um 11:00 schrieb Daniel Vetter:
>>>>On Thu, Jan 27, 2022 at 01:33:32AM -0800, Lucas De Marchi wrote:
>>>>>On Thu, Jan 27, 2022 at 09:57:25AM +0100, Daniel Vetter wrote:
>>>>>>On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>>>>>>>Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>>>>>>>>On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>>>>>>>>>Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>>>>>>>>>When dma_buf_map struct is passed around, it's useful to be able to
>>>>>>>>>>initialize a second map that takes care of reading/writing to an offset
>>>>>>>>>>of the original map.
>>>>>>>>>>
>>>>>>>>>>Add a helper that copies the struct and add the offset to the proper
>>>>>>>>>>address.
>>>>>>>>>Well what you propose here can lead to all kind of problems and is
>>>>>>>>>rather bad design as far as I can see.
>>>>>>>>>
>>>>>>>>>The struct dma_buf_map is only to be filled in by the exporter and
>>>>>>>>>should not be modified in this way by the importer.
>>>>>>>>humn... not sure if I was  clear. There is no importer and exporter here.
>>>>>>>Yeah, and exactly that's what I'm pointing out as problem here.
>>>>>>>
>>>>>>>You are using the inter driver framework for something internal to the
>>>>>>>driver. That is an absolutely clear NAK!
>>>>>>>
>>>>>>>We could discuss that, but you guys are just sending around patches to do
>>>>>>>this without any consensus that this is a good idea.
>>>>>>Uh I suggested this, also we're already using dma_buf_map all over the
>>>>>>place as a convenient abstraction. So imo that's all fine, it should allow
>>>>>>drivers to simplify some code where on igpu it's in normal kernel memory
>>>>>>and on dgpu it's behind some pci bar.
>>>>>>
>>>>>>Maybe we should have a better name for that struct (and maybe also a
>>>>>>better place), but way back when we discussed that bikeshed I didn't come
>>>>>>up with anything better really.
>>>>>I suggest iosys_map since it abstracts access to IO and system memory.
>>>>>
>>>>>>>>There is a role delegation on filling out and reading a buffer when
>>>>>>>>that buffer represents a struct layout.
>>>>>>>>
>>>>>>>>struct bla {
>>>>>>>>      int a;
>>>>>>>>      int b;
>>>>>>>>      int c;
>>>>>>>>      struct foo foo;
>>>>>>>>      struct bar bar;
>>>>>>>>      int d;
>>>>>>>>}
>>>>>>>>
>>>>>>>>
>>>>>>>>This implementation allows you to have:
>>>>>>>>
>>>>>>>>      fill_foo(struct dma_buf_map *bla_map) { ... }
>>>>>>>>      fill_bar(struct dma_buf_map *bla_map) { ... }
>>>>>>>>
>>>>>>>>and the first thing these do is to make sure the map it's pointing to
>>>>>>>>is relative to the struct it's supposed to write/read. Otherwise you're
>>>>>>>>suggesting everything to be relative to struct bla, or to do the same
>>>>>>>>I'm doing it, but IMO more prone to error:
>>>>>>>>
>>>>>>>>      struct dma_buf_map map = *bla_map;
>>>>>>>>      dma_buf_map_incr(map, offsetof(...));
>>>>>>Wrt the issue at hand I think the above is perfectly fine code. The idea
>>>>>>with dma_buf_map is really that it's just a special pointer, so writing
>>>>>>the code exactly as pointer code feels best. Unfortunately you cannot make
>>>>>>them typesafe (because of C), so the code sometimes looks a bit ugly.
>>>>>>Otherwise we could do stuff like container_of and all that with
>>>>>>typechecking in the macros.
>>>>>I had exactly this code above, but after writting quite a few patches
>>>>>using it, particularly with functions that have to write to 2 maps (see
>>>>>patch 6 for example), it felt much better to have something to
>>>>>initialize correctly from the start
>>>>>
>>>>>	struct dma_buf_map other_map = *bla_map;
>>>>>	/* poor Lucas forgetting dma_buf_map_incr(map, offsetof(...)); */
>>>>>
>>>>>is error prone and hard to debug since you will be reading/writting
>>>>>from/to another location rather than exploding
>>>>>
>>>>>While with the construct below
>>>>>
>>>>>	other_map;
>>>>>	...
>>>>>	other_map = INITIALIZER()
>>>>>
>>>>>I can rely on the compiler complaining about uninitialized var. And
>>>>>in most of the cases I can just have this single line in the beggining of the
>>>>>function when the offset is constant:
>>>>>
>>>>>	struct dma_buf_map other_map = INITIALIZER(bla_map, offsetof(..));
>>>>Hm yeah that's a good point that this allows us to rely on the compiler to
>>>>check for uninitialized variables.
>>>>
>>>>Maybe include the above (with editing, but keeping the examples) in the
>>>>kerneldoc to explain why/how to use this? With that the concept at least
>>>>has my
>>>>
>>>>Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>
>>>>I'll leave it up to you & Christian to find a prettier color choice for
>>>>the naming bikeshed.
>>>There is one major issue remaining with this and that is dma_buf_vunmap():
>>>
>>>void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>
>>>Here we expect the original pointer as returned by dma_buf_map(), otherwise
>>>we vunmap() the wrong area!
>>>
>>>For all TTM based driver this doesn't matter since we keep the vmap base
>>>separately in the BO anyway (IIRC), but we had at least one case where this
>>>made boom last year.
>>Yeah but isn't that the same if it's just a void *?
>>
>>If you pass the wrong pointer to an unmap function and not exactly what
>>you go from the map function, then things go boom. This is like
>>complaining that the following code wont work
>>
>>	u32 *stuff
>>
>>	stuff = kmap_local(some_page);
>>	*stuff++ = 0;
>>	*stuff = 1;
>>	kunmap_locak(stuff);
>>
>>It's just ... don't do that :-) Also since we pass dma_buf_map by value
>>and not by pointer anywhere, the risk of this happening is pretty low
>>since you tend to work on a copy. Same with void * pointers really.
>>
>>Now if people start to pass around struct dma_buf_map * as pointers for
>>anything else than out parameters, then we're screwed. But that's like
>>passing around void ** for lolz, which is just wrong (except when it's an
>>out parameter or actually an array of pointers ofc).
>>
>>Or I really don't get your concern and you mean something else?
>
>No that's pretty much it. It's just that we hide the pointer inside a 
>structure and it is absolutely not obvious to a driver dev that you 
>can't do:
>
>dma_buf_vmap(.., &map);
>dma_buf_map_inr(&map, x);
>dma_buf_vunmap(.., &map);
>
>As bare minimum I strongly suggest that we add some WARN_ONs to the 
>framework to check that the pointer given to dma_buf_vunmap() is at 
>least page aligned.

Agreed, that should cover most of the cases. I can add a patch doing
that.

thanks
Lucas De Marchi
