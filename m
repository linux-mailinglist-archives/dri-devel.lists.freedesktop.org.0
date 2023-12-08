Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043EF80AB75
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 18:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DB510EA06;
	Fri,  8 Dec 2023 17:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CBE10E12D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 17:57:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D048FCE0DAF;
 Fri,  8 Dec 2023 17:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D37FC433C8;
 Fri,  8 Dec 2023 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702058269;
 bh=MZC8OXd/xhYpQFY9QXSMpIHOKQcKILf1nuFEeLx1Z1k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IrhW+No2LIvscdmhlUWqrjJiqbzeddYeZMlOvgrxLv9Pp/gv65XNGK+d/kQvyt9F8
 eWeHCO3AAqSqLgKmc7Ik62hbdVifPyu/Z9BpeaTSYwEumWm4CM5RdsEVq3wTqAc8Yt
 0Mtxfy6ckCdT2CkRx53DyJYDR5tIlMzrGiRqLFkqVd6vRp5p0uaNNgnc/icx60AhME
 T4jAdjX/YdISDa0zROBRF880qcvvvYg4KCcH3HTEvBilmN+djnGudGA6yjwLQu61zC
 QQA9Js/3CQoJWElJJO/mXVHwonG1Z2FbVz8Cwm/aqWQC4pxhlM1WCn1Hu4n/x0J3l+
 Hql17ZKbnZbkA==
Message-ID: <3fea9ae9-e9e6-4ba5-812b-2775a6ed9e6a@kernel.org>
Date: Fri, 8 Dec 2023 10:57:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 00/16] Device Memory TCP
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231208005250.2910004-1-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
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
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/23 5:52 PM, Mina Almasry wrote:
> Major changes in v1:
> --------------
> 
> 1. Implemented MVP queue API ndos to remove the userspace-visible
>    driver reset.
> 
> 2. Fixed issues in the napi_pp_put_page() devmem frag unref path.
> 
> 3. Removed RFC tag.
> 
> Many smaller addressed comments across all the patches (patches have
> individual change log).
> 
> Full tree including the rest of the GVE driver changes:
> https://github.com/mina/linux/commits/tcpdevmem-v1
> 

Still a lot of DEVMEM references (e.g., socket API). Any reason not to
move those to DMABUF?

