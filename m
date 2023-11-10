Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11637E864E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A2A10E012;
	Fri, 10 Nov 2023 23:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6996F10E012
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:16:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 786ADCE12C9;
 Fri, 10 Nov 2023 23:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BE0C433C7;
 Fri, 10 Nov 2023 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658174;
 bh=fIaDoeAJ5wEfd3OqiFmAviiP1M+nZrBz6caAN+IfwHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uKGnaQ8aeJx2XbhW1g+57sxckv/co5/lbVNdOgEwSz1N4reK/MBR/a2xSiC3RWOqB
 JUf8rwg+LznxWD/D05rUgWqp79yZ5J24OYnBeNQ80xF1NgW8XnRrZ49vpYgv0B5fhn
 YPwumFdi6/7Yx+B6iaK9vYj/3KWLgB4Yrui79+OAZxGfS6HTp6VojG8O1lUksc4NUE
 B+lBm+9udQDqEM5gJ2Kc4WhGDwrZ+sVjwJ3+Jdvi5wAnmHXha2L0ZRVfLgR5Mt6/F7
 NjlU/YhswwRu9H6tlY2W8scb81qY1j0UQ6J8URn3XvrJgCr2QAdIjXF11rw+yvn/B8
 E4z+bIfKpc6Ww==
Date: Fri, 10 Nov 2023 15:16:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
Message-ID: <20231110151612.3dcca11d@kernel.org>
In-Reply-To: <3a1b5412bee202affc6a7cc74cd939e182b9a18e.camel@redhat.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
 <3a1b5412bee202affc6a7cc74cd939e182b9a18e.camel@redhat.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, linux-media@vger.kernel.org,
 linux-arch@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Nov 2023 12:05:37 +0100 Paolo Abeni wrote:
> > I suppose we just disagree on the elegance of the API.
> 
> FWIW, I think sockopt +cmsg is the right API.

FWIW it's fine by me as well.
