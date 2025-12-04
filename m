Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867C0CA271C
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1655E10E098;
	Thu,  4 Dec 2025 06:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ANW0GNEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DEE10E098;
 Thu,  4 Dec 2025 06:05:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0DCB943BAB;
 Thu,  4 Dec 2025 06:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704ADC113D0;
 Thu,  4 Dec 2025 06:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764828324;
 bh=TpXXIkYEPpVTVHVJr+O1twTDJSV3XXf6h+Qq9iQ/lmg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ANW0GNEj11i4a6Ie3r7pRyD9O8Kys0m6A3l/sQiqrrmCNOznPZ3dh08TUw73jvkhp
 6b6hV+XCH4MWmqBUZqIyPGOq6HoD60Jab3Kqax2T/Wbv8noF3HvnWcsfxamhoK463G
 u6RYYtLDYRCxQ9AY5bYmNyvrMmcQfpDcaW6XdPVE7crtRaSpXKhSF9bc2AfTkFH/gu
 g5S8Eq5tZSIUFdiXpQwExdBdU+V9LY4euH3A2U6jEucTnl0g5sDS7LFtnx0l5wVc1v
 7iKZr/Kj2iK3fMgv5nnEF2pd3hsRFrCiYi+wRTTbwShVpEccXYopxg5d8mRPMy1ViW
 yJjlMIat7swpw==
Message-ID: <2bc690ca-fa57-46fa-949b-28b5441cd364@kernel.org>
Date: Thu, 4 Dec 2025 07:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.18 amdgpu build error
To: Shuah Khan <skhan@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, akpm@linux-foundation.org
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
 <1f31b86d-283c-4878-92d0-ab90aed0c58d@roeck-us.net>
 <5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/4/25 03:34, Shuah Khan wrote:
> On 12/3/25 18:06, Guenter Roeck wrote:
>> On 12/3/25 14:16, Shuah Khan wrote:
> 
>>>
>>> CONFIG_RANDSTRUCT is disabled and so are the GCC_PLUGINS in my config.
>>
>> I guess that would have been too easy...
>>
>>> I am also seeing issues with cloning kernel.org repos on my system after
>>> a recent update:
>>>
>>> remote: Enumerating objects: 11177736, done.
>>> remote: Counting objects: 100% (1231/1231), done.
>>> remote: Compressing objects: 100% (624/624), done.
>>> remote: Total 11177736 (delta 855), reused 781 (delta 606), pack-reused 11176505 (from 1)
>>> Receiving objects: 100% (11177736/11177736), 3.01 GiB | 7.10 MiB/s, done.
>>> Resolving deltas: 100% (9198323/9198323), done.
>>> fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
>>> fatal: fetch-pack: invalid index-pack output
>>>
>>
> 
> Linus, Andrew, and David,
> 
> Finally figured this out. I narrowed it to  to be the HAVE_GIGANTIC_FOLIOS
> support that went into Linux 6.18-rc6 in this commit:
> 
>   From 39231e8d6ba7f794b566fd91ebd88c0834a23b98 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
> Date: Fri, 14 Nov 2025 22:49:20 +0100
> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
> 

Unsuspected and confusing :(

Let me take a look at reply on the revert.

-- 
Cheers

David
