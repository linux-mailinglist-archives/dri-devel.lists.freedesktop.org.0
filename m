Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388675888E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E1B10E3C2;
	Tue, 18 Jul 2023 22:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6B10E3C2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:35:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27D3A6129A;
 Tue, 18 Jul 2023 22:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA35BC433C7;
 Tue, 18 Jul 2023 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689719719;
 bh=ODQozvnR8L9ZZhidmLsCxqJiGSeoc3vXIawk6TBMUFA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uq7+j/NOkFLavVsQ/USh6P3IpWSqxBDgXwQYcbV5CX8S7AB8zn2pWNxFlTbLtIMXQ
 DdjVmmRGkd0tbEukWEbDc3rHWuKnTfw8u+AgnTtKtScYI5G3o/p2xdL88Ey1qR2uei
 ak6CnY7JRbICwClHNZE+AtRSlN7IsfHuill1aC52pO7zXH5HhNt7+UG3AghWPMbalw
 Qe/JwxHOZtC2CIY5yFXp0L66uV4wfmbctY3O93+4j/Xl+CApRlllSvFtaw7TKjux9n
 eboU3TVfT4FBGDKvgh7P7vfQVFOAKYfjBLL/9bOwPmA10iQBRR32d0rVTCd9kwdEIQ
 yB3+v9Vio5DRw==
Message-ID: <eb34f812-a866-a1a3-9f9b-7d5054d17609@kernel.org>
Date: Tue, 18 Jul 2023 16:35:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
 <ZLbUpdNYvyvkD27P@ziepe.ca> <20230718111508.6f0b9a83@kernel.org>
 <35f3ec37-11fe-19c8-9d6f-ae5a789843cb@kernel.org>
 <20230718112940.2c126677@kernel.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20230718112940.2c126677@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Mina Almasry <almasrymina@google.com>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 linux-kselftest@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Andy Lutomirski <luto@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/23 12:29 PM, Jakub Kicinski wrote:
> On Tue, 18 Jul 2023 12:20:59 -0600 David Ahern wrote:
>> On 7/18/23 12:15 PM, Jakub Kicinski wrote:
>>> On Tue, 18 Jul 2023 15:06:29 -0300 Jason Gunthorpe wrote:  
>>>> netlink feels like a weird API choice for that, in particular it would
>>>> be really wrong to somehow bind the lifecycle of a netlink object to a
>>>> process.  
>>>
>>> Netlink is the right API, life cycle of objects can be easily tied to
>>> a netlink socket.  
>>
>> That is an untuitive connection -- memory references, h/w queues, flow
>> steering should be tied to the datapath socket, not a control plane socket.
> 
> There's one RSS context for may datapath sockets. Plus a lot of the
> APIs already exist, and it's more of a question of packaging them up 
> at the user space level. For things which do not have an API, however,
> netlink, please.

I do not see how 1 RSS context (or more specifically a h/w Rx queue) can
be used properly with memory from different processes (or dma-buf
references). When the process dies, that memory needs to be flushed from
the H/W queues. Queues with interlaced submissions make that more
complicated.

I guess the devil is in the details; I look forward to the evolution of
the patches.
