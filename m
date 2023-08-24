Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C337865DA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 05:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0739010E4D0;
	Thu, 24 Aug 2023 03:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387A310E4D0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 03:35:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DD13614E2;
 Thu, 24 Aug 2023 03:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5CEC433C8;
 Thu, 24 Aug 2023 03:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692848139;
 bh=sbR7aCuEj5eVbg6IJIuBs2lOlk3UoQ5wAtQPtb6P5QM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jdrlxtOciSK86Gccra7HgdQaq1QwQaIOy9bYBMypzD2OXPxtnudOXVnhXuK1985n8
 UAPnVephZah7ctxQWK0qv55AyqQNHsotbvD5W9/+CDoLhIXfMZsL3gaS9chfJLew7C
 uqbrT81BNoO1nfWEWunMj73EWmXxCYS2pTX/MaikwKnonlvDpbbCvrbeBpBqPoFqxj
 Qcf+p93aXmJfe1DjqP9nGzh0imagLIKRa2w5NWjsaq6CZ2okUFAkQdI6V6ZD4EESuH
 39OVMRQ7P0ZQzP7SQHJTwOVtquxT+/nKulB+/vQtftoNRKH/dTlF63SfdIZlS/qYFt
 aVM59Q8oQY+YA==
Message-ID: <84bd646f-0e83-63ff-7374-822ad328af0e@kernel.org>
Date: Wed, 23 Aug 2023 20:35:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Content-Language: en-US
To: David Wei <dw@davidwei.uk>, Mina Almasry <almasrymina@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
 <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
 <CAHS8izNZ1pJAFqa-3FPiUdMWEPE_md2vP1-6t-KPT6CPbO03+g@mail.gmail.com>
 <1693f35a-b01d-f67c-fb4e-7311c153df4a@davidwei.uk>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <1693f35a-b01d-f67c-fb4e-7311c153df4a@davidwei.uk>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/23 3:52 PM, David Wei wrote:
> I'm also preparing a submission for NetDev conf. I wonder if you and others at
> Google plan to present there as well? If so, then we may want to coordinate our
> submissions and talks (if accepted).

personally, I see them as related but separate topics. Mina's proposal
as infra that io_uring builds on. Both are interesting and needed
discussions.
