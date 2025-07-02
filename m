Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F7AF5EE9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7D310E74C;
	Wed,  2 Jul 2025 16:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Ecv9veGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9735C10E74B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:42:01 +0000 (UTC)
Date: Wed, 2 Jul 2025 09:41:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751474519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A5s48M7rOqcXqOSVmS8nx3gNeb8aROKoWGRX0CL/xU0=;
 b=Ecv9veGNTwcetXtwhDTJoIXK82M1FgqoiD9Q8aotMISEZ4tVjF0dInAyWF/G8qydHa99nY
 OqrYRFZ6/FFjXYGkQgz5RfVV4/RfK9cnmmSJgdDD/L7CnqlK6SAtctrTcxLYXVx0lNKnhS
 EjW54sKA06SLu0h6LtCnv7WVHIpdmHk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>, 
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 13/17] ttm/pool: enable memcg tracking and shrinker.
Message-ID: <n4ebcz7nxjn5r64jwi3wekp6pp365jwe2idydab7hjvbdlczbq@crufclhtqzef>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-14-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630045005.1337339-14-airlied@gmail.com>
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

On Mon, Jun 30, 2025 at 02:49:32PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This enables all the backend code to use the list lru in memcg mode,
> and set the shrinker to be memcg aware.
> 
> It adds the loop case for when pooled pages end up being reparented
> to a higher memcg group, that newer memcg can search for them there
> and take them back.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 123 ++++++++++++++++++++++++++++-----
>  1 file changed, 105 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 210f4ac4de67..49e92f40ab23 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -143,7 +143,9 @@ static int ttm_pool_nid(struct ttm_pool *pool) {
>  }
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
> -static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> +static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
> +					struct obj_cgroup *objcg,
> +					gfp_t gfp_flags,
>  					unsigned int order)
>  {
>  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
> @@ -163,6 +165,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);

Here I am wondering if we should introduce something like
__GFP_ACCOUNT_NOKMEM to avoid kmem counters but still charge to the
memcg and along with set_active_memcg(), we can avoid introducing gpu
specific memcg charging interfaces.

