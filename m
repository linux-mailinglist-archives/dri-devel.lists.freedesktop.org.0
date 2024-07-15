Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367E9310E7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AB510E09A;
	Mon, 15 Jul 2024 09:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="F1bhmwpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB66410E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:11:46 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42111cf2706so3458475e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721034705; x=1721639505; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G+6pOwi3seCrcstT5uiNqVYvXvwlNG9Cy3/8u9y4CSA=;
 b=F1bhmwpMEfgW3FPUvp8Q1jKwR6QrLN0RvXMF9oC9hVJLUFhCDDiF8+ltfCiXtEB336
 BGM2JAKdcfLfgvsTNFvmjK3rqUVeOAVQPNfIQG5M+pn2cc5QLfjDyjh/0RKWDKuTOqu0
 cgN8NxxP6F5osJoCu7B7YmBH+g1POLGlHx+Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721034705; x=1721639505;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G+6pOwi3seCrcstT5uiNqVYvXvwlNG9Cy3/8u9y4CSA=;
 b=mBEAt/iS9hDa/psR64BegCaIQKvsDIqnAKSa6crQ7XbTgSq9BDTtn8K0WLRFb+nMn4
 mGvmaFGPCeXErw3ksm9HHq+jGCYdqGvL29d/GP/Qlw3ixUwS4zKs13sbliWAM8TbLGxJ
 95sZvmeqOPjr6XQfEflljZ9Wl9WgL79BHclgOekGkUkAcsKCvb0Xxfvhtyl3FU1MvruG
 NqATBmWi7dG05LT3bKtGZdWyMBLo/GArgWwrLEHeI/3eRzGenDHy/tJD/FLoHw4HDrBr
 jzH2fBuYHVsKU0gCCuXF5xdyOdTAKcyD1UujD+a5y3yRKJgwIDcLf+MOtFI+hoPlrsJV
 OSsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcX/k5p3DqlkOhMzJHzk1NkhNYKtTYXwvlgw92LHUuTO6tVNa84SIX0JbkGMhr7xNDIX/BPvbm26LBBGtSG0dddzBluQY+slm3NwocBgmF
X-Gm-Message-State: AOJu0YwJ7rdnzJBOsHM/gkjyC2HFIF3MqxFWwJ2YjcKCIf4bBGDzzypt
 wjP+XJWelUXnX/C+xftwsTjeZLd2DBWQxOL4Kr4t8EGnkp4biehk9dHwgWBf6jw+ldY1zLL3sQt
 VUCc=
X-Google-Smtp-Source: AGHT+IFYTZhdecBLuGhfy2YoC0IcF7v+QtOcL3AFjx7kn45U5QuCuMymxIE8w09nWQfN8K9CxA/MnA==
X-Received: by 2002:a5d:6489:0:b0:367:9614:fdf7 with SMTP id
 ffacd0b85a97d-367f0545ecdmr6806665f8f.0.1721034705074; 
 Mon, 15 Jul 2024 02:11:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3d4dsm5740295f8f.23.2024.07.15.02.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 02:11:44 -0700 (PDT)
Date: Mon, 15 Jul 2024 11:11:42 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
Message-ID: <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
> Am 11.07.24 um 09:42 schrieb Huan Yang:
> > Some user may need load file into dma-buf, current
> > way is:
> >    1. allocate a dma-buf, get dma-buf fd
> >    2. mmap dma-buf fd into vaddr
> >    3. read(file_fd, vaddr, fsz)
> > This is too heavy if fsz reached to GB.
> 
> You need to describe a bit more why that is to heavy. I can only assume you
> need to save memory bandwidth and avoid the extra copy with the CPU.
> 
> > This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
> > User need to offer a file_fd which you want to load into dma-buf, then,
> > it promise if you got a dma-buf fd, it will contains the file content.
> 
> Interesting idea, that has at least more potential than trying to enable
> direct I/O on mmap()ed DMA-bufs.
> 
> The approach with the new IOCTL might not work because it is a very
> specialized use case.
> 
> But IIRC there was a copy_file_range callback in the file_operations
> structure you could use for that. I'm just not sure when and how that's used
> with the copy_file_range() system call.

I'm not sure any of those help, because internally they're all still based
on struct page (or maybe in the future on folios). And that's the thing
dma-buf can't give you, at least without peaking behind the curtain.

I think an entirely different option would be malloc+udmabuf. That
essentially handles the impendence-mismatch between direct I/O and dma-buf
on the dma-buf side. The downside is that it'll make the permanently
pinned memory accounting and tracking issues even more apparent, but I
guess eventually we do need to sort that one out.

And since all the patches here are only for the pages system heap I'm
guess udmabuf should work out for the use-case here? Worth a shot at
least.
-Sima

> 
> Regards,
> Christian.
> 
> > 
> > Notice, file_fd depends on user how to open this file. So, both buffer
> > I/O and Direct I/O is supported.
> > 
> > Signed-off-by: Huan Yang <link@vivo.com>
> > ---
> >   drivers/dma-buf/dma-heap.c    | 525 +++++++++++++++++++++++++++++++++-
> >   include/linux/dma-heap.h      |  57 +++-
> >   include/uapi/linux/dma-heap.h |  32 +++
> >   3 files changed, 611 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 2298ca5e112e..abe17281adb8 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -15,9 +15,11 @@
> >   #include <linux/list.h>
> >   #include <linux/slab.h>
> >   #include <linux/nospec.h>
> > +#include <linux/highmem.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/syscalls.h>
> >   #include <linux/dma-heap.h>
> > +#include <linux/vmalloc.h>
> >   #include <uapi/linux/dma-heap.h>
> >   #define DEVNAME "dma_heap"
> > @@ -43,12 +45,462 @@ struct dma_heap {
> >   	struct cdev heap_cdev;
> >   };
> > +/**
> > + * struct dma_heap_file - wrap the file, read task for dma_heap allocate use.
> > + * @file:		file to read from.
> > + *
> > + * @cred:		kthread use, user cred copy to use for the read.
> > + *
> > + * @max_batch:		maximum batch size to read, if collect match batch,
> > + *			trigger read, default 128MB, must below file size.
> > + *
> > + * @fsz:		file size.
> > + *
> > + * @direct:		use direct IO?
> > + */
> > +struct dma_heap_file {
> > +	struct file *file;
> > +	struct cred *cred;
> > +	size_t max_batch;
> > +	size_t fsz;
> > +	bool direct;
> > +};
> > +
> > +/**
> > + * struct dma_heap_file_work - represents a dma_heap file read real work.
> > + * @vaddr:		contigous virtual address alloc by vmap, file read need.
> > + *
> > + * @start_size:		file read start offset, same to @dma_heap_file_task->roffset.
> > + *
> > + * @need_size:		file read need size, same to @dma_heap_file_task->rsize.
> > + *
> > + * @heap_file:		file wrapper.
> > + *
> > + * @list:		child node of @dma_heap_file_control->works.
> > + *
> > + * @refp:		same @dma_heap_file_task->ref, if end of read, put ref.
> > + *
> > + * @failp:		if any work io failed, set it true, pointp @dma_heap_file_task->fail.
> > + */
> > +struct dma_heap_file_work {
> > +	void *vaddr;
> > +	ssize_t start_size;
> > +	ssize_t need_size;
> > +	struct dma_heap_file *heap_file;
> > +	struct list_head list;
> > +	atomic_t *refp;
> > +	bool *failp;
> > +};
> > +
> > +/**
> > + * struct dma_heap_file_task - represents a dma_heap file read process
> > + * @ref:		current file work counter, if zero, allocate and read
> > + *			done.
> > + *
> > + * @roffset:		last read offset, current prepared work' begin file
> > + *			start offset.
> > + *
> > + * @rsize:		current allocated page size use to read, if reach rbatch,
> > + *			trigger commit.
> > + *
> > + * @rbatch:		current prepared work's batch, below @dma_heap_file's
> > + *			batch.
> > + *
> > + * @heap_file:		current dma_heap_file
> > + *
> > + * @parray:		used for vmap, size is @dma_heap_file's batch's number
> > + *			pages.(this is maximum). Due to single thread file read,
> > + *			one page array reuse each work prepare is OK.
> > + *			Each index in parray is PAGE_SIZE.(vmap need)
> > + *
> > + * @pindex:		current allocated page filled in @parray's index.
> > + *
> > + * @fail:		any work failed when file read?
> > + *
> > + * dma_heap_file_task is the production of file read, will prepare each work
> > + * during allocate dma_buf pages, if match current batch, then trigger commit
> > + * and prepare next work. After all batch queued, user going on prepare dma_buf
> > + * and so on, but before return dma_buf fd, need to wait file read end and
> > + * check read result.
> > + */
> > +struct dma_heap_file_task {
> > +	atomic_t ref;
> > +	size_t roffset;
> > +	size_t rsize;
> > +	size_t rbatch;
> > +	struct dma_heap_file *heap_file;
> > +	struct page **parray;
> > +	unsigned int pindex;
> > +	bool fail;
> > +};
> > +
> > +/**
> > + * struct dma_heap_file_control - global control of dma_heap file read.
> > + * @works:		@dma_heap_file_work's list head.
> > + *
> > + * @lock:		only lock for @works.
> > + *
> > + * @threadwq:		wait queue for @work_thread, if commit work, @work_thread
> > + *			wakeup and read this work's file contains.
> > + *
> > + * @workwq:		used for main thread wait for file read end, if allocation
> > + *			end before file read. @dma_heap_file_task ref effect this.
> > + *
> > + * @work_thread:	file read kthread. the dma_heap_file_task work's consumer.
> > + *
> > + * @heap_fwork_cachep:	@dma_heap_file_work's cachep, it's alloc/free frequently.
> > + *
> > + * @nr_work:		global number of how many work committed.
> > + */
> > +struct dma_heap_file_control {
> > +	struct list_head works;
> > +	spinlock_t lock;
> > +	wait_queue_head_t threadwq;
> > +	wait_queue_head_t workwq;
> > +	struct task_struct *work_thread;
> > +	struct kmem_cache *heap_fwork_cachep;
> > +	atomic_t nr_work;
> > +};
> > +
> > +static struct dma_heap_file_control *heap_fctl;
> >   static LIST_HEAD(heap_list);
> >   static DEFINE_MUTEX(heap_list_lock);
> >   static dev_t dma_heap_devt;
> >   static struct class *dma_heap_class;
> >   static DEFINE_XARRAY_ALLOC(dma_heap_minors);
> > +/**
> > + * map_pages_to_vaddr - map each scatter page into contiguous virtual address.
> > + * @heap_ftask:		prepared and need to commit's work.
> > + *
> > + * Cached pages need to trigger file read, this function map each scatter page
> > + * into contiguous virtual address, so that file read can easy use.
> > + * Now that we get vaddr page, cached pages can return to original user, so we
> > + * will not effect dma-buf export even if file read not end.
> > + */
> > +static void *map_pages_to_vaddr(struct dma_heap_file_task *heap_ftask)
> > +{
> > +	return vmap(heap_ftask->parray, heap_ftask->pindex, VM_MAP,
> > +		    PAGE_KERNEL);
> > +}
> > +
> > +bool dma_heap_prepare_file_read(struct dma_heap_file_task *heap_ftask,
> > +				struct page *page)
> > +{
> > +	struct page **array = heap_ftask->parray;
> > +	int index = heap_ftask->pindex;
> > +	int num = compound_nr(page), i;
> > +	unsigned long sz = page_size(page);
> > +
> > +	heap_ftask->rsize += sz;
> > +	for (i = 0; i < num; ++i)
> > +		array[index++] = &page[i];
> > +	heap_ftask->pindex = index;
> > +
> > +	return heap_ftask->rsize >= heap_ftask->rbatch;
> > +}
> > +
> > +static struct dma_heap_file_work *
> > +init_file_work(struct dma_heap_file_task *heap_ftask)
> > +{
> > +	struct dma_heap_file_work *heap_fwork;
> > +	struct dma_heap_file *heap_file = heap_ftask->heap_file;
> > +
> > +	if (READ_ONCE(heap_ftask->fail))
> > +		return NULL;
> > +
> > +	heap_fwork = kmem_cache_alloc(heap_fctl->heap_fwork_cachep, GFP_KERNEL);
> > +	if (unlikely(!heap_fwork))
> > +		return NULL;
> > +
> > +	heap_fwork->vaddr = map_pages_to_vaddr(heap_ftask);
> > +	if (unlikely(!heap_fwork->vaddr)) {
> > +		kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
> > +		return NULL;
> > +	}
> > +
> > +	heap_fwork->heap_file = heap_file;
> > +	heap_fwork->start_size = heap_ftask->roffset;
> > +	heap_fwork->need_size = heap_ftask->rsize;
> > +	heap_fwork->refp = &heap_ftask->ref;
> > +	heap_fwork->failp = &heap_ftask->fail;
> > +	atomic_inc(&heap_ftask->ref);
> > +	return heap_fwork;
> > +}
> > +
> > +static void destroy_file_work(struct dma_heap_file_work *heap_fwork)
> > +{
> > +	vunmap(heap_fwork->vaddr);
> > +	atomic_dec(heap_fwork->refp);
> > +	wake_up(&heap_fctl->workwq);
> > +
> > +	kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
> > +}
> > +
> > +int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask)
> > +{
> > +	struct dma_heap_file_work *heap_fwork = init_file_work(heap_ftask);
> > +	struct page *last = NULL;
> > +	struct dma_heap_file *heap_file = heap_ftask->heap_file;
> > +	size_t start = heap_ftask->roffset;
> > +	struct file *file = heap_file->file;
> > +	size_t fsz = heap_file->fsz;
> > +
> > +	if (unlikely(!heap_fwork))
> > +		return -ENOMEM;
> > +
> > +	/**
> > +	 * If file size is not page aligned, direct io can't process the tail.
> > +	 * So, if reach to tail, remain the last page use buffer read.
> > +	 */
> > +	if (heap_file->direct && start + heap_ftask->rsize > fsz) {
> > +		heap_fwork->need_size -= PAGE_SIZE;
> > +		last = heap_ftask->parray[heap_ftask->pindex - 1];
> > +	}
> > +
> > +	spin_lock(&heap_fctl->lock);
> > +	list_add_tail(&heap_fwork->list, &heap_fctl->works);
> > +	spin_unlock(&heap_fctl->lock);
> > +	atomic_inc(&heap_fctl->nr_work);
> > +
> > +	wake_up(&heap_fctl->threadwq);
> > +
> > +	if (last) {
> > +		char *buf, *pathp;
> > +		ssize_t err;
> > +		void *buffer;
> > +
> > +		buf = kmalloc(PATH_MAX, GFP_KERNEL);
> > +		if (unlikely(!buf))
> > +			return -ENOMEM;
> > +
> > +		start = PAGE_ALIGN_DOWN(fsz);
> > +
> > +		pathp = file_path(file, buf, PATH_MAX);
> > +		if (IS_ERR(pathp)) {
> > +			kfree(buf);
> > +			return PTR_ERR(pathp);
> > +		}
> > +
> > +		buffer = kmap_local_page(last); // use page's kaddr.
> > +		err = kernel_read_file_from_path(pathp, start, &buffer,
> > +						 fsz - start, &fsz,
> > +						 READING_POLICY);
> > +		kunmap_local(buffer);
> > +		kfree(buf);
> > +		if (err < 0) {
> > +			pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
> > +			       pathp, err, start, fsz, fsz);
> > +
> > +			return err;
> > +		}
> > +	}
> > +
> > +	heap_ftask->roffset += heap_ftask->rsize;
> > +	heap_ftask->rsize = 0;
> > +	heap_ftask->pindex = 0;
> > +	heap_ftask->rbatch = min_t(size_t,
> > +				   PAGE_ALIGN(fsz) - heap_ftask->roffset,
> > +				   heap_ftask->rbatch);
> > +	return 0;
> > +}
> > +
> > +bool dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask)
> > +{
> > +	wait_event_freezable(heap_fctl->workwq,
> > +			     atomic_read(&heap_ftask->ref) == 0);
> > +	return heap_ftask->fail;
> > +}
> > +
> > +bool dma_heap_destroy_file_read(struct dma_heap_file_task *heap_ftask)
> > +{
> > +	bool fail;
> > +
> > +	dma_heap_wait_for_file_read(heap_ftask);
> > +	fail = heap_ftask->fail;
> > +	kvfree(heap_ftask->parray);
> > +	kfree(heap_ftask);
> > +	return fail;
> > +}
> > +
> > +struct dma_heap_file_task *
> > +dma_heap_declare_file_read(struct dma_heap_file *heap_file)
> > +{
> > +	struct dma_heap_file_task *heap_ftask =
> > +		kzalloc(sizeof(*heap_ftask), GFP_KERNEL);
> > +	if (unlikely(!heap_ftask))
> > +		return NULL;
> > +
> > +	/**
> > +	 * Batch is the maximum size which we prepare work will meet.
> > +	 * So, direct alloc this number's page array is OK.
> > +	 */
> > +	heap_ftask->parray = kvmalloc_array(heap_file->max_batch >> PAGE_SHIFT,
> > +					    sizeof(struct page *), GFP_KERNEL);
> > +	if (unlikely(!heap_ftask->parray))
> > +		goto put;
> > +
> > +	heap_ftask->heap_file = heap_file;
> > +	heap_ftask->rbatch = heap_file->max_batch;
> > +	return heap_ftask;
> > +put:
> > +	kfree(heap_ftask);
> > +	return NULL;
> > +}
> > +
> > +static void __work_this_io(struct dma_heap_file_work *heap_fwork)
> > +{
> > +	struct dma_heap_file *heap_file = heap_fwork->heap_file;
> > +	struct file *file = heap_file->file;
> > +	ssize_t start = heap_fwork->start_size;
> > +	ssize_t size = heap_fwork->need_size;
> > +	void *buffer = heap_fwork->vaddr;
> > +	const struct cred *old_cred;
> > +	ssize_t err;
> > +
> > +	// use real task's cred to read this file.
> > +	old_cred = override_creds(heap_file->cred);
> > +	err = kernel_read_file(file, start, &buffer, size, &heap_file->fsz,
> > +			       READING_POLICY);
> > +	if (err < 0) {
> > +		pr_err("use kernel_read_file, err=%ld, [%ld, %ld], f_sz=%ld\n",
> > +		       err, start, (start + size), heap_file->fsz);
> > +		WRITE_ONCE(*heap_fwork->failp, true);
> > +	}
> > +	// recovery to my cred.
> > +	revert_creds(old_cred);
> > +}
> > +
> > +static int dma_heap_file_control_thread(void *data)
> > +{
> > +	struct dma_heap_file_control *heap_fctl =
> > +		(struct dma_heap_file_control *)data;
> > +	struct dma_heap_file_work *worker, *tmp;
> > +	int nr_work;
> > +
> > +	LIST_HEAD(pages);
> > +	LIST_HEAD(workers);
> > +
> > +	while (true) {
> > +		wait_event_freezable(heap_fctl->threadwq,
> > +				     atomic_read(&heap_fctl->nr_work) > 0);
> > +recheck:
> > +		spin_lock(&heap_fctl->lock);
> > +		list_splice_init(&heap_fctl->works, &workers);
> > +		spin_unlock(&heap_fctl->lock);
> > +
> > +		if (unlikely(kthread_should_stop())) {
> > +			list_for_each_entry_safe(worker, tmp, &workers, list) {
> > +				list_del(&worker->list);
> > +				destroy_file_work(worker);
> > +			}
> > +			break;
> > +		}
> > +
> > +		nr_work = 0;
> > +		list_for_each_entry_safe(worker, tmp, &workers, list) {
> > +			++nr_work;
> > +			list_del(&worker->list);
> > +			__work_this_io(worker);
> > +
> > +			destroy_file_work(worker);
> > +		}
> > +		atomic_sub(nr_work, &heap_fctl->nr_work);
> > +
> > +		if (atomic_read(&heap_fctl->nr_work) > 0)
> > +			goto recheck;
> > +	}
> > +	return 0;
> > +}
> > +
> > +size_t dma_heap_file_size(struct dma_heap_file *heap_file)
> > +{
> > +	return heap_file->fsz;
> > +}
> > +
> > +static int prepare_dma_heap_file(struct dma_heap_file *heap_file, int file_fd,
> > +				 size_t batch)
> > +{
> > +	struct file *file;
> > +	size_t fsz;
> > +	int ret;
> > +
> > +	file = fget(file_fd);
> > +	if (!file)
> > +		return -EINVAL;
> > +
> > +	fsz = i_size_read(file_inode(file));
> > +	if (fsz < batch) {
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> > +	/**
> > +	 * Selinux block our read, but actually we are reading the stand-in
> > +	 * for this file.
> > +	 * So save current's cred and when going to read, override mine, and
> > +	 * end of read, revert.
> > +	 */
> > +	heap_file->cred = prepare_kernel_cred(current);
> > +	if (unlikely(!heap_file->cred)) {
> > +		ret = -ENOMEM;
> > +		goto err;
> > +	}
> > +
> > +	heap_file->file = file;
> > +	heap_file->max_batch = batch;
> > +	heap_file->fsz = fsz;
> > +
> > +	heap_file->direct = file->f_flags & O_DIRECT;
> > +
> > +#define DMA_HEAP_SUGGEST_DIRECT_IO_SIZE (1UL << 30)
> > +	if (!heap_file->direct && fsz >= DMA_HEAP_SUGGEST_DIRECT_IO_SIZE)
> > +		pr_warn("alloc read file better to use O_DIRECT to read larget file\n");
> > +
> > +	return 0;
> > +
> > +err:
> > +	fput(file);
> > +	return ret;
> > +}
> > +
> > +static void destroy_dma_heap_file(struct dma_heap_file *heap_file)
> > +{
> > +	fput(heap_file->file);
> > +	put_cred(heap_file->cred);
> > +}
> > +
> > +static int dma_heap_buffer_alloc_read_file(struct dma_heap *heap, int file_fd,
> > +					   size_t batch, unsigned int fd_flags,
> > +					   unsigned int heap_flags)
> > +{
> > +	struct dma_buf *dmabuf;
> > +	int fd;
> > +	struct dma_heap_file heap_file;
> > +
> > +	fd = prepare_dma_heap_file(&heap_file, file_fd, batch);
> > +	if (fd)
> > +		goto error_file;
> > +
> > +	dmabuf = heap->ops->allocate_read_file(heap, &heap_file, fd_flags,
> > +					       heap_flags);
> > +	if (IS_ERR(dmabuf)) {
> > +		fd = PTR_ERR(dmabuf);
> > +		goto error;
> > +	}
> > +
> > +	fd = dma_buf_fd(dmabuf, fd_flags);
> > +	if (fd < 0) {
> > +		dma_buf_put(dmabuf);
> > +		/* just return, as put will call release and that will free */
> > +	}
> > +
> > +error:
> > +	destroy_dma_heap_file(&heap_file);
> > +error_file:
> > +	return fd;
> > +}
> > +
> >   static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> >   				 u32 fd_flags,
> >   				 u64 heap_flags)
> > @@ -93,6 +545,38 @@ static int dma_heap_open(struct inode *inode, struct file *file)
> >   	return 0;
> >   }
> > +static long dma_heap_ioctl_allocate_read_file(struct file *file, void *data)
> > +{
> > +	struct dma_heap_allocation_file_data *heap_allocation_file = data;
> > +	struct dma_heap *heap = file->private_data;
> > +	int fd;
> > +
> > +	if (heap_allocation_file->fd || !heap_allocation_file->file_fd)
> > +		return -EINVAL;
> > +
> > +	if (heap_allocation_file->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
> > +		return -EINVAL;
> > +
> > +	if (heap_allocation_file->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
> > +		return -EINVAL;
> > +
> > +	if (!heap->ops->allocate_read_file)
> > +		return -EINVAL;
> > +
> > +	fd = dma_heap_buffer_alloc_read_file(
> > +		heap, heap_allocation_file->file_fd,
> > +		heap_allocation_file->batch ?
> > +			PAGE_ALIGN(heap_allocation_file->batch) :
> > +			DEFAULT_ADI_BATCH,
> > +		heap_allocation_file->fd_flags,
> > +		heap_allocation_file->heap_flags);
> > +	if (fd < 0)
> > +		return fd;
> > +
> > +	heap_allocation_file->fd = fd;
> > +	return 0;
> > +}
> > +
> >   static long dma_heap_ioctl_allocate(struct file *file, void *data)
> >   {
> >   	struct dma_heap_allocation_data *heap_allocation = data;
> > @@ -121,6 +605,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
> >   static unsigned int dma_heap_ioctl_cmds[] = {
> >   	DMA_HEAP_IOCTL_ALLOC,
> > +	DMA_HEAP_IOCTL_ALLOC_AND_READ,
> >   };
> >   static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
> > @@ -170,6 +655,9 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
> >   	case DMA_HEAP_IOCTL_ALLOC:
> >   		ret = dma_heap_ioctl_allocate(file, kdata);
> >   		break;
> > +	case DMA_HEAP_IOCTL_ALLOC_AND_READ:
> > +		ret = dma_heap_ioctl_allocate_read_file(file, kdata);
> > +		break;
> >   	default:
> >   		ret = -ENOTTY;
> >   		goto err;
> > @@ -316,11 +804,44 @@ static int dma_heap_init(void)
> >   	dma_heap_class = class_create(DEVNAME);
> >   	if (IS_ERR(dma_heap_class)) {
> > -		unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
> > -		return PTR_ERR(dma_heap_class);
> > +		ret = PTR_ERR(dma_heap_class);
> > +		goto fail_class;
> >   	}
> >   	dma_heap_class->devnode = dma_heap_devnode;
> > +	heap_fctl = kzalloc(sizeof(*heap_fctl), GFP_KERNEL);
> > +	if (unlikely(!heap_fctl)) {
> > +		ret =  -ENOMEM;
> > +		goto fail_alloc;
> > +	}
> > +
> > +	INIT_LIST_HEAD(&heap_fctl->works);
> > +	init_waitqueue_head(&heap_fctl->threadwq);
> > +	init_waitqueue_head(&heap_fctl->workwq);
> > +
> > +	heap_fctl->work_thread = kthread_run(dma_heap_file_control_thread,
> > +					     heap_fctl, "heap_fwork_t");
> > +	if (IS_ERR(heap_fctl->work_thread)) {
> > +		ret = -ENOMEM;
> > +		goto fail_thread;
> > +	}
> > +
> > +	heap_fctl->heap_fwork_cachep = KMEM_CACHE(dma_heap_file_work, 0);
> > +	if (unlikely(!heap_fctl->heap_fwork_cachep)) {
> > +		ret = -ENOMEM;
> > +		goto fail_cache;
> > +	}
> > +
> >   	return 0;
> > +
> > +fail_cache:
> > +	kthread_stop(heap_fctl->work_thread);
> > +fail_thread:
> > +	kfree(heap_fctl);
> > +fail_alloc:
> > +	class_destroy(dma_heap_class);
> > +fail_class:
> > +	unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
> > +	return ret;
> >   }
> >   subsys_initcall(dma_heap_init);
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index 064bad725061..9c25383f816c 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -12,12 +12,17 @@
> >   #include <linux/cdev.h>
> >   #include <linux/types.h>
> > +#define DEFAULT_ADI_BATCH (128 << 20)
> > +
> >   struct dma_heap;
> > +struct dma_heap_file_task;
> > +struct dma_heap_file;
> >   /**
> >    * struct dma_heap_ops - ops to operate on a given heap
> >    * @allocate:		allocate dmabuf and return struct dma_buf ptr
> > - *
> > + * @allocate_read_file: allocate dmabuf and read file, then return struct
> > + * dma_buf ptr.
> >    * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
> >    */
> >   struct dma_heap_ops {
> > @@ -25,6 +30,11 @@ struct dma_heap_ops {
> >   				    unsigned long len,
> >   				    u32 fd_flags,
> >   				    u64 heap_flags);
> > +
> > +	struct dma_buf *(*allocate_read_file)(struct dma_heap *heap,
> > +					      struct dma_heap_file *heap_file,
> > +					      u32 fd_flags,
> > +					      u64 heap_flags);
> >   };
> >   /**
> > @@ -65,4 +75,49 @@ const char *dma_heap_get_name(struct dma_heap *heap);
> >    */
> >   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
> > +/**
> > + * dma_heap_destroy_file_read - waits for a file read to complete then destroy it
> > + * Returns: true if the file read failed, false otherwise
> > + */
> > +bool dma_heap_destroy_file_read(struct dma_heap_file_task *heap_ftask);
> > +
> > +/**
> > + * dma_heap_wait_for_file_read - waits for a file read to complete
> > + * Returns: true if the file read failed, false otherwise
> > + */
> > +bool dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask);
> > +
> > +/**
> > + * dma_heap_alloc_file_read - Declare a task to read file when allocate pages.
> > + * @heap_file:		target file to read
> > + *
> > + * Return NULL if failed, otherwise return a struct pointer.
> > + */
> > +struct dma_heap_file_task *
> > +dma_heap_declare_file_read(struct dma_heap_file *heap_file);
> > +
> > +/**
> > + * dma_heap_prepare_file_read - cache each allocated page until we meet this batch.
> > + * @heap_ftask:		prepared and need to commit's work.
> > + * @page:		current allocated page. don't care which order.
> > + *
> > + * Returns true if reach to batch, false so go on prepare.
> > + */
> > +bool dma_heap_prepare_file_read(struct dma_heap_file_task *heap_ftask,
> > +				struct page *page);
> > +
> > +/**
> > + * dma_heap_commit_file_read -  prepare collect enough memory, going to trigger IO
> > + * @heap_ftask:			info that current IO needs
> > + *
> > + * This commit will also check if reach to tail read.
> > + * For direct I/O submissions, it is necessary to pay attention to file reads
> > + * that are not page-aligned. For the unaligned portion of the read, buffer IO
> > + * needs to be triggered.
> > + * Returns:
> > + *   0 if all right, -errno if something wrong
> > + */
> > +int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask);
> > +size_t dma_heap_file_size(struct dma_heap_file *heap_file);
> > +
> >   #endif /* _DMA_HEAPS_H */
> > diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
> > index a4cf716a49fa..8c20e8b74eed 100644
> > --- a/include/uapi/linux/dma-heap.h
> > +++ b/include/uapi/linux/dma-heap.h
> > @@ -39,6 +39,27 @@ struct dma_heap_allocation_data {
> >   	__u64 heap_flags;
> >   };
> > +/**
> > + * struct dma_heap_allocation_file_data - metadata passed from userspace for
> > + *                                      allocations and read file
> > + * @fd:			will be populated with a fd which provides the
> > + *			handle to the allocated dma-buf
> > + * @file_fd:		file descriptor to read from(suggested to use O_DIRECT open file)
> > + * @batch:		how many memory alloced then file read(bytes), default 128MB
> > + *			will auto aligned to PAGE_SIZE
> > + * @fd_flags:		file descriptor flags used when allocating
> > + * @heap_flags:		flags passed to heap
> > + *
> > + * Provided by userspace as an argument to the ioctl
> > + */
> > +struct dma_heap_allocation_file_data {
> > +	__u32 fd;
> > +	__u32 file_fd;
> > +	__u32 batch;
> > +	__u32 fd_flags;
> > +	__u64 heap_flags;
> > +};
> > +
> >   #define DMA_HEAP_IOC_MAGIC		'H'
> >   /**
> > @@ -50,4 +71,15 @@ struct dma_heap_allocation_data {
> >   #define DMA_HEAP_IOCTL_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
> >   				      struct dma_heap_allocation_data)
> > +/**
> > + * DOC: DMA_HEAP_IOCTL_ALLOC_AND_READ - allocate memory from pool and both
> > + *					read file when allocate memory.
> > + *
> > + * Takes a dma_heap_allocation_file_data struct and returns it with the fd field
> > + * populated with the dmabuf handle of the allocation. When return, the dma-buf
> > + * content is read from file.
> > + */
> > +#define DMA_HEAP_IOCTL_ALLOC_AND_READ \
> > +	_IOWR(DMA_HEAP_IOC_MAGIC, 0x1, struct dma_heap_allocation_file_data)
> > +
> >   #endif /* _UAPI_LINUX_DMABUF_POOL_H */
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
