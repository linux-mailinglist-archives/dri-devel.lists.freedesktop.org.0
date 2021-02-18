Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0031EC16
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760E56EA45;
	Thu, 18 Feb 2021 16:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 204EA6EA40
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 16:15:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EA961042;
 Thu, 18 Feb 2021 08:15:28 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6806F3F73D;
 Thu, 18 Feb 2021 08:15:27 -0800 (PST)
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <20210218154538.GA1483@kevin>
From: Steven Price <steven.price@arm.com>
Message-ID: <bddce2d0-8f93-9263-0185-97fc848ddda6@arm.com>
Date: Thu, 18 Feb 2021 16:15:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210218154538.GA1483@kevin>
Content-Language: en-GB
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
Cc: Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2021 15:45, Alyssa Rosenzweig wrote:
>> Yeah plus Cc: stable for backporting and I think an igt or similar for
>> panfrost to check this works correctly would be pretty good too. Since
>> if it took us over 1 year to notice this bug it's pretty clear that
>> normal testing doesn't catch this. So very likely we'll break this
>> again.
> 
> Unfortunately there are a lot of kernel bugs which are noticed during actual
> use (but not CI runs), some of which have never been fixed. I do know
> the shrinker impl is buggy for us, if this is the fix I'm very happy.

I doubt this will actually "fix" anything - if I understand correctly 
then the sequence which is broken is:

  * allocate BO, mmap to CPU
  * madvise(DONTNEED)
  * trigger purge
  * try to access the BO memory

which is an invalid sequence for user space - the attempt to access 
memory should cause a SIGSEGV. However because drm_vma_node_unmap() is 
unable to find the mappings there may still be page table entries 
present which would provide access to memory the kernel has freed. Which 
is of course a big security hole and so this fix is needed.

In what way do you find the shrinker impl buggy? I'm aware there's some 
dodgy locking (although I haven't worked out how to fix it) - but AFAICT 
it's more deadlock territory rather than lacking in locks. Are there 
correctness issues?

>> btw for testing shrinkers recommended way is to have a debugfs file
>> that just force-shrinks everything. That way you avoid all the trouble
>> that tend to happen when you drive a system close to OOM on linux, and
>> it's also much faster.
> 
> 2nding this as a good idea.
> 

Sounds like a good idea to me too. But equally I'm wondering whether the 
best (short term) solution is to actually disable the shrinker. I'm 
somewhat surprised that nobody has got fed up with the "Purging xxx 
bytes" message spam - which makes me think that most people are not 
hitting memory pressure to trigger the shrinker.

The shrinker on kbase caused a lot of grief - and the only way I managed 
to get that under control was by writing a static analysis tool for the 
locking, and by upsetting people by enforcing the (rather dumb) rules of 
the tool on the code base. I've been meaning to look at whether sparse 
can do a similar check of locks.

Sadly at the moment I'm struggling to find time to look at such things.

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
