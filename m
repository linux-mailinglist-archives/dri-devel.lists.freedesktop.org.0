Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1FF578769
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 18:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59D08FD78;
	Mon, 18 Jul 2022 16:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7A48FD78
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 16:30:23 +0000 (UTC)
Received: from localhost (82-69-11-11.dsl.in-addr.zen.co.uk [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B4D2666015BA;
 Mon, 18 Jul 2022 17:30:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658161821;
 bh=67k621VcvZBfls02rcFrFRrfCnedQu+qfsSdKYfJYrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xd700j+UoYb3J5rRcgU6Af8iQwyBjQujE0PgtnhYsiBFWw1z0PoiH7bJSAGOurkuW
 fWikD1enWeG2djQQI3HGpJ5g7dR25f0eGHMtQN6kdew866RqdbXHq710u+jHX8I0PF
 A4HevZkONax7hkMJhfK6OsY/Q1z+2xRXK7PzV3O/iDnpt85YBa/tEsShDdBOad6S94
 1/SMni6mQ1xc4Jle6p1k5jsXIVZyNmXHXT3pdXlb60FGvt0k/BtB3F7YhBAuUMhPSv
 RONw790o3odHrxnO4nxJGRW1cYbAgSIxIVqmAmhhQG+umeiMS3Ksskj1xw2Pk8CNfq
 NnUHS1CkaFIsA==
Date: Mon, 18 Jul 2022 17:30:19 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 2/2] drm/panfrost: Add support for devcoredump
Message-ID: <20220718163019.pms7ujrzhx2nyiki@sobremesa>
References: <20220622143616.1265405-1-adrian.larumbe@collabora.com>
 <20220622143616.1265405-3-adrian.larumbe@collabora.com>
 <4bbca7ec-4b0b-a1c4-983a-5093bcf45e09@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bbca7ec-4b0b-a1c4-983a-5093bcf45e09@arm.com>
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
Cc: dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 tomeu.vizoso@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven, once again thanks for the feedback. I was off for some time and then
busy with other stuff, but I can finally work on a new revision for the patch

On 23.06.2022 13:23, Steven Price wrote:
> On 22/06/2022 15:36, Adrián Larumbe wrote:
> > In the event of a job timeout, debug dump information will be written into
> > /sys/class/devcoredump.
> > 
> > Inspired by etnaviv's similar feature.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> Looks pretty good, a few comments below.

> > +static void
> > +panfrost_core_dump_registers(struct panfrost_dump_iterator *iter,
> > +			     struct panfrost_device *pfdev,
> > +			     u32 as_nr, int slot)
> > +{
> > +	struct panfrost_dump_registers *dumpreg = iter->data;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(panfrost_dump_registers); i++, dumpreg++) {
> > +		unsigned int js_as_offset = 0;
> > +		unsigned int reg;
> > +
> > +		if (panfrost_dump_registers[i] >= JS_HEAD_LO(0) &&
> > +		    panfrost_dump_registers[i] <= JS_CONFIG_NEXT(0))
> 
> It would be good to use something more generic than specific registers
> in case the list of registers is ever changed. We have JS_BASE already
> which would work for the lower end. We seem to be missing the equivalent
> MMU_BASE #define currently. The upper end is base+stride, so for JS we have:

I defined a MMU_AS_STRIDE in the same file, but I feel a bit weird about this
naming because, unlike for the job slot registers, the stride isn't linear.
However for the sake of clarity I think it should be alright.

> > 	if (panfrost_dump_registers[i] >= JS_BASE &&
> > 	    panfrost_dump_registers[i] < JS_BASE + JS_SLOT_STRIDE)
> > +			js_as_offset = slot * JS_SLOT_STRIDE;
> > +		else if (panfrost_dump_registers[i] >= AS_TRANSTAB_LO(0) &&
> > +			 panfrost_dump_registers[i] <= AS_STATUS(0))
> > +			js_as_offset = (as_nr << MMU_AS_SHIFT);
> > +
> > +		reg = panfrost_dump_registers[i] + js_as_offset;
> > +
> > +		dumpreg->reg = cpu_to_le32(reg);
> > +		dumpreg->value = cpu_to_le32(gpu_read(pfdev, reg));
> > +	}
> > +
> > +	panfrost_core_dump_header(iter, PANFROSTDUMP_BUF_REG, dumpreg);
> > +}
> > +
> > +void panfrost_core_dump(struct panfrost_job *job)
> > +{
> > +	struct panfrost_device *pfdev = job->pfdev;
> > +	struct panfrost_dump_iterator iter;
> > +	struct drm_gem_object *dbo;
> > +	unsigned int n_obj, n_bomap_pages;
> > +	__le64 *bomap, *bomap_start;
> > +	size_t file_size;
> > +	u32 as_nr;
> > +	int slot;
> > +	int ret, i;
> > +
> > +	as_nr = job->mmu->as;
> > +	slot = panfrost_job_get_slot(job);
> > +
> > +	/* Only catch the first event, or when manually re-armed */
> > +	if (!panfrost_dump_core)
> > +		return;
> > +	panfrost_dump_core = false;
> > +
> > +	/* At least, we dump registers and end marker */
> > +	n_obj = 2;
> > +	n_bomap_pages = 0;
> > +	file_size = ARRAY_SIZE(panfrost_dump_registers) *
> > +			sizeof(struct panfrost_dump_registers);
> > +
> > +	/* Add in the active buffer objects */
> > +	for (i = 0; i < job->bo_count; i++) {
> > +		/*
> > +		 * Even though the CPU could be configured to use 16K or 64K pages, this
> > +		 * is a very unusual situation for most kernel setups on SoCs that have
> > +		 * a Panfrost device. Also many places across the driver make the somewhat
> > +		 * arbitrary assumption that Panfrost's MMU page size is the same as the CPU's,
> > +		 * so let's have a sanity check to ensure that's always the case
> > +		 */
> > +		WARN_ON(!IS_ALIGNED(dbo->size, PAGE_SIZE));
> 
> This warn needs to go after the assignment below - I just spent a few
> minutes tracking down why I was getting a NULL pointer dereference.
> Sadly my GCC doesn't seem to be able to warn about this uninitialised use :(

I just triggered the warning because of an unitialised garbage value. I suppose
last time I tried to rush the latest iteration of the patch without all the due
testing beforehand (won't happen again).

> > +
> > +		dbo = job->bos[i];
> > +		file_size += dbo->size;
> > +		n_bomap_pages += dbo->size >> PAGE_SHIFT;
> > +		n_obj++;
> > +	}

> > +	/* If we have any buffer objects, add a bomap object */
> > +	if (n_bomap_pages) {
> > +		file_size += n_bomap_pages * sizeof(*bomap);
> > +		n_obj++;
> > +	}
> > +
> > +	/* Add the size of the headers */
> > +	file_size += sizeof(*iter.hdr) * n_obj;
> > +
> > +	/*
> > +	 * Allocate the file in vmalloc memory, it's likely to be big.
> > +	 * The reason behind these GFP flags is that we don't want to trigger the
> > +	 * OOM killer in the event that not enough memory could be found for our
> > +	 * dump file. We also don't want the allocator to do any error reporting,
> > +	 * as the right behaviour is failing gracefully if a big enough buffer
> > +	 * could not be allocated.
> > +	 */
> > +	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> > +			__GFP_NORETRY);
> > +	if (!iter.start) {
> > +		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
> > +		return;
> > +	}
> > +
> > +	/* Point the data member after the headers */
> > +	iter.hdr = iter.start;
> > +	iter.data = &iter.hdr[n_obj];
> > +
> > +	memset(iter.hdr, 0, iter.data - iter.start);
> > +
> > +	/*
> > +	 * For now, we write the job identifier in the register dump header,
> > +	 * so that we can decode the entire dump later with pandecode
> > +	 */
> > +	iter.hdr->reghdr.jc = cpu_to_le64(job->jc);
> > +	iter.hdr->reghdr.major = cpu_to_le32(PANFROSTDUMP_MAJOR);
> > +	iter.hdr->reghdr.minor = cpu_to_le32(PANFROSTDUMP_MINOR);
> > +	iter.hdr->reghdr.gpu_id = cpu_to_le32(pfdev->features.id);
> > +	iter.hdr->reghdr.nbos = cpu_to_le64(job->bo_count);
> > +
> > +	panfrost_core_dump_registers(&iter, pfdev, as_nr, slot);
> > +
> > +	/* Reserve space for the bomap */
> > +	if (job->bo_count) {
> > +		bomap_start = bomap = iter.data;
> > +		memset(bomap, 0, sizeof(*bomap) * n_bomap_pages);
> > +		panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BOMAP,
> > +					  bomap + n_bomap_pages);
> > +	}
> > +
> > +	for (i = 0; i < job->bo_count; i++) {
> > +		struct iosys_map map;
> > +		struct panfrost_gem_mapping *mapping;
> > +		struct panfrost_gem_object *bo;
> > +		struct sg_page_iter page_iter;
> > +		void *vaddr;
> > +
> > +		bo = to_panfrost_bo(job->bos[i]);
> > +		mapping = job->mappings[i];
> > +
> > +		if (!bo->base.sgt) {
> > +			dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
> > +			iter.hdr->bomap.valid = 0;
> > +			goto dump_header;
> > +		}
> > +
> > +		ret = drm_gem_shmem_vmap(&bo->base, &map);
> > +		if (ret) {
> > +			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
> > +			iter.hdr->bomap.valid = 0;
> > +			goto dump_header;
> > +		}
> > +
> > +		WARN_ON(!mapping->active);
> > +
> > +		iter.hdr->bomap.data[0] = cpu_to_le32((bomap - bomap_start));
> > +
> > +		for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
> > +			struct page *page = sg_page_iter_page(&page_iter);
> > +
> > +			if (!IS_ERR(page)) {
> > +				*bomap++ = cpu_to_le64(page_to_phys(page));
> > +			} else {
> > +				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
> > +				*bomap++ = ~cpu_to_le64(0);
> > +			}
> > +		}
> > +
> > +		iter.hdr->bomap.iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
> > +
> > +		vaddr = map.vaddr;
> > +		memcpy(iter.data, vaddr, bo->base.base.size);
> > +
> > +		drm_gem_shmem_vunmap(&bo->base, &map);
> > +
> > +		iter.hdr->bomap.valid = cpu_to_le64(1);
> 
> 'valid' is only 32 bit so this should be cpu_to_le32(1).

  Fixed.

> Steve

Adrian
