Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509617E885F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 03:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D7A10E121;
	Sat, 11 Nov 2023 02:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B812310E121
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EAB0AB82448;
 Sat, 11 Nov 2023 02:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F08C433C7;
 Sat, 11 Nov 2023 02:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699670158;
 bh=gY+gv6FuH7IyPZd+GcBbaxMFJ8nyFzbRgSyvPpB8WHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ht9uExB8i5dnk2CmKBU1mVcjqsdrsD2ZgLZevr8N30eX0ZSAYboFGGKykaf+sSld7
 CGIVo25CwHPZiytr+teiiIPuigIDo+JPIkQyvN5n3iPDUMIc9jsF0NZEo7e+fDs8hI
 ztRuR71feWJhW6c3gOy9FbB8al83VwWsa2jI6RDs8vnryE62nP6YASRYhTa1kayr6w
 Da1EO6WGh1FXrOMerj2O/J/S46xnJ+wZhJFsdyYR1y51fhNB5Bz4l+uQ9vxyzm9yki
 rXMDshUoip7ZzimtjecJgZVPpXDWmdS8vodHd4gqw3Sf3ZLjfhV8IAAtpr5Xj5Edg8
 N5/Cmof6uQUjA==
Date: Fri, 10 Nov 2023 18:35:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 12/12] selftests: add ncdevmem, netcat for devmem
 TCP
Message-ID: <20231110183556.2b7b7502@kernel.org>
In-Reply-To: <CAHS8izNFnE8RGgBhKzxhVoKXtXgZGVQCLSdm4_dWNeH9Gx-WDQ@mail.gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-13-almasrymina@google.com>
 <20231110151335.38a1c6ec@kernel.org>
 <CAHS8izNFnE8RGgBhKzxhVoKXtXgZGVQCLSdm4_dWNeH9Gx-WDQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Nov 2023 18:27:08 -0800 Mina Almasry wrote:
> Thanks for the clear requirement. I clearly had something different in mind.
> 
> Might be dumb suggestions, but instead of creating a new ndo that we
> maybe end up wanting to deprecate once the queue API is ready, how
> about we use either of those existing APIs?
> 
> +void netdev_reset(struct net_device *dev)
> +{
> +       int flags = ETH_RESET_ALL;
> +       int err;
> +
> +#if 1
> +       __dev_close(dev);
> +       err = __dev_open(dev, NULL);
> +#else
> +       err = dev->ethtool_ops->reset(dev, &flags);
> +#endif
> +}
> +
> 
> I've tested both of these to work with GVE on both bind via the
> netlink API and unbind via the netlink socket close, but I'm not
> enough of an expert to tell if there is some bad side effect that can
> happen or something.

We generally don't accept drivers doing device reconfiguration with
full close() + open() because if the open() fails your machine 
may be cut off.

There are drivers which do it, but they are either old... or weren't
reviewed hard enough.

The driver should allocate memory and whether else it can without
stopping the queues first. Once it has all those, stop the queues,
reconfigure with already allocated resources, start queues, free old.

Even without the queue API in place, good drivers do full device
reconfig this way. Hence my mind goes towards a new (temporary?)
ndo. It will be replaced by the queue API, but whoever implements
it for now has to follow this careful reconfig strategy...
