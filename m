Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325E7E3665
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 09:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9CE10E4C1;
	Tue,  7 Nov 2023 08:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E09510E4BC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 08:01:46 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SPgf74yFYzvQS6;
 Tue,  7 Nov 2023 16:01:35 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 7 Nov
 2023 16:00:33 +0800
Subject: Re: [RFC PATCH v3 07/12] page-pool: device memory support
To: Mina Almasry <almasrymina@google.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-8-almasrymina@google.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <4a0e9d53-324d-e19b-2a30-ba86f9e5569e@huawei.com>
Date: Tue, 7 Nov 2023 16:00:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20231106024413.2801438-8-almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 07 Nov 2023 08:12:35 +0000
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
> Overload the LSB of struct page* to indicate that it's a page_pool_iov.
> 
> Refactor mm calls on struct page* into helpers, and add page_pool_iov
> handling on those helpers. Modify callers of these mm APIs with calls to
> these helpers instead.
> 
> In areas where struct page* is dereferenced, add a check for special
> handling of page_pool_iov.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
>  include/net/page_pool/helpers.h | 74 ++++++++++++++++++++++++++++++++-
>  net/core/page_pool.c            | 63 ++++++++++++++++++++--------
>  2 files changed, 118 insertions(+), 19 deletions(-)
> 
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index b93243c2a640..08f1a2cc70d2 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -151,6 +151,64 @@ static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
>  	return NULL;
>  }
>  
> +static inline int page_pool_page_ref_count(struct page *page)
> +{
> +	if (page_is_page_pool_iov(page))
> +		return page_pool_iov_refcount(page_to_page_pool_iov(page));

We have added a lot of 'if' for the devmem case, it would be better to
make it more generic so that we can have more unified metadata handling
for normal page and devmem. If we add another memory type here, do we
need another 'if' here?
That is part of the reason I suggested using a more unified metadata for
all the types of memory chunks used by page_pool.
