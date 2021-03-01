Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3123279B5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF706E50D;
	Mon,  1 Mar 2021 08:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2484C6E512
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1FF953F5CD;
 Mon,  1 Mar 2021 09:46:50 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="ehRdhFYs";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnE42f3fwIXm; Mon,  1 Mar 2021 09:46:49 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 809AA3F57B;
 Mon,  1 Mar 2021 09:46:47 +0100 (CET)
Received: from [10.249.254.148] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EA2053600BA;
 Mon,  1 Mar 2021 09:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614588406; bh=Z6xFn7O2EELK204PM9aKLbatlVdp+N1U6O2xIgFWJOs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ehRdhFYs/y93AM9zHvkbYyvv7PfAX3VH/rm6CrWV19WK3I414x8Ur+Ruwwe2/7uNK
 oAi8Ra9a57MzoeFuE5DjCYySyvXMCc0oNBIRKDEIOQ3Nt0g3vNt4x5c4C+7GmsOETC
 YI5CMj5Usa+hKqLxs+rffQFbjjI9pq2DiKm8QijM=
Subject: Re: [PATCH 17/35] drm/amdkfd: register HMM device private zone
To: Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>, 
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-18-Felix.Kuehling@amd.com>
 <CAKMK7uEd9KZAmeNd9Z9GF9p0yUButHc+8_PERRuNR79+uqAhbQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <7f837938-3ad8-6ecf-d2b7-952b177cffb8@shipmail.org>
Date: Mon, 1 Mar 2021 09:46:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEd9KZAmeNd9Z9GF9p0yUButHc+8_PERRuNR79+uqAhbQ@mail.gmail.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/1/21 9:32 AM, Daniel Vetter wrote:
> On Wed, Jan 06, 2021 at 10:01:09PM -0500, Felix Kuehling wrote:
>> From: Philip Yang <Philip.Yang@amd.com>
>>
>> Register vram memory as MEMORY_DEVICE_PRIVATE type resource, to
>> allocate vram backing pages for page migration.
>>
>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> So maybe I'm getting this all wrong, but I think that the current ttm
> fault code relies on devmap pte entries (especially for hugepte entries)
> to stop get_user_pages. But this only works if the pte happens to not
> point at a range with devmap pages.

I don't think that's in TTM yet, but the proposed fix, yes (see email I 
just sent in another thread),
but only for huge ptes.

>
> This patch here changes that, and so probably breaks this devmap pte hack
> ttm is using?
>
> If I'm not wrong here then I think we need to first fix up the ttm code to
> not use the devmap hack anymore, before a ttm based driver can register a
> dev_pagemap. Also adding Thomas since that just came up in another
> discussion.

It doesn't break the ttm devmap hack per se, but it indeed allows gup to 
the range registered, but here's where my lack of understanding why we 
can't allow gup-ing TTM ptes if there indeed is a backing struct-page? 
Because registering MEMORY_DEVICE_PRIVATE implies that, right?

/Thomas

> -Daniel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
