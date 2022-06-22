Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A966554047
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8831133F0;
	Wed, 22 Jun 2022 01:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96810ECF2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 01:54:58 +0000 (UTC)
Received: from localhost (82-69-11-11.dsl.in-addr.zen.co.uk [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A4B66601692;
 Wed, 22 Jun 2022 02:54:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655862897;
 bh=aaKabN/slaonbIu40gcFcYte8EBD7isN34uI+XwEZI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGI7EgMff3XR8aM2Y/1xp4lfCGTy6v934qTzVRUF+laszOn8c3Yc9aAgjAjnMF5Ev
 a9XMcqBfltcn7iKlzGjjDFL5Pyzxld8llYXAS52SIEO/Gf7126cT86UWY3rgLkjVDH
 G3t2NpE2byMZAh888RxEqpiRnr4hKm1JHSyA3H0oKh6OnUl8kgynDRUFovDoZqHXn/
 teHgXQZSD0RSVi859Z+5gDEk2vH7sOJtYSh/d9MkpmcRrkiVMfNlqECSVQMMccbBDN
 UgLdD2n7mxmzuj0OTp9pIVcQ8Jr6Obve5UD/larQWR8GccZ8BuGcAXDcxVvzvMZqoP
 NYOaj1MTsOUJA==
Date: Wed, 22 Jun 2022 02:54:55 +0100
From: Adri??n Larumbe <adrian.larumbe@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH v2 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <20220622015455.pqiiqevouh7udj7y@sobremesa>
References: <20220621023204.94179-1-adrian.larumbe@collabora.com>
 <20220621023204.94179-2-adrian.larumbe@collabora.com>
 <YrHBs+u9gAbOAAxT@maud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrHBs+u9gAbOAAxT@maud>
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
 tomeu.vizoso@collabora.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alyssa, thanks for the feedback.

If I don't answer directly to any of your concerns in this message, it's because
I applied your suggestions in v3 of the patch straight away.

On 21.06.2022 09:03, Alyssa Rosenzweig wrote:
> Hi Adrian,
> 
> Great work on the devcoredump support! This is really cool to see coming
> along, thank you! I've left a few notes below:
> 
> > +		if (panfrost_dump_registers[i] >= JS_HEAD_LO(0) &&
> > +		    panfrost_dump_registers[i] <= JS_CONFIG_NEXT(0))
> > +			js_as_offset = slot * 0x80;
> > +		else if (panfrost_dump_registers[i] >= AS_TRANSTAB_LO(0) &&
> > +			 panfrost_dump_registers[i] <= AS_STATUS(0))
> > +			js_as_offset = ((as_nr) << 6);
> 
> I'm not a fan of the magic numbers. Do you think it makes sense to add
> 
> 	#define JS_SLOT_STRIDE 0x80
> 	#define MMU_AS_SHIFT 0x6
> 
> in the appropriate places in panfrost_regs.h, reexpress the existing
> #defines in terms of those
> 
> 	#define JS_HEAD_LO(n) (JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x00)
> 	...
> 	#define JS_FLUSH_ID_NEXT(n) (JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x70)
> 	...
> 	#define MM_AS(as) (0x2400 + ((as) << MMU_AS_SHIFT)
> 
> and then use those here?
> 
> Also, drop the parans around (as_nr), this isn't a macro.
> 
> > +	/* Add in the active buffer objects */
> > +	for (i = 0; i < job->bo_count; i++) {
> > +		dbo = job->bos[i];
> > +		file_size += dbo->size;
> > +		n_bomap_pages += dbo->size >> PAGE_SHIFT;
> > +		n_obj++;
> > +	}
> 
> Strictly, I don't think this is right -- what happens if the CPU is
> configured to use 16K or 64K pages? -- however, that mistake is pretty
> well entrenched in panfrost.ko right now and it doesn't seem to bother
> anyone (non-4K pages on arm64 are pretty rare outside of fruit
> computers).
> 
> That said, out-of-context there looks like an alignment question. Could
> we add an assert for that, documenting the invariant:
> 
> 	WARN_ON(!IS_ALIGNED(dbo->size, PAGE_SIZE));
> 
> > +	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> > +			__GFP_NORETRY);
> > +	if (!iter.start) {
> > +		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
> > +		return;
> > +	}
> > ...
> > +	memset(iter.hdr, 0, iter.data - iter.start);
> 
> Why are we using __GFP_NOWARN and __GFP_NORETRY? Why not plain vmalloc?
> 
> Also, why vmalloc instead of vzalloc? (Or adding __GFP_ZERO to the list
> of __vmalloc flags if __GFP_NOWARN/__GFP_NORETRY are really needed?) Are
> there relevant performance or security considerations?

I borrowed this code from Etnaviv a while ago and the same doubt struck me
then. My understanding of its intended behaviour is that because the dump file
might be huge, we don't want the memory manager to trigger the OOM killer and
annoy quite a few running processes because of a debug feature. Also since the
code already handles the situation when an allocation fails by refusing to
generate a dump, there's no need for the allocator to generate specific error
messages.

So I guess it boils down to 'if there's quite enough memory to allocate a huge
dump file, go ahead, otherwise don't reclaim any processes' pages for something
that isn't essential'.

I don't see much use for __GFP_ZERO in this case, because the dump file gets
memcpy'd with the contents of every single bo so whatever the original
contents of the memory were at the time of the allocation, they're overwritten
immediately.

> > +/* Definitions for coredump decoding in user space */
> > +#define PANFROSTDUMP_VERSION_1 1
> 
> I'm not a fan of an enum that just represents a number. Using the
> numbers directly means we can compare them in a natural way. Also, using
> a major/minor split like Steven suggested can help with semantic
> versioning.
> 
> Cheers,
> Alyssa

I've also rebased v3 on top of drm-misc-next and the compiler error because of
the removed panfrost_job structure member is gone.

Adrian Larumbe
