Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464527E3A59
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 11:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B0010E511;
	Tue,  7 Nov 2023 10:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E606710E4D4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:00:42 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SPhtd20XRzrTwF;
 Tue,  7 Nov 2023 16:57:29 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 7 Nov
 2023 17:00:07 +0800
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
To: Mina Almasry <almasrymina@google.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <7e851882-9a85-3672-c3d5-73b47599873c@huawei.com>
Date: Tue, 7 Nov 2023 17:00:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20231106024413.2801438-9-almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 07 Nov 2023 10:55:18 +0000
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/11/6 10:44, Mina Almasry wrote:
> Make skb_frag_page() fail in the case where the frag is not backed
> by a page, and fix its relevent callers to handle this case.
> 
> Correctly handle skb_frag refcounting in the page_pool_iovs case.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 

...

>  /**
>   * skb_frag_page - retrieve the page referred to by a paged fragment
>   * @frag: the paged fragment
>   *
> - * Returns the &struct page associated with @frag.
> + * Returns the &struct page associated with @frag. Returns NULL if this frag
> + * has no associated page.
>   */
>  static inline struct page *skb_frag_page(const skb_frag_t *frag)
>  {
> -	return frag->bv_page;
> +	if (!page_is_page_pool_iov(frag->bv_page))
> +		return frag->bv_page;
> +
> +	return NULL;

It seems most of callers don't expect NULL returning for skb_frag_page(),
and this patch only changes a few relevant callers to handle the NULL case.

It may make more sense to add a new helper to do the above checking, and
add a warning in skb_frag_page() to catch any missing NULL checking for
skb_frag_page() caller, something like below?

 static inline struct page *skb_frag_page(const skb_frag_t *frag)
 {
-       return frag->bv_page;
+       struct page *page = frag->bv_page;
+
+       BUG_ON(page_is_page_pool_iov(page));
+
+       return page;
+}
+
+static inline struct page *skb_frag_readable_page(const skb_frag_t *frag)
+{
+       struct page *page = frag->bv_page;
+
+       if (!page_is_page_pool_iov(page))
+               return page;
+
+       return NULL;
 }


