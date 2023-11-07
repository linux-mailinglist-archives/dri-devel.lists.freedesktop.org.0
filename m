Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FE7E3663
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 09:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5290D10E4BF;
	Tue,  7 Nov 2023 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D352F10E4BC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 08:02:49 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SPgDb63d2z1P82L;
 Tue,  7 Nov 2023 15:42:55 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 7 Nov
 2023 15:46:04 +0800
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Mina Almasry <almasrymina@google.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <1fee982f-1e96-4ae8-ede0-7e57bf84c5f7@huawei.com>
Date: Tue, 7 Nov 2023 15:46:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20231106024413.2801438-5-almasrymina@google.com>
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/11/6 10:44, Mina Almasry wrote:
> +
> +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
> +{
> +	size_t size, avail;
> +
> +	gen_pool_for_each_chunk(binding->chunk_pool,
> +				netdev_devmem_free_chunk_owner, NULL);
> +
> +	size = gen_pool_size(binding->chunk_pool);
> +	avail = gen_pool_avail(binding->chunk_pool);
> +
> +	if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
> +		  size, avail))
> +		gen_pool_destroy(binding->chunk_pool);


Is there any other place calling the gen_pool_destroy() when the above
warning is triggered? Do we have a leaking for binding->chunk_pool?

> +
> +	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> +				 DMA_BIDIRECTIONAL);
> +	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	dma_buf_put(binding->dmabuf);
> +	kfree(binding);
> +}
> +

