Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F743A3130
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9D6EDAE;
	Thu, 10 Jun 2021 16:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EC56EDA9;
 Thu, 10 Jun 2021 16:44:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c9so3063653wrt.5;
 Thu, 10 Jun 2021 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7+oHmU4eRe/lusT8CbRatuJ3o4g6a4ul0yc5NKtcGOA=;
 b=sYtsN1qVTmpgxZ3nt/R00IffVRXPBQUB5nJs6+9QczXM7mZvO5njCQdUPPpi4qteJ/
 oz8za3uWis5KMoDaJ3Ymd3u/ABuE2eJkOlZ4Xm87OGstQFEJ0/FjEDQ5CZAe1XJTwC/j
 kE/tXvyUHgIEKtYbU8pB803B/9Okn+LKT28metmT4hedpzutuH0Xou657cMwq5TDg51e
 1ZVLhejCYRB69ntn5hmO4JGk+fX47AaMlMBT+TWrc0tx3QUJVRC3U5EYkC5iSgSrUDwy
 LemTxLMjfzNRqV2NZDRav8ozEvxcy8oRvhNQZfJIcLIPE6K5/uuoexrKRHeKNOhB8GlO
 vjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7+oHmU4eRe/lusT8CbRatuJ3o4g6a4ul0yc5NKtcGOA=;
 b=D412Zt8MkvntE/AOZKXV7xFY51E6Tcz/8taLVvmkK7iCU6JElvGehpaZcd0gSxrN3K
 1riLv63jwPkNCpBaZP5YsCUkgjz5B9WT9QmV4SMqqDbdbotO0hFfikDZdVPVYZ8oabiu
 FLqkb3o1MVqjBsS1Z418qR17MkB1o48YNBfg9sbYiSw5ODZQhukMAnWlS/gkT/qasp50
 2hshubzZ3k/bEnDisIvLAx6i0J+yTz06wvN/Q6UpNSxRddhkb15vI+7r4gCP3Pz423Iu
 kwclqt3fi0Rj5JOOuWDXevxqHdgjPRoyIeOUzV7iT8s8I3JpaLZ9QO8PfXAsRhqBlHpn
 J3YA==
X-Gm-Message-State: AOAM532/gut5/M+BYQX/t7XJ/H4sHANh/qQUI0+qoris9rT38wPreewZ
 +XCTfltuK+dctgBE0r1no4HZ34mvxjg=
X-Google-Smtp-Source: ABdhPJzddWvuZfx+is4l65I3v6uHI0MCZXRAu5+8XAO+yaH6kuWQyrSszEcPsRwlymwGlCyornJcPw==
X-Received: by 2002:adf:e943:: with SMTP id m3mr6439979wrn.384.1623343465373; 
 Thu, 10 Jun 2021 09:44:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e?
 ([2a02:908:1252:fb60:c285:5f9a:99f5:633e])
 by smtp.gmail.com with ESMTPSA id w23sm10018028wmi.0.2021.06.10.09.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 09:44:24 -0700 (PDT)
Subject: Re: Change how amdgpu stores fences in dma_resv objects
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <f3788c24-bb42-4913-6334-fb3549c21fb9@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03aaeb20-433c-db7d-1fa9-c954e913f943@gmail.com>
Date: Thu, 10 Jun 2021 18:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f3788c24-bb42-4913-6334-fb3549c21fb9@daenzer.net>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 18:34 schrieb Michel Dänzer:
> On 2021-06-10 11:17 a.m., Christian König wrote:
>> Since we can't find a consensus on hot to move forward with the dma_resv object I concentrated on changing the approach for amdgpu first.
>>
>> This new approach changes how the driver stores the command submission fence in the dma_resv object in DMA-buf exported BOs.
>>
>> For exported BOs we now store the CS fence in a dma_fence_chain container and assign that one to the exclusive fences slot.
>>
>> During synchronization this dma_fence_chain container is unpacked again and the containing fences handled individually.
>>
>> This has a little bit more overhead than the old approach, but it allows for waiting for the exclusive slot for writes again.
> Nice!
>
> This seems to work as expected with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880: Some buffers now don't poll readable at first, until the GPU is done processing them.

Well I'm still pretty sure that any polling on the CPU should be 
avoided, but yes it is nice to have that working now in general.

> Unfortunately, as expected, without a high priority context for the compositor which can preempt client drawing, this isn't enough to prevent slow clients from slowing down the compositor as well. But it should already help for fullscreen apps where the compositor can directly scan out the client buffers at least.

I have seen patches for this flying by internally, but not sure about 
the status.

Christian.
