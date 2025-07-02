Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2FAF5E0D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98410E72C;
	Wed,  2 Jul 2025 16:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="A39qaWfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED40F10E72C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:06:44 +0000 (UTC)
Date: Wed, 2 Jul 2025 09:06:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751472403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srTNbsweal/ZTMihhkqr7z7S4H0d6CYN8w3bSn5u8Xk=;
 b=A39qaWfe2ddBeltU2pFOoAwv6donCRWRvZDOgD8qmVSQrt4qnlrAd4ekZPSwWXTghLDzVi
 pKmXJZ+XL+6XDWnKML/XT/EwXwvE1YzpkNh+bLXrXYFJ+uAaHX0g1BNM7mv/fGYhgs2cD5
 z6fNQMDxZWl6I/amQzQystCjf7mgaig=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>, 
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 08/17] memcg: add support for GPU page counters.
Message-ID: <kk5qq4af4roysrnba3w5433fmhmbt4ps5kfnmvickh3uxlqc3g@lpqtnmqhuzgm>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-9-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630045005.1337339-9-airlied@gmail.com>
X-Migadu-Flow: FLOW_OUT
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

On Mon, Jun 30, 2025 at 02:49:27PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This introduces 2 new statistics and 3 new memcontrol APIs for dealing
> with GPU system memory allocations.
> 
> The stats corresponds to the same stats in the global vmstat,
> for number of active GPU pages, and number of pages in pools that
> can be reclaimed.
> 
> The first API charges a order of pages to a objcg, and sets
> the objcg on the pages like kmem does, and updates the active/reclaim
> statistic.
> 
> The second API uncharges a page from the obj cgroup it is currently charged
> to.
> 
> The third API allows moving a page to/from reclaim and between obj cgroups.
> When pages are added to the pool lru, this just updates accounting.
> When pages are being removed from a pool lru, they can be taken from
> the parent objcg so this allows them to be uncharged from there and transferred
> to a new child objcg.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |   6 ++
>  include/linux/memcontrol.h              |  14 +++
>  mm/memcontrol.c                         | 110 ++++++++++++++++++++++++
>  3 files changed, 130 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 0cc35a14afbe..d6f057c4fe2e 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1542,6 +1542,12 @@ The following nested keys are defined.
>  	  vmalloc (npn)
>  		Amount of memory used for vmap backed memory.
>  
> +	  gpu (npn)
> +		Amount of system memory used for GPU devices.
> +
> +	  gpu_reclaim (npn)
> +		Amount of system memory cached for GPU devices.
> +
>  	  shmem
>  		Amount of cached filesystem data that is swap-backed,
>  		such as tmpfs, shm segments, shared anonymous mmap()s
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 87b6688f124a..ff82d603910d 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -36,6 +36,8 @@ enum memcg_stat_item {
>  	MEMCG_SOCK,
>  	MEMCG_PERCPU_B,
>  	MEMCG_VMALLOC,
> +	MEMCG_GPU,
> +	MEMCG_GPU_RECLAIM,

You already added node level counters i.e. GPUActive & GPUReclaim, just
use those instead of these. Add them to memcg_node_stat_items[].

