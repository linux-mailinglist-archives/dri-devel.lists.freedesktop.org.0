Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF337E4DBD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 01:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4D710E6CD;
	Wed,  8 Nov 2023 00:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2AC10E6CD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 00:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A77160FDF;
 Wed,  8 Nov 2023 00:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBF6C433C7;
 Wed,  8 Nov 2023 00:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699402210;
 bh=49/18eui175XW6NzFUiZghmKR051RlPOSAcbSznIRN0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ICoTurgjXoU7vBaB5nU3XnpCuGXUGM/Lg+7nx9Zg5c9Vx2xHyr8NmLns0KLqXONdI
 R8LCfCS/mHRDjwxTSoVe+sj1cDEttA8Y0JuKSpm6lLw1n/qSIvaHCleQRX+/QjqfLB
 9Bnfw+85Cc/QjVXk/VLdQ1jhn6eKkRkQigB0ZLL0MOdSoiV/erOA1zHYVxiYbjmu34
 FBxFuBnpvV+HFTIqWMpFB8XBpikQNZwbiRDQ+p87uOEkTycDU3xckJomKwbrGlJPDI
 Tua1FNCNa4KtRmoEEFxhCTAEpwuhMRfvnw4geJfz4mItNfTxdevbQPqdoQT+SaaD4C
 6UXbF+jG51x8A==
Message-ID: <674f6ae2-d88e-4203-83f9-e9a9322393d9@kernel.org>
Date: Tue, 7 Nov 2023 17:10:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 06/12] memory-provider: dmabuf devmem memory
 provider
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-7-almasrymina@google.com>
 <583db67b-96c6-4e17-bea0-b5a14799db4a@kernel.org>
 <CAHS8izME7NixQrrh+qKnMR4+FyTzKW=B2pYyNffJ+igiehe-7g@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAHS8izME7NixQrrh+qKnMR4+FyTzKW=B2pYyNffJ+igiehe-7g@mail.gmail.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 5:02 PM, Mina Almasry wrote:
> On Mon, Nov 6, 2023 at 1:02 PM Stanislav Fomichev <sdf@google.com> wrote:
>>
>> On 11/05, Mina Almasry wrote:
>>> +static inline bool page_is_page_pool_iov(const struct page *page)
>>> +{
>>> +     return (unsigned long)page & PP_DEVMEM;
>>> +}
>>
>> Speaking of bpf: one thing that might be problematic with this PP_DEVMEM
>> bit is that it will make debugging with bpftrace a bit (more)
>> complicated. If somebody were trying to get to that page_pool_iov from
>> the frags, they will have to do the equivalent of page_is_page_pool_iov,
>> but probably not a big deal? (thinking out loud)
> 
> Good point, but that doesn't only apply to bpf I think. I'm guessing
> even debugger drgn access to the bv_page in the frag will have trouble
> if it's actually accessing an iov with LSB set.
> 
> But this is not specific to this use for LSB pointer trick. I think
> all code that currently uses LSB pointer trick will have similar
> troubles. In this context my humble vote is that we get such big
> upside from reducing code churn that it's reasonable to tolerate such
> side effects.

+1

> 
> I could alleviate some of the issues by teaching drgn to do the right
> thing for devmem/iovs... time permitting.
> 
Tools like drgn and crash have to know when the LSB trick is used  -
e.g., dst_entry - and handle it when dereferencing pointers.
