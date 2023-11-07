Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927257E3282
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 02:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081BE10E49D;
	Tue,  7 Nov 2023 01:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7210E49D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 01:09:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E93BBCE0E26;
 Tue,  7 Nov 2023 01:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147D2C433C8;
 Tue,  7 Nov 2023 01:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699319347;
 bh=71l20GkBOFUWOSbSR+FiTHlfmSsCI73pQkIYJSjwA1o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U4YbRkhjKovNT9nbOQUSJL0HgDh16yoV1zgSGNMyDkFbe/4JG87BU2EEup/QMpgwc
 kbRXf6SG9j3O3TNdKSYqN5dxD5+C+9ZXdxrUXd3X6cIg47/LbwJBtzrWnHEhJqhsXU
 PjGxXa40525TjLBDK9dUhHpj3nFHe+7u2ldDn6wikhJZ3G8WoygqNBBAQGvQr7b4ik
 /P0990SE8EkzyRrGHxTSlJPvIh60Lduh5XfLBwWNeDIqYHIJa6h7F7kVNeX005uRAK
 u7K7FyCdA2UQVa7D98G+Tj2nKc9lZw8Pom2TlxYgWcaNE61PZV60iOgukpBP82xD2Q
 ENZ1ONDIE1q4g==
Message-ID: <c9a08db6-7418-4684-a5bf-6e9ac0655795@kernel.org>
Date: Mon, 6 Nov 2023 18:09:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
 <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
 <CAHS8izNxKHhW5uCqmfau6n3c18=hE3RXzA+ng5LEGiKj12nGcg@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAHS8izNxKHhW5uCqmfau6n3c18=hE3RXzA+ng5LEGiKj12nGcg@mail.gmail.com>
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
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/23 5:20 PM, Mina Almasry wrote:
> The user is free to modify or delete flow steering rules outside of the
> lifetime of the socket. Technically it's possible for the user to
> reconfigure flow steering while the socket is simultaneously receiving,
> and the result will be packets switching from devmem to non-devmem.

generically, from one page pool to another (ie., devmem piece of that
statement is not relevant).
