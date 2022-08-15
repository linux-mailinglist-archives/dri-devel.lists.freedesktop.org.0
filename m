Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E2593030
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 15:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80369C8375;
	Mon, 15 Aug 2022 13:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30929C8AED
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 13:45:55 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D73DD660162D;
 Mon, 15 Aug 2022 14:45:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660571153;
 bh=MHQ8bqcaMDMd5Xe0yYmPLHWWBvtCcXLazDKtenFSuis=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ESSdkDr6DN+ilYL1gLIBqcc7dwYNN8onJ85yoF+mbA75mVDyT8+cXkkW1D3LyOryz
 y9pDlF4if61ZYUiQciMYEXQkc1MCzJ+CeDfdM3ETn0iXn1s0cIFu6FbZwzckdqDS3N
 GJ5jjIWB2GzO5ZNjtoRLHD1YyHeNVOBoi2QxlDfQPEHXSS/DwxA16DIv0IbFQch4hq
 U+Dy0Uvgc/6p64Z4MDTrTqy/jMJYr1veUI6iDOS/qFjJnNndY3b2Vz6al2hZZSbU3S
 0YDtDwKqPjBsr6NfBYNm0uZ4iZgMt1hyZEQpB4NcFVFlAs39xFtgJNRh9GJR8gG7jB
 IncaE2gdiNrCw==
Message-ID: <6893d5e9-4b60-0efb-2a87-698b1bcda63e@collabora.com>
Date: Mon, 15 Aug 2022 16:45:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
 <2df57a30-2afb-23dc-c7f5-f61c113dd5b4@collabora.com>
 <57562db8-bacf-e82d-8417-ab6343c1d2fa@amd.com>
 <86a87de8-24a9-3c53-3ac7-612ca97e41df@collabora.com>
 <8f749cd0-9a04-7c72-6a4f-a42d501e1489@amd.com>
 <5340d876-62b8-8a64-aa6d-7736c2c8710f@collabora.com>
 <594f1013-b925-3c75-be61-2d649f5ca54e@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <594f1013-b925-3c75-be61-2d649f5ca54e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 16:06, Christian König wrote:
> Am 15.08.22 um 13:50 schrieb Dmitry Osipenko:
>> On 8/15/22 14:28, Christian König wrote:
>>>>>> Maybe it was discussed privately? In this case I will be happy to get
>>>>>> more info from you about the root of the problem so I could start to
>>>>>> look at how to fix it properly. It's not apparent where the
>>>>>> problem is
>>>>>> to a TTM newbie like me.
>>>>>>
>>>>> Well this is completely unfixable. See the whole purpose of TTM is to
>>>>> allow tracing where what is mapped of a buffer object.
>>>>>
>>>>> If you circumvent that and increase the page reference yourself than
>>>>> that whole functionality can't work correctly any more.
>>>> Are you suggesting that the problem is that TTM doesn't see the KVM
>>>> page
>>>> faults/mappings?
>>> Yes, and no. It's one of the issues, but there is more behind that (e.g.
>>> what happens when TTM switches from pages to local memory for backing a
>>> BO).
>> If KVM page fault could reach TTM, then it should be able to relocate
>> BO. I see now where is the problem, thanks. Although, I'm wondering
>> whether it already works somehow.. I'll try to play with the the AMDGPU
>> shrinker and see what will happen on guest mapping of a relocated BO.
> 
> Well the page fault already somehow reaches TTM, otherwise the pfn
> couldn't be filled in in the first place.
> 
> The issues is more that KVM should never ever grab a page reference to
> pages mapped with VM_IO or VM_PFNMAP.
> 
> Essentially we need to apply the same restriction as with
> get_user_pages() here.
> 
>>> Another question is why is KVM accessing the page structure in the first
>>> place? The VMA is mapped with VM_PFNMAP and VM_IO, KVM should never ever
>>> touch any of those pages.
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.19%2Fsource%2Fvirt%2Fkvm%2Fkvm_main.c%23L2549&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2f38c27f20f842fc582a08da7eb4580d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637961610314049167%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Pu5F1EF9UvDPdOQ7sjJ1WDRt5XpFZmAMXdkexnDpEmU%3D&amp;reserved=0
>>
> 
> Well that comment sounds like KVM is doing the right thing, so I'm
> wondering what exactly is going on here.

KVM actually doesn't hold the page reference, it takes the temporal
reference during page fault and then drops the reference once page is
mapped, IIUC. Is it still illegal for TTM? Or there is a possibility for
a race condition here?

-- 
Best regards,
Dmitry
