Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6875739D932
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 11:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE93E6E3AA;
	Mon,  7 Jun 2021 09:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50F6E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 09:59:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so12229623wmd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KJIvsbNYtrpQv/O40cqmFzAFmK8mnqBQVVaBFghlFhg=;
 b=q8rs4EbcEbBYeynF3i/sB//0+APz/0UzxF4G9MewsBLGu21yQoCpYP39oEkCXUnybl
 WJzgixf8xmW74DplF7cpqYCpaVEHss6R2Tw1Wujj1mLMf+HHaLQGkPnRJyQTKcqMhaWN
 lcLxBwdQZiNm1/9Zswm2xqY98JtK0vIHkN3QtD1J4XI9MoN4hQa4pQ6cVFvOU8PqG0nE
 pKJ05zvaGNLhM9wtQ1Jl0hHmgwTgXFU36SmC+U5CWXR2YHZJV2Hbe1KzUHiFk4dNhzqH
 MW5djGoWuHDRjruWlHDKY8O4As1g5XvNOpRZqhZgzUGX4wSsztoPIOUp0kURjlvB+0Wy
 crXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KJIvsbNYtrpQv/O40cqmFzAFmK8mnqBQVVaBFghlFhg=;
 b=OWygZcgdvSWhO/8duEQqQmBrz4pSk6Je50hH7RvRcbMRdMw/7QX31Yxayl2uraJAB/
 Vwgb8TQYG2I2iqvqAzrjWxPjfdp0MLkZO3rD4j8JcmpZg4hmgNtEk6mr63LB93EAUVkJ
 CSoBs/x3hOhEtEexJjypKrLQFvXHIwO8jqHDlfvfkcSRMZM5ur5F/NSCwZ+ntTbg3L46
 GM/gu0rhJbprUdPQJDxIZf/BAAWcjLUAlN0Z4zRwmm7ZjY0gX2Xh1kPBO6y55MEEOBl2
 VKOZ8tvhgRgJQuBtvSOXxcMD5ZQ3wnxjL/7b6w+h2rluSJ0W5VFSrZNpa+MQrn+Hdre9
 gUHQ==
X-Gm-Message-State: AOAM532Vzr2oLtIJ9/RARScW4PKIvTXyMOGXJY1BoWnHyHccIqSz/jDI
 awfYSBkm1sHp7vD8A60k/qvGvNb7cJ0=
X-Google-Smtp-Source: ABdhPJzLHn4mpaPtZIG+SNIBIe4yoDbw8acoSbpcFxX/+gViwnUOq6iR82II+E+LkmgiHLUoZna2YA==
X-Received: by 2002:a1c:6004:: with SMTP id u4mr16051764wmb.110.1623059952513; 
 Mon, 07 Jun 2021 02:59:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id k11sm16711105wmj.1.2021.06.07.02.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 02:59:12 -0700 (PDT)
Subject: Re: handle exclusive fence similar to shared ones
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210606100312.119176-1-christian.koenig@amd.com>
 <CAKMK7uGX7z2KdymWus2fk9VR57wU+Rj4jcS0j=j_sYwaH8zrLg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3fdb2dbe-748b-5297-277f-6a8394100725@gmail.com>
Date: Mon, 7 Jun 2021 11:59:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGX7z2KdymWus2fk9VR57wU+Rj4jcS0j=j_sYwaH8zrLg@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.06.21 um 10:58 schrieb Daniel Vetter:
> Hi Christian,
>
> So unfortunately I got distracted with some i915 bugs and fun last
> week completely, so didn't get around to it.
>
> On Sun, Jun 6, 2021 at 12:03 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi Daniel,
>>
>> as discussed here are the patches which change the handle around exclusive fence handling.
>>
>> The main problem seems to have been the dma_resv_test_signaled() function which ignored the exclusive fence when shared fences where present. This was already rather inconsistent since dma_fence_wait_timeout() takes the exclusive one into account even if shared ones are present.
>>
>> The second patch then fixes nouveu to also always take the exclusive fence into account.
>>
>> The third then removes the workaround in amdgpu around the VM page table clearing handling. Since I'm not sure if there are no other places which relies on the existing behavior I will hold this one back for a while.
>>
>> Is that what you had in mind as well?
> I think from the semantics something where we treat the exclusive
> fence as an IPC mechanism that the kernel doesn't care much about
> (exceptions apply), and but more consistently count all access from
> any CS as a shared fence. So in a way what you've done here, and also
> what you've done in the earlier series with setting the read/write
> flags on shared fences.

Yeah, I think that this will work for me as well.

> For actual approach what I've picked is a bit of what amdgpu does +
> what other drivers do with NO_IMPLICIT, but with the bugs fixed
> (there's a bunch of them): Essentially we try to always set the shared
> fences, and exclusive fences are set additionally on top when the
> implicit sync IPC calls for that. And on the depdendency side we do
> clever logic to only take in the exclusive fence when required.
> Currently for amdgpu this means introspecting the fence owner (there's
> some nasty tricks there I think to do to make this work and not be a
> security bug), for others that's done with the NO_IMPLICIT flag (but
> again some nasty corners there, which I think a bunch of drivers get
> wrong).

For amdgpu I have been pondering on the following idea  last week to 
make it behave the same as the other drivers:

1. We allow setting the explicit fence without touching the shared fences.
     As far as I understand it this is also part of your idea above.

2. During command submission amdgpu uses a dma_fence_chain node to chain 
together the new CS with the existing explicit sync.

3. During command synchronization amdgpu takes a look at the explicit 
fence and walks the dma_fence_chain history.
     Submissions from the same process (the owner) are not synced to 
(e.g. same behavior as of today), but as soon as we see something which 
doesn't fit into the amdgpu CS model we sync to the remaining chain.

That would give us both keeping the current amdgpu CS behavior (which we 
then can extend) as well as setting the explicit fence according to the 
DMA-buf rules.

> There's two reasons I'm more leaning in that direction:
> - The annoying thing is that the audit on the dependency side is a lot
> trickier since everyone rolls their own dependency handling.

Yes, absolutely agree. That's why I said we need to have use case based 
functionality here.

In other words what we need is something like an 
dma_resv_for_each_sync_fence(for_write) macro.

E.g. drivers then only do something like:

dma_resv_for_each_sync_fence(resv, for_write, fence)
     driver_specific_syncing_to_fence(fence);

And not every driver calling the underlying functions on it's own and 
then doing whatever it pleases.

> If we don't change (for now at least) the rules around dma_resv then an
> oversight in the audit isn't going to be a huge problem.
> - Wording becomes inconsistent: An exclusive fence which is also a
> shared is a bit confusing. I think it's better if we stick to the
> current rules for dma_resv, change the semantics we want in drivers (I
> think that's doable, at maybe some code cost e.g. Jason's import ioctl
> would be simpler with your changed rules, but still doable with the
> current dma_resv rules). And then when we have that, we figure out
> what to change with the dma_resv struct/rules.

But then at least do the minimal change so that we can get amdgpu in 
line with all other drivers like I outlined above.

We can keep that as a hack in amdgpu if that makes you feel better. 
Chaining the exclusive fence together is roughly 4 times slower than the 
shared approach, but I think that this is negligible compared to all the 
other stuff we do.

Regards,
Christian.

> Wrt the patches: Good thing is that what you change here and what I've
> found thus far is 100% not overlapping, so at least we didn't waste
> time auditing the same code :-)
>
> Cheers, Daniel
>> Regards,
>> Christian.
>>
>>
>

