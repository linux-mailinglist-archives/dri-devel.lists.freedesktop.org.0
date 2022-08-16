Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D3595D6D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E992A9EF6;
	Tue, 16 Aug 2022 13:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548A0A56CB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:31:17 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id f4so6072305qkl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=rumT36EiZyaMacTPy8T+o7aCAEqNJYGvihfJScbiGss=;
 b=seZ2ybBL4UUJEeXC8WRkLy1+rvQGdYlws8IAofQ5RPNqa22OWN3+A1512regvu2Tr4
 EmFL4HQ7V26Yh1HeRZEqnGpj10fLaWP8xkOhlESVQZ4ZC61MEoOxlhosGqGzyhlThunk
 8npnhp5ZXwnCSvg1o+907AnHNg2SfYEAtIA9MiHQhRXdhQRNsg6oU8+zwpRMk5wewxy8
 MHKhDRvfpVIIBDm24zKXNG2g8R6KuJkDuQZXllFp3PTW02MsJpPhtefDgU94MMvKPsXq
 LUnH73zh5zkCYBfFUMkiYiczqose0nEArddGcbxKxyYChWaypu/VnylJSNMfiGZ5QfKj
 AtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=rumT36EiZyaMacTPy8T+o7aCAEqNJYGvihfJScbiGss=;
 b=o+XxgPCW2Uq3+oAaN4JlyyVXBku4UiWQ8txRne+r2RGL51FM/eUekqO7ml2Hj+aqGM
 332CmFgDE+efEeZIviCK8FIBzwFReSHDt7RrHpZq48ynk/b/pwD/iz8wzEixntaozuIj
 lUH6jMU1GwYJ+LzRwaLDTS6We8xvP4ftD2py9QKuwSOdMiHp2D2oSfuJ4m64U4eXlfs+
 6QZYTw+TvQxuSi9d42RwqX52iyDyx/kRgjzGUjmI4EMNWQEWZrxXbwcTP3QGXbZ9KBWY
 vrYjr+e3iIxpeiD3MeQ3wOTJOOKj/vImdtiN7TzUrs5i5NDlnwP7fnayWpXwQNmRF8gh
 eX2g==
X-Gm-Message-State: ACgBeo0DZp1ktMWhUXjvoMP8rbPIpkR1MWOQGkrV0DYaMqqWxPLpULok
 6B8L5csuOjadJtRGBLCCxSMlyQ==
X-Google-Smtp-Source: AA6agR5pZRIvpjod6d4ltX7U3KsZrj+cXTWVJvu1uBAGEGka8mMknM52pIbfeLyGm2zwWfyC0HfW5A==
X-Received: by 2002:a05:620a:1788:b0:6bb:75c3:ba06 with SMTP id
 ay8-20020a05620a178800b006bb75c3ba06mr953376qkb.686.1660656676120; 
 Tue, 16 Aug 2022 06:31:16 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 l9-20020ac87249000000b003434d3b5938sm10148191qtp.2.2022.08.16.06.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 06:31:15 -0700 (PDT)
Message-ID: <ae9b779bb6701d3d08866e7f4e9cc6f5c23c7bd0.camel@ndufresne.ca>
Subject: Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf heap support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Olivier Masse <olivier.masse@nxp.com>, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 christian.koenig@amd.com,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Date: Tue, 16 Aug 2022 09:31:14 -0400
In-Reply-To: <20220802095843.14614-4-olivier.masse@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
 <20220802095843.14614-4-olivier.masse@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
Cc: clement.faure@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mardi 02 ao=C3=BBt 2022 =C3=A0 11:58 +0200, Olivier Masse a =C3=A9crit=
=C2=A0:
> add Linaro secure heap bindings: linaro,secure-heap

Just a curiosity, how is this specific to Linaro OPTEE OS ? Shouldn't it be=
 "de-
linaro-ified" somehow ?

regards,
Nicolas

> use genalloc to allocate/free buffer from buffer pool.
> buffer pool info is from dts.
> use sg_table instore the allocated memory info, the length of sg_table is=
 1.
> implement secure_heap_buf_ops to implement buffer share in difference dev=
ice:
> 1. Userspace passes this fd to all drivers it wants this buffer
> to share with: First the filedescriptor is converted to a &dma_buf using
> dma_buf_get(). Then the buffer is attached to the device using dma_buf_at=
tach().
> 2. Once the buffer is attached to all devices userspace can initiate DMA
> access to the shared buffer. In the kernel this is done by calling dma_bu=
f_map_attachment()
> 3. get sg_table with dma_buf_map_attachment in difference device.
>=20
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> ---
>  drivers/dma-buf/heaps/Kconfig       |  21 +-
>  drivers/dma-buf/heaps/Makefile      |   1 +
>  drivers/dma-buf/heaps/secure_heap.c | 588 ++++++++++++++++++++++++++++
>  3 files changed, 606 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/dma-buf/heaps/secure_heap.c
>=20
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfi=
g
> index 6a33193a7b3e..b2406932192e 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -1,8 +1,12 @@
> -config DMABUF_HEAPS_DEFERRED_FREE
> -	tristate
> +menuconfig DMABUF_HEAPS_DEFERRED_FREE
> +	bool "DMA-BUF heaps deferred-free library"
> +	help
> +	  Choose this option to enable the DMA-BUF heaps deferred-free library.
> =20
> -config DMABUF_HEAPS_PAGE_POOL
> -	tristate
> +menuconfig DMABUF_HEAPS_PAGE_POOL
> +	bool "DMA-BUF heaps page-pool library"
> +	help
> +	  Choose this option to enable the DMA-BUF heaps page-pool library.
> =20
>  config DMABUF_HEAPS_SYSTEM
>  	bool "DMA-BUF System Heap"
> @@ -26,3 +30,12 @@ config DMABUF_HEAPS_DSP
>            Choose this option to enable the dsp dmabuf heap. The dsp heap
>            is allocated by gen allocater. it's allocated according the dt=
s.
>            If in doubt, say Y.
> +
> +config DMABUF_HEAPS_SECURE
> +	tristate "DMA-BUF Secure Heap"
> +	depends on DMABUF_HEAPS && DMABUF_HEAPS_DEFERRED_FREE
> +	help
> +	  Choose this option to enable the secure dmabuf heap. The secure heap
> +	  pools are defined according to the DT. Heaps are allocated
> +	  in the pools using gen allocater.
> +	  If in doubt, say Y.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index e70722ea615e..08f6aa5919d1 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DMABUF_HEAPS_PAGE_POOL)	+=3D page_pool.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+=3D system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+=3D cma_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_DSP)          +=3D dsp_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_SECURE)	+=3D secure_heap.o
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> new file mode 100644
> index 000000000000..31aac5d050b4
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF secure heap exporter
> + *
> + * Copyright 2021 NXP.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/genalloc.h>
> +#include <linux/highmem.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +
> +#include "deferred-free-helper.h"
> +#include "page_pool.h"
> +
> +#define MAX_SECURE_HEAP 2
> +#define MAX_HEAP_NAME_LEN 32
> +
> +struct secure_heap_buffer {
> +	struct dma_heap *heap;
> +	struct list_head attachments;
> +	struct mutex lock;
> +	unsigned long len;
> +	struct sg_table sg_table;
> +	int vmap_cnt;
> +	struct deferred_freelist_item deferred_free;
> +	void *vaddr;
> +	bool uncached;
> +};
> +
> +struct dma_heap_attachment {
> +	struct device *dev;
> +	struct sg_table *table;
> +	struct list_head list;
> +	bool no_map;
> +	bool mapped;
> +	bool uncached;
> +};
> +
> +struct secure_heap_info {
> +	struct gen_pool *pool;
> +
> +	bool no_map;
> +};
> +
> +struct rmem_secure {
> +	phys_addr_t base;
> +	phys_addr_t size;
> +
> +	char name[MAX_HEAP_NAME_LEN];
> +
> +	bool no_map;
> +};
> +
> +static struct rmem_secure secure_data[MAX_SECURE_HEAP] =3D {0};
> +static unsigned int secure_data_count;
> +
> +static struct sg_table *dup_sg_table(struct sg_table *table)
> +{
> +	struct sg_table *new_table;
> +	int ret, i;
> +	struct scatterlist *sg, *new_sg;
> +
> +	new_table =3D kzalloc(sizeof(*new_table), GFP_KERNEL);
> +	if (!new_table)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret =3D sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
> +	if (ret) {
> +		kfree(new_table);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	new_sg =3D new_table->sgl;
> +	for_each_sgtable_sg(table, sg, i) {
> +		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
> +		new_sg->dma_address =3D sg->dma_address;
> +#ifdef CONFIG_NEED_SG_DMA_LENGTH
> +		new_sg->dma_length =3D sg->dma_length;
> +#endif
> +		new_sg =3D sg_next(new_sg);
> +	}
> +
> +	return new_table;
> +}
> +
> +static int secure_heap_attach(struct dma_buf *dmabuf,
> +			      struct dma_buf_attachment *attachment)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +	struct secure_heap_info *info =3D dma_heap_get_drvdata(buffer->heap);
> +	struct dma_heap_attachment *a;
> +	struct sg_table *table;
> +
> +	a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> +	if (!a)
> +		return -ENOMEM;
> +
> +	table =3D dup_sg_table(&buffer->sg_table);
> +	if (IS_ERR(table)) {
> +		kfree(a);
> +		return -ENOMEM;
> +	}
> +
> +	a->table =3D table;
> +	a->dev =3D attachment->dev;
> +	INIT_LIST_HEAD(&a->list);
> +	a->no_map =3D info->no_map;
> +	a->mapped =3D false;
> +	a->uncached =3D buffer->uncached;
> +	attachment->priv =3D a;
> +
> +	mutex_lock(&buffer->lock);
> +	list_add(&a->list, &buffer->attachments);
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static void secure_heap_detach(struct dma_buf *dmabuf,
> +			       struct dma_buf_attachment *attachment)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +	struct dma_heap_attachment *a =3D attachment->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	list_del(&a->list);
> +	mutex_unlock(&buffer->lock);
> +
> +	sg_free_table(a->table);
> +	kfree(a->table);
> +	kfree(a);
> +}
> +
> +static struct sg_table *secure_heap_map_dma_buf(struct dma_buf_attachmen=
t *attachment,
> +						enum dma_data_direction direction)
> +{
> +	struct dma_heap_attachment *a =3D attachment->priv;
> +	struct sg_table *table =3D a->table;
> +	int attr =3D 0;
> +	int ret;
> +
> +	if (!a->no_map) {
> +		if (a->uncached)
> +			attr =3D DMA_ATTR_SKIP_CPU_SYNC;
> +
> +		ret =3D dma_map_sgtable(attachment->dev, table, direction, attr);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		a->mapped =3D true;
> +	}
> +
> +	return table;
> +}
> +
> +static void secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachm=
ent,
> +				      struct sg_table *table,
> +				      enum dma_data_direction direction)
> +{
> +	struct dma_heap_attachment *a =3D attachment->priv;
> +	int attr =3D 0;
> +
> +	if (!a->no_map)	{
> +		if (a->uncached)
> +			attr =3D DMA_ATTR_SKIP_CPU_SYNC;
> +
> +		a->mapped =3D false;
> +		dma_unmap_sgtable(attachment->dev, table, direction, attr);
> +	}
> +}
> +
> +static int secure_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> +						enum dma_data_direction direction)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +
> +	mutex_lock(&buffer->lock);
> +
> +	if (buffer->vmap_cnt)
> +		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
> +
> +	if (!buffer->uncached) {
> +		list_for_each_entry(a, &buffer->attachments, list) {
> +			if (!a->mapped)
> +				continue;
> +			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> +		}
> +	}
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static int secure_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> +					      enum dma_data_direction direction)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +	struct dma_heap_attachment *a;
> +
> +	mutex_lock(&buffer->lock);
> +
> +	if (buffer->vmap_cnt)
> +		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> +
> +	if (!buffer->uncached) {
> +		list_for_each_entry(a, &buffer->attachments, list) {
> +			if (!a->mapped)
> +				continue;
> +			dma_sync_sgtable_for_device(a->dev, a->table, direction);
> +		}
> +	}
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static int secure_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struc=
t *vma)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +	struct sg_table *table =3D &buffer->sg_table;
> +	unsigned long addr =3D vma->vm_start;
> +	struct sg_page_iter piter;
> +	int ret;
> +
> +	if (buffer->uncached)
> +		vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
> +
> +	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> +		struct page *page =3D sg_page_iter_page(&piter);
> +
> +		ret =3D remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
> +				      vma->vm_page_prot);
> +		if (ret)
> +			return ret;
> +		addr +=3D PAGE_SIZE;
> +	}
> +	return 0;
> +}
> +
> +static void *secure_heap_do_vmap(struct secure_heap_buffer *buffer)
> +{
> +	struct sg_table *table =3D &buffer->sg_table;
> +	int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> +	struct page **pages =3D vmalloc(sizeof(struct page *) * npages);
> +	struct page **tmp =3D pages;
> +	struct sg_page_iter piter;
> +	pgprot_t pgprot =3D PAGE_KERNEL;
> +	void *vaddr;
> +
> +	if (!pages)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (buffer->uncached)
> +		pgprot =3D pgprot_writecombine(PAGE_KERNEL);
> +
> +	for_each_sgtable_page(table, &piter, 0) {
> +		WARN_ON(tmp - pages >=3D npages);
> +		*tmp++ =3D sg_page_iter_page(&piter);
> +	}
> +
> +	vaddr =3D vmap(pages, npages, VM_MAP, pgprot);
> +	vfree(pages);
> +
> +	if (!vaddr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return vaddr;
> +}
> +
> +static int secure_heap_vmap(struct dma_buf *dmabuf, struct dma_buf_map *=
map)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +	void *vaddr;
> +	int ret =3D 0;
> +
> +	mutex_lock(&buffer->lock);
> +	if (buffer->vmap_cnt) {
> +		buffer->vmap_cnt++;
> +		goto out;
> +	}
> +
> +	vaddr =3D secure_heap_do_vmap(buffer);
> +	if (IS_ERR(vaddr)) {
> +		ret =3D PTR_ERR(vaddr);
> +		goto out;
> +	}
> +
> +	buffer->vaddr =3D vaddr;
> +	buffer->vmap_cnt++;
> +	dma_buf_map_set_vaddr(map, buffer->vaddr);
> +out:
> +	mutex_unlock(&buffer->lock);
> +
> +	return ret;
> +}
> +
> +static void secure_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_ma=
p *map)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	if (!--buffer->vmap_cnt) {
> +		vunmap(buffer->vaddr);
> +		buffer->vaddr =3D NULL;
> +	}
> +	mutex_unlock(&buffer->lock);
> +	dma_buf_map_clear(map);
> +}
> +
> +static void secure_heap_zero_buffer(struct secure_heap_buffer *buffer)
> +{
> +	struct sg_table *sgt =3D &buffer->sg_table;
> +	struct sg_page_iter piter;
> +	struct page *p;
> +	void *vaddr;
> +
> +	for_each_sgtable_page(sgt, &piter, 0) {
> +		p =3D sg_page_iter_page(&piter);
> +		vaddr =3D kmap_atomic(p);
> +		memset(vaddr, 0, PAGE_SIZE);
> +		kunmap_atomic(vaddr);
> +	}
> +}
> +
> +static void secure_heap_buf_free(struct deferred_freelist_item *item,
> +				 enum df_reason reason)
> +{
> +	struct secure_heap_buffer *buffer;
> +	struct secure_heap_info *info;
> +	struct sg_table *table;
> +	struct scatterlist *sg;
> +	int i;
> +
> +	buffer =3D container_of(item, struct secure_heap_buffer, deferred_free)=
;
> +	info =3D dma_heap_get_drvdata(buffer->heap);
> +
> +	if (!info->no_map) {
> +		// Zero the buffer pages before adding back to the pool
> +		if (reason =3D=3D DF_NORMAL)
> +			secure_heap_zero_buffer(buffer);
> +	}
> +
> +	table =3D &buffer->sg_table;
> +	for_each_sg(table->sgl, sg, table->nents, i)
> +		gen_pool_free(info->pool, sg_dma_address(sg), sg_dma_len(sg));
> +
> +	sg_free_table(table);
> +	kfree(buffer);
> +}
> +
> +static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct secure_heap_buffer *buffer =3D dmabuf->priv;
> +	int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> +
> +	deferred_free(&buffer->deferred_free, secure_heap_buf_free, npages);
> +}
> +
> +static const struct dma_buf_ops secure_heap_buf_ops =3D {
> +	.attach =3D secure_heap_attach,
> +	.detach =3D secure_heap_detach,
> +	.map_dma_buf =3D secure_heap_map_dma_buf,
> +	.unmap_dma_buf =3D secure_heap_unmap_dma_buf,
> +	.begin_cpu_access =3D secure_heap_dma_buf_begin_cpu_access,
> +	.end_cpu_access =3D secure_heap_dma_buf_end_cpu_access,
> +	.mmap =3D secure_heap_mmap,
> +	.vmap =3D secure_heap_vmap,
> +	.vunmap =3D secure_heap_vunmap,
> +	.release =3D secure_heap_dma_buf_release,
> +};
> +
> +static struct dma_buf *secure_heap_do_allocate(struct dma_heap *heap,
> +					       unsigned long len,
> +					       unsigned long fd_flags,
> +					       unsigned long heap_flags,
> +					       bool uncached)
> +{
> +	struct secure_heap_buffer *buffer;
> +	struct secure_heap_info *info =3D dma_heap_get_drvdata(heap);
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	unsigned long size =3D roundup(len, PAGE_SIZE);
> +	struct dma_buf *dmabuf;
> +	struct sg_table *table;
> +	int ret =3D -ENOMEM;
> +	unsigned long phy_addr;
> +
> +	buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&buffer->attachments);
> +	mutex_init(&buffer->lock);
> +	buffer->heap =3D heap;
> +	buffer->len =3D size;
> +	buffer->uncached =3D uncached;
> +
> +	phy_addr =3D gen_pool_alloc(info->pool, size);
> +	if (!phy_addr)
> +		goto free_buffer;
> +
> +	table =3D &buffer->sg_table;
> +	if (sg_alloc_table(table, 1, GFP_KERNEL))
> +		goto free_pool;
> +
> +	sg_set_page(table->sgl,	phys_to_page(phy_addr),	size, 0);
> +	sg_dma_address(table->sgl) =3D phy_addr;
> +	sg_dma_len(table->sgl) =3D size;
> +
> +	/* create the dmabuf */
> +	exp_info.exp_name =3D dma_heap_get_name(heap);
> +	exp_info.ops =3D &secure_heap_buf_ops;
> +	exp_info.size =3D buffer->len;
> +	exp_info.flags =3D fd_flags;
> +	exp_info.priv =3D buffer;
> +	dmabuf =3D dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf)) {
> +		ret =3D PTR_ERR(dmabuf);
> +		goto free_pages;
> +	}
> +
> +	return dmabuf;
> +
> +free_pages:
> +	sg_free_table(table);
> +
> +free_pool:
> +	gen_pool_free(info->pool, phy_addr, size);
> +
> +free_buffer:
> +	mutex_destroy(&buffer->lock);
> +	kfree(buffer);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
> +					    unsigned long len,
> +					    unsigned long fd_flags,
> +					    unsigned long heap_flags)
> +{
> +	// use uncache buffer here by default
> +	return secure_heap_do_allocate(heap, len, fd_flags, heap_flags, true);
> +	// use cache buffer
> +	// return secure_heap_do_allocate(heap, len, fd_flags, heap_flags, fals=
e);
> +}
> +
> +static const struct dma_heap_ops secure_heap_ops =3D {
> +	.allocate =3D secure_heap_allocate,
> +};
> +
> +static int secure_heap_add(struct rmem_secure *rmem)
> +{
> +	struct dma_heap *secure_heap;
> +	struct dma_heap_export_info exp_info;
> +	struct secure_heap_info *info =3D NULL;
> +	struct gen_pool *pool =3D NULL;
> +	int ret =3D -EINVAL;
> +
> +	if (rmem->base =3D=3D 0 || rmem->size =3D=3D 0) {
> +		pr_err("secure_data base or size is not correct\n");
> +		goto error;
> +	}
> +
> +	info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		pr_err("dmabuf info allocation failed\n");
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	pool =3D gen_pool_create(PAGE_SHIFT, -1);
> +	if (!pool) {
> +		pr_err("can't create gen pool\n");
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	if (gen_pool_add(pool, rmem->base, rmem->size, -1) < 0) {
> +		pr_err("failed to add memory into pool\n");
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	info->pool =3D pool;
> +	info->no_map =3D rmem->no_map;
> +
> +	exp_info.name =3D rmem->name;
> +	exp_info.ops =3D &secure_heap_ops;
> +	exp_info.priv =3D info;
> +
> +	secure_heap =3D dma_heap_add(&exp_info);
> +	if (IS_ERR(secure_heap)) {
> +		pr_err("dmabuf secure heap allocation failed\n");
> +		ret =3D PTR_ERR(secure_heap);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	kfree(info);
> +	if (pool)
> +		gen_pool_destroy(pool);
> +
> +	return ret;
> +}
> +
> +static int secure_heap_create(void)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < secure_data_count; i++) {
> +		ret =3D secure_heap_add(&secure_data[i]);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int rmem_secure_heap_device_init(struct reserved_mem *rmem,
> +					 struct device *dev)
> +{
> +	dev_set_drvdata(dev, rmem);
> +	return 0;
> +}
> +
> +static void rmem_secure_heap_device_release(struct reserved_mem *rmem,
> +					 struct device *dev)
> +{
> +	dev_set_drvdata(dev, NULL);
> +}
> +
> +static const struct reserved_mem_ops rmem_dma_ops =3D {
> +	.device_init    =3D rmem_secure_heap_device_init,
> +	.device_release =3D rmem_secure_heap_device_release,
> +};
> +
> +static int __init rmem_secure_heap_setup(struct reserved_mem *rmem)
> +{
> +	if (secure_data_count < MAX_SECURE_HEAP) {
> +		int name_len =3D 0;
> +		char *s =3D rmem->name;
> +
> +		secure_data[secure_data_count].base =3D rmem->base;
> +		secure_data[secure_data_count].size =3D rmem->size;
> +		secure_data[secure_data_count].no_map =3D
> +			(of_get_flat_dt_prop(rmem->fdt_node, "no-map", NULL) !=3D NULL);
> +
> +		while (name_len < MAX_HEAP_NAME_LEN) {
> +			if ((*s =3D=3D '@') || (*s =3D=3D '\0'))
> +				break;
> +			name_len++;
> +			s++;
> +		}
> +		if (name_len =3D=3D MAX_HEAP_NAME_LEN)
> +			name_len--;
> +
> +		strncpy(secure_data[secure_data_count].name, rmem->name, name_len);
> +
> +		rmem->ops =3D &rmem_dma_ops;
> +		pr_info("Reserved memory: DMA buf secure pool %s at %pa, size %ld MiB\=
n",
> +			secure_data[secure_data_count].name,
> +			&rmem->base, (unsigned long)rmem->size / SZ_1M);
> +
> +		secure_data_count++;
> +		return 0;
> +	}
> +	WARN_ONCE(1, "Cannot handle more than %u secure heaps\n", MAX_SECURE_HE=
AP);
> +	return -EINVAL;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap", rmem_secure_he=
ap_setup);
> +
> +module_init(secure_heap_create);
> +MODULE_LICENSE("GPL v2");

