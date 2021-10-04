Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2AC420C96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 15:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5C6E0AC;
	Mon,  4 Oct 2021 13:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38F1B6E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 13:05:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE931FB;
 Mon,  4 Oct 2021 06:05:41 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66C6D3F70D;
 Mon,  4 Oct 2021 06:05:40 -0700 (PDT)
Subject: Re: [PATCH v5 6/8] drm/panfrost: Support synchronization jobs
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210930190954.1525933-1-boris.brezillon@collabora.com>
 <20210930190954.1525933-7-boris.brezillon@collabora.com>
 <9ed27061-54f3-1804-936d-18aecf3d8872@arm.com>
 <20211004142424.09afb418@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5e279d45-0159-b58d-0871-788f1e1562e4@arm.com>
Date: Mon, 4 Oct 2021 14:05:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004142424.09afb418@collabora.com>
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

On 04/10/2021 13:24, Boris Brezillon wrote:
> On Mon, 4 Oct 2021 12:30:42 +0100
> Steven Price <steven.price@arm.com> wrote:
[...]
>>
>> It took me a while to convince myself that the reference counting for
>> the PM reference is correct. Before panfrost_job_hw_submit() always
>> returned with an extra reference, but now we have a case which doesn't.
>> AFAICT this is probably fine because we dereference on the path where
>> the hardware has completed the job (which obviously won't happen here).
>> But I'm still a bit uneasy whether the reference counts are always correct.
> 
> I think it is. We only decrement the PM count in the interrupt handler
> path, and as you pointed out, we won't reach that path here. But if
> that helps, I can move this if to `panfrost_job_run()`:
> 
> 	/* Nothing to execute, signal the fence directly. */
> 	if (job->requirements & PANFROST_JD_REQ_DEP_ONLY)
> 		dma_fence_signal_locked(job->done_fence);
> 	else
> 		panfrost_job_hw_submit(job, slot);
> 

I think that would make it a bit more readable - really
panfrost_job_hw_submit() needs a bit of TLC, I did post a patch ages
ago[1] but it didn't get any feedback and then I forgot about it. Things
have moved on so it would need a little bit of rework.

Thanks,

Steve

[1]
https://lore.kernel.org/dri-devel/20210512152419.30003-1-steven.price@arm.com/
