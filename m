Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AB812467
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 02:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F1010E8B8;
	Thu, 14 Dec 2023 01:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6DF10E8B8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 01:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 54339CE2041;
 Thu, 14 Dec 2023 01:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435CAC433C7;
 Thu, 14 Dec 2023 01:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702516677;
 bh=zsaG1Z/V6aX7d8f9bjRUYAcyyvlRqu+OVBtKr82ilo8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ASB0owDzSZAjwNqEaZNw5l/tG4f5H9NX+k9wIaQk8aZXmjNXWFA3xs3z4915D3ydm
 7Ny7vU+2Z7vaKSVVG1qq8axAQ/MCShUSGffVW9XOEwhE7c/wF53+YRFmoEGCRaSXJV
 xxx5jmq9TTDBawDFV+xQEVsShfQCo7hbn0fdbEXDcJggTLF+nKeQ0DUI/UxbZMIsOO
 5BjG5ifdnXPja4ZIyPRc+ST7CoXQVV+Yuqp2Ss/x8LSXqj0MPfatQDbKpgwNw8T3UN
 XTW5ymxEA+Otu6nrG7yjCGi17kV/e48xzniquq3SrjsO19LqX8qx2v133Y2t3Q722V
 y4VWpmNMV+zfA==
Date: Wed, 13 Dec 2023 17:17:55 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [net-next v1 05/16] net: netdev netlink api to bind dma-buf to
 a net device
Message-ID: <20231213171755.5965e1ec@kernel.org>
In-Reply-To: <20231208005250.2910004-6-almasrymina@google.com>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-6-almasrymina@google.com>
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
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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

On Thu,  7 Dec 2023 16:52:36 -0800 Mina Almasry wrote:
> +        name: type
> +        doc: rx or tx queue
> +        type: u8
> +        enum: queue-type

nit: the queue/napi GET was applied to net-next, would be good to stick
to the same types (s/u8/u32)
