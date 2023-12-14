Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB596812459
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 02:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3033910E171;
	Thu, 14 Dec 2023 01:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975F010E171
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 01:15:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BE902B82022;
 Thu, 14 Dec 2023 01:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BC1C433C7;
 Thu, 14 Dec 2023 01:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702516540;
 bh=t0rU34tq8DhzkLBkFxn7ambC0hASa1O0GjSgzQkryC8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ot/Mr1P8szCrNFm0hJ5f4gZjqkAYiPwfrzCNxDCw9eE3Tj8W7JjdlpUDBDsgugHu/
 byFf0jmPC0QT6DYooDZBa7TFhilvS5PqbAxbeveAlzb6IskUdxsdU0qbnALISkxT3E
 8LaENIaxborpvBH4Xq6FmVOJ2TqiIIiXx2b45387wfpu6oDF+1d0YaVbkAQ4V9YnY8
 JbXgZWzOAf/iAWSoUZw7b6BOBgUV1h4M7EHkiteQthq74DtjeXUr9DjH5DA8Kd8vgN
 3hk5WYLKXg9U3ZPPHHf8m2W4H1ZGik9cIDED+aV//wHrF2u7hBFmTsUASIc9VgVjBj
 l540ij+i/09FA==
Date: Wed, 13 Dec 2023 17:15:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [net-next v1 03/16] queue_api: define queue api
Message-ID: <20231213171538.04847459@kernel.org>
In-Reply-To: <20231208005250.2910004-4-almasrymina@google.com>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-4-almasrymina@google.com>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Shailend Chand <shailend@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  7 Dec 2023 16:52:34 -0800 Mina Almasry wrote:
> This API enables the net stack to reset the queues used for devmem.

Nice, thanks for moving this forward. FWIW when I started hacking on it
the API looked more like:
https://github.com/kuba-moo/linux/commit/7af8abfa4fdff248e21fc76aecc334004a0f322f
which passes the config objects to the queue callbacks as an argument.
Storing in struct netdev_rx_queue makes implementing prepare / swap
harder. But that's just FYI, we can refactor later. The queue config
rabbit hole is pretty deep.
