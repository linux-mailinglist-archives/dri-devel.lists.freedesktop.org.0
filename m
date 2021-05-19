Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73343886F2
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 07:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A546E218;
	Wed, 19 May 2021 05:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171066E218;
 Wed, 19 May 2021 05:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 04A0C402F8;
 Wed, 19 May 2021 07:47:01 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="BDZtBpnM";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUKUAGRnIPfh; Wed, 19 May 2021 07:46:59 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 242BC3FB52;
 Wed, 19 May 2021 07:46:57 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8DB823600DD;
 Wed, 19 May 2021 07:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1621403217; bh=7l1J6Wvb7+vMf7L74qCJftf0cfmKUAtZMaBLYoplip0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BDZtBpnM3TsCJwgPrhr+IXnH3Gg1oGUYXaYAROx4BZrJEssWvLsDmn4buVxjQI2F3
 iGds2WLa0cl6tFfESvxobJk/cA5RBSK1YAAp6MjqEIcOH6u09qU05gFFMXMWuYV6Vr
 rRjHHgl+nrnRzvmkb6ZdNkw+43vIxXRfCXXntc8Y=
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
To: Matthew Auld <matthew.william.auld@gmail.com>,
 Christoph Hellwig <hch@lst.de>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de> <87pmxqiry6.fsf@depni.sinp.msu.ru>
 <20210517123716.GD15150@lst.de> <87lf8dik15.fsf@depni.sinp.msu.ru>
 <20210517131137.GA19451@lst.de>
 <CAM0jSHPy68kMi8NnpAO7ESVW0Ct=dhZ0kYHJO7APy-GBsNp2fQ@mail.gmail.com>
 <20210518132155.GB2617@lst.de>
 <CAM0jSHNR04h-t4_mE4KOGbu7fR8En4uNnhQSkB+bE8Q5vqcSjg@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <3d984dd9-9396-d992-5b88-94bcfde0a98d@shipmail.org>
Date: Wed, 19 May 2021 07:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNR04h-t4_mE4KOGbu7fR8En4uNnhQSkB+bE8Q5vqcSjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 5:00 PM, Matthew Auld wrote:
> On Tue, 18 May 2021 at 14:21, Christoph Hellwig <hch@lst.de> wrote:
>> On Mon, May 17, 2021 at 06:06:44PM +0100, Matthew Auld wrote:
>>>> Looks like it is caused by the validation failure then.  Which means the
>>>> existing code is doing something wrong in its choice of the page
>>>> protection bit.  I really need help from the i915 maintainers here..
>>> AFAIK there are two users of remap_io_sg, the first is our shmem
>>> objects(see i915_gem_shmem.c), and for these we support UC, WC, and WB
>>> mmap modes for userspace. The other user is device local-memory
>>> objects(VRAM), and for this one we have an actual io_mapping which is
>>> allocated as WC, and IIRC this should only be mapped as WC for the
>>> mmap mode, but normal userspace can't hit this path yet.
>> The only caller in current mainline is vm_fault_cpu in i915_gem_mman.c.
>> Is that device local?
> The vm_fault_cpu covers both device local and shmem objects.
>
>>> What do we need to do here? It sounds like shmem backed objects are
>>> allocated as WB for the pages underneath, but i915 allows mapping them
>>> as UC/WC which trips up this track_pfn thing?
>> To me the warnings looks like system memory is mapped with the wrong
>> permissions, yes.  If you want to map it as UC/WC the right set_memory_*
>> needs to be used on the kernel mapping as well to ensure that the
>> attributes don't conflict.
> AFAIK mmap_offset also supports multiple active mmap modes for a given
> object, so set_memory_* should still work here?

No, that won't work because there are active maps with conflicting 
caching attributes. I think the history here is that that was assumed to 
be OK for integrated graphics that ran only on Intel processors that 
promise to never write back unmodified cache lines resulting from 
prefetching, like some AMD processors did way back at least.

These conflicting mappings can obviously not be supported for discrete 
graphics, but for integrated they are part of the uAPI.

/Thomas





> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
