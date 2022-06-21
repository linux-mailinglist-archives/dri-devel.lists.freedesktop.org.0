Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCF5532D8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 15:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F8B10E269;
	Tue, 21 Jun 2022 13:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA36510E269
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:03:56 +0000 (UTC)
Received: from maud (unknown [184.175.41.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E70BA6601742;
 Tue, 21 Jun 2022 14:03:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655816635;
 bh=nIHT4mBUlZmHgcK1doTX5bMDgyD+VTIKWvJ8XOeSd5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fesPicQytzz5TWJGEUD8k/CtabTVruwGTH3lT/ihqO6URxZUBrwPO48tugYsLiEKt
 Iz8fIDo8xa0GZb5Y+fv1FGcU75YdPv6v0yJgqvExklfSZ5Uw/YRqxYyxy0pmIpZ97L
 JDOqUC1zbY6A18JV1x1WRh4cV1k8iwNR88M4tW0G+ocEXWuO2C/0TZWTCjMKZYag6h
 EUK7ns/G34sNcDF+bkvPYKMd1DIw+IUS4ySsKvatV4fQ+/qXkLewdNF7xSoVZ+6YPH
 obVubffVmgWcKjxtjiG4CWfaHrFAOtjUTG1AtiOzIim3XrkoE+DBneVKOTZgH0620r
 n8O4jSHqJ1B4Q==
Date: Tue, 21 Jun 2022 09:03:47 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v2 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <YrHBs+u9gAbOAAxT@maud>
References: <20220621023204.94179-1-adrian.larumbe@collabora.com>
 <20220621023204.94179-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621023204.94179-2-adrian.larumbe@collabora.com>
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

Hi Adrian,

Great work on the devcoredump support! This is really cool to see coming
along, thank you! I've left a few notes below:

> +		if (panfrost_dump_registers[i] >= JS_HEAD_LO(0) &&
> +		    panfrost_dump_registers[i] <= JS_CONFIG_NEXT(0))
> +			js_as_offset = slot * 0x80;
> +		else if (panfrost_dump_registers[i] >= AS_TRANSTAB_LO(0) &&
> +			 panfrost_dump_registers[i] <= AS_STATUS(0))
> +			js_as_offset = ((as_nr) << 6);

I'm not a fan of the magic numbers. Do you think it makes sense to add

	#define JS_SLOT_STRIDE 0x80
	#define MMU_AS_SHIFT 0x6

in the appropriate places in panfrost_regs.h, reexpress the existing
#defines in terms of those

	#define JS_HEAD_LO(n) (JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x00)
	...
	#define JS_FLUSH_ID_NEXT(n) (JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x70)
	...
	#define MM_AS(as) (0x2400 + ((as) << MMU_AS_SHIFT)

and then use those here?

Also, drop the parans around (as_nr), this isn't a macro.

> +	/* Add in the active buffer objects */
> +	for (i = 0; i < job->bo_count; i++) {
> +		dbo = job->bos[i];
> +		file_size += dbo->size;
> +		n_bomap_pages += dbo->size >> PAGE_SHIFT;
> +		n_obj++;
> +	}

Strictly, I don't think this is right -- what happens if the CPU is
configured to use 16K or 64K pages? -- however, that mistake is pretty
well entrenched in panfrost.ko right now and it doesn't seem to bother
anyone (non-4K pages on arm64 are pretty rare outside of fruit
computers).

That said, out-of-context there looks like an alignment question. Could
we add an assert for that, documenting the invariant:

	WARN_ON(!IS_ALIGNED(dbo->size, PAGE_SIZE));

> +	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> +			__GFP_NORETRY);
> +	if (!iter.start) {
> +		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
> +		return;
> +	}
> ...
> +	memset(iter.hdr, 0, iter.data - iter.start);

Why are we using __GFP_NOWARN and __GFP_NORETRY? Why not plain vmalloc?

Also, why vmalloc instead of vzalloc? (Or adding __GFP_ZERO to the list
of __vmalloc flags if __GFP_NOWARN/__GFP_NORETRY are really needed?) Are
there relevant performance or security considerations?

> +/* Definitions for coredump decoding in user space */
> +#define PANFROSTDUMP_VERSION_1 1

I'm not a fan of an enum that just represents a number. Using the
numbers directly means we can compare them in a natural way. Also, using
a major/minor split like Steven suggested can help with semantic
versioning.

Cheers,
Alyssa
