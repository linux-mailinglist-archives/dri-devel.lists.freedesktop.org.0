Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39BA88A22
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 19:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57CD10E093;
	Mon, 14 Apr 2025 17:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Bm1lAKfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2104 seconds by postgrey-1.36 at gabe;
 Mon, 14 Apr 2025 17:44:00 UTC
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633910E093
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 17:44:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EHhkq02220803
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Apr 2025 12:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1744652626;
 bh=uSa+mwmKRsBHbiI7E5dH/18NMyqtwpzqZyLK302xmvo=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Bm1lAKflwAMgYAOCL2yVsM2jB/fBUu3cn1FssnlehWq6jbcwdnhFGtpOkaQ0gZKiy
 tnQGJ1/oyRbco7PFdmQi19tAi/12G9iF+CFgwog6SSPDSQ6oHlzaSBUwohh+6fYcqQ
 B51L9202lDKSXg9tvYPehbLnuSnTLVOBA906nzUc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EHhk8m016722
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Apr 2025 12:43:46 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 12:43:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 12:43:45 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EHhjq3117844;
 Mon, 14 Apr 2025 12:43:45 -0500
Message-ID: <b3391234-ea53-4a18-a1e3-b8a92d9dff5d@ti.com>
Date: Mon, 14 Apr 2025 12:43:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
To: "T.J. Mercier" <tjmercier@google.com>, Maxime Ripard <mripard@kernel.org>
CC: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
 <20250407-dma-buf-ecc-heap-v3-2-97cdd36a5f29@kernel.org>
 <CABdmKX0=Er-y41roEuZjGZ95YzMxt-mPd9K5982fm_eWhtX5vw@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CABdmKX0=Er-y41roEuZjGZ95YzMxt-mPd9K5982fm_eWhtX5vw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/25 3:26 PM, T.J. Mercier wrote:
> On Mon, Apr 7, 2025 at 9:29 AM Maxime Ripard <mripard@kernel.org> wrote:
>>
>> Some reserved memory regions might have particular memory setup or
>> attributes that make them good candidates for heaps.
>>
>> Let's provide a heap type that will create a new heap for each reserved
>> memory region flagged as such.
>>
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> This patch looks good to me, but I think it'd be good to add more
> justification like you did at
> https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org
> 
>> ---
>>   drivers/dma-buf/heaps/Kconfig         |   8 +
>>   drivers/dma-buf/heaps/Makefile        |   1 +
>>   drivers/dma-buf/heaps/carveout_heap.c | 360 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 369 insertions(+)
>>
>> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
>> index a5eef06c422644e8aadaf5aff2bd9a33c49c1ba3..c6981d696733b4d8d0c3f6f5a37d967fd6a1a4a2 100644
>> --- a/drivers/dma-buf/heaps/Kconfig
>> +++ b/drivers/dma-buf/heaps/Kconfig
>> @@ -1,5 +1,13 @@
>> +config DMABUF_HEAPS_CARVEOUT
>> +       bool "Carveout Heaps"
>> +       depends on DMABUF_HEAPS
>> +       help
>> +         Choose this option to enable the carveout dmabuf heap. The carveout
>> +         heap is backed by pages from reserved memory regions flagged as
>> +         exportable. If in doubt, say Y.
>> +
>>   config DMABUF_HEAPS_SYSTEM
>>          bool "DMA-BUF System Heap"
>>          depends on DMABUF_HEAPS
>>          help
>>            Choose this option to enable the system dmabuf heap. The system heap
>> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
>> index 974467791032ffb8a7aba17b1407d9a19b3f3b44..b734647ad5c84f449106748160258e372f153df2 100644
>> --- a/drivers/dma-buf/heaps/Makefile
>> +++ b/drivers/dma-buf/heaps/Makefile
>> @@ -1,3 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0
>> +obj-$(CONFIG_DMABUF_HEAPS_CARVEOUT)    += carveout_heap.o
>>   obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      += system_heap.o
>>   obj-$(CONFIG_DMABUF_HEAPS_CMA)         += cma_heap.o
>> diff --git a/drivers/dma-buf/heaps/carveout_heap.c b/drivers/dma-buf/heaps/carveout_heap.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f7198b781ea57f4f60e554d917c9277e9a716b16
>> --- /dev/null
>> +++ b/drivers/dma-buf/heaps/carveout_heap.c
>> @@ -0,0 +1,360 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/dma-heap.h>
>> +#include <linux/genalloc.h>
>> +#include <linux/highmem.h>
>> +#include <linux/of_reserved_mem.h>
>> +
>> +struct carveout_heap_priv {
>> +       struct dma_heap *heap;
>> +       struct gen_pool *pool;
>> +};
>> +
>> +struct carveout_heap_buffer_priv {
>> +       struct mutex lock;
>> +       struct list_head attachments;
>> +
>> +       unsigned long num_pages;
>> +       struct carveout_heap_priv *heap;
>> +       dma_addr_t daddr;
>> +       void *vaddr;
>> +       unsigned int vmap_cnt;
>> +};
>> +
>> +struct carveout_heap_attachment {
>> +       struct list_head head;
>> +       struct sg_table table;
>> +
>> +       struct device *dev;
>> +       bool mapped;
>> +};
>> +
>> +static int carveout_heap_attach(struct dma_buf *buf,
>> +                               struct dma_buf_attachment *attachment)
>> +{
>> +       struct carveout_heap_buffer_priv *priv = buf->priv;
>> +       struct carveout_heap_attachment *a;
>> +       struct sg_table *sgt;
>> +       unsigned long len = priv->num_pages * PAGE_SIZE;
>> +       int ret;
>> +
>> +       a = kzalloc(sizeof(*a), GFP_KERNEL);
>> +       if (!a)
>> +               return -ENOMEM;
>> +       INIT_LIST_HEAD(&a->head);
>> +       a->dev = attachment->dev;
>> +       attachment->priv = a;
>> +
>> +       sgt = &a->table;
>> +       ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
>> +       if (ret)
>> +               goto err_cleanup_attach;
>> +
>> +       sg_dma_address(sgt->sgl) = priv->daddr;
>> +       sg_dma_len(sgt->sgl) = len;
>> +
>> +       mutex_lock(&priv->lock);
>> +       list_add(&a->head, &priv->attachments);
>> +       mutex_unlock(&priv->lock);
>> +
>> +       return 0;
>> +
>> +err_cleanup_attach:
>> +       kfree(a);
>> +       return ret;
>> +}
>> +
>> +static void carveout_heap_detach(struct dma_buf *dmabuf,
>> +                                struct dma_buf_attachment *attachment)
>> +{
>> +       struct carveout_heap_buffer_priv *priv = dmabuf->priv;
>> +       struct carveout_heap_attachment *a = attachment->priv;
>> +
>> +       mutex_lock(&priv->lock);
>> +       list_del(&a->head);
>> +       mutex_unlock(&priv->lock);
>> +
>> +       sg_free_table(&a->table);
>> +       kfree(a);
>> +}
>> +
>> +static struct sg_table *
>> +carveout_heap_map_dma_buf(struct dma_buf_attachment *attachment,
>> +                         enum dma_data_direction direction)
>> +{
>> +       struct carveout_heap_attachment *a = attachment->priv;
>> +       struct sg_table *table = &a->table;
>> +       int ret;
>> +
>> +       ret = dma_map_sgtable(a->dev, table, direction, 0);
>> +       if (ret)
>> +               return ERR_PTR(-ENOMEM);
> 
> Not ERR_PTR(ret)? This is already converted to ENOMEM by
> dma_buf_map_attachment before leaving the dmabuf code, but it might be
> nice to retain the error type internally. The two existing heaps
> aren't consistent about this, and I have a slight preference to
> propagate the error here.
> 
>> +
>> +       a->mapped = true;
>> +
>> +       return table;
>> +}
>> +
>> +static void carveout_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>> +                                       struct sg_table *table,
>> +                                       enum dma_data_direction direction)
>> +{
>> +       struct carveout_heap_attachment *a = attachment->priv;
>> +
>> +       a->mapped = false;
>> +       dma_unmap_sgtable(a->dev, table, direction, 0);
>> +}
>> +
>> +static int
>> +carveout_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>> +                                      enum dma_data_direction direction)
>> +{
>> +       struct carveout_heap_buffer_priv *priv = dmabuf->priv;
>> +       struct carveout_heap_attachment *a;
>> +       unsigned long len = priv->num_pages * PAGE_SIZE;
>> +
>> +       mutex_lock(&priv->lock);
>> +
>> +       if (priv->vmap_cnt > 0)
>> +               invalidate_kernel_vmap_range(priv->vaddr, len);
>> +
>> +       list_for_each_entry(a, &priv->attachments, head) {
>> +               if (!a->mapped)
>> +                       continue;
>> +
>> +               dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
>> +       }
>> +
>> +       mutex_unlock(&priv->lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static int
>> +carveout_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>> +                                    enum dma_data_direction direction)
>> +{
>> +       struct carveout_heap_buffer_priv *priv = dmabuf->priv;
>> +       struct carveout_heap_attachment *a;
>> +       unsigned long len = priv->num_pages * PAGE_SIZE;
>> +
>> +       mutex_lock(&priv->lock);
>> +
>> +       if (priv->vmap_cnt > 0)
>> +               flush_kernel_vmap_range(priv->vaddr, len);
>> +
>> +       list_for_each_entry(a, &priv->attachments, head) {
>> +               if (!a->mapped)
>> +                       continue;
>> +
>> +               dma_sync_sgtable_for_device(a->dev, &a->table, direction);
>> +       }
>> +
>> +       mutex_unlock(&priv->lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static int carveout_heap_mmap(struct dma_buf *dmabuf,
>> +                             struct vm_area_struct *vma)
>> +{
>> +       struct carveout_heap_buffer_priv *priv = dmabuf->priv;
>> +       unsigned long len = priv->num_pages * PAGE_SIZE;
>> +       struct page *page = virt_to_page(priv->vaddr);
>> +
>> +       return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page),
>> +                              len, vma->vm_page_prot);
>> +}
>> +
>> +static int carveout_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>> +{
>> +       struct carveout_heap_buffer_priv *priv = dmabuf->priv;
>> +
>> +       mutex_lock(&priv->lock);
>> +
>> +       iosys_map_set_vaddr(map, priv->vaddr);
>> +       priv->vmap_cnt++;
>> +
>> +       mutex_unlock(&priv->lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static void carveout_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>> +{
>> +       struct carveout_heap_buffer_priv *priv = dmabuf->priv;
>> +
>> +       mutex_lock(&priv->lock);
>> +
>> +       priv->vmap_cnt--;
>> +       mutex_unlock(&priv->lock);
>> +
>> +       iosys_map_clear(map);
>> +}
>> +
>> +static void carveout_heap_dma_buf_release(struct dma_buf *buf)
>> +{
>> +       struct carveout_heap_buffer_priv *buffer_priv = buf->priv;
>> +       struct carveout_heap_priv *heap_priv = buffer_priv->heap;
>> +       unsigned long len = buffer_priv->num_pages * PAGE_SIZE;
>> +
>> +       gen_pool_free(heap_priv->pool, (unsigned long)buffer_priv->vaddr, len);
>> +       kfree(buffer_priv);
>> +}
>> +
>> +static const struct dma_buf_ops carveout_heap_buf_ops = {
>> +       .attach         = carveout_heap_attach,
>> +       .detach         = carveout_heap_detach,
>> +       .map_dma_buf    = carveout_heap_map_dma_buf,
>> +       .unmap_dma_buf  = carveout_heap_unmap_dma_buf,
>> +       .begin_cpu_access       = carveout_heap_dma_buf_begin_cpu_access,
>> +       .end_cpu_access = carveout_heap_dma_buf_end_cpu_access,
>> +       .mmap           = carveout_heap_mmap,
>> +       .vmap           = carveout_heap_vmap,
>> +       .vunmap         = carveout_heap_vunmap,
>> +       .release        = carveout_heap_dma_buf_release,
>> +};
>> +
>> +static struct dma_buf *carveout_heap_allocate(struct dma_heap *heap,
>> +                                             unsigned long len,
>> +                                             u32 fd_flags,
>> +                                             u64 heap_flags)
>> +{
>> +       struct carveout_heap_priv *heap_priv = dma_heap_get_drvdata(heap);
>> +       struct carveout_heap_buffer_priv *buffer_priv;
>> +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>> +       struct dma_buf *buf;
>> +       dma_addr_t daddr;
>> +       size_t size = PAGE_ALIGN(len);
> 
> This PAGE_ALIGN is not needed since dma_heap_buffer_alloc requires all
> heap allocations to be page aligned before this function is called.
> 
> 
> 
> 
> 
>> +       void *vaddr;
>> +       int ret;
>> +
>> +       buffer_priv = kzalloc(sizeof(*buffer_priv), GFP_KERNEL);
>> +       if (!buffer_priv)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       INIT_LIST_HEAD(&buffer_priv->attachments);
>> +       mutex_init(&buffer_priv->lock);
>> +
>> +       vaddr = gen_pool_dma_zalloc(heap_priv->pool, size, &daddr);
>> +       if (!vaddr) {
>> +               ret = -ENOMEM;
>> +               goto err_free_buffer_priv;
>> +       }
>> +
>> +       buffer_priv->vaddr = vaddr;
>> +       buffer_priv->daddr = daddr;
>> +       buffer_priv->heap = heap_priv;
>> +       buffer_priv->num_pages = size >> PAGE_SHIFT;
>> +
>> +       /* create the dmabuf */
>> +       exp_info.exp_name = dma_heap_get_name(heap);
>> +       exp_info.ops = &carveout_heap_buf_ops;
>> +       exp_info.size = size;
>> +       exp_info.flags = fd_flags;
>> +       exp_info.priv = buffer_priv;
>> +
>> +       buf = dma_buf_export(&exp_info);
>> +       if (IS_ERR(buf)) {
>> +               ret = PTR_ERR(buf);
>> +               goto err_free_buffer;
>> +       }
>> +
>> +       return buf;
>> +
>> +err_free_buffer:
>> +       gen_pool_free(heap_priv->pool, (unsigned long)vaddr, len);
>> +err_free_buffer_priv:
>> +       kfree(buffer_priv);
>> +
>> +       return ERR_PTR(ret);
>> +}
>> +
>> +static const struct dma_heap_ops carveout_heap_ops = {
>> +       .allocate = carveout_heap_allocate,
>> +};
>> +
>> +static int __init carveout_heap_setup(struct device_node *node)
>> +{
>> +       struct dma_heap_export_info exp_info = {};
>> +       const struct reserved_mem *rmem;
>> +       struct carveout_heap_priv *priv;
>> +       struct dma_heap *heap;
>> +       struct gen_pool *pool;
>> +       void *base;
>> +       int ret;
>> +
>> +       rmem = of_reserved_mem_lookup(node);
>> +       if (!rmem)
>> +               return -EINVAL;
>> +
>> +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return -ENOMEM;
>> +
>> +       pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
>> +       if (!pool) {
>> +               ret = -ENOMEM;
>> +               goto err_cleanup_heap;
>> +       }
>> +       priv->pool = pool;
>> +
>> +       base = memremap(rmem->base, rmem->size, MEMREMAP_WB);

Why add a mapping here? What if the carveout is never mapped by the CPU
(or maybe it shouldn't be mapped for some reason). Instead you could
make the map at map time. I do it that way in our evil vendor tree
version of this driver for reference[0].

>> +       if (!base) {
>> +               ret = -ENOMEM;
>> +               goto err_release_mem_region;
>> +       }
>> +
>> +       ret = gen_pool_add_virt(pool, (unsigned long)base, rmem->base,
>> +                               rmem->size, NUMA_NO_NODE);
>> +       if (ret)
>> +               goto err_unmap;
>> +
>> +       exp_info.name = node->full_name;

So this is the only part that concerns me. We really got the user exposed
naming wrong with the CMA Heap IMHO (probably should have been always called
"default_cma" or somthing, instead it changes based on how the default CMA
area was defined).

If the name of the heap is how users select the heap, it needs to be consistent.
And naming it after the node makes the DT name into ABI. It also means it will
change based on device, or even based on how it is created. What if this same
reserved region is defined by ACPI instead of DT in some cases, or from kernel
command-line, etc.. Makes for bad ABI :(

Maybe in addition to the "export" property, in the DT node we have a "heap-name"
that can be set which then defines what name is presented to userspace. At
very least that allows us to kick the can down the road till we can figure out
what good portable Heap names should look like.

Andrew

[0] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/drivers/dma-buf/heaps/carveout-heap.c?h=ti-linux-6.12.y

>> +       exp_info.ops = &carveout_heap_ops;
>> +       exp_info.priv = priv;
>> +
>> +       heap = dma_heap_add(&exp_info);
>> +       if (IS_ERR(heap)) {
>> +               ret = PTR_ERR(heap);
>> +               goto err_cleanup_pool_region;
>> +       }
>> +       priv->heap = heap;
>> +
>> +       return 0;
>> +
>> +err_cleanup_pool_region:
>> +       gen_pool_free(pool, (unsigned long)base, rmem->size);
>> +err_unmap:
>> +       memunmap(base);
>> +err_release_mem_region:
>> +       gen_pool_destroy(pool);
>> +err_cleanup_heap:
>> +       kfree(priv);
>> +       return ret;
>> +}
>> +
>> +static int __init carveout_heap_init(void)
>> +{
>> +       struct device_node *rmem_node;
>> +       struct device_node *node;
>> +       int ret;
>> +
>> +       rmem_node = of_find_node_by_path("/reserved-memory");
>> +       if (!rmem_node)
>> +               return 0;
>> +
>> +       for_each_child_of_node(rmem_node, node) {
>> +               if (!of_property_read_bool(node, "export"))
>> +                       continue;
>> +
>> +               ret = carveout_heap_setup(node);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +module_init(carveout_heap_init);
>>
>> --
>> 2.49.0
>>
