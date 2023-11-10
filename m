Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D87E868B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5911610E2C7;
	Fri, 10 Nov 2023 23:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4A10E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:19:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AEF3DCE16DE;
 Fri, 10 Nov 2023 23:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA104C433C8;
 Fri, 10 Nov 2023 23:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658395;
 bh=WhEv7XhK+t86jf2iy5v/8j4Xu6HVlv6Bu7i7eHf+DcQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lBPJ+8HOTH+QZNkBBNnj3QzSJF+Y0eeL633p3vyJ/AvYHNIDs0ZyxBh1HUUxvu9ww
 Kdu7kCnZfMUZoATzyYeJ8lNCkvs07MFihtPxdJEhv45ubQ6Sg12r35L3sD7WJFaVC5
 FnCdIKAN5XL16RbE2J6mU4B3ESUlTgRMADYoBsRUdmUdqK1cbk5xhmoYrtZkOB5Vmx
 urqguJR3yAIfYDyKO0uuN4NC0w4Ec54bVQQya+ceeb9+iRPVuWbuxKTtVtNOrDCW1M
 gMq1zXrVv6VEbQv/zkG0wJQD4dnri/rEc5t6BPhuLd5CyaLW/Q9gizTFwrQT37mB4S
 FGagW5ESHEB4Q==
Date: Fri, 10 Nov 2023 15:19:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
Message-ID: <20231110151953.75c03297@kernel.org>
In-Reply-To: <20231106024413.2801438-5-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun,  5 Nov 2023 18:44:03 -0800 Mina Almasry wrote:
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -52,6 +52,8 @@
>  #include <net/net_trackers.h>
>  #include <net/net_debug.h>
>  #include <net/dropreason-core.h>
> +#include <linux/xarray.h>
> +#include <linux/refcount.h>
> =20
>  struct netpoll_info;
>  struct device;
> @@ -808,6 +810,84 @@ bool rps_may_expire_flow(struct net_device *dev, u16=
 rxq_index, u32 flow_id,
>  #endif
>  #endif /* CONFIG_RPS */
> =20
> +struct netdev_dmabuf_binding {

Similar nitpick to the skbuff.h comment. Take this somewhere else,
please, it doesn't need to be included in netdevice.h

> +	struct netdev_dmabuf_binding *rbinding;

the 'r' in rbinding stands for rx? =F0=9F=A4=94=EF=B8=8F


