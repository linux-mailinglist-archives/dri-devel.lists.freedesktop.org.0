Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B17D3F777E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B391F6E247;
	Wed, 25 Aug 2021 14:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 805B36E247
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 14:34:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13A58106F;
 Wed, 25 Aug 2021 07:34:35 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7F533F5A1;
 Wed, 25 Aug 2021 07:34:33 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] drm/panfrost: Handle non-aligned lock addresses
To: Alyssa Rosenzweig <alyssa@collabora.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
References: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
 <20210824173028.7528-5-alyssa.rosenzweig@collabora.com>
 <6fe675c4-d22b-22da-ba3c-f6d33419b9ed@arm.com> <YSZOgzaYN2Vub4w+@maud>
From: Steven Price <steven.price@arm.com>
Message-ID: <8db73065-e8e8-7894-7eac-befd082a25e1@arm.com>
Date: Wed, 25 Aug 2021 15:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSZOgzaYN2Vub4w+@maud>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 25/08/2021 15:07, Alyssa Rosenzweig wrote:
>>> In practice, the current callers pass PAGE_SIZE aligned inputs, avoiding
>>> the bug. Therefore this doesn't need to be backported. Still, that's a
>>> happy accident and not a precondition of lock_region, so we let's do the
>>> right thing to future proof.
>>
>> Actually it's worse than that due to the hardware behaviour, the spec
>> states (for LOCKADDR_BASE):
>>
>>> Only the upper bits of the address are used. The address is aligned to a
>>> multiple of the region size, so a variable number of low-order bits are
>>> ignored, depending on the selected region size. It is recommended that software
>>> ensures that these low bits in the address are cleared, to avoid confusion.
>>
>> It appears that indeed this has caused confusion ;)
>>
>> So for a simple request like locking from 0xCAFE0000 - 0xCB010000 (size
>> = 0x30000) the region width gets rounded up (to 0x40000) which causes
>> the start address to be effectively rounded down (by the hardware) to
>> 0xCAFC0000 and we fail to lock 0xCB000000-0xCB010000.
>>
>> Interestingly (unless my reading of this is wrong) that means to lock
>> 0xFFFF0000-0x100010000 (i.e. crossing the 4GB boundary) requires locking
>> *at least* 0x00000000-0x200000000 (i.e. locking the first 8GB).
>>
>> This appears to be broken in kbase (which actually does zero out the low
>> bits of the address) - I've raised a bug internally so hopefully someone
>> will tell me if I've read the spec completely wrong here.
> 
> Horrifying, and not what I wanted to read my last day before 2 weeks of
> leave. Let's drop this patch, hopefully by the time I'm back, your
> friends in GPU can confirm that's a spec bug and not an actual
> hardware/driver one...
> 
> Can you apply the other 3 patches in the mean time? Thanks :-)
> 

Yeah, sure. I'll push the first 3 to drm-misc-next-fixes (should land in
v5.15).

It's interesting that if my (new) reading of the spec is correct then
kbase has been horribly broken in this respect forever. So clearly it
can't be something that crops up very often. It would have been good if
the spec could have included wording such as "naturally aligned" if
that's what was intended.

Enjoy your holiday!

Thanks,
Steve
