Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BF66BDB7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF8610E3F4;
	Mon, 16 Jan 2023 12:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25FCE10E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 12:21:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFC9DAD7;
 Mon, 16 Jan 2023 04:21:49 -0800 (PST)
Received: from [10.57.13.214] (unknown [10.57.13.214])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 356BF3F445;
 Mon, 16 Jan 2023 04:21:06 -0800 (PST)
Message-ID: <8ae70c49-65fb-fae1-224f-6f213e2bd338@arm.com>
Date: Mon, 16 Jan 2023 12:21:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 0/4] drm/panfrost: Expose memory usage stats through
 fdinfo
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
 <5b4f73a1-60bf-7da6-e94d-fca9f6ec7c3a@arm.com>
 <20230116120515.1cd3243d@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230116120515.1cd3243d@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 11:05, Boris Brezillon wrote:
> Hi Steven,
> 
> On Mon, 16 Jan 2023 10:30:21 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 04/01/2023 13:03, Boris Brezillon wrote:
>>> Hello,
>>>
>>> Here's an attempt at exposing some memory usage stats through fdinfo,
>>> which recently proved useful in debugging a memory leak. Not entirely
>>> sure the name I chose are accurate, so feel free to propose
>>> alternatives, and let me know if you see any other mem-related stuff
>>> that would be interesting to expose.  
>>
>> Sorry it's taken me a while to look at this - I'm still working through
>> the holiday backlog.
>>
>> The names look reasonable to me, and I gave this a quick spin and it
>> seemed to work (the numbers reported looks reasonable). As Daniel
>> suggested it would be good if some of the boiler plate fdinfo code could
>> be moved to generic code (although to be fair there's not much here).
>>
>> Of course what we're missing is the 'engine' usage information for
>> gputop - it's been on my todo list of a while, but I'm more than happy
>> for you to do it for me ;) It's somewhat more tricky because of the
>> whole 'queuing' on slots mechanism that Mali has. But we obviously
>> shouldn't block this memory implementation on that, it can be added
>> afterwards.
> 
> Yeah, we've been discussing this drm-engine-xxx feature with Chris, and
> I was telling him there's no easy way to get accurate numbers when
> _NEXT queuing is involved. It all depends on whether we're able to
> process the first job DONE interrupt before the second one kicks in, and
> even then, we can't tell for sure for how long the second job has been
> running when we get to process the first job interrupt. Inserting
> WRITE_JOB(CYCLE_COUNT) before a job chain is doable, but inserting it
> after isn't, and I'm not sure we want to add such tricks to the kernel
> driver anyway. Don't know if you have any better ideas. If not, I guess
> we can leave with this inaccuracy and still expose drm-engine-xxx...

It's fun isn't it ;) I spent many hours in the past puzzling over this!

Realistically it doesn't make sense for the kernel to get involved in
inserting write_jobs. You open up so many cans of worms regarding how to
manage the memory for the GPU to write in. The closed DDK handles this
by the user space driver adding these jobs and the tooling capturing
data from both the kernel and user space.

But for just the gputop type tooling I don't think we need that level of
accuracy[1]. If you ignore the impacts of interrupt latency then it's
possible to tell which job the GPU is currently executing and do the
accounting. Obviously interrupt latency is far from zero (that's why we
have _NEXT) but it's usually small enough that it won't skew the results
too far.

Obviously in the case you describe (second DONE interrupt before the
first one is handled) you also get the weird reporting that the second
job took no time. Which is 'wrong' but clearly the second job was
'quick' so 0 isn't likely to be too far out. And fdinfo isn't exposing
these 'per job' timings so it's unlikely to be very visible.

Thanks,

Steve

[1] As a side-note, there's a bunch of issues even with the data from
write_job(cycle_count): the frequency of the GPU may change, the
frequency of the memory system may change, a job running on the other
slot may be competing for resources on the GPU etc. When actually
profiling an application reliably it becomes necessary to lock
frequencies and ensure that it is the only thing running. I think the
DDK even includes an option to run each job by itself to avoid
cross-slot impacts (although that is unrealistic in itself).

> Regards,
> 
> Boris

