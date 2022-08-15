Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CB592E80
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 13:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07253AEBD3;
	Mon, 15 Aug 2022 11:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0895AB9DD2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:50:25 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru
 [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F4AF6601DA5;
 Mon, 15 Aug 2022 12:50:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660564224;
 bh=E8nqT1c6+89KY4W9Oy2uPm+ut6tNvo9I/f1SbKKEwcI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V64QCit7+5r/d3HX1Qfm8ZX5xXKWNR1Upa7xN4BURysTKZ5LQO6zDzVB5EmjLbKr+
 ZZ2uxtjUqYpb/hG1bXXn1nN64kxrQKjNJJAsdLE0R5oRQmVBhXucZi6NtCirjwCmdh
 84fW4QvC599wgAYZfA8Ojfpbes6tC7tpG0m4cUZasCegbBuyECQ2gnRx/ByNn7r0+k
 qSuVBjTRTT6SUe4S7/pplCe11xB5ooy8dcxGELM3RI131PscdXJ+ewRA9Z1yAdCxL9
 U3Gl7UImm57hxrYbBL8GkRA18u/L7b9qIEiKrSjJsjDBli+lcJr7TDRIaKwTdEwrj5
 p1M9Z5zEoN9DA==
Message-ID: <5340d876-62b8-8a64-aa6d-7736c2c8710f@collabora.com>
Date: Mon, 15 Aug 2022 14:50:20 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <8f749cd0-9a04-7c72-6a4f-a42d501e1489@amd.com>
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

On 8/15/22 14:28, Christian König wrote:
>>>> Maybe it was discussed privately? In this case I will be happy to get
>>>> more info from you about the root of the problem so I could start to
>>>> look at how to fix it properly. It's not apparent where the problem is
>>>> to a TTM newbie like me.
>>>>
>>> Well this is completely unfixable. See the whole purpose of TTM is to
>>> allow tracing where what is mapped of a buffer object.
>>>
>>> If you circumvent that and increase the page reference yourself than
>>> that whole functionality can't work correctly any more.
>> Are you suggesting that the problem is that TTM doesn't see the KVM page
>> faults/mappings?
> 
> Yes, and no. It's one of the issues, but there is more behind that (e.g.
> what happens when TTM switches from pages to local memory for backing a
> BO).

If KVM page fault could reach TTM, then it should be able to relocate
BO. I see now where is the problem, thanks. Although, I'm wondering
whether it already works somehow.. I'll try to play with the the AMDGPU
shrinker and see what will happen on guest mapping of a relocated BO.

> Another question is why is KVM accessing the page structure in the first
> place? The VMA is mapped with VM_PFNMAP and VM_IO, KVM should never ever
> touch any of those pages.

https://elixir.bootlin.com/linux/v5.19/source/virt/kvm/kvm_main.c#L2549

-- 
Best regards,
Dmitry
