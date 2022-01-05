Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECC6484F04
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 09:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3510710EBDB;
	Wed,  5 Jan 2022 08:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827710EBD9;
 Wed,  5 Jan 2022 08:09:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l4so24885955wmq.3;
 Wed, 05 Jan 2022 00:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0xpEoBRMOies06/2RL3K9uvLjMXLLaZ6V4LrR1h1mrc=;
 b=o3bMr/S+y1QXLAMSBXCtWliHbqw7JI3kCHxE5aGhT+m24vAs2wL2KkxGod9fZl++39
 Hct9ZhrQfYW+mjw7nxRdC72ORBNvZnz0US4lbVc/+5CBgF6VU4lVt2rPXoYeoRYKtdGE
 yeAFWLZnq5FaFzZkamuxG6yAZ1eQbSpueAzKhWZjM19tm4a3G+iD9tX4StuClOxbFHQD
 ml0yVEUcYgdZCdS6EbXWQlfwioLofarCSJ2f1V+dsOghzH7IFZKPa5Vx5WpDVU9hQbWX
 gALYi/Qb80sqa9j3eVf9xCYoNxNzUbdLmeommcRT/gVvpaW8CTPRcxVu8oszzP0kk8o3
 x0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0xpEoBRMOies06/2RL3K9uvLjMXLLaZ6V4LrR1h1mrc=;
 b=6LYOlPB5J90zAbqsyC2q/rPEM7xqb0bFoAmGRfzLaV78AGT7rYEKzxhVz3/Ck0Hs4v
 D5Guy53ULjTnDiSSfo8WitTsz+LVaaJNwmM3AK8x9k70LxWNkjVtFjzo7cGa5oqe8xtw
 vEn/UjKjDi9YWRymBRhviI9lLsfIBWsGuKbvK3N2+asF+CV5nn3MSH4AFz9u0zq7VHCZ
 NPU7zrwg/8LeVHXGnC6HuRqw9qGWWHFX7mHDY6AFM7yER9or/lwV5INO2c3GxGOeFdSM
 tFYUXl0eXV0/H5vvbLlojDvvi78IMnf6Gw7GuU5V7AKUuQ/hAjvM5OTGkdWwx8GJ20MR
 0qYg==
X-Gm-Message-State: AOAM530vuwWIN1SRzHUbzLEzTnnGCkIMJkWpC4dsxp975FymASli8D0i
 obuUByoNGxrgv1njH7/FJGA=
X-Google-Smtp-Source: ABdhPJy2W3UfPiRx2S5cpLvSxjk6VYuoFz2xu92LDJQN1M7oqfD0wHZoNgXEWG5aIjRSp+gZ6jFTIg==
X-Received: by 2002:a1c:3b86:: with SMTP id i128mr1797471wma.50.1641370139237; 
 Wed, 05 Jan 2022 00:08:59 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:9ec1:88f9:78a5:dade?
 ([2a02:908:1252:fb60:9ec1:88f9:78a5:dade])
 by smtp.gmail.com with ESMTPSA id e1sm41450430wrc.74.2022.01.05.00.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 00:08:58 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Adrian Reber <adrian@lisas.de>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
 <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
Date: Wed, 5 Jan 2022 09:08:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.01.22 um 19:08 schrieb Felix Kuehling:
> [+Adrian]
>
> Am 2021-12-23 um 2:05 a.m. schrieb Christian König:
>
>> Am 22.12.21 um 21:53 schrieb Daniel Vetter:
>>> On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
>>>
>>> [SNIP]
>>> Still sounds funky. I think minimally we should have an ack from CRIU
>>> developers that this is officially the right way to solve this
>>> problem. I
>>> really don't want to have random one-off hacks that don't work across
>>> the
>>> board, for a problem where we (drm subsystem) really shouldn't be the
>>> only
>>> one with this problem. Where "this problem" means that the mmap space is
>>> per file description, and not per underlying inode or real device or
>>> whatever. That part sounds like a CRIU problem, and I expect CRIU folks
>>> want a consistent solution across the board for this. Hence please
>>> grab an
>>> ack from them.
>> Unfortunately it's a KFD design problem. AMD used a single device
>> node, then mmaped different objects from the same offset to different
>> processes and expected it to work the rest of the fs subsystem without
>> churn.
> This may be true for mmaps in the KFD device, but not for mmaps in the
> DRM render nodes.

Correct, yes.

>> So yes, this is indeed because the mmap space is per file descriptor
>> for the use case here.
> No. This is a different problem.

I was already wondering which mmaps through the KFD node we have left 
which cause problems here.

> The problem has to do with the way that DRM manages mmap permissions. In
> order to be able to mmap an offset in the render node, there needs to be
> a BO that was created in the same render node. If you fork a process, it
> inherits the VMA.

Yeah, so far it works like designed.

> But KFD doesn't know anything about the inherited BOs
> from the parent process.

Ok, why that? When the KFD is reinitializing it's context why shouldn't 
it cleanup those VMAs?

> Therefore those BOs don't get checkpointed and
> restored in the child process. When the CRIU checkpoint is restored, our
> CRIU plugin never creates a BO corresponding to the VMA in the child
> process' render node FD. We've also lost the relationship between the
> parent and child-process' render node FDs. After "fork" the render node
> FD points to the same struct file in parent and child. After restoring
> the CRIU checkpoint, they are separate struct files, created by separate
> "open" system calls. Therefore the mmap call that restores the VMA fails
> in the child process.
>
> At least for KFD, there is no point inheriting BOs from a child process,
> because the GPU has no way of accessing the BOs in the child process.
> The child process has no GPU address space, no user mode queues, no way
> to do anything with the GPU before it completely reinitializes its KFD
> context.
>
> We can workaround this issue in user mode with madvise(...,
> MADV_DONTFORK). In fact we've already done this for some BOs to avoid a
> memory leak in the parent process while a child process exists. But it's
> slightly racy because there is a short time window where VMA exists
> without the VM_DONTCOPY flag. A fork during that time window could still
> create a child process with an inherited VMA.
>
> Therefore a safer solution is to set the vm_flags in the VMA in the
> driver when the VMA is first created.

Thanks for the full explanation, it makes much more sense now.

Regards,
Christian.

>
> Regards,
>    Felix
>
>
>> And thanks for pointing this out, this indeed makes the whole change
>> extremely questionable.
>>
>> Regards,
>> Christian.
>>
>>> Cheers, Daniel
>>>

