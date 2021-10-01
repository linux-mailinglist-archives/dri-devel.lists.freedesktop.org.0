Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD9C41ECF0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2E6E58A;
	Fri,  1 Oct 2021 12:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4D6B6E58A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 12:09:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C22B3106F;
 Fri,  1 Oct 2021 05:09:51 -0700 (PDT)
Received: from [10.1.27.18] (e122027.cambridge.arm.com [10.1.27.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39DD13F70D;
 Fri,  1 Oct 2021 05:09:50 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Add PANFROST_BO_NO{READ,WRITE} flags
To: Alyssa Rosenzweig <alyssa@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org
References: <20210930184723.1482426-1-boris.brezillon@collabora.com>
 <YVYMWdQS/EMc23IF@maud> <20210930214030.19f63eac@collabora.com>
 <YVY2O48ckub2fc5W@maud>
From: Steven Price <steven.price@arm.com>
Message-ID: <5ec5c310-902f-ee13-2fe6-2a88b366eae7@arm.com>
Date: Fri, 1 Oct 2021 13:09:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVY2O48ckub2fc5W@maud>
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

On 30/09/2021 23:12, Alyssa Rosenzweig wrote:
>>>> +	/* Executable implies readable */
>>>> +	if ((args->flags & PANFROST_BO_NOREAD) &&
>>>> +	    !(args->flags & PANFROST_BO_NOEXEC))
>>>> +		return -EINVAL;  
>>>
>>> Generally, executable also implies not-writeable. Should we check that?
>>
>> We were allowing it until now, so doing that would break the backward
>> compat, unfortunately.
> 
> Not a problem if you only enforce this starting with the appropriate
> UABI version, but...
> 
>> Steve also mentioned that the DDK might use shaders modifying other
>> shaders here [1]
> 
> What? I believe it, but what?

*might* ;) I've not looked in detail and a quick look through the code
just now I can't actually find anything which does.

> For the case of pilot shaders, that shouldn't require self-modifying
> code. As I understand, the DDK binds the push uniform (FAU / RMU) buffer
> as global shader memory (SSBO) and uses regular STORE instructions on
> it. That requires writability on that BO but that should be fine.

Yeah it looks like you're correct here - I've never looked closely into
exactly how pilot shaders work. It would appear that the DDK checks (in
user space) for the GPU-executable + GPU-writable condition and moans.
So this obviously isn't used by the DDK as it stands.

For the actual patch:

Reviewed-by: Steven Price <steven.price@arm.com>

Although if you can figure out how to add the "private mapping" flag at
the same time we can avoid bumping the version number too many times.
And today I'm actually in the office so (perversely) I haven't got the
hardware to actually test it at the moment - I really need to get remote
access set up!

Thanks,

Steve
