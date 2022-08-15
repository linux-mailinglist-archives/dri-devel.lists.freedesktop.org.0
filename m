Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343F592B64
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D73A98F6;
	Mon, 15 Aug 2022 10:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEFF8E7E3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:18:14 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8DF3B66016A1;
 Mon, 15 Aug 2022 11:18:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660558693;
 bh=bt6zHiqFOssYaXdPmgRbYknys43UYciOnxf9yqFEAiI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hgAo6geyIhflayb4fSNhoE0iCQz9PLhgoSSF3k70UyLRnrFgpztGxMJg5NTLlbrHn
 Boy7/1AsUR7rYYjFtOzLYzOV0aaHSviLrmzom9aJdFWAtTnLlEH2YpbL4cKtSXt5dl
 e5IgECy+yDiKVh5hx4Rct6WzBM78FtN1fTxgnm48704p8dhndVSPuzKi89qJ5/PyjR
 /33/QfZmcYn0KcI7HU9fVdZKdQChWY++Jn2YlT7UkydJatUawuEud1tdsAPQcEHwB8
 KaR4zimR74GNPao0P+Y/5iMGrQO7UCmhRPCO89DBM92q7hvRscTboHWQHSKTH6wkxm
 r9kAFPouLjDVA==
Message-ID: <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
Date: Mon, 15 Aug 2022 13:18:10 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
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

On 8/15/22 13:14, Christian König wrote:
> Am 15.08.22 um 12:11 schrieb Christian König:
>> Am 15.08.22 um 12:09 schrieb Dmitry Osipenko:
>>> On 8/15/22 13:05, Christian König wrote:
>>>> Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
>>>>> Higher order pages allocated using alloc_pages() aren't refcounted and
>>>>> they
>>>>> need to be refcounted, otherwise it's impossible to map them by
>>>>> KVM. This
>>>>> patch sets the refcount of the tail pages and fixes the KVM memory
>>>>> mapping
>>>>> faults.
>>>>>
>>>>> Without this change guest virgl driver can't map host buffers into
>>>>> guest
>>>>> and can't provide OpenGL 4.5 profile support to the guest. The host
>>>>> mappings are also needed for enabling the Venus driver using host GPU
>>>>> drivers that are utilizing TTM.
>>>>>
>>>>> Based on a patch proposed by Trigger Huang.
>>>> Well I can't count how often I have repeated this: This is an
>>>> absolutely
>>>> clear NAK!
>>>>
>>>> TTM pages are not reference counted in the first place and because of
>>>> this giving them to virgl is illegal.
>>> A? The first page is refcounted when allocated, the tail pages are not.
>>
>> No they aren't. The first page is just by coincident initialized with
>> a refcount of 1. This refcount is completely ignored and not used at all.
>>
>> Incrementing the reference count and by this mapping the page into
>> some other address space is illegal and corrupts the internal state
>> tracking of TTM.
> 
> See this comment in the source code as well:
> 
>         /* Don't set the __GFP_COMP flag for higher order allocations.
>          * Mapping pages directly into an userspace process and calling
>          * put_page() on a TTM allocated page is illegal.
>          */
> 
> I have absolutely no idea how somebody had the idea he could do this.

I saw this comment, but it doesn't make sense because it doesn't explain
why it's illegal. Hence it looks like a bogus comment since the
refcouting certainly works, at least to a some degree because I haven't
noticed any problems in practice, maybe by luck :)

I'll try to dig out the older discussions, thank you for the quick reply!

-- 
Best regards,
Dmitry
