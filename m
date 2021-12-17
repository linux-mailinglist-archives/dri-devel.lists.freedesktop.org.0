Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8857C47880B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 10:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3319E10FCB7;
	Fri, 17 Dec 2021 09:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 485CC10FCB2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 09:48:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA8741435;
 Fri, 17 Dec 2021 01:48:16 -0800 (PST)
Received: from [10.57.6.245] (unknown [10.57.6.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42B643F774;
 Fri, 17 Dec 2021 01:48:15 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211216161603.983711-1-steven.price@arm.com>
 <CAL_JsqKZBsJxy8h5EQf0wwfioWS-Kx9i=0cQ7p4FHckEXstGiw@mail.gmail.com>
 <4c564c0d-7702-9dfe-910f-969fe130aba8@arm.com> <20211217091046.GG1978@kadam>
 <4e56a7a8-c48c-49dc-6535-730ad871d1e1@arm.com> <20211217092817.GH1978@kadam>
From: Steven Price <steven.price@arm.com>
Message-ID: <68709772-b515-f4ab-676f-2bf1f510dfe6@arm.com>
Date: Fri, 17 Dec 2021 09:48:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217092817.GH1978@kadam>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/12/2021 09:28, Dan Carpenter wrote:
> On Fri, Dec 17, 2021 at 09:16:19AM +0000, Steven Price wrote:
>> On 17/12/2021 09:10, Dan Carpenter wrote:
>>> On Fri, Dec 17, 2021 at 08:55:50AM +0000, Steven Price wrote:
>>>> However this one is harder to fix without setting an arbitrary cap on
>>>> the number of BOs during a sumbit. I'm not sure how other drivers handle
>>>> this - the ones I've looked at so far all have the same issue. There's
>>>> obviously the list that Dan already sent, but e.g. msm has the same bug
>>>> in msm_gem_submit.c:submit_create() with an amusing bug where the check
>>>> for (sz > SIZE_MAX) will never hit, although the call is to kzalloc() so
>>>> large allocations are going to fail anyway.
>>>
>>> sz is u64 and SIZE_MAX is ULONG_MAX so the (sz > SIZE_MAX) condition
>>> does work to prevent an integer overflow on 32bit systems.  But it's not
>>> beautiful.
>>
>> sz is the result of struct_size() which returns a size_t, and SIZE_MAX
>> in case of an overflow.
> 
> Correct.
> 
>> However the check is *greater than* SIZE_MAX
>> which will never occur even on 32 bit systems.
> 
> You've missed a part.  We add ((u64)nr_cmds * sizeof(submit->cmd[0]))
> to SIZE_MAX.  If nr_cmds is zero then, whatever, the kzmalloc() will
> fail.  No big deal.  But if it's non-zero then "sz" is larger than
> SIZE_MAX and we allocate a smaller buffer than expected leading to
> memory corruption.

Ah, my bracket matching is obviously off today - somehow I hadn't
noticed that the second line wasn't part of the call to struct_size().

> Btw, it turns out that I had a hand in writing that check so hooray for
> me.  :)  #HoorayForMe

Indeed hooray for you! ;) Although it still all seems like a very
round-a-bout way of enforcing an arbitrary maximum on the size!

Thanks,

Steve
