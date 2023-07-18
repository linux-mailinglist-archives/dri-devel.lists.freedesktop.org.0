Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750D75848C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6BD10E3B7;
	Tue, 18 Jul 2023 18:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B72310E042
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:21:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4FF9616B4;
 Tue, 18 Jul 2023 18:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53795C433C8;
 Tue, 18 Jul 2023 18:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689704461;
 bh=3FpetCvZbbcCl2/n3R3+Fi+awrw/7SJjS0am3/4WDVM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pf57YBI319TjSa6UdgcJVOWOTlRAztiD3yo6PD8hehnt65sGwpA1/vT9ljpawxCW5
 fMeHtFOrE123MsPIWNyokLRCZR87Ro5QZoioK+wC06wGF0s00mvFuQQAKz6jQtdH0h
 mbq5e4/ZMJxcbt/7pdjAigRdAHIqMlD/cTA7hyNdzCCkfge9qJSS9TPfANUK/xfNq6
 fL8/Pj/ihkWO/XwAv7J9G983bpRqTTCpKg1dZZrOVg1xFl12oojb3McruJqzldJVb2
 mB5JfoqtrIkLnTjiPwjIfZYf8wvVAxq40FosgtpbIomeKTbQx3WE4Xfrbn/L9dgT/T
 cozltHy/MCSDg==
Message-ID: <35f3ec37-11fe-19c8-9d6f-ae5a789843cb@kernel.org>
Date: Tue, 18 Jul 2023 12:20:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
 <ZLbUpdNYvyvkD27P@ziepe.ca> <20230718111508.6f0b9a83@kernel.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20230718111508.6f0b9a83@kernel.org>
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
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Andy Lutomirski <luto@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/23 12:15 PM, Jakub Kicinski wrote:
> On Tue, 18 Jul 2023 15:06:29 -0300 Jason Gunthorpe wrote:
>> netlink feels like a weird API choice for that, in particular it would
>> be really wrong to somehow bind the lifecycle of a netlink object to a
>> process.
> 
> Netlink is the right API, life cycle of objects can be easily tied to
> a netlink socket.

That is an untuitive connection -- memory references, h/w queues, flow
steering should be tied to the datapath socket, not a control plane socket.
