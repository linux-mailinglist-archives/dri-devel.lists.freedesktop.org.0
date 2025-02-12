Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FC4A3215B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 09:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EF710E801;
	Wed, 12 Feb 2025 08:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B558C10E801
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:40:20 +0000 (UTC)
Message-ID: <0ea22cc5-18c2-4de4-b06e-533ad4fae20f@lankhorst.se>
Date: Wed, 12 Feb 2025 09:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cgroup/dmem: Don't open-code
 css_for_each_descendant_pre
To: Friedrich Vock <friedrich.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 cgroups@vger.kernel.org
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <20250127152754.21325-1-friedrich.vock@gmx.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250127152754.21325-1-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hey,

I was hoping someone else would look at it, but it seems not.

This patch appears to work on my system, it would be helpful if I could 
get the exact sequence failing to write a reproducer, but I don't want 
to hold up a bugfix because of it.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Should I send this through the drm-misc-fixes tree?

Cheers,
~Maarten

On 2025-01-27 16:27, Friedrich Vock wrote:
> The current implementation has a bug: If the current css doesn't
> contain any pool that is a descendant of the "pool" (i.e. when
> found_descendant == false), then "pool" will point to some unrelated
> pool. If the current css has a child, we'll overwrite parent_pool with
> this unrelated pool on the next iteration.
> 
> Since we can just check whether a pool refers to the same region to
> determine whether or not it's related, all the additional pool tracking
> is unnecessary, so just switch to using css_for_each_descendant_pre for
> traversal.
> 
> Fixes: b168ed458 ("kernel/cgroup: Add "dmem" memory accounting cgroup")
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
> 
> v2 (Michal): Switch to the more idiomatic css_for_each_descendant_pre
> instead of fixing the open-coded version
> 
> ---
>   kernel/cgroup/dmem.c | 50 ++++++++++----------------------------------
>   1 file changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> index 52736ef0ccf2..77d9bb1c147f 100644
> --- a/kernel/cgroup/dmem.c
> +++ b/kernel/cgroup/dmem.c
> @@ -220,60 +220,32 @@ dmem_cgroup_calculate_protection(struct dmem_cgroup_pool_state *limit_pool,
>   				 struct dmem_cgroup_pool_state *test_pool)
>   {
>   	struct page_counter *climit;
> -	struct cgroup_subsys_state *css, *next_css;
> +	struct cgroup_subsys_state *css;
>   	struct dmemcg_state *dmemcg_iter;
> -	struct dmem_cgroup_pool_state *pool, *parent_pool;
> -	bool found_descendant;
> +	struct dmem_cgroup_pool_state *pool, *found_pool;
> 
>   	climit = &limit_pool->cnt;
> 
>   	rcu_read_lock();
> -	parent_pool = pool = limit_pool;
> -	css = &limit_pool->cs->css;
> 
> -	/*
> -	 * This logic is roughly equivalent to css_foreach_descendant_pre,
> -	 * except we also track the parent pool to find out which pool we need
> -	 * to calculate protection values for.
> -	 *
> -	 * We can stop the traversal once we find test_pool among the
> -	 * descendants since we don't really care about any others.
> -	 */
> -	while (pool != test_pool) {
> -		next_css = css_next_child(NULL, css);
> -		if (next_css) {
> -			parent_pool = pool;
> -		} else {
> -			while (css != &limit_pool->cs->css) {
> -				next_css = css_next_child(css, css->parent);
> -				if (next_css)
> -					break;
> -				css = css->parent;
> -				parent_pool = pool_parent(parent_pool);
> -			}
> -			/*
> -			 * We can only hit this when test_pool is not a
> -			 * descendant of limit_pool.
> -			 */
> -			if (WARN_ON_ONCE(css == &limit_pool->cs->css))
> -				break;
> -		}
> -		css = next_css;
> -
> -		found_descendant = false;
> +	css_for_each_descendant_pre(css, &limit_pool->cs->css) {
>   		dmemcg_iter = container_of(css, struct dmemcg_state, css);
> +		found_pool = NULL;
> 
>   		list_for_each_entry_rcu(pool, &dmemcg_iter->pools, css_node) {
> -			if (pool_parent(pool) == parent_pool) {
> -				found_descendant = true;
> +			if (pool->region == limit_pool->region) {
> +				found_pool = pool;
>   				break;
>   			}
>   		}
> -		if (!found_descendant)
> +		if (!found_pool)
>   			continue;
> 
>   		page_counter_calculate_protection(
> -			climit, &pool->cnt, true);
> +			climit, &found_pool->cnt, true);
> +
> +		if (found_pool == test_pool)
> +			break;
>   	}
>   	rcu_read_unlock();
>   }
> --
> 2.48.0
> 

