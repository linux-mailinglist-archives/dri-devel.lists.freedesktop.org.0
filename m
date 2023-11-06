Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407A7E31B3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22ABB10E465;
	Mon,  6 Nov 2023 23:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F7F10E465
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:55:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 82551B81258;
 Mon,  6 Nov 2023 23:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEBDC433C7;
 Mon,  6 Nov 2023 23:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699314944;
 bh=CBVsDjLpDh3DqO53Z7jB5PodqXv0dqoRE1VTibicHDk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tHDu7NE3mpkr1DOFckfUWx88lr1g8NMqtWJ6eVQjt6YtxEJtB3MzRhMAqpHUCOOnu
 HERcGnFrYBktSD8DKkbyE8ek8H9VHw/wEzhcjIKOE9tdi5RIBdczye7+hnXGI4KJKu
 S0rpAERxYf/jKoXVcPPVq6PuYBkI20g7/zRTur41oqPVeJXe+V/38zMNofUypZYzSp
 O3mGYMyQzkQzdasVHQ+sN5vodbH7gZFWgfyYemzHaE/bdy2CusoZbtwSH6Pqk3dywZ
 jimVApXC5UDwmcNUMEwKAOS0k67+Rh55jzHYDZxhXJeV0Yn4t1vShofBTTCgeHKn43
 cIasqiU647M3A==
Message-ID: <93eb6a2b-a991-40ca-8f26-f520c986729a@kernel.org>
Date: Mon, 6 Nov 2023 16:55:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
Content-Language: en-US
To: Stanislav Fomichev <sdf@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
 <CAKH8qBueYgpxQTvTwngOs6RNjy9yvLF92s1p5nFrobw_UprNMQ@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAKH8qBueYgpxQTvTwngOs6RNjy9yvLF92s1p5nFrobw_UprNMQ@mail.gmail.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mina Almasry <almasrymina@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, linux-arch@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/23 4:32 PM, Stanislav Fomichev wrote:
>> The concise notification API returns tokens as a range for
>> compression, encoding as two 32-bit unsigned integers start + length.
>> It allows for even further batching by returning multiple such ranges
>> in a single call.
> 
> Tangential: should tokens be u64? Otherwise we can't have more than
> 4gb unacknowledged. Or that's a reasonable constraint?
> 

Was thinking the same and with bits reserved for a dmabuf id to allow
multiple dmabufs in a single rx queue (future extension, but build the
capability in now). e.g., something like a 37b offset (128GB dmabuf
size), 19b length (large GRO), 8b dmabuf id (lots of dmabufs to a queue).
