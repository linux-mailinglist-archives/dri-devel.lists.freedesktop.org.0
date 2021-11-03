Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E6B4440E2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 12:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA62A6FA3B;
	Wed,  3 Nov 2021 11:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 56D7A6FA3B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 11:54:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 907E0D6E;
 Wed,  3 Nov 2021 04:54:39 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F8D3F7B4;
 Wed,  3 Nov 2021 04:54:38 -0700 (PDT)
Subject: Re: dri/drm/kms question with regards to minor faults
To: Bert Schiettecatte <bert@noisetron.com>, John Keeping
 <john@metanate.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <e9e2bbf8-daa3-48f0-b875-f7487b64d57c@www.fastmail.com>
 <YXwUTPBPlgwj5NdA@donbot>
 <a1140d60-77a0-4312-acae-9e9da2239b0d@www.fastmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <71f68aef-fffd-1a58-94fa-273e8c11ed81@arm.com>
Date: Wed, 3 Nov 2021 11:54:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a1140d60-77a0-4312-acae-9e9da2239b0d@www.fastmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/11/2021 05:20, Bert Schiettecatte wrote:
> Hi John 
> 
>> Coincidentally, I've been looking at Panfrost on RK3288 this week as
>> well!  I'm testing it with a project that has been using the binary blob
>> driver for several years and unfortunately Panfrost seems to use ~15%
>> more CPU.
>> Like you, I see a huge number of minor faults (~500/second compared with
>> ~3/second on libmali).  It seems that Panfrost is mmap'ing and
>> munmap'ing buffers on every frame which doesn't happen when the same
>> application is using the binary driver.
> 
> Thanks for confirming you are seeing the same issue. 
> 
>> Panfrost experts, is there a missed opportunity for optimisation here?
>> Or is there something applications should be doing differently to avoid
>> repeatedly mapping & unmapping the same buffers?
> 
> Panfrost team - any update on this? 

I was hoping Alyssa would comment since she's much more familiar with
Mesa than I am!

On the first point of libmali not performing mmap()s very often - I'll
just note that this was a specific design goal and for example the kbase
kernel driver provides ioctl()s to do CPU cache maintenance for this to
work on arm platforms (i.e. it's not a portable solution).

So short answer: yes there is room for optimisation here.

However things get tricky when fitting into a portable framework. The
easiest way of ensuring cache coherency is to ensure there is a clear
owner - so the usual approach is mmap(), read/write some data on the
CPU, munmap(), GPU accesses data, repeat. The DMA framework in the
kernel will then ensure that any cache maintenance/bounce buffering or
other quirks are dealt with.

Having said that we know that existing platforms don't require these
'quirks' (because libmali works on them) so in theory it should be
possible for Mesa to avoid the mmap()/munmap() dance in many cases
(where the memory is coherent with the GPU[1]). But this is where my
knowledge of Mesa is lacking as I've no idea how to go about that.

Regards,
Steve

[1] I think this should actually be true all the time with Panfrost as
the buffer is mapped write-combining on the CPU if the GPU isn't fully
coherent. But I haven't double checked this.
