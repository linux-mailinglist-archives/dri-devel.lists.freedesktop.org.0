Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A99BB67F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 14:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960F310E3EB;
	Mon,  4 Nov 2024 13:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ajIXj+uL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA9710E3EB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730727715;
 bh=HXZuZel12bVsiYfz0H601Bs/k+63sw8yp3si4WDZxQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ajIXj+uLHLbds8I7uNKG/L/ug3xj013bMhPApnxuz17nP4JI//LM1Cw6HG2X6qezA
 2xjJbHYvILqMwsh9OB8ZJKyjapNO3d+USbG2yJFP+FE9uS0yw1SVjbHgSj2jRSUA1N
 wV6wMJzbbTedxUXqdluW/g3Ve172VZeZh7uM/sekM7MLHAMOfM3cn/LkbdgCuXpOQg
 OOJiBLBH9RBySAS1a6pUqCydZGnzxR0XCLHmzp3OjKoyScIa/heW8R6TlgDqhlTPtP
 xGc7z/pH1C2PS2FCI4sqjNJqBrUSoecFVkD0fxmYi75RJ1pzniDVHflYoP+uv0Mo7P
 geth8KaP/KpPA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 553E917E3638;
 Mon,  4 Nov 2024 14:41:55 +0100 (CET)
Date: Mon, 4 Nov 2024 14:41:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH 3/3] drm/panthor: Prevent potential overwrite of buffer
 objects
Message-ID: <20241104144150.65c6887c@collabora.com>
In-Reply-To: <ca33d9b9-683d-4c09-951a-1bc48287bdde@arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
 <20241024145432.934086-4-akash.goel@arm.com>
 <20241024173935.6430159e@collabora.com>
 <40c9a0a3-81e4-4ecc-b9a0-d55523f5f594@arm.com>
 <20241104121646.687cae93@collabora.com>
 <ca33d9b9-683d-4c09-951a-1bc48287bdde@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Nov 2024 12:49:56 +0000
Akash Goel <akash.goel@arm.com> wrote:

> On 11/4/24 11:16, Boris Brezillon wrote:
> > Hi Akash,
> > 
> > On Thu, 31 Oct 2024 21:42:27 +0000
> > Akash Goel <akash.goel@arm.com> wrote:
> >   
> >> I assume you also reckon that there is a potential problem here for arm64.  
> > 
> > It impacts any system that's not IO-coherent I would say, and this
> > comment seems to prove this is a known issue [3].
> >   
> 
> Thanks for confirming.
> 
> Actually I had tried to check with Daniel Vetter about [3], as it was 
> not clear to me that how that code exactly helped in x86 case.
> As far as I understand, [3] updates the attribute of direct kernel 
> mapping of the shmem pages to WC, so as to be consistent with the 
> Userspace mapping of the pages or their vmapping inside the kernel.
> But didn't get how that alignment actually helped in cleaning the dirty 
> cache lines.

Yeah, I was not referring to the code but rather the fact that x86,
with its IO coherency model, is a special case here, and that other
archs probably need explicit flushes in a few places.

> >>
> >> shmem calls 'flush_dcache_folio()' after clearing the pages but that
> >> just clears the 'PG_dcache_clean' bit and CPU cache is not cleaned
> >> immediately.
> >>
> >> I realize that this patch is not foolproof, as Userspace can try to
> >> populate the BO from CPU side before mapping it on the GPU side.
> >>
> >> Not sure if we also need to consider the case when shmem pages are
> >> swapped out. Don't know if there could be a similar situation of dirty
> >> cachelines after the swap in.  
> > 
> > I think we do. We basically need to flush CPU caches any time
> > pages are [re]allocated, because the shmem layer will either zero-out
> > (first allocation) or populate (swap-in) in that path, and in both
> > cases, it involves a CPU copy to a cached mapping.
> >   
> 
> Thanks for confirming.
> 
> I think we may have to do cache flush page by page.
> Not all pages might get swapped out and the initial allocation of all 
> pages may not happen at the same time.

If the pages are mapped GPU-side, it's always all pages at a time (at
least until we add support for lazy page allocation, AKA growing/heap
buffers). You're right that GPU buffers that have only been mapped
CPU-side with mmap() get their pages lazily allocated, though I'm not
really sure we care about optimizing that case just yet.

> Please correct me if my understanding is wrong.

Eviction should be rare enough that we can probably pay the price of a
flush on the entire BO range.
