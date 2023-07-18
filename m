Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918E375838B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 19:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E3E10E3BB;
	Tue, 18 Jul 2023 17:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EC610E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 17:32:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90637616A3;
 Tue, 18 Jul 2023 17:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B41EC433C8;
 Tue, 18 Jul 2023 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689701556;
 bh=5sr+yjwLVU6f+lqMOfWoGq5NUJvs6qsaMrWv5HRb0zE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=idOxW7Wfi/M22qWhbX0ZuMGzGLMpVBG26F9PGqW02cBDx+a8kPduaXPCNyv2gJLAO
 YIOzIg2DhjzuNdLVitTUITjJC45H8l1WtTyq8YlyoDV2wLe9w+3JKxi6+JhB5+ZsKZ
 9wq43VR+kOlkL3WhN7OM8HWIv3hpicw2TuPpxSe7Nbwo9qllmCwRpgp+ILSXD1jsQ3
 LuBZYWJJMChc1JlbmkOyU1EVCZhj+II1qEFbMJMMf/l+EmZIulzA5dxUNwwo+q+91y
 93fOXY6mg7tjd6adh1mHOcqT/q72z1++d3bJbyeWA/p6lEm9COrpwzKTq+VKWBFhOg
 DU4JRoJhnIYPQ==
Date: Tue, 18 Jul 2023 10:32:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Message-ID: <20230718103234.711d7e4f@kernel.org>
In-Reply-To: <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 16 Jul 2023 19:41:28 -0700 Andy Lutomirski wrote:
> I'm wondering if a more capable if somewhat higher latency model could 
> work where the NIC stores received packets in its own device memory. 
> Then userspace (or the kernel or a driver or whatever) could initiate a 
> separate DMA from the NIC to the final target *after* reading the 
> headers.  Can the hardware support this?

No, no, that's impossible. SW response times are in 100s of usec (at
best) which at 200Gbps already means megabytes of data _per-queue_. 
Way more than the amount of buffer NICs will have.

The Rx application can bind to a IP addr + Port and then install
a one-sided-3-tuple (dst IP+proto+port) rule in the HW. Worst case
a full 5-tuple per flow.

Most NICs support OvS offloads with 100s of thousands of flows.
The steering should be bread and butter.

It does require splitting flows into separate data and control channels,
but it's the right trade-off - complexity should be on the SW side.
